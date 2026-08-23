package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-b21§ extends §_-K17§
   {
      
      private static const §_-O1N§:int = 100;
      
      private var radius:Number = 100;
      
      private var §_-Fm§:Hero = null;
      
      private var §_-VQ§:§_-h2I§ = null;
      
      private var §_-H2c§:Boolean = false;
      
      public function §_-b21§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-82B§;
         this.radius = §_-O1N§ * (1 + §_-Nu§() / 100);
      }
      
      override public function dispose() : void
      {
         this.§_-Fm§ = null;
         this.§_-zC§();
         super.dispose();
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 60;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-zC§();
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         this.§_-Fm§ = this.hero.game.squirrels.get(param1);
         if(!this.§_-Fm§ || !this.hero.isSelf)
         {
            this.active = false;
            return;
         }
         this.§_-H2c§ = true;
         if(!this.§_-VQ§)
         {
            this.§_-VQ§ = new §_-h2I§(new PerkRadius());
            this.§_-VQ§.touchable = false;
         }
         this.§_-VQ§.scaleXY(1);
         this.§_-VQ§.scaleXY(int(this.radius * 2) / this.§_-VQ§.height);
         this.§_-VQ§.y = -Hero.§_-YH§;
         this.hero.§_-83v§(this.§_-VQ§);
      }
      
      override protected function §_-D2T§() : void
      {
         if(this.§_-H2c§)
         {
            this.§_-P2v§();
         }
         else
         {
            super.§_-D2T§();
         }
      }
      
      override protected function §_-91N§() : void
      {
         if(this.§_-H2c§)
         {
            this.§_-P2v§();
         }
         else
         {
            super.§_-91N§();
         }
      }
      
      override protected function get multipleSelection() : Boolean
      {
         return true;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if(!("helperTeleport" in _loc2_))
               {
                  super.§_-o2C§(param1);
                  return;
               }
               if(!this.hero || _loc2_["helperTeleport"][0] != this.hero.id)
               {
                  return;
               }
               if(!this.§_-Fm§ || !this.§_-Fm§.§_-k2W§ || this.§_-Fm§.isDead || this.§_-Fm§.inHollow)
               {
                  return;
               }
               this.§_-Fm§.§_-s1§(new b2Vec2(_loc2_["helperTeleport"][1],_loc2_["helperTeleport"][2]));
               if(this.§_-Fm§.isSelf)
               {
                  this.§_-Fm§.sendLocation();
               }
               this.§_-Fm§.heroView.§_-S2O§();
               this.§_-Fm§.heroView.§_-A2O§(new §_-QC§.perkData[this.§_-i2D§]["buttonClass"](),1);
               §_-92z§.sendMessage(this.§_-Fm§.player.id,"",§_-A1n§.§_-o2y§);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function §_-os§() : void
      {
         super.§_-os§();
         this.§_-H2c§ = false;
         this.§_-zC§();
      }
      
      private function §_-zC§() : void
      {
         if(Boolean(this.§_-VQ§) && Boolean(this.§_-VQ§.parentStarling))
         {
            this.§_-VQ§.parentStarling.removeChildStarling(this.§_-VQ§,false);
         }
      }
      
      private function §_-P2v§() : void
      {
         if(!Game.toggle)
         {
            if(!this.hero || !this.hero.game || !this.active)
            {
               return;
            }
            var _loc1_:Hero = this.§_-Fm§;
            if(!_loc1_ || !_loc1_.§_-k2W§ || _loc1_.isDead || _loc1_.inHollow)
            {
               this.active = false;
               this.§_-Fm§ = null;
               §_-Z1A§();
               return;
            }
            var _loc2_:Point = this.hero.game.squirrels.globalToLocal(§_-k2C§);
            var _loc3_:b2Vec2 = new b2Vec2(_loc2_.x / Game.§_-x2P§,_loc2_.y / Game.§_-x2P§);
            if(!this.§_-w1q§(_loc3_))
            {
               this.active = false;
               this.§_-Fm§ = null;
               §_-Z1A§();
               return;
            }
            if(this.§_-Fm§.isSelf)
            {
               this.§_-Fm§.§_-s1§(_loc3_);
               this.§_-Fm§.sendLocation();
               this.§_-Fm§ = null;
            }
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"helperTeleport":[this.hero.id,_loc3_.x,_loc3_.y]}));
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"selectionFinished":[this.§_-i2D§,this.hero.id,1]}));
            this.active = false;
            return;
         }
         if(!this.hero || !this.hero.game || !this.active)
         {
            return;
         }
         _loc1_ = this.§_-Fm§;
         if(!_loc1_ || !_loc1_.§_-k2W§ || _loc1_.isDead || _loc1_.inHollow)
         {
            this.active = false;
            this.§_-Fm§ = null;
            §_-Z1A§();
            return;
         }
         _loc2_ = this.hero.game.squirrels.globalToLocal(§_-k2C§);
         _loc3_ = new b2Vec2(_loc2_.x / Game.§_-x2P§,_loc2_.y / Game.§_-x2P§);
         if(!this.§_-w1q§(_loc3_))
         {
            this.active = false;
            this.§_-Fm§ = null;
            §_-Z1A§();
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"helperTeleport":[this.hero.id,_loc3_.x,_loc3_.y]}));
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"selectionFinished":[this.§_-i2D§,this.hero.id,1]}));
         this.active = false;
      }
      
      private function §_-w1q§(param1:b2Vec2) : Boolean
      {
         if(!Game.toggle)
         {
            return true;
         }
         if(!this.hero || !this.hero.position || !param1)
         {
            return false;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1);
         return _loc2_.Length() < this.radius / Game.§_-x2P§;
      }
   }
}


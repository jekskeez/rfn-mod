package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-s2S§ extends §_-aM§
   {
      
      private static const §_-w1v§:int = 100;
      
      private var radius:Number = 100;
      
      private var §_-qd§:Hero = null;
      
      private var §_-n2L§:§_-aS§ = null;
      
      private var §_-Q2w§:Boolean = false;
      
      public function §_-s2S§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-PS§;
         this.radius = §_-w1v§ * (1 + §_-bx§() / 100);
      }
      
      override public function dispose() : void
      {
         this.§_-qd§ = null;
         this.§_-Pw§();
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
         this.§_-Pw§();
      }
      
      override protected function set selectedHero(param1:int) : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         this.§_-qd§ = this.hero.game.squirrels.get(param1);
         if(!this.§_-qd§ || !this.hero.isSelf)
         {
            this.active = false;
            return;
         }
         this.§_-Q2w§ = true;
         if(!this.§_-n2L§)
         {
            this.§_-n2L§ = new §_-aS§(new PerkRadius());
            this.§_-n2L§.touchable = false;
         }
         this.§_-n2L§.scaleXY(1);
         this.§_-n2L§.scaleXY(int(this.radius * 2) / this.§_-n2L§.height);
         this.§_-n2L§.y = -Hero.§_-a1A§;
         this.hero.§_-J2J§(this.§_-n2L§);
      }
      
      override protected function §_-w2U§() : void
      {
         if(this.§_-Q2w§)
         {
            this.§_-H1h§();
         }
         else
         {
            super.§_-w2U§();
         }
      }
      
      override protected function §_-h1u§() : void
      {
         if(this.§_-Q2w§)
         {
            this.§_-H1h§();
         }
         else
         {
            super.§_-h1u§();
         }
      }
      
      override protected function get multipleSelection() : Boolean
      {
         return true;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(!("helperTeleport" in _loc2_))
               {
                  super.§_-x2f§(param1);
                  return;
               }
               if(!this.hero || _loc2_["helperTeleport"][0] != this.hero.id)
               {
                  return;
               }
               if(!this.§_-qd§ || !this.§_-qd§.§_-K13§ || this.§_-qd§.isDead || this.§_-qd§.inHollow)
               {
                  return;
               }
               this.§_-qd§.§_-r1C§(new b2Vec2(_loc2_["helperTeleport"][1],_loc2_["helperTeleport"][2]));
               if(this.§_-qd§.isSelf)
               {
                  this.§_-qd§.sendLocation();
               }
               this.§_-qd§.heroView.§_-k1I§();
               this.§_-qd§.heroView.§_-v2L§(new §_-pl§.perkData[this.§_-T2a§]["buttonClass"](),1);
               §_-u24§.sendMessage(this.§_-qd§.player.id,"",§_-g1j§.§_-C1E§);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function §_-c2j§() : void
      {
         super.§_-c2j§();
         this.§_-Q2w§ = false;
         this.§_-Pw§();
      }
      
      private function §_-Pw§() : void
      {
         if(Boolean(this.§_-n2L§) && Boolean(this.§_-n2L§.parentStarling))
         {
            this.§_-n2L§.parentStarling.removeChildStarling(this.§_-n2L§,false);
         }
      }
      
      private function §_-H1h§() : void
      {
         if(!Game.toggle)
         {
            if(!this.hero || !this.hero.game || !this.active)
            {
               return;
            }
            var _loc1_:Hero = this.§_-qd§;
            if(!_loc1_ || !_loc1_.§_-K13§ || _loc1_.isDead || _loc1_.inHollow)
            {
               this.active = false;
               this.§_-qd§ = null;
               §_-k1J§();
               return;
            }
            var _loc2_:Point = this.hero.game.squirrels.globalToLocal(§_-z2x§);
            var _loc3_:b2Vec2 = new b2Vec2(_loc2_.x / Game.§_-12A§,_loc2_.y / Game.§_-12A§);
            if(!this.§_-s1b§(_loc3_))
            {
               this.active = false;
               this.§_-qd§ = null;
               §_-k1J§();
               return;
            }
            if(this.§_-qd§.isSelf)
            {
               this.§_-qd§.§_-r1C§(_loc3_);
               this.§_-qd§.sendLocation();
               this.§_-qd§ = null;
            }
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"helperTeleport":[this.hero.id,_loc3_.x,_loc3_.y]}));
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"selectionFinished":[this.§_-T2a§,this.hero.id,1]}));
            this.active = false;
            return;
         }
         if(!this.hero || !this.hero.game || !this.active)
         {
            return;
         }
         _loc1_ = this.§_-qd§;
         if(!_loc1_ || !_loc1_.§_-K13§ || _loc1_.isDead || _loc1_.inHollow)
         {
            this.active = false;
            this.§_-qd§ = null;
            §_-k1J§();
            return;
         }
         _loc2_ = this.hero.game.squirrels.globalToLocal(§_-z2x§);
         _loc3_ = new b2Vec2(_loc2_.x / Game.§_-12A§,_loc2_.y / Game.§_-12A§);
         if(!this.§_-s1b§(_loc3_))
         {
            this.active = false;
            this.§_-qd§ = null;
            §_-k1J§();
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"helperTeleport":[this.hero.id,_loc3_.x,_loc3_.y]}));
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"selectionFinished":[this.§_-T2a§,this.hero.id,1]}));
         this.active = false;
      }
      
      private function §_-s1b§(param1:b2Vec2) : Boolean
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
         return _loc2_.Length() < this.radius / Game.§_-12A§;
      }
   }
}


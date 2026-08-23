package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-s1i§;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.core.Starling;
   
   public class §_-SN§ extends §_-21O§
   {
      
      private static const §_-O1N§:Number = 100;
      
      private var §_-62M§:Boolean = false;
      
      private var §_-S1u§:§_-h2I§ = null;
      
      private var radius:Number;
      
      private var §_-VQ§:§_-h2I§ = null;
      
      private var §_-k2C§:Point = new Point();
      
      private var §_-Us§:Point = new Point();
      
      public function §_-SN§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-M1H§;
         this.radius = §_-O1N§ * (1 + §_-Nu§() / 100);
      }
      
      override public function dispose() : void
      {
         this.§_-os§();
         super.dispose();
      }
      
      override public function get startCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 45;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 45;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game || !this.hero.isSelf || !this.hero.shaman)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.setSelection();
         if(this.§_-41W§)
         {
            return;
         }
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
      
      override protected function deactivate() : void
      {
         this.§_-os§();
         super.deactivate();
         if(this.§_-62M§)
         {
            §_-Z1A§();
            this.§_-62M§ = false;
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-b1y§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if(!("pocketTeleport" in _loc2_))
               {
                  return;
               }
               if(!this.hero || _loc2_["pocketTeleport"][0] != this.hero.id)
               {
                  return;
               }
               this.hero.§_-s1§(new b2Vec2(_loc2_["pocketTeleport"][1],_loc2_["pocketTeleport"][2]));
               this.hero.sendLocation();
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function setSelection() : void
      {
         if(!this.hero.isSelf || !this.hero.game)
         {
            return;
         }
         Mouse.hide();
         if(this.§_-S1u§)
         {
            this.§_-S1u§.removeFromParent();
         }
         this.§_-S1u§ = new §_-h2I§(new HeroPointer());
         §_-s1i§.§_-831§.addChild(this.§_-S1u§.getStarlingView());
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         this.§_-S1u§.x = this.§_-Us§.x;
         this.§_-S1u§.y = this.§_-Us§.y;
         this.§_-S1u§.§_-x2x§();
         this.§_-62M§ = true;
      }
      
      private function §_-os§() : void
      {
         if(!this.hero.isSelf)
         {
            return;
         }
         if(this.§_-S1u§)
         {
            this.§_-S1u§.removeFromParent();
         }
         if(Boolean(this.§_-VQ§) && Boolean(this.§_-VQ§.parentStarling))
         {
            this.§_-VQ§.parentStarling.removeChildStarling(this.§_-VQ§,false);
         }
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Mouse.show();
      }
      
      private function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-k2C§.setTo(_loc2_.§_-n2h§,_loc2_.§_-Zv§);
         this.§_-Us§ = _loc2_.§_-l29§(§_-s1i§.instance);
         this.§_-S1u§.x = this.§_-Us§.x;
         this.§_-S1u§.y = this.§_-Us§.y;
         var _loc3_:Boolean = Boolean(this.hero.game) && this.hero.game.§_-W2H§();
         this.§_-S1u§.visible = _loc3_;
         if(_loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§ && _loc3_)
         {
            this.§_-P2v§();
         }
      }
      
      private function §_-P2v§() : void
      {
         if(!this.hero.game)
         {
            this.§_-62M§ = false;
            this.active = false;
            return;
         }
         var _loc1_:Point = this.hero.game.squirrels.globalToLocal(this.§_-k2C§);
         var _loc2_:b2Vec2 = new b2Vec2(_loc1_.x / Game.§_-x2P§,_loc1_.y / Game.§_-x2P§);
         var _loc3_:b2Vec2 = this.hero.position.Copy();
         _loc3_.Subtract(_loc2_);
         if(_loc3_.Length() > this.radius / Game.§_-x2P§ && !this.§_-41W§)
         {
            this.active = false;
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pocketTeleport":[this.hero.id,_loc2_.x,_loc2_.y]}));
         this.§_-62M§ = false;
         this.active = false;
      }
   }
}


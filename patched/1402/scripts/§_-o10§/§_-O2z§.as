package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.core.Starling;
   
   public class §_-O2z§ extends §_-S2w§
   {
      
      private static const §_-w1v§:Number = 100;
      
      private var §_-81L§:Boolean = false;
      
      private var §_-5W§:§_-aS§ = null;
      
      private var radius:Number;
      
      private var §_-n2L§:§_-aS§ = null;
      
      private var §_-z2x§:Point = new Point();
      
      private var §_-5b§:Point = new Point();
      
      public function §_-O2z§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-K2J§;
         this.radius = §_-w1v§ * (1 + §_-bx§() / 100);
      }
      
      override public function dispose() : void
      {
         this.§_-c2j§();
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
         if(this.§_-53U§)
         {
            return;
         }
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
      
      override protected function deactivate() : void
      {
         this.§_-c2j§();
         super.deactivate();
         if(this.§_-81L§)
         {
            §_-k1J§();
            this.§_-81L§ = false;
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(!("pocketTeleport" in _loc2_))
               {
                  return;
               }
               if(!this.hero || _loc2_["pocketTeleport"][0] != this.hero.id)
               {
                  return;
               }
               this.hero.§_-r1C§(new b2Vec2(_loc2_["pocketTeleport"][1],_loc2_["pocketTeleport"][2]));
               this.hero.sendLocation();
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function setSelection() : void
      {
         if(!this.hero.isSelf || !this.hero.game)
         {
            return;
         }
         Mouse.hide();
         if(this.§_-5W§)
         {
            this.§_-5W§.removeFromParent();
         }
         this.§_-5W§ = new §_-aS§(new HeroPointer());
         §_-817§.§_-X2a§.addChild(this.§_-5W§.getStarlingView());
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         this.§_-5W§.x = this.§_-5b§.x;
         this.§_-5W§.y = this.§_-5b§.y;
         this.§_-5W§.§_-i18§();
         this.§_-81L§ = true;
      }
      
      private function §_-c2j§() : void
      {
         if(!this.hero.isSelf)
         {
            return;
         }
         if(this.§_-5W§)
         {
            this.§_-5W§.removeFromParent();
         }
         if(Boolean(this.§_-n2L§) && Boolean(this.§_-n2L§.parentStarling))
         {
            this.§_-n2L§.parentStarling.removeChildStarling(this.§_-n2L§,false);
         }
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Mouse.show();
      }
      
      private function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-z2x§.setTo(_loc2_.§_-ca§,_loc2_.§_-n2z§);
         this.§_-5b§ = _loc2_.§_-13l§(§_-817§.instance);
         this.§_-5W§.x = this.§_-5b§.x;
         this.§_-5W§.y = this.§_-5b§.y;
         var _loc3_:Boolean = Boolean(this.hero.game) && this.hero.game.§_-M6§();
         this.§_-5W§.visible = _loc3_;
         if(_loc3_)
         {
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
         if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§ && _loc3_)
         {
            this.§_-H1h§();
         }
      }
      
      private function §_-H1h§() : void
      {
         if(!this.hero.game)
         {
            this.§_-81L§ = false;
            this.active = false;
            return;
         }
         var _loc1_:Point = this.hero.game.squirrels.globalToLocal(this.§_-z2x§);
         var _loc2_:b2Vec2 = new b2Vec2(_loc1_.x / Game.§_-12A§,_loc1_.y / Game.§_-12A§);
         var _loc3_:b2Vec2 = this.hero.position.Copy();
         _loc3_.Subtract(_loc2_);
         if(_loc3_.Length() > this.radius / Game.§_-12A§ && !this.§_-53U§)
         {
            this.active = false;
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pocketTeleport":[this.hero.id,_loc2_.x,_loc2_.y]}));
         this.§_-81L§ = false;
         this.active = false;
      }
   }
}


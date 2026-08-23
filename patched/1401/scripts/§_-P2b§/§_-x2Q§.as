package §_-P2b§
{
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-s1i§;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import starling.core.Starling;
   
   public class §_-x2Q§ extends §_-H2N§
   {
      
      protected var §_-S1u§:§_-h2I§ = null;
      
      protected var §_-92A§:Point = new Point();
      
      protected var §_-k2C§:Point = new Point();
      
      protected var §_-Us§:Point = new Point();
      
      protected var §_-T1h§:Boolean = false;
      
      protected var circle:§_-d2d§ = null;
      
      public function §_-x2Q§(param1:Hero)
      {
         super(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.circle || !this.hero || !this.circle.visible)
         {
            return;
         }
         if(!this.available)
         {
            this.§_-os§();
         }
         var _loc2_:Point = (this.hero.game as SquirrelGame).globalToLocal(this.hero.localToGlobal(new Point(-this.maxRadius,this.hero.heroView.y - this.maxRadius - Hero.§_-YH§)));
         this.circle.rotation = this.hero.rotation;
         this.circle.x = _loc2_.x;
         this.circle.y = _loc2_.y;
      }
      
      override public function get json() : String
      {
         if(this.active)
         {
            return "";
         }
         return JSON.stringify(this.§_-92A§);
      }
      
      override public function dispose() : void
      {
         if(this.circle)
         {
            this.hero.game.removeChildStarling(this.circle);
            this.hero.game.removeChild(this.circle);
            this.circle = null;
         }
         this.§_-os§();
         super.dispose();
      }
      
      override public function §_-S2A§() : void
      {
         this.§_-os§();
         super.§_-S2A§();
      }
      
      override public function §_-7J§() : void
      {
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.§_-92A§ = new Point();
         setTimeout(this.setSelection,100);
      }
      
      override public function set active(param1:Boolean) : void
      {
         if(!param1)
         {
            this.§_-os§();
         }
         super.active = param1;
      }
      
      override protected function deactivate() : void
      {
         this.§_-os§();
         super.deactivate();
      }
      
      public function §_-21G§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ESCAPE)
         {
            return;
         }
         this.§_-os§();
      }
      
      public function §_-K1G§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-k2C§.setTo(_loc2_.§_-n2h§,_loc2_.§_-Zv§);
         this.§_-Us§ = _loc2_.§_-l29§(§_-s1i§.instance);
         if(this.maxRadius > 0)
         {
            this.§_-S1u§.alpha = this.§_-Us§.subtract(this.hero.heroView.localToGlobal(new Point(0,-23))).length > this.maxRadius ? 0.5 : 1;
         }
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
         if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§ && this.§_-T1h§ && _loc3_)
         {
            this.§_-D2T§();
         }
      }
      
      protected function get maxRadius() : Number
      {
         return 0;
      }
      
      protected function setSelection() : void
      {
         if(!this.hero.isSelf || !this.hero.game)
         {
            return;
         }
         §_-O1M§.§_-SK§();
         Mouse.hide();
         if(this.§_-S1u§)
         {
            this.§_-S1u§.removeFromParent();
         }
         this.§_-S1u§ = new §_-h2I§(new HeroPointer());
         this.§_-S1u§.x = this.§_-Us§.x;
         this.§_-S1u§.y = this.§_-Us§.y;
         this.§_-S1u§.§_-x2x§();
         this.§_-S1u§.visible = false;
         §_-s1i§.§_-831§.addChild(this.§_-S1u§.getStarlingView());
         if(this.maxRadius > 0)
         {
            if(!this.circle)
            {
               this.circle = new §_-d2d§(new Circle());
               this.circle.touchable = false;
               this.circle.visible = false;
               this.circle.stop();
            }
            this.circle.scaleXY(1);
            this.circle.scaleXY(int(this.maxRadius * 2) / this.circle.width);
            this.circle.visible = true;
            this.hero.game.§_-83v§(this.circle);
            this.hero.game.addChild(this.circle);
         }
         this.§_-T1h§ = true;
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      protected function §_-os§() : void
      {
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(this.§_-S1u§)
         {
            this.§_-S1u§.removeFromParent();
         }
         this.§_-T1h§ = false;
         if(this.circle)
         {
            this.circle.visible = false;
         }
         Mouse.show();
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§);
      }
      
      protected function §_-D2T§() : void
      {
         if(this.maxRadius > 0 && this.§_-Us§.subtract(this.hero.heroView.localToGlobal(new Point(0,-23))).length > this.maxRadius)
         {
            return;
         }
         var _loc1_:Point = this.hero.game.squirrels.globalToLocal(this.§_-k2C§);
         this.§_-92A§ = new Point(_loc1_.x / Game.§_-x2P§,_loc1_.y / Game.§_-x2P§);
         this.§_-92A§.subtract(new Point(this.hero.game.map.x,this.hero.game.map.y));
         Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,!this.active,this.target,this.json);
         this.§_-os§();
         this.§_-T1h§ = false;
         if(this.circle)
         {
            this.circle.visible = false;
         }
      }
   }
}


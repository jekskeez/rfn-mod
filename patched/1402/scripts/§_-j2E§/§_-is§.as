package §_-j2E§
{
   import §_-61C§.§_-a2p§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.utils.setTimeout;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import starling.core.Starling;
   
   public class §_-is§ extends §_-92f§
   {
      
      protected var §_-5W§:§_-aS§ = null;
      
      protected var §_-WP§:Point = new Point();
      
      protected var §_-z2x§:Point = new Point();
      
      protected var §_-5b§:Point = new Point();
      
      protected var §_-72x§:Boolean = false;
      
      protected var circle:§_-f1u§ = null;
      
      public function §_-is§(param1:Hero)
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
            this.§_-c2j§();
         }
         var _loc2_:Point = (this.hero.game as SquirrelGame).globalToLocal(this.hero.localToGlobal(new Point(-this.maxRadius,this.hero.heroView.y - this.maxRadius - Hero.§_-a1A§)));
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
         return JSON.stringify(this.§_-WP§);
      }
      
      override public function dispose() : void
      {
         if(this.circle)
         {
            this.hero.game.removeChildStarling(this.circle);
            this.hero.game.removeChild(this.circle);
            this.circle = null;
         }
         this.§_-c2j§();
         super.dispose();
      }
      
      override public function §_-xm§() : void
      {
         this.§_-c2j§();
         super.§_-xm§();
      }
      
      override public function §_-V1z§() : void
      {
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         this.§_-WP§ = new Point();
         setTimeout(this.setSelection,100);
      }
      
      override public function set active(param1:Boolean) : void
      {
         if(!param1)
         {
            this.§_-c2j§();
         }
         super.active = param1;
      }
      
      override protected function deactivate() : void
      {
         this.§_-c2j§();
         super.deactivate();
      }
      
      public function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ESCAPE)
         {
            return;
         }
         this.§_-c2j§();
      }
      
      public function §_-w1m§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         this.§_-z2x§.setTo(_loc2_.§_-ca§,_loc2_.§_-n2z§);
         this.§_-5b§ = _loc2_.§_-13l§(§_-817§.instance);
         if(this.maxRadius > 0)
         {
            this.§_-5W§.alpha = this.§_-5b§.subtract(this.hero.heroView.localToGlobal(new Point(0,-23))).length > this.maxRadius ? 0.5 : 1;
         }
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
         if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§ && this.§_-72x§ && _loc3_)
         {
            this.§_-w2U§();
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
         §_-a2p§.§_-Y1F§();
         Mouse.hide();
         if(this.§_-5W§)
         {
            this.§_-5W§.removeFromParent();
         }
         this.§_-5W§ = new §_-aS§(new HeroPointer());
         this.§_-5W§.x = this.§_-5b§.x;
         this.§_-5W§.y = this.§_-5b§.y;
         this.§_-5W§.§_-i18§();
         this.§_-5W§.visible = false;
         §_-817§.§_-X2a§.addChild(this.§_-5W§.getStarlingView());
         if(this.maxRadius > 0)
         {
            if(!this.circle)
            {
               this.circle = new §_-f1u§(new Circle());
               this.circle.touchable = false;
               this.circle.visible = false;
               this.circle.stop();
            }
            this.circle.scaleXY(1);
            this.circle.scaleXY(int(this.maxRadius * 2) / this.circle.width);
            this.circle.visible = true;
            this.hero.game.§_-J2J§(this.circle);
            this.hero.game.addChild(this.circle);
         }
         this.§_-72x§ = true;
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      protected function §_-c2j§() : void
      {
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(this.§_-5W§)
         {
            this.§_-5W§.removeFromParent();
         }
         this.§_-72x§ = false;
         if(this.circle)
         {
            this.circle.visible = false;
         }
         Mouse.show();
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§);
      }
      
      protected function §_-w2U§() : void
      {
         if(this.maxRadius > 0 && this.§_-5b§.subtract(this.hero.heroView.localToGlobal(new Point(0,-23))).length > this.maxRadius)
         {
            return;
         }
         var _loc1_:Point = this.hero.game.squirrels.globalToLocal(this.§_-z2x§);
         this.§_-WP§ = new Point(_loc1_.x / Game.§_-12A§,_loc1_.y / Game.§_-12A§);
         this.§_-WP§.subtract(new Point(this.hero.game.map.x,this.hero.game.map.y));
         Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,!this.active,this.target,this.json);
         this.§_-c2j§();
         this.§_-72x§ = false;
         if(this.circle)
         {
            this.circle.visible = false;
         }
      }
   }
}


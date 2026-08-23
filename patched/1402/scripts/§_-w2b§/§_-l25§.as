package §_-w2b§
{
   import §_-G2y§.ControllerHeroLocal;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-hd§.§_-01M§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import starling.core.Starling;
   import starling.display.Button;
   import starling.display.Sprite;
   
   public class §_-l25§ extends Sprite
   {
      
      private static const §_-838§:int = 10;
      
      private static var §_-215§:Boolean = true;
      
      private var §_-6w§:ControllerHeroLocal = null;
      
      private var §_-22H§:Button = null;
      
      private var §_-hx§:Button = null;
      
      private var §_-f2e§:Button = null;
      
      public function §_-l25§(param1:ControllerHeroLocal)
      {
         super();
         this.§_-6w§ = param1;
         this.§_-22H§ = new Button(§_-01M§.getTexture(new BtnMoveLeft()));
         this.§_-22H§.addEventListener(TouchEvent.§_-qu§,this.§_-03z§);
         addChild(this.§_-22H§);
         this.§_-hx§ = new Button(§_-01M§.getTexture(new BtnMoveRight()));
         this.§_-hx§.addEventListener(TouchEvent.§_-qu§,this.§_-03z§);
         addChild(this.§_-hx§);
         this.§_-f2e§ = new Button(§_-01M§.getTexture(new BtnMoveUp()));
         this.§_-f2e§.addEventListener(TouchEvent.§_-qu§,this.§_-03z§);
         addChild(this.§_-f2e§);
         Starling.§_-n1s§.stage.addChild(this);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         this.§_-W1N§();
      }
      
      public static function §_-520§(param1:Boolean) : void
      {
         §_-215§ = param1;
      }
      
      public function remove() : void
      {
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-W1N§);
         this.§_-6w§ = null;
         this.§_-22H§.§_-b1M§(TouchEvent.§_-qu§);
         this.§_-22H§.removeFromParent(true);
         this.§_-22H§ = null;
         this.§_-hx§.§_-b1M§(TouchEvent.§_-qu§);
         this.§_-hx§.removeFromParent(true);
         this.§_-hx§ = null;
         this.§_-f2e§.§_-b1M§(TouchEvent.§_-qu§);
         this.§_-f2e§.removeFromParent(true);
         this.§_-f2e§ = null;
         removeFromParent(true);
      }
      
      private function §_-03z§(param1:TouchEvent) : void
      {
         var _loc6_:§_-J1a§ = null;
         if(!§_-215§)
         {
            return;
         }
         param1.stopImmediatePropagation();
         var _loc2_:Vector.<§_-J1a§> = param1.§_-31F§(this);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_];
            switch(_loc6_.target)
            {
               case this.§_-f2e§:
                  _loc3_ = int(Keyboard.UP);
                  break;
               case this.§_-22H§:
                  _loc3_ = int(Keyboard.LEFT);
                  break;
               case this.§_-hx§:
                  _loc3_ = int(Keyboard.RIGHT);
            }
            switch(_loc6_.§_-iR§)
            {
               case §_-01Z§.§_-N1v§:
                  this.§_-6w§.§_-r1i§(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,0,_loc3_));
                  break;
               case §_-01Z§.§_-1Z§:
                  this.§_-6w§.§_-r1i§(new KeyboardEvent(KeyboardEvent.KEY_UP,true,false,0,_loc3_));
            }
            _loc4_++;
         }
      }
      
      private function §_-W1N§(param1:Event = null) : void
      {
         this.§_-22H§.x = §_-838§;
         this.§_-22H§.y = Game.starling.stage.stageHeight - this.§_-22H§.height * 1.5;
         this.§_-hx§.x = this.§_-22H§.x + this.§_-22H§.width + §_-838§;
         this.§_-hx§.y = Game.starling.stage.stageHeight - this.§_-hx§.height * 1.5;
         this.§_-f2e§.x = Game.starling.stage.stageWidth - this.§_-f2e§.width - §_-838§;
         this.§_-f2e§.y = Game.starling.stage.stageHeight - this.§_-f2e§.height * 1.5;
      }
   }
}


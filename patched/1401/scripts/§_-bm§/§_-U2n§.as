package §_-bm§
{
   import §_-C1l§.§_-a2§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-s2l§.ControllerHeroLocal;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import starling.core.Starling;
   import starling.display.Button;
   import starling.display.Sprite;
   
   public class §_-U2n§ extends Sprite
   {
      
      private static const §_-o1V§:int = 10;
      
      private static var §_-F2N§:Boolean = true;
      
      private var §_-c6§:ControllerHeroLocal = null;
      
      private var §_-71N§:Button = null;
      
      private var §_-h26§:Button = null;
      
      private var §_-Q2p§:Button = null;
      
      public function §_-U2n§(param1:ControllerHeroLocal)
      {
         super();
         this.§_-c6§ = param1;
         this.§_-71N§ = new Button(§_-a2§.getTexture(new BtnMoveLeft()));
         this.§_-71N§.addEventListener(TouchEvent.§_-N1l§,this.§_-B1E§);
         addChild(this.§_-71N§);
         this.§_-h26§ = new Button(§_-a2§.getTexture(new BtnMoveRight()));
         this.§_-h26§.addEventListener(TouchEvent.§_-N1l§,this.§_-B1E§);
         addChild(this.§_-h26§);
         this.§_-Q2p§ = new Button(§_-a2§.getTexture(new BtnMoveUp()));
         this.§_-Q2p§.addEventListener(TouchEvent.§_-N1l§,this.§_-B1E§);
         addChild(this.§_-Q2p§);
         Starling.§_-y1l§.stage.addChild(this);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         this.§_-A3q§();
      }
      
      public static function §_-C2O§(param1:Boolean) : void
      {
         §_-F2N§ = param1;
      }
      
      public function remove() : void
      {
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         this.§_-c6§ = null;
         this.§_-71N§.§_-b8§(TouchEvent.§_-N1l§);
         this.§_-71N§.removeFromParent(true);
         this.§_-71N§ = null;
         this.§_-h26§.§_-b8§(TouchEvent.§_-N1l§);
         this.§_-h26§.removeFromParent(true);
         this.§_-h26§ = null;
         this.§_-Q2p§.§_-b8§(TouchEvent.§_-N1l§);
         this.§_-Q2p§.removeFromParent(true);
         this.§_-Q2p§ = null;
         removeFromParent(true);
      }
      
      private function §_-B1E§(param1:TouchEvent) : void
      {
         var _loc6_:§_-e2m§ = null;
         if(!§_-F2N§)
         {
            return;
         }
         param1.stopImmediatePropagation();
         var _loc2_:Vector.<§_-e2m§> = param1.§_-51Q§(this);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_];
            switch(_loc6_.target)
            {
               case this.§_-Q2p§:
                  _loc3_ = int(Keyboard.UP);
                  break;
               case this.§_-71N§:
                  _loc3_ = int(Keyboard.LEFT);
                  break;
               case this.§_-h26§:
                  _loc3_ = int(Keyboard.RIGHT);
            }
            switch(_loc6_.§_-Q2S§)
            {
               case §_-sj§.§_-ML§:
                  this.§_-c6§.§_-21G§(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,0,_loc3_));
                  break;
               case §_-sj§.§_-L23§:
                  this.§_-c6§.§_-21G§(new KeyboardEvent(KeyboardEvent.KEY_UP,true,false,0,_loc3_));
            }
            _loc4_++;
         }
      }
      
      private function §_-A3q§(param1:Event = null) : void
      {
         this.§_-71N§.x = §_-o1V§;
         this.§_-71N§.y = Game.starling.stage.stageHeight - this.§_-71N§.height * 1.5;
         this.§_-h26§.x = this.§_-71N§.x + this.§_-71N§.width + §_-o1V§;
         this.§_-h26§.y = Game.starling.stage.stageHeight - this.§_-h26§.height * 1.5;
         this.§_-Q2p§.x = Game.starling.stage.stageWidth - this.§_-Q2p§.width - §_-o1V§;
         this.§_-Q2p§.y = Game.starling.stage.stageHeight - this.§_-Q2p§.height * 1.5;
      }
   }
}


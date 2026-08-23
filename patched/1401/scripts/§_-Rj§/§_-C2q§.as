package §_-Rj§
{
   import §_-42B§.TweenMax;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   
   public class §_-C2q§ extends Sprite
   {
      
      public static const §_-H13§:Number = 0.3;
      
      public static const §_-c1K§:Number = 1;
      
      public static const §_-Ym§:Number = 0.1;
      
      private var §_-o2N§:§_-A32§;
      
      private var §_-OR§:§_-22V§;
      
      private var tween:TweenMax;
      
      public function §_-C2q§(param1:§_-A32§)
      {
         super();
         this.§_-OR§ = new §_-22V§("",10,5,new TextFormat(§_-22V§.§_-F2z§,12,16777215,true));
         addChild(this.§_-OR§);
         this.§_-o2N§ = param1;
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
      }
      
      public function dispose() : void
      {
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         this.§_-OR§ = null;
         this.tween = null;
      }
      
      private function §_-F2x§(param1:Number) : void
      {
         this.alpha = 1;
         this.§_-OR§.text = gls("Масштаб") + ": " + int(param1 * 100) + " %";
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         this.graphics.drawRoundRect(0,0,this.§_-OR§.width + 20,this.§_-OR§.height + 10,10);
         this.graphics.endFill();
         this.x = (Game.starling.stage.stageWidth + §_-a9§.§_-9o§) * 0.5 - this.width;
         this.y = 44;
         if(this.tween != null)
         {
            this.tween.§_-h2r§();
         }
         this.tween = TweenMax.to(this,0.7,{
            "delay":0.8,
            "alpha":0
         });
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(Game.stage.focus != this.§_-o2N§.map)
         {
            return;
         }
         if(!param1.ctrlKey)
         {
            return;
         }
         if(this.§_-o2N§.§_-uo§)
         {
            return;
         }
         var _loc2_:Number = 0;
         switch(param1.keyCode)
         {
            case Keyboard.NUMPAD_ADD:
            case Keyboard.EQUAL:
               _loc2_ = §_-Ym§;
               break;
            case Keyboard.NUMPAD_SUBTRACT:
            case Keyboard.MINUS:
               _loc2_ = -§_-Ym§;
         }
         if(_loc2_ == 0)
         {
            return;
         }
         this.§_-q0§(_loc2_);
      }
      
      public function §_-q0§(param1:Number) : void
      {
         if(this.§_-o2N§.§_-uo§)
         {
            return;
         }
         var _loc2_:Number = this.§_-o2N§.scale + param1;
         if(_loc2_ > §_-c1K§ || _loc2_ < §_-H13§)
         {
            return;
         }
         this.§_-o2N§.scale = _loc2_;
         this.§_-F2x§(_loc2_);
      }
   }
}


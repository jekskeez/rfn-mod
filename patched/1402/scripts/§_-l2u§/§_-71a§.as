package §_-l2u§
{
   import §_-22D§.TweenMax;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   
   public class §_-71a§ extends Sprite
   {
      
      public static const §_-P11§:Number = 0.3;
      
      public static const §_-A3E§:Number = 1;
      
      public static const §_-I1k§:Number = 0.1;
      
      private var §_-5Y§:§_-62b§;
      
      private var §_-222§:§_-i5§;
      
      private var tween:TweenMax;
      
      public function §_-71a§(param1:§_-62b§)
      {
         super();
         this.§_-222§ = new §_-i5§("",10,5,new TextFormat(§_-i5§.§_-c10§,12,16777215,true));
         addChild(this.§_-222§);
         this.§_-5Y§ = param1;
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
      }
      
      public function dispose() : void
      {
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         this.§_-222§ = null;
         this.tween = null;
      }
      
      private function §_-711§(param1:Number) : void
      {
         this.alpha = 1;
         this.§_-222§.text = gls("Масштаб") + ": " + int(param1 * 100) + " %";
         this.graphics.clear();
         this.graphics.beginFill(0,0.25);
         this.graphics.drawRoundRect(0,0,this.§_-222§.width + 20,this.§_-222§.height + 10,10);
         this.graphics.endFill();
         this.x = (Game.starling.stage.stageWidth + §_-Zy§.§_-21V§) * 0.5 - this.width;
         this.y = 44;
         if(this.tween != null)
         {
            this.tween.§_-kl§();
         }
         this.tween = TweenMax.to(this,0.7,{
            "delay":0.8,
            "alpha":0
         });
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(Game.stage.focus != this.§_-5Y§.map)
         {
            return;
         }
         if(!param1.ctrlKey)
         {
            return;
         }
         if(this.§_-5Y§.§_-nW§)
         {
            return;
         }
         var _loc2_:Number = 0;
         switch(param1.keyCode)
         {
            case Keyboard.NUMPAD_ADD:
            case Keyboard.EQUAL:
               _loc2_ = §_-I1k§;
               break;
            case Keyboard.NUMPAD_SUBTRACT:
            case Keyboard.MINUS:
               _loc2_ = -§_-I1k§;
         }
         if(_loc2_ == 0)
         {
            return;
         }
         this.§_-KW§(_loc2_);
      }
      
      public function §_-KW§(param1:Number) : void
      {
         if(this.§_-5Y§.§_-nW§)
         {
            return;
         }
         var _loc2_:Number = this.§_-5Y§.scale + param1;
         if(_loc2_ > §_-A3E§ || _loc2_ < §_-P11§)
         {
            return;
         }
         this.§_-5Y§.scale = _loc2_;
         this.§_-711§(_loc2_);
      }
   }
}


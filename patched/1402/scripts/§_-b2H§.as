package
{
   import §_-22D§.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class §_-b2H§ extends Sprite
   {
      
      private var messageField:TextField = new TextField();
      
      private var §_-qs§:DisplayObject = null;
      
      private var §_-BC§:Function = null;
      
      private var §_-Y2p§:Timer = new Timer(5000,1);
      
      private var tween:TweenMax = null;
      
      public function §_-b2H§(param1:Function = null)
      {
         super();
         this.§_-BC§ = param1;
         this.init();
      }
      
      override public function get height() : Number
      {
         return this.visible ? this.§_-qs§.y + this.§_-qs§.height : 0;
      }
      
      public function §_-33§(param1:String, param2:int = 5000) : void
      {
         if(this.tween != null)
         {
            this.tween.§_-kl§();
            this.tween = null;
         }
         this.messageField.htmlText = param1;
         this.redraw();
         if(param2 == 0)
         {
            return;
         }
         this.§_-Y2p§.delay = param2;
         this.§_-Y2p§.reset();
         this.§_-Y2p§.start();
      }
      
      public function remove(param1:Boolean = false) : void
      {
         this.visible = false;
         this.§_-Y2p§.stop();
         if(!param1)
         {
            this.§_-BC§();
         }
      }
      
      public function dispose() : void
      {
         this.§_-Y2p§.stop();
         this.§_-Y2p§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-L1N§);
         if(this.tween != null)
         {
            this.tween.§_-kl§();
            this.tween = null;
         }
      }
      
      private function init() : void
      {
         this.messageField.x = 0;
         this.messageField.y = 0;
         this.messageField.mouseEnabled = false;
         this.messageField.wordWrap = true;
         this.messageField.multiline = true;
         this.messageField.width = 120;
         this.messageField.embedFonts = true;
         this.messageField.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,11);
         addChild(this.messageField);
         this.§_-Y2p§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-L1N§);
         this.§_-qs§ = new MessageTriangle();
         addChild(this.§_-qs§);
         this.visible = false;
      }
      
      private function redraw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.7);
         this.graphics.drawRoundRectComplex(this.messageField.x - 3,this.messageField.y,this.messageField.textWidth + 10,this.messageField.textHeight + 5,5,5,5,5);
         this.graphics.endFill();
         this.§_-qs§.x = this.messageField.x - 3 + int((this.messageField.textWidth + 10) * 0.5);
         this.§_-qs§.y = this.messageField.y + this.messageField.textHeight + 5;
         if(this.scaleX > 0)
         {
            this.x = -int(this.messageField.textWidth * 0.5) - 2;
         }
         else
         {
            this.x = int(this.messageField.textWidth * 0.5) - 2;
         }
         this.visible = true;
         this.alpha = 1;
         if(this.§_-BC§ != null)
         {
            this.§_-BC§();
         }
      }
      
      private function §_-L1N§(param1:TimerEvent) : void
      {
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "onComplete":this.remove
         });
      }
   }
}


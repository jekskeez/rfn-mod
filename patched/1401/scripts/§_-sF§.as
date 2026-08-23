package
{
   import §_-42B§.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class §_-sF§ extends Sprite
   {
      
      private var messageField:TextField = new TextField();
      
      private var §_-uI§:DisplayObject = null;
      
      private var §_-42s§:Function = null;
      
      private var §_-wQ§:Timer = new Timer(5000,1);
      
      private var tween:TweenMax = null;
      
      public function §_-sF§(param1:Function = null)
      {
         super();
         this.§_-42s§ = param1;
         this.init();
      }
      
      override public function get height() : Number
      {
         return this.visible ? this.§_-uI§.y + this.§_-uI§.height : 0;
      }
      
      public function §_-BM§(param1:String, param2:int = 5000) : void
      {
         if(this.tween != null)
         {
            this.tween.§_-h2r§();
            this.tween = null;
         }
         this.messageField.htmlText = param1;
         this.redraw();
         if(param2 == 0)
         {
            return;
         }
         this.§_-wQ§.delay = param2;
         this.§_-wQ§.reset();
         this.§_-wQ§.start();
      }
      
      public function remove(param1:Boolean = false) : void
      {
         this.visible = false;
         this.§_-wQ§.stop();
         if(!param1)
         {
            this.§_-42s§();
         }
      }
      
      public function dispose() : void
      {
         this.§_-wQ§.stop();
         this.§_-wQ§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-R1§);
         if(this.tween != null)
         {
            this.tween.§_-h2r§();
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
         this.messageField.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,11);
         addChild(this.messageField);
         this.§_-wQ§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-R1§);
         this.§_-uI§ = new MessageTriangle();
         addChild(this.§_-uI§);
         this.visible = false;
      }
      
      private function redraw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.7);
         this.graphics.drawRoundRectComplex(this.messageField.x - 3,this.messageField.y,this.messageField.textWidth + 10,this.messageField.textHeight + 5,5,5,5,5);
         this.graphics.endFill();
         this.§_-uI§.x = this.messageField.x - 3 + int((this.messageField.textWidth + 10) * 0.5);
         this.§_-uI§.y = this.messageField.y + this.messageField.textHeight + 5;
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
         if(this.§_-42s§ != null)
         {
            this.§_-42s§();
         }
      }
      
      private function §_-R1§(param1:TimerEvent) : void
      {
         this.tween = TweenMax.to(this,1,{
            "alpha":0,
            "onComplete":this.remove
         });
      }
   }
}


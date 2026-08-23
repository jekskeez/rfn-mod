package buttons
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-y1l§;
   
   public class §_-c6§ extends Sprite
   {
      
      public var §_-3I§:SimpleButton;
      
      public var §_-A3W§:SimpleButton;
      
      public function §_-c6§(param1:SimpleButton, param2:SimpleButton, param3:Boolean)
      {
         super();
         this.§_-3I§ = param1;
         this.§_-A3W§ = param2;
         this.init(param3);
      }
      
      override public function get width() : Number
      {
         return this.§_-3I§.width;
      }
      
      public function on(param1:MouseEvent = null) : void
      {
         this.toggle(true);
      }
      
      public function off(param1:MouseEvent = null) : void
      {
         this.toggle(false);
      }
      
      public function enabled(param1:Boolean) : void
      {
         this.mouseEnabled = this.§_-3I§.mouseEnabled = this.§_-A3W§.mouseEnabled = param1;
         if(!param1)
         {
            this.filters = §_-y1l§.§_-Tk§;
         }
      }
      
      private function init(param1:Boolean) : void
      {
         this.toggle(param1);
         addChild(this.§_-3I§);
         addChild(this.§_-A3W§);
         this.§_-3I§.addEventListener(MouseEvent.CLICK,this.on);
         this.§_-A3W§.addEventListener(MouseEvent.CLICK,this.off);
      }
      
      private function toggle(param1:Boolean) : void
      {
         this.§_-3I§.visible = !param1;
         this.§_-A3W§.visible = param1;
      }
   }
}


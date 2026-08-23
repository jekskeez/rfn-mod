package buttons
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-x1Z§;
   
   public class §_-p1R§ extends Sprite
   {
      
      public var §_-H1o§:SimpleButton;
      
      public var §_-l2A§:SimpleButton;
      
      public function §_-p1R§(param1:SimpleButton, param2:SimpleButton, param3:Boolean)
      {
         super();
         this.§_-H1o§ = param1;
         this.§_-l2A§ = param2;
         this.init(param3);
      }
      
      override public function get width() : Number
      {
         return this.§_-H1o§.width;
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
         this.mouseEnabled = this.§_-H1o§.mouseEnabled = this.§_-l2A§.mouseEnabled = param1;
         if(!param1)
         {
            this.filters = §_-x1Z§.§_-c2G§;
         }
      }
      
      private function init(param1:Boolean) : void
      {
         this.toggle(param1);
         addChild(this.§_-H1o§);
         addChild(this.§_-l2A§);
         this.§_-H1o§.addEventListener(MouseEvent.CLICK,this.on);
         this.§_-l2A§.addEventListener(MouseEvent.CLICK,this.off);
      }
      
      private function toggle(param1:Boolean) : void
      {
         this.§_-H1o§.visible = !param1;
         this.§_-l2A§.visible = param1;
      }
   }
}


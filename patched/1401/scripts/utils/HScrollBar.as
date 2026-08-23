package utils
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class HScrollBar extends Sprite
   {
      
      public static const ON_SCROLL:String = "HScrollBar.ON_SCROLL";
      
      private var §_-x5§:ScrollerLine = null;
      
      private var thumb:ScrollerThumb = null;
      
      public function HScrollBar(param1:int = 380)
      {
         super();
         this.§_-x5§ = new ScrollerLine();
         this.§_-x5§.height = param1;
         this.§_-x5§.filters = [new DropShadowFilter(4,114,11179649,1,4,4,1,1,true)];
         this.§_-x5§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-f2a§);
         addChild(this.§_-x5§);
         this.thumb = new ScrollerThumb();
         this.thumb.x = int((this.§_-x5§.width - this.thumb.width) * 0.5);
         this.thumb.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-S2F§);
         addChild(this.thumb);
         this.§_-Vy§();
      }
      
      private function §_-f2a§(param1:MouseEvent) : void
      {
         this.thumb.y = this.globalToLocal(new Point(param1.stageX,param1.stageY)).y;
         this.§_-Vy§();
         this.§_-S2F§();
      }
      
      private function §_-S2F§(param1:MouseEvent = null) : void
      {
         this.thumb.startDrag(false,new Rectangle(this.thumb.x,0,0,this.§_-x5§.height - this.thumb.height));
         this.thumb.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-K25§);
         this.thumb.stage.addEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
      }
      
      private function §_-K25§(param1:MouseEvent) : void
      {
         this.thumb.stopDrag();
         this.thumb.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-K25§);
         this.thumb.stage.removeEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
      }
      
      private function §_-Vy§() : void
      {
         this.thumb.y = Math.max(Math.min(this.thumb.y,this.§_-x5§.height - this.thumb.height),0);
         this.§_-N17§();
      }
      
      private function §_-L1Y§(param1:Event) : void
      {
         this.§_-N17§();
      }
      
      private function §_-N17§() : void
      {
         dispatchEvent(new Event(ON_SCROLL));
      }
      
      public function get value() : Number
      {
         return Math.min(Math.max(this.thumb.y / (this.§_-x5§.height - this.thumb.height),0),1);
      }
      
      public function set value(param1:Number) : void
      {
         this.§_-P1q§(param1);
         this.§_-N17§();
      }
      
      public function §_-P1q§(param1:Number) : void
      {
         param1 = Math.min(Math.max(param1,0),1);
         this.thumb.y = param1 * (this.§_-x5§.height - this.thumb.height);
      }
   }
}


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
      
      private var §_-t0§:ScrollerLine = null;
      
      private var thumb:ScrollerThumb = null;
      
      public function HScrollBar(param1:int = 380)
      {
         super();
         this.§_-t0§ = new ScrollerLine();
         this.§_-t0§.height = param1;
         this.§_-t0§.filters = [new DropShadowFilter(4,114,11179649,1,4,4,1,1,true)];
         this.§_-t0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-834§);
         addChild(this.§_-t0§);
         this.thumb = new ScrollerThumb();
         this.thumb.x = int((this.§_-t0§.width - this.thumb.width) * 0.5);
         this.thumb.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-a2h§);
         addChild(this.thumb);
         this.§_-dD§();
      }
      
      private function §_-834§(param1:MouseEvent) : void
      {
         this.thumb.y = this.globalToLocal(new Point(param1.stageX,param1.stageY)).y;
         this.§_-dD§();
         this.§_-a2h§();
      }
      
      private function §_-a2h§(param1:MouseEvent = null) : void
      {
         this.thumb.startDrag(false,new Rectangle(this.thumb.x,0,0,this.§_-t0§.height - this.thumb.height));
         this.thumb.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-iW§);
         this.thumb.stage.addEventListener(Event.ENTER_FRAME,this.§_-A1X§);
      }
      
      private function §_-iW§(param1:MouseEvent) : void
      {
         this.thumb.stopDrag();
         this.thumb.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-iW§);
         this.thumb.stage.removeEventListener(Event.ENTER_FRAME,this.§_-A1X§);
      }
      
      private function §_-dD§() : void
      {
         this.thumb.y = Math.max(Math.min(this.thumb.y,this.§_-t0§.height - this.thumb.height),0);
         this.§_-t§();
      }
      
      private function §_-A1X§(param1:Event) : void
      {
         this.§_-t§();
      }
      
      private function §_-t§() : void
      {
         dispatchEvent(new Event(ON_SCROLL));
      }
      
      public function get value() : Number
      {
         return Math.min(Math.max(this.thumb.y / (this.§_-t0§.height - this.thumb.height),0),1);
      }
      
      public function set value(param1:Number) : void
      {
         this.§_-r1E§(param1);
         this.§_-t§();
      }
      
      public function §_-r1E§(param1:Number) : void
      {
         param1 = Math.min(Math.max(param1,0),1);
         this.thumb.y = param1 * (this.§_-t0§.height - this.thumb.height);
      }
   }
}


package tape
{
   import §_-83V§.§_-2p§;
   import §_-83V§.§_-K1U§;
   import §_-Q1P§.§_-y2d§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import utils.§_-32G§;
   
   public class §_-T10§ extends §_-021§
   {
      
      private var on:ShamaningOn = new ShamaningOn();
      
      private var off:ShamaningOff = new ShamaningOff();
      
      private var §_-71n§:Boolean = false;
      
      public var §_-O1s§:Boolean = false;
      
      public function §_-T10§(param1:Class)
      {
         super(param1,TapeShamaingButton);
         this.button.addEventListener(MouseEvent.CLICK,this.§_-Q1r§);
         this.on.x = 39;
         this.on.y = 29;
         this.on.mouseEnabled = false;
         addChild(this.on);
         this.§_-O1s§ = §_-32G§.§_-Yw§(this.className,"ISaveInvert");
         this.off.x = 39;
         this.off.y = 29;
         this.off.mouseEnabled = false;
         addChild(this.off);
         this.state = this.§_-O1s§;
      }
      
      public function get state() : Boolean
      {
         return this.§_-71n§;
      }
      
      public function set state(param1:Boolean) : void
      {
         this.§_-71n§ = param1;
         param1 = this.§_-O1s§ ? !param1 : param1;
         this.on.visible = param1;
         this.off.visible = !param1;
      }
      
      private function §_-Q1r§(param1:Event) : void
      {
         if((className == §_-K1U§ || className == §_-2p§) && §_-y2d§.mode != §_-q1p§.§_-w1Y§)
         {
            this.state = false;
            return;
         }
         this.state = !this.state;
      }
   }
}


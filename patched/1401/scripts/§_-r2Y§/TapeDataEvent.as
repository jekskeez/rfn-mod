package §_-r2Y§
{
   import flash.events.Event;
   import tape.§_-xc§;
   
   public class TapeDataEvent extends Event
   {
      
      public static const UPDATE:String = "TapeDataEvent.UPDATE";
      
      public var data:§_-xc§;
      
      public function TapeDataEvent(param1:String, param2:§_-xc§)
      {
         super(param1);
         this.data = param2;
      }
   }
}


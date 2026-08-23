package §_-a11§
{
   import flash.events.Event;
   import tape.§_-h2f§;
   
   public class TapeDataEvent extends Event
   {
      
      public static const UPDATE:String = "TapeDataEvent.UPDATE";
      
      public var data:§_-h2f§;
      
      public function TapeDataEvent(param1:String, param2:§_-h2f§)
      {
         super(param1);
         this.data = param2;
      }
   }
}


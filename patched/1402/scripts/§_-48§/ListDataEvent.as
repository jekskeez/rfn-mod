package §_-48§
{
   import §_-cA§.§_-I2x§;
   import flash.events.Event;
   
   public class ListDataEvent extends Event
   {
      
      public static const UPDATE:String = "ListDataEvent.UPDATE";
      
      public static const SORTED:String = "ListDataEvent.SORTED";
      
      public var data:§_-I2x§;
      
      public function ListDataEvent(param1:String, param2:§_-I2x§)
      {
         super(param1);
         this.data = param2;
      }
   }
}


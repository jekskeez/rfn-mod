package §_-5C§
{
   import §_-X1o§.§_-93Q§;
   import flash.events.Event;
   
   public class ListDataEvent extends Event
   {
      
      public static const UPDATE:String = "ListDataEvent.UPDATE";
      
      public static const SORTED:String = "ListDataEvent.SORTED";
      
      public var data:§_-93Q§;
      
      public function ListDataEvent(param1:String, param2:§_-93Q§)
      {
         super(param1);
         this.data = param2;
      }
   }
}


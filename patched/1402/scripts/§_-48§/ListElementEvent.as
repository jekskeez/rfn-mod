package §_-48§
{
   import §_-cA§.§_-3b§;
   import flash.events.Event;
   
   public class ListElementEvent extends Event
   {
      
      public static const CHANGED:String = "ListElementEvent.CHANGED";
      
      public var §_-B2d§:§_-3b§;
      
      public function ListElementEvent(param1:String, param2:§_-3b§)
      {
         super(param1);
         this.§_-B2d§ = param2;
      }
   }
}


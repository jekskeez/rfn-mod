package events
{
   import flash.events.Event;
   
   public class CastItemsEvent extends Event
   {
      
      public static const UPDATE:String = "CastItemsEvent.UPDATE";
      
      public var items:Array = null;
      
      public function CastItemsEvent(param1:String, param2:Array)
      {
         super(param1);
         this.items = param2;
      }
   }
}


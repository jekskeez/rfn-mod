package events
{
   import flash.events.Event;
   
   public class NotificationEvent extends Event
   {
      
      public static const SHOW:String = "NotificationEvent.SHOWED";
      
      public static const HIDE:String = "NotificationEvent.HIDED";
      
      public var §_-H16§:int;
      
      public function NotificationEvent(param1:String, param2:int)
      {
         super(param1);
         this.§_-H16§ = param2;
      }
   }
}


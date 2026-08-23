package events
{
   import flash.events.Event;
   
   public class PostEvent extends Event
   {
      
      public static const REMOVE_EVENT:String = "PostEvent.REMOVE_EVENT";
      
      public var id:int = -1;
      
      public function PostEvent(param1:int)
      {
         super(REMOVE_EVENT);
         this.id = param1;
      }
   }
}


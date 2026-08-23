package events
{
   import flash.events.Event;
   
   public class EditorEvent extends Event
   {
      
      public static const MODE_CHANGED:String = "EditorEvent.MODE_CHANGED";
      
      public static const LOCATION_CHANGED:String = "EditorEvent.LOCATION_CHANGED";
      
      public static const SUBLOCATION_CHANGED:String = "EditorEvent.SUBLOCATION_CHANGED";
      
      public var location:int;
      
      public var mode:int;
      
      public var sub:int;
      
      public function EditorEvent(param1:String, param2:int, param3:int, param4:int = 0)
      {
         super(param1,false,true);
         this.location = param2;
         this.mode = param3;
         this.sub = param4;
      }
   }
}


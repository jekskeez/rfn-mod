package events
{
   import flash.events.Event;
   
   public class §_-F2k§ extends Event
   {
      
      public static const §_-I5§:String = "EditElement.new";
      
      public static const ADD:String = "EditElement.add";
      
      public static const REMOVE:String = "EditElement.remove";
      
      public static const SELECT:String = "EditElement.select";
      
      public static const CHANGE:String = "EditElement.change";
      
      public var className:*;
      
      public function §_-F2k§(param1:*, param2:String = "EditElement.new")
      {
         super(param2);
         this.className = param1;
      }
   }
}


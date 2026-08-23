package events
{
   import §_-c2C§.Screen;
   import flash.events.Event;
   
   public class ScreenEvent extends Event
   {
      
      public static const SHOW:String = "ScreenEvent.show";
      
      public static const HIDE:String = "ScreenEvent.hide";
      
      public var screen:Screen;
      
      public function ScreenEvent(param1:String, param2:Screen)
      {
         super(param1);
         this.screen = param2;
      }
   }
}


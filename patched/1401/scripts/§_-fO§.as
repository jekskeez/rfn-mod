package
{
   import events.NotificationEvent;
   import flash.events.EventDispatcher;
   
   public class §_-fO§ extends EventDispatcher
   {
      
      private static var _instance:§_-fO§;
      
      public function §_-fO§()
      {
         super();
      }
      
      public static function get instance() : §_-fO§
      {
         return _instance = _instance || new §_-fO§();
      }
      
      public static function show(param1:int) : void
      {
         instance.dispatchEvent(new NotificationEvent(NotificationEvent.SHOW,param1));
      }
      
      public static function hide(param1:int) : void
      {
         instance.dispatchEvent(new NotificationEvent(NotificationEvent.HIDE,param1));
      }
   }
}


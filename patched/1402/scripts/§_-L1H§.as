package
{
   import events.NotificationEvent;
   import flash.events.EventDispatcher;
   
   public class §_-L1H§ extends EventDispatcher
   {
      
      private static var _instance:§_-L1H§;
      
      public function §_-L1H§()
      {
         super();
      }
      
      public static function get instance() : §_-L1H§
      {
         return _instance = _instance || new §_-L1H§();
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


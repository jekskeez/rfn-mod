package §_-I10§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-B3s§
   {
      
      public static var items:Object = {};
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-B3s§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-Q1C§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-2C§(param1:int) : int
      {
         return int(items[param1]) || 0;
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1[0].length)
         {
            items[param1[0][_loc2_]] = param1[0][_loc2_ + 1];
            _loc2_ += 2;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.ITEMS_CHANGED,items));
      }
   }
}


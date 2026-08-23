package §_-X1k§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-OG§
   {
      
      public static var items:Object = {};
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-OG§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-736§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-S2c§(param1:int) : int
      {
         return int(items[param1]) || 0;
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1[0].length)
         {
            items[param1[0][_loc2_]] = param1[0][_loc2_ + 1];
            _loc2_ += 2;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.ITEMS_CHANGED,items));
      }
   }
}


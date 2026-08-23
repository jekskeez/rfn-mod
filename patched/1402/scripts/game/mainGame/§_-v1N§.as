package game.mainGame
{
   import §_-X2V§.CastItemEvent;
   import §_-g16§.§_-713§;
   import §_-g16§.§_-CM§;
   import §_-g16§.§_-L1n§;
   import §_-g16§.§_-j1C§;
   import §_-g16§.§_-w3§;
   import flash.events.EventDispatcher;
   
   public class §_-v1N§ extends EventDispatcher
   {
      
      public static const §_-T1s§:int = 0;
      
      public static const §_-T2l§:int = 1;
      
      public static const §_-W29§:int = 2;
      
      private static const §_-N2H§:Array = [{
         "class":§_-w3§,
         "count":20
      },{
         "class":§_-713§,
         "count":10
      },{
         "class":§_-CM§,
         "count":5
      },{
         "class":§_-L1n§,
         "count":5
      },{
         "class":§_-j1C§,
         "count":5
      }];
      
      private var §_-3N§:int = 2147483647;
      
      public var §_-IA§:Class = null;
      
      public var type:int = 0;
      
      public function §_-v1N§(param1:Class, param2:int, param3:int = 2147483647)
      {
         super();
         this.§_-IA§ = param1;
         this.type = param2;
         this.§_-3N§ = param3;
      }
      
      public static function §_-O2d§(param1:Class) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-N2H§.length)
         {
            if(param1 == §_-N2H§[_loc2_]["class"])
            {
               return §_-N2H§[_loc2_]["count"];
            }
            _loc2_++;
         }
         return int.MAX_VALUE;
      }
      
      public function get count() : int
      {
         return this.§_-3N§;
      }
      
      public function set count(param1:int) : void
      {
         if(this.§_-3N§ == param1)
         {
            return;
         }
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < §_-N2H§.length)
         {
            if(this.§_-IA§ == §_-N2H§[_loc3_]["class"])
            {
               _loc2_ = true;
               param1 = Math.min(§_-N2H§[_loc3_]["count"],param1);
            }
            _loc3_++;
         }
         this.§_-3N§ = param1;
         if(this.§_-3N§ <= 0 && !_loc2_)
         {
            dispatchEvent(new CastItemEvent(CastItemEvent.§_-N1W§,this));
            return;
         }
         dispatchEvent(new CastItemEvent(CastItemEvent.ITEM_CHANGE,this));
      }
   }
}


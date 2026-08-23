package game.mainGame
{
   import §_-8I§.CastItemEvent;
   import §_-d11§.§_-4P§;
   import §_-d11§.§_-Cj§;
   import §_-d11§.§_-UT§;
   import §_-d11§.§_-p1i§;
   import §_-d11§.§_-sS§;
   import flash.events.EventDispatcher;
   
   public class §_-bM§ extends EventDispatcher
   {
      
      public static const §_-Qg§:int = 0;
      
      public static const §_-S2D§:int = 1;
      
      public static const §_-t2G§:int = 2;
      
      private static const §_-FQ§:Array = [{
         "class":§_-4P§,
         "count":20
      },{
         "class":§_-Cj§,
         "count":10
      },{
         "class":§_-p1i§,
         "count":5
      },{
         "class":§_-sS§,
         "count":5
      },{
         "class":§_-UT§,
         "count":5
      }];
      
      private var §_-C3L§:int = 2147483647;
      
      public var §_-D28§:Class = null;
      
      public var type:int = 0;
      
      public function §_-bM§(param1:Class, param2:int, param3:int = 2147483647)
      {
         super();
         this.§_-D28§ = param1;
         this.type = param2;
         this.§_-C3L§ = param3;
      }
      
      public static function §_-a2a§(param1:Class) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-FQ§.length)
         {
            if(param1 == §_-FQ§[_loc2_]["class"])
            {
               return §_-FQ§[_loc2_]["count"];
            }
            _loc2_++;
         }
         return int.MAX_VALUE;
      }
      
      public function get count() : int
      {
         return this.§_-C3L§;
      }
      
      public function set count(param1:int) : void
      {
         if(this.§_-C3L§ == param1)
         {
            return;
         }
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < §_-FQ§.length)
         {
            if(this.§_-D28§ == §_-FQ§[_loc3_]["class"])
            {
               _loc2_ = true;
               param1 = Math.min(§_-FQ§[_loc3_]["count"],param1);
            }
            _loc3_++;
         }
         this.§_-C3L§ = param1;
         if(this.§_-C3L§ <= 0 && !_loc2_)
         {
            dispatchEvent(new CastItemEvent(CastItemEvent.§_-q1E§,this));
            return;
         }
         dispatchEvent(new CastItemEvent(CastItemEvent.ITEM_CHANGE,this));
      }
   }
}


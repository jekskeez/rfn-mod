package §_-X1k§
{
   import §_-bN§.DialogRepost;
   import §_-c2C§.§_-t2c§;
   import §_-s2e§.§_-U2d§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-j2O§;
   
   public class §_-86§
   {
      
      public static const §_-qo§:int = 0;
      
      public static const §_-1x§:int = 1;
      
      public static const §_-Z2N§:int = 2;
      
      public static const §_-u1s§:int = 3;
      
      public static const §_-x2G§:int = 4;
      
      private static var §_-I1Y§:Array = [];
      
      public static var data:Object = null;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-86§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-K0§.init();
         Connection.listen(§_-x2f§,[§_-s2l§.§_-I16§]);
         §_-t2c§.addCallback(§_-d1J§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      private static function §_-d1J§() : void
      {
         while(§_-I1Y§.length > 0)
         {
            §_-U2d§.load(onLoad,true);
         }
      }
      
      private static function onLoad() : void
      {
         new DialogRepost(§_-j2O§.WALL_AWARD,§_-I1Y§.shift()).show();
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Boolean = data == null;
         if(data == null)
         {
            data = {};
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1[0].length)
         {
            if(!_loc2_)
            {
               §_-b2D§(param1[0][_loc3_],param1[0][_loc3_ + 1],data[param1[0][_loc3_]]);
            }
            data[param1[0][_loc3_]] = param1[0][_loc3_ + 1];
            _loc3_ += 2;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.AWARD_UPDATE));
      }
      
      private static function §_-b2D§(param1:int, param2:int, param3:int) : void
      {
         var answer:Object = null;
         var counterId:int = param1;
         var newValue:int = param2;
         var oldValue:int = param3;
         answer = §_-K0§.§_-l2n§(counterId,newValue,oldValue);
         if(answer == null)
         {
            return;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.AWARD_CHANGED,answer));
         if(answer["value"] != 100)
         {
            return;
         }
         §_-t2c§.addCallback(function():void
         {
            §_-U2d§.load(function():void
            {
               new DialogRepost(§_-j2O§.WALL_AWARD,answer["id"]).show();
            },true);
         });
      }
      
      private static function §_-S1p§(param1:int) : int
      {
         if(data == null)
         {
            return 0;
         }
         var _loc2_:int = int(§_-K0§.DATA[param1]["stat"]);
         if(!(_loc2_ in data))
         {
            return 0;
         }
         return int(data[_loc2_]);
      }
      
      public static function §_-D2n§(param1:int) : uint
      {
         var _loc2_:int = §_-S1p§(param1);
         var _loc3_:uint = _loc2_ < 0 ? uint(_loc2_ + (1 << 16)) : uint(_loc2_);
         var _loc4_:uint = uint(§_-K0§.DATA[param1]["unlock"]);
         var _loc5_:uint = Math.max(_loc3_ - _loc4_,0);
         if(!§_-mH§(param1))
         {
            _loc5_ = Math.min(_loc5_,uint(§_-K0§.DATA[param1]["total"]));
         }
         return _loc5_;
      }
      
      public static function §_-m2m§(param1:int) : Boolean
      {
         var _loc2_:int = §_-S1p§(param1);
         var _loc3_:uint = _loc2_ < 0 ? uint(_loc2_ + (1 << 16)) : uint(_loc2_);
         return _loc3_ < uint(§_-K0§.DATA[param1]["unlock"]);
      }
      
      public static function §_-HU§(param1:int) : Boolean
      {
         return §_-D2n§(param1) >= uint(§_-K0§.DATA[param1]["total"]);
      }
      
      private static function §_-mH§(param1:int) : Boolean
      {
         return Boolean(§_-K0§.DATA[param1]["last"]) && false;
      }
      
      public static function §_-o2u§(param1:int) : String
      {
         if("unlock_name" in §_-K0§.DATA[param1])
         {
            return §_-K0§.DATA[param1]["unlock_name"];
         }
         return "";
      }
      
      public static function §_-2W§(param1:int) : Array
      {
         if("values" in §_-K0§.DATA[param1])
         {
            return §_-K0§.DATA[param1]["values"];
         }
         return null;
      }
   }
}


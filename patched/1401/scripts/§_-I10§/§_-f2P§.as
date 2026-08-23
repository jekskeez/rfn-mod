package §_-I10§
{
   import §_-68§.§_-EI§;
   import §_-T2y§.§_-71o§;
   import §_-k1c§.DialogRepost;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-73l§;
   
   public class §_-f2P§
   {
      
      public static const §_-T1§:int = 0;
      
      public static const §_-T2Z§:int = 1;
      
      public static const §_-S2i§:int = 2;
      
      public static const §_-I1I§:int = 3;
      
      public static const §_-6n§:int = 4;
      
      private static var §_-Pj§:Array = [];
      
      public static var data:Object = null;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-f2P§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-O1T§.init();
         Connection.listen(§_-o2C§,[§_-S2I§.§_-1n§]);
         §_-71o§.addCallback(§_-Yp§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      private static function §_-Yp§() : void
      {
         while(§_-Pj§.length > 0)
         {
            §_-EI§.load(onLoad,true);
         }
      }
      
      private static function onLoad() : void
      {
         new DialogRepost(§_-73l§.WALL_AWARD,§_-Pj§.shift()).show();
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
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
               §_-q1K§(param1[0][_loc3_],param1[0][_loc3_ + 1],data[param1[0][_loc3_]]);
            }
            data[param1[0][_loc3_]] = param1[0][_loc3_ + 1];
            _loc3_ += 2;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.AWARD_UPDATE));
      }
      
      private static function §_-q1K§(param1:int, param2:int, param3:int) : void
      {
         var answer:Object = null;
         var counterId:int = param1;
         var newValue:int = param2;
         var oldValue:int = param3;
         answer = §_-O1T§.§_-A24§(counterId,newValue,oldValue);
         if(answer == null)
         {
            return;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.AWARD_CHANGED,answer));
         if(answer["value"] != 100)
         {
            return;
         }
         §_-71o§.addCallback(function():void
         {
            §_-EI§.load(function():void
            {
               new DialogRepost(§_-73l§.WALL_AWARD,answer["id"]).show();
            },true);
         });
      }
      
      private static function §_-jN§(param1:int) : int
      {
         if(data == null)
         {
            return 0;
         }
         var _loc2_:int = int(§_-O1T§.DATA[param1]["stat"]);
         if(!(_loc2_ in data))
         {
            return 0;
         }
         return int(data[_loc2_]);
      }
      
      public static function §_-C21§(param1:int) : uint
      {
         var _loc2_:int = §_-jN§(param1);
         var _loc3_:uint = _loc2_ < 0 ? uint(_loc2_ + (1 << 16)) : uint(_loc2_);
         var _loc4_:uint = uint(§_-O1T§.DATA[param1]["unlock"]);
         var _loc5_:uint = Math.max(_loc3_ - _loc4_,0);
         if(!§_-61j§(param1))
         {
            _loc5_ = Math.min(_loc5_,uint(§_-O1T§.DATA[param1]["total"]));
         }
         return _loc5_;
      }
      
      public static function §_-D2S§(param1:int) : Boolean
      {
         var _loc2_:int = §_-jN§(param1);
         var _loc3_:uint = _loc2_ < 0 ? uint(_loc2_ + (1 << 16)) : uint(_loc2_);
         return _loc3_ < uint(§_-O1T§.DATA[param1]["unlock"]);
      }
      
      public static function §_-Y2w§(param1:int) : Boolean
      {
         return §_-C21§(param1) >= uint(§_-O1T§.DATA[param1]["total"]);
      }
      
      private static function §_-61j§(param1:int) : Boolean
      {
         return Boolean(§_-O1T§.DATA[param1]["last"]) && false;
      }
      
      public static function §_-M1r§(param1:int) : String
      {
         if("unlock_name" in §_-O1T§.DATA[param1])
         {
            return §_-O1T§.DATA[param1]["unlock_name"];
         }
         return "";
      }
      
      public static function §_-33f§(param1:int) : Array
      {
         if("values" in §_-O1T§.DATA[param1])
         {
            return §_-O1T§.DATA[param1]["values"];
         }
         return null;
      }
   }
}


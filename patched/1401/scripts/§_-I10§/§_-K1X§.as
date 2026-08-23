package §_-I10§
{
   import flash.events.Event;
   import flash.utils.getTimer;
   import utils.StringUtil;
   import utils.§_-2Y§;
   
   public class §_-K1X§
   {
      
      public static const §_-T1I§:String = "nutty_pass";
      
      public static const §_-822§:String = "nutty_pass_points";
      
      private static var §_-B1a§:Boolean = false;
      
      private static var §_-J2§:Function = null;
      
      private static var §_-N2r§:Array = [];
      
      private static var §_-g2H§:Object = {};
      
      private static var §_-83S§:Object = {};
      
      public function §_-K1X§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-2Y§.load(§_-a9§.§_-K2p§ + "?" + Math.random(),false,null,§_-a0§,§_-93n§);
      }
      
      public static function get §_-v2e§() : Boolean
      {
         return §_-B1a§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-B1a§)
         {
            if(param1 != null)
            {
               param1();
            }
            return;
         }
         §_-J2§ = param1;
      }
      
      public static function get events() : Array
      {
         return §_-N2r§;
      }
      
      public static function §_-5n§(param1:String, param2:int) : Object
      {
         var _loc3_:Object = §_-83S§[param1];
         return _loc3_ ? _loc3_[param2] : null;
      }
      
      public static function §_-M2p§() : Array
      {
         var _loc3_:Object = null;
         var _loc1_:int = §_-b2p§();
         var _loc2_:Array = [];
         for each(_loc3_ in §_-N2r§)
         {
            if(_loc1_ >= _loc3_.startSec && _loc1_ <= _loc3_.finishSec)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public static function §_-e1K§(param1:String) : Object
      {
         var _loc6_:Object = null;
         var _loc2_:Array = §_-g2H§[param1];
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:int = §_-b2p§();
         var _loc4_:int = int(_loc2_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_[_loc5_];
            if(_loc3_ >= _loc6_.startSec && _loc3_ <= _loc6_.finishSec)
            {
               return _loc6_;
            }
            _loc5_++;
         }
         return null;
      }
      
      private static function §_-b2p§() : int
      {
         return Game.§_-nE§ + int(getTimer() / 1000);
      }
      
      private static function §_-a0§(param1:Event) : void
      {
         var e:Event = param1;
         try
         {
            §_-mH§(JSON.parse(e.target.data));
         }
         catch(err:Error)
         {
            §_-TQ§.add("EventsData parse error: " + err);
         }
         §_-B1a§ = true;
         if(§_-J2§ != null)
         {
            §_-J2§();
         }
      }
      
      private static function §_-93n§(param1:Event) : void
      {
         §_-TQ§.add("EventsData load error: " + param1);
         if(§_-B1a§)
         {
            return;
         }
         §_-B1a§ = true;
         if(§_-J2§ != null)
         {
            §_-J2§();
         }
      }
      
      private static function §_-mH§(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Date = null;
         var _loc6_:Date = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:Object = null;
         var _loc10_:Array = null;
         var _loc11_:Object = null;
         §_-N2r§ = [];
         §_-g2H§ = {};
         §_-83S§ = {};
         var _loc2_:Array = param1 ? param1["events"] as Array : null;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Number = new Date().time;
         for each(_loc4_ in _loc2_)
         {
            _loc5_ = StringUtil.§_-Bj§(_loc4_.start);
            _loc6_ = StringUtil.§_-Bj§(_loc4_.finish);
            if(!(!_loc6_ || _loc6_.time < _loc3_))
            {
               _loc7_ = int(int(_loc4_.v) || 0);
               _loc8_ = _loc4_.type;
               _loc9_ = {
                  "type":_loc8_,
                  "v":_loc7_,
                  "rate":_loc4_.rate || 0,
                  "start":_loc4_.start,
                  "finish":_loc4_.finish,
                  "startDate":_loc5_,
                  "finishDate":_loc6_,
                  "startSec":int(_loc5_.time / 1000),
                  "finishSec":int(_loc6_.time / 1000),
                  "key":_loc8_ + "_" + _loc7_
               };
               §_-N2r§.push(_loc9_);
               _loc10_ = §_-g2H§[_loc8_];
               if(!_loc10_)
               {
                  §_-g2H§[_loc8_] = _loc10_ = [];
               }
               _loc10_.push(_loc9_);
               _loc11_ = §_-83S§[_loc8_];
               if(!_loc11_)
               {
                  §_-83S§[_loc8_] = _loc11_ = {};
               }
               _loc11_[_loc7_] = _loc9_;
            }
         }
      }
   }
}


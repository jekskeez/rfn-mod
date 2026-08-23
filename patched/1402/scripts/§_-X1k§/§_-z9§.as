package §_-X1k§
{
   import flash.events.Event;
   import flash.utils.getTimer;
   import utils.StringUtil;
   import utils.§_-fE§;
   
   public class §_-z9§
   {
      
      public static const §_-bp§:String = "nutty_pass";
      
      public static const §_-H2D§:String = "nutty_pass_points";
      
      private static var §_-MM§:Boolean = false;
      
      private static var §_-v2m§:Function = null;
      
      private static var §_-73f§:Array = [];
      
      private static var §_-D2T§:Object = {};
      
      private static var §_-I2o§:Object = {};
      
      public function §_-z9§()
      {
         super();
      }
      
      public static function init() : void
      {
         §_-fE§.load(§_-Zy§.§_-83§ + "?" + Math.random(),false,null,§_-FT§,§_-n2y§);
      }
      
      public static function get §_-Xh§() : Boolean
      {
         return §_-MM§;
      }
      
      public static function set onLoaded(param1:Function) : void
      {
         if(§_-MM§)
         {
            if(param1 != null)
            {
               param1();
            }
            return;
         }
         §_-v2m§ = param1;
      }
      
      public static function get events() : Array
      {
         return §_-73f§;
      }
      
      public static function §_-d2K§(param1:String, param2:int) : Object
      {
         var _loc3_:Object = §_-I2o§[param1];
         return _loc3_ ? _loc3_[param2] : null;
      }
      
      public static function §_-C12§() : Array
      {
         var _loc3_:Object = null;
         var _loc1_:int = §_-D§();
         var _loc2_:Array = [];
         for each(_loc3_ in §_-73f§)
         {
            if(_loc1_ >= _loc3_.startSec && _loc1_ <= _loc3_.finishSec)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public static function §_-SC§(param1:String) : Object
      {
         var _loc6_:Object = null;
         var _loc2_:Array = §_-D2T§[param1];
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:int = §_-D§();
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
      
      private static function §_-D§() : int
      {
         return Game.§_-i24§ + int(getTimer() / 1000);
      }
      
      private static function §_-FT§(param1:Event) : void
      {
         var e:Event = param1;
         try
         {
            §_-81v§(JSON.parse(e.target.data));
         }
         catch(err:Error)
         {
            §_-p2U§.add("EventsData parse error: " + err);
         }
         §_-MM§ = true;
         if(§_-v2m§ != null)
         {
            §_-v2m§();
         }
      }
      
      private static function §_-n2y§(param1:Event) : void
      {
         §_-p2U§.add("EventsData load error: " + param1);
         if(§_-MM§)
         {
            return;
         }
         §_-MM§ = true;
         if(§_-v2m§ != null)
         {
            §_-v2m§();
         }
      }
      
      private static function §_-81v§(param1:Object) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Date = null;
         var _loc6_:Date = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:Object = null;
         var _loc10_:Array = null;
         var _loc11_:Object = null;
         §_-73f§ = [];
         §_-D2T§ = {};
         §_-I2o§ = {};
         var _loc2_:Array = param1 ? param1["events"] as Array : null;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Number = new Date().time;
         for each(_loc4_ in _loc2_)
         {
            _loc5_ = StringUtil.§_-H2v§(_loc4_.start);
            _loc6_ = StringUtil.§_-H2v§(_loc4_.finish);
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
               §_-73f§.push(_loc9_);
               _loc10_ = §_-D2T§[_loc8_];
               if(!_loc10_)
               {
                  §_-D2T§[_loc8_] = _loc10_ = [];
               }
               _loc10_.push(_loc9_);
               _loc11_ = §_-I2o§[_loc8_];
               if(!_loc11_)
               {
                  §_-I2o§[_loc8_] = _loc11_ = {};
               }
               _loc11_[_loc7_] = _loc9_;
            }
         }
      }
   }
}


package
{
   import protocol.§_-s2l§;
   import protocol.§_-z1i§;
   
   public class §_-eT§
   {
      
      private static var type:uint = 0;
      
      public static const §_-P26§:uint = 1 << type;
      
      public static const §_-FM§:uint = 1 << ++type;
      
      public static const §_-J§:uint = 1 << ++type;
      
      public static const SIZE:uint = 1 << ++type;
      
      public static const STATE:uint = 1 << ++type;
      
      public static const §_-03H§:uint = 1 << ++type;
      
      public static const §_-LS§:uint = 1 << ++type;
      
      public static const §_-I1N§:uint = 1 << ++type;
      
      public static const §_-x1i§:uint = 1 << ++type;
      
      public static const §_-t1d§:uint = 1 << ++type;
      
      public static const §_-x2Q§:uint = 1 << ++type;
      
      public static const §_-u2P§:uint = 1 << ++type;
      
      public static const §_-a2c§:uint = 1 << ++type;
      
      public static const §_-11N§:uint = 1 << ++type;
      
      public static const §_-x2l§:uint = 1 << ++type;
      
      public static const §_-t1a§:uint = 1 << ++type;
      
      public static const §_-w1y§:uint = 1 << ++type;
      
      public static const ALL:uint = all;
      
      public static const §_-a1z§:uint = 1 << ++type;
      
      public static const §_-D12§:Object = {};
      
      §_-D12§[§_-P26§] = ["SSS","info",3];
      §_-D12§[§_-FM§] = ["S","news"];
      §_-D12§[§_-J§] = ["I","leader_id"];
      §_-D12§[SIZE] = ["I","size"];
      §_-D12§[STATE] = ["B","state"];
      §_-D12§[§_-03H§] = ["BII","rank",3];
      §_-D12§[§_-LS§] = ["I","rank_range"];
      §_-D12§[§_-I1N§] = ["I","places"];
      §_-D12§[§_-x1i§] = ["I","ban"];
      §_-D12§[§_-t1d§] = ["[BIB]I","totems",2];
      §_-D12§[§_-x2Q§] = ["[BBII]","totems_rangs"];
      §_-D12§[§_-u2P§] = ["[BB]","totems_bonuses"];
      §_-D12§[§_-a2c§] = ["[IIII]","daily_statistics"];
      §_-D12§[§_-11N§] = ["[I]","blacklist"];
      §_-D12§[§_-x2l§] = ["B","level_limiter"];
      §_-D12§[§_-t1a§] = ["I","rating_info",1];
      §_-D12§[§_-w1y§] = ["[II]","rating_history"];
      §_-D12§[§_-a1z§] = ["II","balance",2];
      
      public function §_-eT§()
      {
         super();
      }
      
      public static function parse(param1:§_-z1i§, param2:uint) : Array
      {
         var _loc11_:uint = 0;
         var _loc12_:int = 0;
         var _loc13_:Object = null;
         var _loc14_:* = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         param1.position = 0;
         var _loc3_:String = "[I";
         var _loc4_:Array = ["id",1];
         var _loc5_:int = 1;
         var _loc6_:int = 0;
         while(_loc6_ <= §_-eT§.type)
         {
            _loc11_ = uint(1 << _loc6_);
            if((param2 & _loc11_) != 0)
            {
               if(!(_loc11_ in §_-D12§))
               {
                  break;
               }
               _loc3_ += §_-D12§[_loc11_][0];
               _loc4_.push(§_-D12§[_loc11_][1]);
               _loc12_ = §_-D12§[_loc11_].length > 2 ? int(§_-D12§[_loc11_][2]) : 1;
               _loc4_.push(_loc12_);
               _loc5_ += _loc12_;
            }
            _loc6_++;
         }
         _loc3_ += "]";
         §_-p2U§.add("Parsing clan_info format " + _loc3_ + " for mask " + param2);
         var _loc7_:Array = [];
         §_-s2l§.§_-T1d§(param1,_loc3_,_loc7_);
         if(_loc7_.length == 0)
         {
            return [];
         }
         _loc7_ = _loc7_.pop();
         var _loc8_:int = int(_loc7_.length);
         var _loc9_:int = int(_loc4_.length);
         var _loc10_:Array = [];
         §_-p2U§.add("Parsing clan_info contains " + _loc8_ + " fields for " + _loc8_ / _loc5_ + " clans");
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc13_ = {};
            _loc14_ = _loc6_;
            _loc15_ = 0;
            while(_loc15_ < _loc9_)
            {
               if(_loc4_[_loc15_ + 1] == 1)
               {
                  _loc13_[_loc4_[_loc15_]] = _loc7_[_loc14_++];
               }
               else
               {
                  _loc13_[_loc4_[_loc15_]] = [];
                  _loc16_ = 0;
                  while(_loc16_ < _loc4_[_loc15_ + 1])
                  {
                     _loc13_[_loc4_[_loc15_]].push(_loc7_[_loc14_++]);
                     _loc16_++;
                  }
               }
               _loc15_ += 2;
            }
            if("info" in _loc13_)
            {
               _loc13_["name"] = _loc13_["info"][0];
               _loc13_["photo"] = _loc13_["info"][1];
               _loc13_["emblem"] = _loc13_["info"][2];
            }
            if("balance" in _loc13_)
            {
               _loc13_["coins"] = _loc13_["balance"][0];
               _loc13_["acorns"] = _loc13_["balance"][1];
            }
            _loc10_.push(_loc13_);
            _loc6_ += _loc5_;
         }
         return _loc10_;
      }
      
      private static function get all() : uint
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         while(_loc2_ <= type)
         {
            _loc1_ |= 1 << _loc2_;
            _loc2_++;
         }
         return _loc1_;
      }
   }
}


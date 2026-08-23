package
{
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   
   public class §_-Oy§
   {
      
      private static var type:uint = 0;
      
      public static const §_-g2n§:uint = 1 << type;
      
      public static const §_-K12§:uint = 1 << ++type;
      
      public static const §_-U1d§:uint = 1 << ++type;
      
      public static const SIZE:uint = 1 << ++type;
      
      public static const STATE:uint = 1 << ++type;
      
      public static const §_-819§:uint = 1 << ++type;
      
      public static const §_-X13§:uint = 1 << ++type;
      
      public static const §_-X2U§:uint = 1 << ++type;
      
      public static const §_-N29§:uint = 1 << ++type;
      
      public static const §_-TZ§:uint = 1 << ++type;
      
      public static const §_-6V§:uint = 1 << ++type;
      
      public static const §_-Q1V§:uint = 1 << ++type;
      
      public static const §_-W1X§:uint = 1 << ++type;
      
      public static const §_-02f§:uint = 1 << ++type;
      
      public static const §_-M2k§:uint = 1 << ++type;
      
      public static const §_-Ng§:uint = 1 << ++type;
      
      public static const §_-81Z§:uint = 1 << ++type;
      
      public static const ALL:uint = all;
      
      public static const §_-I25§:uint = 1 << ++type;
      
      public static const §_-HM§:Object = {};
      
      §_-HM§[§_-g2n§] = ["SSS","info",3];
      §_-HM§[§_-K12§] = ["S","news"];
      §_-HM§[§_-U1d§] = ["I","leader_id"];
      §_-HM§[SIZE] = ["I","size"];
      §_-HM§[STATE] = ["B","state"];
      §_-HM§[§_-819§] = ["BII","rank",3];
      §_-HM§[§_-X13§] = ["I","rank_range"];
      §_-HM§[§_-X2U§] = ["I","places"];
      §_-HM§[§_-N29§] = ["I","ban"];
      §_-HM§[§_-TZ§] = ["[BIB]I","totems",2];
      §_-HM§[§_-6V§] = ["[BBII]","totems_rangs"];
      §_-HM§[§_-Q1V§] = ["[BB]","totems_bonuses"];
      §_-HM§[§_-W1X§] = ["[IIII]","daily_statistics"];
      §_-HM§[§_-02f§] = ["[I]","blacklist"];
      §_-HM§[§_-M2k§] = ["B","level_limiter"];
      §_-HM§[§_-Ng§] = ["I","rating_info",1];
      §_-HM§[§_-81Z§] = ["[II]","rating_history"];
      §_-HM§[§_-I25§] = ["II","balance",2];
      
      public function §_-Oy§()
      {
         super();
      }
      
      public static function parse(param1:§_-U1M§, param2:uint) : Array
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
         while(_loc6_ <= §_-Oy§.type)
         {
            _loc11_ = uint(1 << _loc6_);
            if((param2 & _loc11_) != 0)
            {
               if(!(_loc11_ in §_-HM§))
               {
                  break;
               }
               _loc3_ += §_-HM§[_loc11_][0];
               _loc4_.push(§_-HM§[_loc11_][1]);
               _loc12_ = §_-HM§[_loc11_].length > 2 ? int(§_-HM§[_loc11_][2]) : 1;
               _loc4_.push(_loc12_);
               _loc5_ += _loc12_;
            }
            _loc6_++;
         }
         _loc3_ += "]";
         §_-TQ§.add("Parsing clan_info format " + _loc3_ + " for mask " + param2);
         var _loc7_:Array = [];
         §_-S2I§.§_-M2z§(param1,_loc3_,_loc7_);
         if(_loc7_.length == 0)
         {
            return [];
         }
         _loc7_ = _loc7_.pop();
         var _loc8_:int = int(_loc7_.length);
         var _loc9_:int = int(_loc4_.length);
         var _loc10_:Array = [];
         §_-TQ§.add("Parsing clan_info contains " + _loc8_ + " fields for " + _loc8_ / _loc5_ + " clans");
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


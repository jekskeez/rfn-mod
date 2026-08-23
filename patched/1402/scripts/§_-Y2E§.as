package
{
   import §_-X1k§.§_-XW§;
   import protocol.§_-s2l§;
   import protocol.§_-z1i§;
   import utils.§_-33I§;
   
   public class §_-Y2E§
   {
      
      private static var type:uint = 0;
      
      public static const §_-Jm§:uint = 1 << type;
      
      public static const §_-O13§:uint = 1 << ++type;
      
      public static const §_-rC§:uint = 1 << ++type;
      
      public static const §_-n2H§:uint = 1 << ++type;
      
      public static const §_-qK§:uint = 1 << ++type;
      
      public static const §_-s10§:uint = 1 << ++type;
      
      public static const §_-W1l§:uint = 1 << ++type;
      
      public static const §_-l1l§:uint = 1 << ++type;
      
      public static const §_-V2n§:uint = 1 << ++type;
      
      public static const §_-D20§:uint = 1 << ++type;
      
      public static const §_-L1b§:uint = 1 << ++type;
      
      public static const §_-HV§:uint = 1 << ++type;
      
      public static const §_-CN§:uint = 1 << ++type;
      
      public static const §_-82Q§:uint = 1 << ++type;
      
      public static const §_-T5§:uint = 1 << ++type;
      
      public static const §_-sa§:uint = 1 << ++type;
      
      public static const §_-qk§:uint = 1 << ++type;
      
      public static const §_-t1a§:uint = 1 << ++type;
      
      public static const §_-w1y§:uint = 1 << ++type;
      
      public static const ALL:uint = all;
      
      public static const §_-D12§:Object = {};
      
      public static var §_-C1e§:String = "";
      
      §_-D12§[§_-Jm§] = ["I","nid"];
      §_-D12§[§_-O13§] = ["B","type"];
      §_-D12§[§_-rC§] = ["B","rights"];
      §_-D12§[§_-n2H§] = ["S","name"];
      §_-D12§[§_-qK§] = ["B","sex"];
      §_-D12§[§_-s10§] = ["S","photo_big"];
      §_-D12§[§_-W1l§] = ["B","online"];
      §_-D12§[§_-l1l§] = ["I","last_online"];
      §_-D12§[§_-V2n§] = ["I","exp"];
      §_-D12§[§_-D20§] = ["[I][I]","worn",2];
      §_-D12§[§_-L1b§] = ["I","clan_id"];
      §_-D12§[§_-HV§] = ["I","respawn_totem"];
      §_-D12§[§_-CN§] = ["[B]","collection_exchange"];
      §_-D12§[§_-82Q§] = ["B","is_gone"];
      §_-D12§[§_-T5§] = ["BB","vip_info",2];
      §_-D12§[§_-sa§] = ["[B]","interior"];
      §_-D12§[§_-qk§] = ["B","shaman_level"];
      §_-D12§[§_-t1a§] = ["III","rating_info",3];
      §_-D12§[§_-w1y§] = ["[II]","rating_history"];
      
      public function §_-Y2E§()
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
         var _loc4_:Array = ["uid",1];
         var _loc5_:int = 1;
         var _loc6_:int = 0;
         while(_loc6_ <= §_-Y2E§.type)
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
         §_-p2U§.add("Parsing info format " + _loc3_ + " for mask " + param2);
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
         §_-p2U§.add("Parsing info contains " + _loc8_ + " fields for " + _loc8_ / _loc5_ + " players");
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
            if("name" in _loc13_)
            {
               _loc13_["name"] = _loc13_["name"] == "" ? §_-C1e§ : _loc13_["name"];
            }
            if("exp" in _loc13_)
            {
               _loc13_["level"] = §_-XW§.§_-cO§(_loc13_["exp"]);
            }
            if("shaman_level" in _loc13_)
            {
               _loc13_["shaman_level"] += 1;
            }
            if("worn" in _loc13_)
            {
               _loc13_["worn_packages"] = _loc13_["worn"][0];
               _loc13_["worn_accessories"] = _loc13_["worn"][1];
            }
            if("vip_info" in _loc13_)
            {
               _loc13_["vip_exist"] = _loc13_["vip_info"][0];
               _loc13_["vip_color"] = _loc13_["vip_info"][1];
            }
            if("rating_info" in _loc13_)
            {
               _loc13_["rating_score"] = _loc13_["rating_info"][0];
               _loc13_["rating_player"] = _loc13_["rating_info"][1];
               _loc13_["rating_shaman"] = _loc13_["rating_info"][2];
            }
            _loc10_.push(_loc13_);
            _loc6_ += _loc5_;
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
            §_-p2U§.add("PlayerInfoParser profile=" + JSON.stringify(_loc10_));
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


package
{
   import §_-I10§.§_-My§;
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   import utils.§_-c10§;
   
   public class §_-hF§
   {
      
      private static var type:uint = 0;
      
      public static const §_-g12§:uint = 1 << type;
      
      public static const §_-S2f§:uint = 1 << ++type;
      
      public static const §_-k2y§:uint = 1 << ++type;
      
      public static const §_-31q§:uint = 1 << ++type;
      
      public static const §_-R2P§:uint = 1 << ++type;
      
      public static const §_-31X§:uint = 1 << ++type;
      
      public static const §_-B3k§:uint = 1 << ++type;
      
      public static const §_-N2C§:uint = 1 << ++type;
      
      public static const §_-P13§:uint = 1 << ++type;
      
      public static const §_-61o§:uint = 1 << ++type;
      
      public static const §_-329§:uint = 1 << ++type;
      
      public static const §_-e1B§:uint = 1 << ++type;
      
      public static const §_-C§:uint = 1 << ++type;
      
      public static const §_-71A§:uint = 1 << ++type;
      
      public static const §_-sK§:uint = 1 << ++type;
      
      public static const §_-U2X§:uint = 1 << ++type;
      
      public static const §_-AA§:uint = 1 << ++type;
      
      public static const §_-Ng§:uint = 1 << ++type;
      
      public static const §_-81Z§:uint = 1 << ++type;
      
      public static const ALL:uint = all;
      
      public static const §_-HM§:Object = {};
      
      public static var §_-8H§:String = "";
      
      §_-HM§[§_-g12§] = ["I","nid"];
      §_-HM§[§_-S2f§] = ["B","type"];
      §_-HM§[§_-k2y§] = ["B","rights"];
      §_-HM§[§_-31q§] = ["S","name"];
      §_-HM§[§_-R2P§] = ["B","sex"];
      §_-HM§[§_-31X§] = ["S","photo_big"];
      §_-HM§[§_-B3k§] = ["B","online"];
      §_-HM§[§_-N2C§] = ["I","last_online"];
      §_-HM§[§_-P13§] = ["I","exp"];
      §_-HM§[§_-61o§] = ["[I][I]","worn",2];
      §_-HM§[§_-329§] = ["I","clan_id"];
      §_-HM§[§_-e1B§] = ["I","respawn_totem"];
      §_-HM§[§_-C§] = ["[B]","collection_exchange"];
      §_-HM§[§_-71A§] = ["B","is_gone"];
      §_-HM§[§_-sK§] = ["BB","vip_info",2];
      §_-HM§[§_-U2X§] = ["[B]","interior"];
      §_-HM§[§_-AA§] = ["B","shaman_level"];
      §_-HM§[§_-Ng§] = ["III","rating_info",3];
      §_-HM§[§_-81Z§] = ["[II]","rating_history"];
      
      public function §_-hF§()
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
         var _loc4_:Array = ["uid",1];
         var _loc5_:int = 1;
         var _loc6_:int = 0;
         while(_loc6_ <= §_-hF§.type)
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
         §_-TQ§.add("Parsing info format " + _loc3_ + " for mask " + param2);
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
         §_-TQ§.add("Parsing info contains " + _loc8_ + " fields for " + _loc8_ / _loc5_ + " players");
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
               _loc13_["name"] = _loc13_["name"] == "" ? §_-8H§ : _loc13_["name"];
            }
            if("exp" in _loc13_)
            {
               _loc13_["level"] = §_-My§.§_-51r§(_loc13_["exp"]);
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
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
            §_-TQ§.add("PlayerInfoParser profile=" + JSON.stringify(_loc10_));
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


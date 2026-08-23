package §_-X1k§
{
   import §_-j2E§.§_-A11§;
   
   public class §_-P2x§
   {
      
      public static const §_-T1B§:int = 0;
      
      public static const §_-o2O§:int = 1;
      
      public static const §_-C1d§:int = 2;
      
      public static const §_-9f§:int = 3;
      
      public static const §_-d2g§:int = 4;
      
      public static const §_-V1n§:int = 0;
      
      public static const §_-qQ§:int = 1;
      
      public static const §_-M2M§:int = 2;
      
      public static const §_-JW§:int = 3;
      
      public static const §_-e2Z§:int = 4;
      
      public static const §_-z2B§:int = 0;
      
      public static const §_-Y1M§:int = 1;
      
      public static const §_-A3§:int = 2;
      
      public static const §_-m1Z§:int = 3;
      
      public static const §_-w1K§:int = 0;
      
      public static const §_-B1R§:int = 1;
      
      public static const §_-01k§:int = 2;
      
      public static const §_-M2R§:int = 3;
      
      public static const §_-z2g§:int = 4;
      
      public static const §_-m1o§:int = 5;
      
      public static const §_-bz§:int = -1;
      
      public static const §_-c1n§:int = -2;
      
      public static const §_-L10§:int = -3;
      
      public static const §_-H1g§:int = -4;
      
      public static const §_-22k§:int = -5;
      
      public static const §_-CB§:int = -6;
      
      public static const §_-x1Y§:int = -7;
      
      public static const §_-F2K§:int = 37;
      
      public static const §_-A2N§:int = 43;
      
      public static const §_-px§:int = 49;
      
      public static const §_-t1k§:int = 51;
      
      public static const SCRAT_METAL:int = 84;
      
      public static const SCRAT_DRAGON:int = 85;
      
      public static const SCRAT_JUGGLER:int = 86;
      
      public static const SCRAT_VAMPYRE:int = 87;
      
      public static const SCRAT_HATTER:int = 88;
      
      public static const SCRAT_SKELETON:int = 89;
      
      public static const SCRAT_PERSIA:int = 90;
      
      public static const SCRAT_ROBOCOP:int = 91;
      
      public static const SCRATTY_METAL:int = 92;
      
      public static const SCRATTY_DRAGON:int = 93;
      
      public static const SCRATTY_JUGGLER:int = 94;
      
      public static const SCRATTY_VAMPYRE:int = 95;
      
      public static const SCRATTY_HATTER:int = 96;
      
      public static const SCRATTY_SKELETON:int = 97;
      
      public static const SCRATTY_PERSIA:int = 98;
      
      public static const §_-pM§:int = 99;
      
      public static const §_-i0§:int = 110;
      
      public static const §_-rR§:int = 111;
      
      public static const §_-b2N§:int = 112;
      
      public static const §_-c9§:int = 130;
      
      public static const §_-Z1s§:int = 138;
      
      public static const §_-I1e§:int = 143;
      
      public static const §_-FC§:int = 147;
      
      public static const §_-83K§:int = 148;
      
      public static const §_-P2Q§:int = 150;
      
      public static const §_-U1K§:int = 157;
      
      public static const §_-i1Y§:int = -2;
      
      public static const §_-l1B§:int = -3;
      
      public static const §_-42l§:int = -4;
      
      public static const §_-oY§:int = -5;
      
      public static const §_-Be§:int = -6;
      
      public static const §_-nC§:int = 3;
      
      public static const §_-81g§:int = 53;
      
      public static const §_-X14§:int = 68;
      
      public static const §_-BT§:int = 91;
      
      public static const §_-D2V§:int = 270;
      
      public static var §_-u21§:Boolean = false;
      
      public static const §_-h1w§:Object = {};
      
      public static const §_-v1v§:Object = {};
      
      public static const §_-W1W§:Object = {};
      
      public static var §_-e0§:Array = [];
      
      public static var §_-z2L§:Array = [];
      
      private static var §_-u2R§:Array = [];
      
      private static var §_-V1V§:Array = [];
      
      private static var §_-e1R§:Object = {};
      
      private static var §_-wo§:Object = {};
      
      private static var §_-l1I§:Object = {};
      
      private static var §_-5c§:Object = {};
      
      public function §_-P2x§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(§_-u21§)
         {
            return;
         }
         §_-u21§ = true;
         var _loc1_:int = 0;
         while(_loc1_ < §_-i1e§)
         {
            _loc2_ = §_-y18§(_loc1_);
            if(!(!_loc2_ || _loc2_.length == 0))
            {
               §_-5c§[_loc2_[0]] = true;
               if(§_-32p§(_loc1_) != §_-m1Z§)
               {
                  switch(§_-VY§(_loc1_))
                  {
                     case §_-V1n§:
                        §_-e0§.push(_loc1_);
                        break;
                     case §_-qQ§:
                        §_-z2L§.push(_loc1_);
                  }
               }
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  §_-u2R§[_loc2_[_loc3_]] = _loc1_;
                  if(§_-VY§(_loc1_) == §_-qQ§)
                  {
                     §_-e1R§[_loc2_[_loc3_]] = true;
                  }
                  if(§_-Q1X§(_loc2_[0]))
                  {
                     §_-wo§[_loc2_[_loc3_]] = true;
                  }
                  if(§_-E1Y§(_loc2_[0]))
                  {
                     §_-l1I§[_loc2_[_loc3_]] = true;
                  }
                  _loc4_ = §_-G1S§(_loc2_[_loc3_]);
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.length)
                  {
                     §_-V1V§[_loc4_[_loc5_]] = _loc2_[_loc3_];
                     _loc5_++;
                  }
                  _loc3_++;
               }
            }
            _loc1_++;
         }
      }
      
      public static function §_-Q1Y§(param1:int) : Boolean
      {
         return §_-g1g§(param1) != -1;
      }
      
      public static function §_-Iz§(param1:int) : int
      {
         switch(param1)
         {
            case §_-V1n§:
               return §_-bz§;
            case §_-qQ§:
               return §_-c1n§;
            default:
               return -1;
         }
      }
      
      public static function §_-g1g§(param1:int) : int
      {
         switch(param1)
         {
            case §_-bz§:
               return §_-V1n§;
            case §_-c1n§:
               return §_-qQ§;
            default:
               return -1;
         }
      }
      
      public static function getBones(param1:String) : Object
      {
         return §_-HZ§.clothes.bones[param1];
      }
      
      public static function get §_-LN§() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in §_-HZ§.clothes.packages)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public static function getPackageCoinsPrice(param1:int) : int
      {
         var _loc2_:Number = §_-y2L§.§_-L8§(param1);
         return §_-HZ§.clothes.packages[param1]["coins_price"] * _loc2_;
      }
      
      public static function §_-O1c§(param1:int) : int
      {
         return Math.min(§_-HZ§.clothes.packages[param1]["coins_price"] / 10);
      }
      
      public static function §_-O1L§(param1:int) : int
      {
         return §_-HZ§.clothes.packages[param1]["max_level"];
      }
      
      public static function §_-01H§(param1:int) : String
      {
         return gls(§_-HZ§.clothes.packages[param1]["name"] || "");
      }
      
      public static function §_-T1O§(param1:int) : String
      {
         return gls(§_-HZ§.clothes.packages[param1]["description"] || "");
      }
      
      public static function §_-Zv§(param1:int) : Array
      {
         return §_-HZ§.clothes.packages[param1]["bones"] || [];
      }
      
      public static function §_-L19§(param1:int) : Array
      {
         return §_-HZ§.clothes.packages[param1]["accessories"];
      }
      
      public static function §_-G1S§(param1:int) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         for(_loc3_ in §_-HZ§.clothes.packages[param1]["skills"])
         {
            _loc2_.push(int(_loc3_));
         }
         return _loc2_;
      }
      
      public static function §_-eJ§(param1:int, param2:int) : int
      {
         if(param2 in §_-HZ§.clothes.packages[param1]["skills"])
         {
            return §_-HZ§.clothes.packages[param1]["skills"][param2];
         }
         return -1;
      }
      
      public static function §_-Sj§(param1:int) : Boolean
      {
         return "disable_run" in §_-HZ§.clothes.packages[param1];
      }
      
      public static function §_-Q1X§(param1:int) : Boolean
      {
         return "scrat" in §_-HZ§.clothes.packages[param1];
      }
      
      public static function §_-E1Y§(param1:int) : Boolean
      {
         return "scratty" in §_-HZ§.clothes.packages[param1];
      }
      
      public static function §_-52q§(param1:int) : int
      {
         return int(§_-HZ§.clothes.packages[param1]["cast_animation"]) || 0;
      }
      
      public static function get §_-i1e§() : int
      {
         return §_-HZ§.clothes.outfits.length;
      }
      
      public static function §_-32p§(param1:int) : int
      {
         return §_-HZ§.clothes.outfits[param1]["rarity"];
      }
      
      public static function §_-VY§(param1:int) : int
      {
         return §_-HZ§.clothes.outfits[param1]["character"];
      }
      
      public static function §_-y18§(param1:int) : Array
      {
         return §_-HZ§.clothes.outfits[param1]["packages"];
      }
      
      public static function §_-ss§(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-HZ§.clothes.outfits.length)
         {
            if(§_-HZ§.clothes.outfits[_loc2_]["packages"].indexOf(param1) != -1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public static function §_-rA§(param1:int) : Boolean
      {
         return §_-HZ§.clothes.outfits[param1]["newest"];
      }
      
      public static function get §_-X1Q§() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in §_-HZ§.clothes.accessories)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public static function §_-q2t§(param1:int) : int
      {
         if(param1 in §_-HZ§.clothes.accessories)
         {
            return §_-HZ§.clothes.accessories[param1]["coins_price"];
         }
         return 0;
      }
      
      public static function §_-01x§(param1:int) : int
      {
         return §_-HZ§.clothes.accessories[param1]["place"];
      }
      
      public static function §_-cE§(param1:int) : int
      {
         return int(§_-HZ§.clothes.accessories[param1]["character"]) || -1;
      }
      
      public static function §_-F1F§(param1:int) : Array
      {
         if(!(param1 in §_-HZ§.clothes.accessories))
         {
            return [];
         }
         return §_-HZ§.clothes.accessories[param1]["bones"] || [];
      }
      
      public static function §_-d1E§(param1:int) : String
      {
         return gls(§_-HZ§.clothes.accessories[param1]["name"]);
      }
      
      public static function §_-b2c§(param1:int) : int
      {
         return §_-u2R§[param1];
      }
      
      public static function §_-c1K§(param1:int) : int
      {
         return §_-V1V§[param1];
      }
      
      public static function §_-k1G§(param1:int) : Boolean
      {
         return param1 in §_-e1R§;
      }
      
      public static function §_-r5§(param1:int) : Boolean
      {
         return param1 in §_-wo§;
      }
      
      public static function §_-e2S§(param1:int) : Boolean
      {
         return param1 in §_-l1I§;
      }
      
      public static function §_-ZR§(param1:int) : Boolean
      {
         return param1 in §_-5c§;
      }
      
      public static function §_-93Q§(param1:int) : int
      {
         var _loc2_:int = §_-b2c§(param1);
         var _loc3_:Array = §_-y18§(_loc2_);
         if(!_loc3_ || _loc3_.length == 0)
         {
            return 0;
         }
         return _loc3_[0];
      }
      
      public static function §_-Ax§(param1:int) : int
      {
         var skins:Array = null;
         var i:int = 0;
         var id:int = param1;
         skins = §_-y18§(id).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return getPackageCoinsPrice(param1) != 0;
         });
         i = 0;
         while(i < skins.length)
         {
            if(!§_-L1o§.§_-J2p§(skins[i],§_-L1o§.§_-U1v§))
            {
               return skins[i];
            }
            i++;
         }
         return -1;
      }
      
      public static function §_-VD§(param1:int) : int
      {
         if(§_-r5§(param1))
         {
            return §_-C1d§;
         }
         if(§_-e2S§(param1))
         {
            return §_-9f§;
         }
         if(§_-k1G§(param1))
         {
            return §_-o2O§;
         }
         return §_-T1B§;
      }
      
      public static function §_-81H§(param1:Array) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(§_-VD§(param1[_loc2_]) == §_-C1d§)
            {
               return §_-C1d§;
            }
            if(§_-VD§(param1[_loc2_]) == §_-9f§)
            {
               return §_-9f§;
            }
            _loc2_++;
         }
         return §_-T1B§;
      }
      
      public static function §_-T§(param1:int) : Array
      {
         var _loc2_:Array = §_-y18§(param1);
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc3_.concat(§_-G1S§(_loc2_[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-DA§(param1:int) : Array
      {
         var id:int = param1;
         var answer:Array = §_-y18§(id).concat();
         return answer.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            var item:int = param1;
            var index:int = param2;
            var array:Array = param3;
            return §_-G1S§(item).some(function(param1:int, param2:int, param3:Array):Boolean
            {
               return param1 == 0;
            });
         });
      }
      
      public static function §_-1b§(param1:int, param2:int, param3:Array) : Boolean
      {
         return getPackageCoinsPrice(param1) != 0;
      }
      
      public static function §_-y2T§(param1:int, param2:int, param3:Array) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         var _loc4_:int = §_-c1K§(param1);
         var _loc5_:Boolean = §_-eJ§(_loc4_,param1) <= §_-L1o§.§_-51J§(_loc4_);
         var _loc6_:Boolean = §_-L1o§.§_-J2p§(_loc4_,§_-L1o§.§_-U1v§);
         return getPackageCoinsPrice(_loc4_) != 0 || _loc5_ && _loc6_;
      }
      
      public static function §_-9c§(param1:int) : int
      {
         if(param1 in §_-e1R§)
         {
            return param1;
         }
         return §_-G1S§(param1)[0] in §_-A11§.§_-ik§ ? int(§_-A11§.§_-ik§[§_-G1S§(param1)[0]]) : int(§_-G1S§(param1)[0]);
      }
   }
}


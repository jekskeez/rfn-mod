package §_-I10§
{
   import §_-P2b§.§_-6L§;
   
   public class §_-g2W§
   {
      
      public static const §_-O2w§:int = 0;
      
      public static const §_-YG§:int = 1;
      
      public static const §_-x2F§:int = 2;
      
      public static const §_-k22§:int = 3;
      
      public static const §_-W25§:int = 4;
      
      public static const §_-k2t§:int = 0;
      
      public static const §_-y1I§:int = 1;
      
      public static const §_-p2x§:int = 2;
      
      public static const §_-A2k§:int = 3;
      
      public static const §_-Uj§:int = 4;
      
      public static const §_-l2T§:int = 0;
      
      public static const §_-Q1I§:int = 1;
      
      public static const §_-I2F§:int = 2;
      
      public static const §_-Ae§:int = 3;
      
      public static const §_-v1b§:int = 0;
      
      public static const §_-g1h§:int = 1;
      
      public static const §_-91o§:int = 2;
      
      public static const §_-k2J§:int = 3;
      
      public static const §_-O2l§:int = 4;
      
      public static const §_-t10§:int = 5;
      
      public static const §_-Qs§:int = -1;
      
      public static const §_-03k§:int = -2;
      
      public static const §_-81U§:int = -3;
      
      public static const §_-QH§:int = -4;
      
      public static const §_-nk§:int = -5;
      
      public static const §_-X2L§:int = -6;
      
      public static const §_-714§:int = -7;
      
      public static const §_-h2n§:int = 37;
      
      public static const §_-z1z§:int = 43;
      
      public static const §_-v1G§:int = 49;
      
      public static const §_-52H§:int = 51;
      
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
      
      public static const §_-92x§:int = 99;
      
      public static const §_-v1V§:int = 110;
      
      public static const §_-q1G§:int = 111;
      
      public static const §_-qT§:int = 112;
      
      public static const §_-a1v§:int = 130;
      
      public static const §_-A1l§:int = 138;
      
      public static const §_-m1W§:int = 143;
      
      public static const §_-bo§:int = 147;
      
      public static const §_-23o§:int = 148;
      
      public static const §_-C1r§:int = 150;
      
      public static const §_-k7§:int = 157;
      
      public static const §_-114§:int = -2;
      
      public static const §_-17§:int = -3;
      
      public static const §_-2T§:int = -4;
      
      public static const §_-w2M§:int = -5;
      
      public static const §_-G1V§:int = -6;
      
      public static const §_-Z2h§:int = 3;
      
      public static const §_-G2V§:int = 53;
      
      public static const §_-824§:int = 68;
      
      public static const §_-i3§:int = 91;
      
      public static const §_-N2l§:int = 270;
      
      public static var §_-P20§:Boolean = false;
      
      public static const §_-12e§:Object = {};
      
      public static const §_-72b§:Object = {};
      
      public static const §_-qH§:Object = {};
      
      public static var §_-12P§:Array = [];
      
      public static var §_-Ca§:Array = [];
      
      private static var §_-c2w§:Array = [];
      
      private static var §_-01T§:Array = [];
      
      private static var §_-C3B§:Object = {};
      
      private static var §_-h1A§:Object = {};
      
      private static var §_-hC§:Object = {};
      
      private static var §_-G2Y§:Object = {};
      
      public function §_-g2W§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(§_-P20§)
         {
            return;
         }
         §_-P20§ = true;
         var _loc1_:int = 0;
         while(_loc1_ < §_-G1k§)
         {
            _loc2_ = §_-W2m§(_loc1_);
            if(!(!_loc2_ || _loc2_.length == 0))
            {
               §_-G2Y§[_loc2_[0]] = true;
               if(§_-U2z§(_loc1_) != §_-Ae§)
               {
                  switch(§_-018§(_loc1_))
                  {
                     case §_-k2t§:
                        §_-12P§.push(_loc1_);
                        break;
                     case §_-y1I§:
                        §_-Ca§.push(_loc1_);
                  }
               }
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  §_-c2w§[_loc2_[_loc3_]] = _loc1_;
                  if(§_-018§(_loc1_) == §_-y1I§)
                  {
                     §_-C3B§[_loc2_[_loc3_]] = true;
                  }
                  if(§_-j1E§(_loc2_[0]))
                  {
                     §_-h1A§[_loc2_[_loc3_]] = true;
                  }
                  if(§_-r2T§(_loc2_[0]))
                  {
                     §_-hC§[_loc2_[_loc3_]] = true;
                  }
                  _loc4_ = §_-w2o§(_loc2_[_loc3_]);
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.length)
                  {
                     §_-01T§[_loc4_[_loc5_]] = _loc2_[_loc3_];
                     _loc5_++;
                  }
                  _loc3_++;
               }
            }
            _loc1_++;
         }
      }
      
      public static function §_-Kg§(param1:int) : Boolean
      {
         return §_-43l§(param1) != -1;
      }
      
      public static function §_-Kk§(param1:int) : int
      {
         switch(param1)
         {
            case §_-k2t§:
               return §_-Qs§;
            case §_-y1I§:
               return §_-03k§;
            default:
               return -1;
         }
      }
      
      public static function §_-43l§(param1:int) : int
      {
         switch(param1)
         {
            case §_-Qs§:
               return §_-k2t§;
            case §_-03k§:
               return §_-y1I§;
            default:
               return -1;
         }
      }
      
      public static function getBones(param1:String) : Object
      {
         return §_-t2V§.clothes.bones[param1];
      }
      
      public static function get §_-21d§() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in §_-t2V§.clothes.packages)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public static function getPackageCoinsPrice(param1:int) : int
      {
         var _loc2_:Number = §_-g1R§.§_-72d§(param1);
         return §_-t2V§.clothes.packages[param1]["coins_price"] * _loc2_;
      }
      
      public static function §_-BA§(param1:int) : int
      {
         return Math.min(§_-t2V§.clothes.packages[param1]["coins_price"] / 10);
      }
      
      public static function §_-do§(param1:int) : int
      {
         return §_-t2V§.clothes.packages[param1]["max_level"];
      }
      
      public static function §_-G1Y§(param1:int) : String
      {
         return gls(§_-t2V§.clothes.packages[param1]["name"] || "");
      }
      
      public static function §_-81F§(param1:int) : String
      {
         return gls(§_-t2V§.clothes.packages[param1]["description"] || "");
      }
      
      public static function §_-w1D§(param1:int) : Array
      {
         return §_-t2V§.clothes.packages[param1]["bones"] || [];
      }
      
      public static function §_-e2y§(param1:int) : Array
      {
         return §_-t2V§.clothes.packages[param1]["accessories"];
      }
      
      public static function §_-w2o§(param1:int) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         for(_loc3_ in §_-t2V§.clothes.packages[param1]["skills"])
         {
            _loc2_.push(int(_loc3_));
         }
         return _loc2_;
      }
      
      public static function §_-32z§(param1:int, param2:int) : int
      {
         if(param2 in §_-t2V§.clothes.packages[param1]["skills"])
         {
            return §_-t2V§.clothes.packages[param1]["skills"][param2];
         }
         return -1;
      }
      
      public static function §_-f1y§(param1:int) : Boolean
      {
         return "disable_run" in §_-t2V§.clothes.packages[param1];
      }
      
      public static function §_-j1E§(param1:int) : Boolean
      {
         return "scrat" in §_-t2V§.clothes.packages[param1];
      }
      
      public static function §_-r2T§(param1:int) : Boolean
      {
         return "scratty" in §_-t2V§.clothes.packages[param1];
      }
      
      public static function §_-p1I§(param1:int) : int
      {
         return int(§_-t2V§.clothes.packages[param1]["cast_animation"]) || 0;
      }
      
      public static function get §_-G1k§() : int
      {
         return §_-t2V§.clothes.outfits.length;
      }
      
      public static function §_-U2z§(param1:int) : int
      {
         return §_-t2V§.clothes.outfits[param1]["rarity"];
      }
      
      public static function §_-018§(param1:int) : int
      {
         return §_-t2V§.clothes.outfits[param1]["character"];
      }
      
      public static function §_-W2m§(param1:int) : Array
      {
         return §_-t2V§.clothes.outfits[param1]["packages"];
      }
      
      public static function §_-53d§(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-t2V§.clothes.outfits.length)
         {
            if(§_-t2V§.clothes.outfits[_loc2_]["packages"].indexOf(param1) != -1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public static function §_-bB§(param1:int) : Boolean
      {
         return §_-t2V§.clothes.outfits[param1]["newest"];
      }
      
      public static function get §_-fQ§() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in §_-t2V§.clothes.accessories)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public static function §_-q1s§(param1:int) : int
      {
         if(param1 in §_-t2V§.clothes.accessories)
         {
            return §_-t2V§.clothes.accessories[param1]["coins_price"];
         }
         return 0;
      }
      
      public static function §_-m1y§(param1:int) : int
      {
         return §_-t2V§.clothes.accessories[param1]["place"];
      }
      
      public static function §_-9r§(param1:int) : int
      {
         return int(§_-t2V§.clothes.accessories[param1]["character"]) || -1;
      }
      
      public static function §_-Y2V§(param1:int) : Array
      {
         if(!(param1 in §_-t2V§.clothes.accessories))
         {
            return [];
         }
         return §_-t2V§.clothes.accessories[param1]["bones"] || [];
      }
      
      public static function §_-224§(param1:int) : String
      {
         return gls(§_-t2V§.clothes.accessories[param1]["name"]);
      }
      
      public static function §_-X2e§(param1:int) : int
      {
         return §_-c2w§[param1];
      }
      
      public static function §_-N2b§(param1:int) : int
      {
         return §_-01T§[param1];
      }
      
      public static function §_-D2d§(param1:int) : Boolean
      {
         return param1 in §_-C3B§;
      }
      
      public static function §_-91b§(param1:int) : Boolean
      {
         return param1 in §_-h1A§;
      }
      
      public static function §_-W2e§(param1:int) : Boolean
      {
         return param1 in §_-hC§;
      }
      
      public static function §_-CZ§(param1:int) : Boolean
      {
         return param1 in §_-G2Y§;
      }
      
      public static function §_-s1h§(param1:int) : int
      {
         var _loc2_:int = §_-X2e§(param1);
         var _loc3_:Array = §_-W2m§(_loc2_);
         if(!_loc3_ || _loc3_.length == 0)
         {
            return 0;
         }
         return _loc3_[0];
      }
      
      public static function §_-41l§(param1:int) : int
      {
         var skins:Array = null;
         var i:int = 0;
         var id:int = param1;
         skins = §_-W2m§(id).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return getPackageCoinsPrice(param1) != 0;
         });
         i = 0;
         while(i < skins.length)
         {
            if(!§_-h1f§.§_-i21§(skins[i],§_-h1f§.§_-A3r§))
            {
               return skins[i];
            }
            i++;
         }
         return -1;
      }
      
      public static function §_-z1V§(param1:int) : int
      {
         if(§_-91b§(param1))
         {
            return §_-x2F§;
         }
         if(§_-W2e§(param1))
         {
            return §_-k22§;
         }
         if(§_-D2d§(param1))
         {
            return §_-YG§;
         }
         return §_-O2w§;
      }
      
      public static function §_-Y2z§(param1:Array) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(§_-z1V§(param1[_loc2_]) == §_-x2F§)
            {
               return §_-x2F§;
            }
            if(§_-z1V§(param1[_loc2_]) == §_-k22§)
            {
               return §_-k22§;
            }
            _loc2_++;
         }
         return §_-O2w§;
      }
      
      public static function §_-433§(param1:int) : Array
      {
         var _loc2_:Array = §_-W2m§(param1);
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc3_.concat(§_-w2o§(_loc2_[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-H2J§(param1:int) : Array
      {
         var id:int = param1;
         var answer:Array = §_-W2m§(id).concat();
         return answer.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            var item:int = param1;
            var index:int = param2;
            var array:Array = param3;
            return §_-w2o§(item).some(function(param1:int, param2:int, param3:Array):Boolean
            {
               return param1 == 0;
            });
         });
      }
      
      public static function §_-SB§(param1:int, param2:int, param3:Array) : Boolean
      {
         return getPackageCoinsPrice(param1) != 0;
      }
      
      public static function §_-42y§(param1:int, param2:int, param3:Array) : Boolean
      {
         if(param1 == 0)
         {
            return false;
         }
         var _loc4_:int = §_-N2b§(param1);
         var _loc5_:Boolean = §_-32z§(_loc4_,param1) <= §_-h1f§.§_-p1s§(_loc4_);
         var _loc6_:Boolean = §_-h1f§.§_-i21§(_loc4_,§_-h1f§.§_-A3r§);
         return getPackageCoinsPrice(_loc4_) != 0 || _loc5_ && _loc6_;
      }
      
      public static function §_-Kc§(param1:int) : int
      {
         if(param1 in §_-C3B§)
         {
            return param1;
         }
         return §_-w2o§(param1)[0] in §_-6L§.§_-CI§ ? int(§_-6L§.§_-CI§[§_-w2o§(param1)[0]]) : int(§_-w2o§(param1)[0]);
      }
   }
}


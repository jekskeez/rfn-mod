package §_-p1f§
{
   import §_-92M§.§_-U1r§;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-W1e§;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-L9§
   {
      
      public static const §_-O1d§:Object = {
         "0":"Горячие клавиши",
         "1":"Игра",
         "2":"Уведомления",
         "3":"Чат",
         "4":"Диалоги покупок",
         "5":"Просмотренные события"
      };
      
      private static const §_-G2O§:Array = ["quality","highlight","blackout"];
      
      public function §_-L9§()
      {
         super();
      }
      
      public static function §_-Z28§(param1:int) : String
      {
         var _loc2_:String = String(param1);
         return _loc2_ in §_-O1d§ ? §_-O1d§[_loc2_] : "Категория " + param1;
      }
      
      public static function §_-G2m§(param1:int, param2:§_-U1M§) : Object
      {
         if(param2 == null)
         {
            return {};
         }
         param2.position = 0;
         param2.endian = Endian.LITTLE_ENDIAN;
         try
         {
            switch(param1)
            {
               case §_-82N§.§_-NF§:
                  return §_-m1X§(param2);
               case §_-82N§.§_-43h§:
                  return §_-v29§(param2);
               case §_-82N§.§_-K7§:
                  return §_-kh§(param2);
               case §_-82N§.§_-J1S§:
                  return {"chatState":param2.readUnsignedByte()};
               case §_-82N§.§_-c7§:
                  return §_-r2o§(param2);
               case §_-82N§.§_-a1K§:
                  return §_-13T§(param2);
            }
         }
         catch(e:Error)
         {
         }
         return {"raw":§_-sU§(param2)};
      }
      
      public static function encode(param1:int, param2:Object) : §_-U1M§
      {
         var _loc3_:§_-U1M§ = new §_-U1M§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         if(param2 != null && "raw" in param2)
         {
            §_-G2W§(_loc3_,param2["raw"] as Array);
            return _loc3_;
         }
         switch(param1)
         {
            case §_-82N§.§_-NF§:
               §_-F1G§(_loc3_,param2);
               break;
            case §_-82N§.§_-43h§:
               §_-K1h§(_loc3_,param2);
               break;
            case §_-82N§.§_-K7§:
               §_-81h§(_loc3_,param2);
               break;
            case §_-82N§.§_-J1S§:
               _loc3_.writeByte("chatState" in param2 ? int(param2["chatState"]) : 0);
               break;
            case §_-82N§.§_-c7§:
               §_-h1b§(_loc3_,param2);
               break;
            case §_-82N§.§_-a1K§:
               §_-v1q§(_loc3_,param2);
               break;
            default:
               §_-G2W§(_loc3_,param2 != null && "raw" in param2 ? param2["raw"] as Array : []);
         }
         return _loc3_;
      }
      
      private static function §_-m1X§(param1:§_-U1M§) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:uint = param1.§_-C10§();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_[_loc4_] = {
               "class":param1.readUnsignedByte(),
               "perk":param1.§_-C10§()
            };
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function §_-F1G§(param1:§_-U1M§, param2:Object) : void
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < §_-U1r§.§_-N1p§)
         {
            if(!(_loc4_ in param2))
            {
               break;
            }
            _loc3_.push(param2[_loc4_]["class"],param2[_loc4_]["perk"]);
            _loc4_++;
         }
         var _loc5_:int = int(_loc3_.length * 0.5);
         param1.§_-s15§(_loc5_);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            param1.writeByte(_loc3_[_loc4_ * 2]);
            param1.§_-s15§(_loc3_[_loc4_ * 2 + 1]);
            _loc4_++;
         }
      }
      
      private static function §_-v29§(param1:§_-U1M§) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ < §_-G2O§.length)
         {
            _loc2_[§_-G2O§[_loc3_]] = param1.readUnsignedByte();
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-K1h§(param1:§_-U1M§, param2:Object) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < §_-G2O§.length)
         {
            param1.writeByte(§_-G2O§[_loc3_] in param2 ? int(param2[§_-G2O§[_loc3_]]) : 0);
            _loc3_++;
         }
      }
      
      private static function §_-kh§(param1:§_-U1M§) : Object
      {
         return {
            "closeout_period":param1.§_-C10§(),
            "stock_package":param1.§_-C10§(),
            "news_id":param1.§_-C10§()
         };
      }
      
      private static function §_-81h§(param1:§_-U1M§, param2:Object) : void
      {
         param1.§_-s15§(int(param2["closeout_period"]));
         param1.§_-s15§(int(param2["stock_package"]));
         param1.§_-s15§(int(param2["news_id"]));
      }
      
      private static function §_-r2o§(param1:§_-U1M§) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ < §_-W1e§.§_-ZC§.length)
         {
            _loc2_[§_-W1e§.§_-ZC§[_loc3_]] = param1.§_-C10§();
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-h1b§(param1:§_-U1M§, param2:Object) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < §_-W1e§.§_-ZC§.length)
         {
            param1.§_-s15§(§_-W1e§.§_-ZC§[_loc3_] in param2 ? int(param2[§_-W1e§.§_-ZC§[_loc3_]]) : 0);
            _loc3_++;
         }
      }
      
      private static function §_-13T§(param1:§_-U1M§) : Object
      {
         var _loc2_:uint = param1.§_-C10§();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push({
               "type":param1.§_-B2h§(),
               "startSec":param1.§_-C10§()
            });
            _loc4_++;
         }
         return {"seen":_loc3_};
      }
      
      private static function §_-v1q§(param1:§_-U1M§, param2:Object) : void
      {
         var _loc3_:Array = param2 != null && param2["seen"] != null ? param2["seen"] as Array : [];
         param1.§_-s15§(_loc3_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            param1.§_-4E§(_loc3_[_loc4_]["type"]);
            param1.§_-s15§(int(_loc3_[_loc4_]["startSec"]));
            _loc4_++;
         }
      }
      
      private static function §_-sU§(param1:§_-U1M§) : Array
      {
         var _loc2_:Array = [];
         while(param1.bytesAvailable > 0)
         {
            _loc2_.push(param1.readUnsignedByte());
         }
         return _loc2_;
      }
      
      private static function §_-G2W§(param1:§_-U1M§, param2:Array) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            param1.writeByte(int(param2[_loc3_]));
            _loc3_++;
         }
      }
   }
}


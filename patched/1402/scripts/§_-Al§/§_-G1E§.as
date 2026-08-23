package §_-Al§
{
   import §_-HG§.§_-of§;
   import §_-X1k§.§_-N10§;
   import §_-X1k§.§_-u2n§;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-G1E§
   {
      
      public static const §_-M1r§:Object = {
         "0":"Горячие клавиши",
         "1":"Игра",
         "2":"Уведомления",
         "3":"Чат",
         "4":"Диалоги покупок",
         "5":"Просмотренные события"
      };
      
      private static const §_-d2c§:Array = ["quality","highlight","blackout"];
      
      public function §_-G1E§()
      {
         super();
      }
      
      public static function §_-N2z§(param1:int) : String
      {
         var _loc2_:String = String(param1);
         return _loc2_ in §_-M1r§ ? §_-M1r§[_loc2_] : "Категория " + param1;
      }
      
      public static function §_-Y2a§(param1:int, param2:§_-z1i§) : Object
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
               case §_-u2n§.§_-r2t§:
                  return §_-7c§(param2);
               case §_-u2n§.§_-eS§:
                  return §_-B9§(param2);
               case §_-u2n§.§_-P1g§:
                  return §_-Y2I§(param2);
               case §_-u2n§.§_-M1L§:
                  return {"chatState":param2.readUnsignedByte()};
               case §_-u2n§.§_-O2m§:
                  return §_-d2r§(param2);
               case §_-u2n§.§_-gu§:
                  return §_-X2e§(param2);
            }
         }
         catch(e:Error)
         {
         }
         return {"raw":§_-11U§(param2)};
      }
      
      public static function encode(param1:int, param2:Object) : §_-z1i§
      {
         var _loc3_:§_-z1i§ = new §_-z1i§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         if(param2 != null && "raw" in param2)
         {
            §_-Wa§(_loc3_,param2["raw"] as Array);
            return _loc3_;
         }
         switch(param1)
         {
            case §_-u2n§.§_-r2t§:
               §_-Y2F§(_loc3_,param2);
               break;
            case §_-u2n§.§_-eS§:
               §_-i2j§(_loc3_,param2);
               break;
            case §_-u2n§.§_-P1g§:
               §_-62e§(_loc3_,param2);
               break;
            case §_-u2n§.§_-M1L§:
               _loc3_.writeByte("chatState" in param2 ? int(param2["chatState"]) : 0);
               break;
            case §_-u2n§.§_-O2m§:
               §_-my§(_loc3_,param2);
               break;
            case §_-u2n§.§_-gu§:
               §_-66§(_loc3_,param2);
               break;
            default:
               §_-Wa§(_loc3_,param2 != null && "raw" in param2 ? param2["raw"] as Array : []);
         }
         return _loc3_;
      }
      
      private static function §_-7c§(param1:§_-z1i§) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:uint = param1.§_-jk§();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_[_loc4_] = {
               "class":param1.readUnsignedByte(),
               "perk":param1.§_-jk§()
            };
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function §_-Y2F§(param1:§_-z1i§, param2:Object) : void
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < §_-of§.§_-3g§)
         {
            if(!(_loc4_ in param2))
            {
               break;
            }
            _loc3_.push(param2[_loc4_]["class"],param2[_loc4_]["perk"]);
            _loc4_++;
         }
         var _loc5_:int = int(_loc3_.length * 0.5);
         param1.§_-C1W§(_loc5_);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            param1.writeByte(_loc3_[_loc4_ * 2]);
            param1.§_-C1W§(_loc3_[_loc4_ * 2 + 1]);
            _loc4_++;
         }
      }
      
      private static function §_-B9§(param1:§_-z1i§) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ < §_-d2c§.length)
         {
            _loc2_[§_-d2c§[_loc3_]] = param1.readUnsignedByte();
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-i2j§(param1:§_-z1i§, param2:Object) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < §_-d2c§.length)
         {
            param1.writeByte(§_-d2c§[_loc3_] in param2 ? int(param2[§_-d2c§[_loc3_]]) : 0);
            _loc3_++;
         }
      }
      
      private static function §_-Y2I§(param1:§_-z1i§) : Object
      {
         return {
            "closeout_period":param1.§_-jk§(),
            "stock_package":param1.§_-jk§(),
            "news_id":param1.§_-jk§()
         };
      }
      
      private static function §_-62e§(param1:§_-z1i§, param2:Object) : void
      {
         param1.§_-C1W§(int(param2["closeout_period"]));
         param1.§_-C1W§(int(param2["stock_package"]));
         param1.§_-C1W§(int(param2["news_id"]));
      }
      
      private static function §_-d2r§(param1:§_-z1i§) : Object
      {
         var _loc2_:Object = {};
         var _loc3_:int = 0;
         while(_loc3_ < §_-N10§.§_-X2R§.length)
         {
            _loc2_[§_-N10§.§_-X2R§[_loc3_]] = param1.§_-jk§();
            _loc3_++;
         }
         return _loc2_;
      }
      
      private static function §_-my§(param1:§_-z1i§, param2:Object) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < §_-N10§.§_-X2R§.length)
         {
            param1.§_-C1W§(§_-N10§.§_-X2R§[_loc3_] in param2 ? int(param2[§_-N10§.§_-X2R§[_loc3_]]) : 0);
            _loc3_++;
         }
      }
      
      private static function §_-X2e§(param1:§_-z1i§) : Object
      {
         var _loc2_:uint = param1.§_-jk§();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push({
               "type":param1.§_-o1§(),
               "startSec":param1.§_-jk§()
            });
            _loc4_++;
         }
         return {"seen":_loc3_};
      }
      
      private static function §_-66§(param1:§_-z1i§, param2:Object) : void
      {
         var _loc3_:Array = param2 != null && param2["seen"] != null ? param2["seen"] as Array : [];
         param1.§_-C1W§(_loc3_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            param1.§_-d2z§(_loc3_[_loc4_]["type"]);
            param1.§_-C1W§(int(_loc3_[_loc4_]["startSec"]));
            _loc4_++;
         }
      }
      
      private static function §_-11U§(param1:§_-z1i§) : Array
      {
         var _loc2_:Array = [];
         while(param1.bytesAvailable > 0)
         {
            _loc2_.push(param1.readUnsignedByte());
         }
         return _loc2_;
      }
      
      private static function §_-Wa§(param1:§_-z1i§, param2:Array) : void
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


package §_-I10§
{
   import §_-92M§.§_-U1r§;
   import flash.utils.Endian;
   import protocol.Connection;
   import protocol.§_-P1h§;
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   import protocol.§_-h2B§;
   
   public class §_-82N§
   {
      
      public static const §_-NF§:int = 0;
      
      public static const §_-43h§:int = 1;
      
      public static const §_-K7§:int = 2;
      
      public static const §_-J1S§:int = 3;
      
      public static const §_-c7§:int = 4;
      
      public static const §_-a1K§:int = 5;
      
      private static const §_-G2O§:Array = ["quality","highlight","blackout"];
      
      private static var §_-IC§:Object = {};
      
      private static var §_-VN§:Object = {};
      
      public function §_-82N§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-43h§]);
      }
      
      public static function addCallback(param1:int, param2:Function) : void
      {
         §_-VN§[param1] = param2;
      }
      
      public static function §_-m2x§(param1:String, param2:int) : Boolean
      {
         return §_-FG§(§_-F2p§(),param1,param2);
      }
      
      public static function §_-s1o§(param1:Array) : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc2_:Array = §_-F2p§();
         var _loc3_:Boolean = false;
         for each(_loc4_ in param1)
         {
            _loc5_ = _loc4_["type"];
            _loc6_ = int(_loc4_["startSec"]);
            if(!(!_loc5_ || _loc6_ <= 0 || §_-FG§(_loc2_,_loc5_,_loc6_)))
            {
               _loc2_.push({
                  "type":_loc5_,
                  "startSec":_loc6_
               });
               _loc3_ = true;
            }
         }
         if(_loc3_)
         {
            save(§_-a1K§,{"seen":_loc2_});
         }
      }
      
      private static function §_-FG§(param1:Array, param2:String, param3:int) : Boolean
      {
         var _loc4_:Object = null;
         for each(_loc4_ in param1)
         {
            if(_loc4_["type"] == param2 && _loc4_["startSec"] == param3)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function save(param1:int, param2:Object) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         §_-IC§[param1] = param2;
         var _loc3_:§_-U1M§ = §_-P1h§.get(param2.length);
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         switch(param1)
         {
            case §_-NF§:
               _loc4_ = [];
               _loc7_ = 0;
               while(_loc7_ < §_-U1r§.§_-N1p§)
               {
                  if(!(_loc7_ in param2))
                  {
                     break;
                  }
                  _loc4_.push(param2[_loc7_]["class"],param2[_loc7_]["perk"]);
                  _loc7_++;
               }
               _loc5_ = int(_loc4_.length * 0.5);
               _loc3_.§_-s15§(_loc5_);
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc3_.writeByte(_loc4_[_loc7_ * 2]);
                  _loc3_.§_-s15§(_loc4_[_loc7_ * 2 + 1]);
                  _loc7_++;
               }
               break;
            case §_-43h§:
               _loc7_ = 0;
               while(_loc7_ < §_-G2O§.length)
               {
                  _loc3_.writeByte(§_-G2O§[_loc7_] in param2 ? int(param2[§_-G2O§[_loc7_]]) : 0);
                  _loc7_++;
               }
               break;
            case §_-K7§:
               _loc3_.§_-s15§(param2["closeout_period"]);
               _loc3_.§_-s15§(param2["stock_package"]);
               _loc3_.§_-s15§(param2["news_id"]);
               break;
            case §_-J1S§:
               _loc3_.writeByte(param2["chatState"]);
               break;
            case §_-c7§:
               _loc7_ = 0;
               while(_loc7_ < §_-W1e§.§_-ZC§.length)
               {
                  _loc3_.§_-s15§(§_-W1e§.§_-ZC§[_loc7_] in param2 ? param2[§_-W1e§.§_-ZC§[_loc7_]] : 0);
                  _loc7_++;
               }
               break;
            case §_-a1K§:
               _loc6_ = param2["seen"] || [];
               _loc3_.§_-s15§(_loc6_.length);
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc3_.§_-4E§(_loc6_[_loc7_]["type"]);
                  _loc3_.§_-s15§(_loc6_[_loc7_]["startSec"]);
                  _loc7_++;
               }
         }
         Connection.§_-Li§(§_-h2B§.§_-rO§,param1,_loc3_);
      }
      
      public static function load(param1:int) : Object
      {
         if(!(param1 in §_-IC§))
         {
            return {};
         }
         return §_-IC§[param1];
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var settings:Array = null;
         var i:int = 0;
         var data:Object = null;
         var byteArray:§_-U1M§ = null;
         var length:uint = 0;
         var seenCount:uint = 0;
         var seenList:Array = null;
         var j:int = 0;
         var packet:§_-S2I§ = param1;
         settings = packet[0];
         i = 0;
         while(i < settings.length)
         {
            data = {};
            byteArray = settings[i + 1];
            try
            {
               switch(settings[i])
               {
                  case §_-NF§:
                     length = byteArray.§_-C10§();
                     j = 0;
                     while(j < length)
                     {
                        data[j] = {};
                        data[j]["class"] = byteArray.readUnsignedByte();
                        data[j]["perk"] = byteArray.§_-C10§();
                        j++;
                     }
                     break;
                  case §_-43h§:
                     j = 0;
                     while(j < §_-G2O§.length)
                     {
                        data[§_-G2O§[j]] = byteArray.readUnsignedByte();
                        j++;
                     }
                     break;
                  case §_-K7§:
                     data["closeout_period"] = byteArray.§_-C10§();
                     data["stock_package"] = byteArray.§_-C10§();
                     data["news_id"] = byteArray.§_-C10§();
                     break;
                  case §_-J1S§:
                     data["chatState"] = byteArray.readUnsignedByte();
                     break;
                  case §_-c7§:
                     j = 0;
                     while(j < §_-W1e§.§_-ZC§.length)
                     {
                        data[§_-W1e§.§_-ZC§[j]] = byteArray.§_-C10§();
                        j++;
                     }
                     break;
                  case §_-a1K§:
                     seenCount = byteArray.§_-C10§();
                     seenList = [];
                     j = 0;
                     while(j < seenCount)
                     {
                        seenList.push({
                           "type":byteArray.§_-B2h§(),
                           "startSec":byteArray.§_-C10§()
                        });
                        j++;
                     }
                     data["seen"] = seenList;
               }
            }
            catch(e:Error)
            {
               §_-TQ§.add("Error on load settings. Type " + settings[i]);
               Connection.§_-Li§(§_-h2B§.§_-rO§,settings[i],new §_-U1M§());
            }
            §_-P1h§.add(byteArray);
            §_-IC§[settings[i]] = data;
            if(settings[i] in §_-VN§)
            {
               §_-VN§[settings[i]]();
            }
            i += 2;
         }
      }
      
      private static function §_-F2p§() : Array
      {
         return load(§_-a1K§)["seen"] || [];
      }
   }
}


package §_-X1k§
{
   import §_-HG§.§_-of§;
   import flash.utils.Endian;
   import protocol.Connection;
   import protocol.§_-Q17§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import protocol.§_-z1i§;
   
   public class §_-u2n§
   {
      
      public static const §_-r2t§:int = 0;
      
      public static const §_-eS§:int = 1;
      
      public static const §_-P1g§:int = 2;
      
      public static const §_-M1L§:int = 3;
      
      public static const §_-O2m§:int = 4;
      
      public static const §_-gu§:int = 5;
      
      private static const §_-d2c§:Array = ["quality","highlight","blackout"];
      
      private static var §_-ZH§:Object = {};
      
      private static var §_-uu§:Object = {};
      
      public function §_-u2n§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-eS§]);
      }
      
      public static function addCallback(param1:int, param2:Function) : void
      {
         §_-uu§[param1] = param2;
      }
      
      public static function §_-F1a§(param1:String, param2:int) : Boolean
      {
         return §_-l1Q§(§_-P2J§(),param1,param2);
      }
      
      public static function §_-KQ§(param1:Array) : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc2_:Array = §_-P2J§();
         var _loc3_:Boolean = false;
         for each(_loc4_ in param1)
         {
            _loc5_ = _loc4_["type"];
            _loc6_ = int(_loc4_["startSec"]);
            if(!(!_loc5_ || _loc6_ <= 0 || §_-l1Q§(_loc2_,_loc5_,_loc6_)))
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
            save(§_-gu§,{"seen":_loc2_});
         }
      }
      
      private static function §_-l1Q§(param1:Array, param2:String, param3:int) : Boolean
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
         §_-ZH§[param1] = param2;
         var _loc3_:§_-z1i§ = §_-Q17§.get(param2.length);
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         switch(param1)
         {
            case §_-r2t§:
               _loc4_ = [];
               _loc7_ = 0;
               while(_loc7_ < §_-of§.§_-3g§)
               {
                  if(!(_loc7_ in param2))
                  {
                     break;
                  }
                  _loc4_.push(param2[_loc7_]["class"],param2[_loc7_]["perk"]);
                  _loc7_++;
               }
               _loc5_ = int(_loc4_.length * 0.5);
               _loc3_.§_-C1W§(_loc5_);
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc3_.writeByte(_loc4_[_loc7_ * 2]);
                  _loc3_.§_-C1W§(_loc4_[_loc7_ * 2 + 1]);
                  _loc7_++;
               }
               break;
            case §_-eS§:
               _loc7_ = 0;
               while(_loc7_ < §_-d2c§.length)
               {
                  _loc3_.writeByte(§_-d2c§[_loc7_] in param2 ? int(param2[§_-d2c§[_loc7_]]) : 0);
                  _loc7_++;
               }
               break;
            case §_-P1g§:
               _loc3_.§_-C1W§(param2["closeout_period"]);
               _loc3_.§_-C1W§(param2["stock_package"]);
               _loc3_.§_-C1W§(param2["news_id"]);
               break;
            case §_-M1L§:
               _loc3_.writeByte(param2["chatState"]);
               break;
            case §_-O2m§:
               _loc7_ = 0;
               while(_loc7_ < §_-N10§.§_-X2R§.length)
               {
                  _loc3_.§_-C1W§(§_-N10§.§_-X2R§[_loc7_] in param2 ? param2[§_-N10§.§_-X2R§[_loc7_]] : 0);
                  _loc7_++;
               }
               break;
            case §_-gu§:
               _loc6_ = param2["seen"] || [];
               _loc3_.§_-C1W§(_loc6_.length);
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc3_.§_-d2z§(_loc6_[_loc7_]["type"]);
                  _loc3_.§_-C1W§(_loc6_[_loc7_]["startSec"]);
                  _loc7_++;
               }
         }
         Connection.§_-e2T§(§_-u1O§.§_-Q24§,param1,_loc3_);
      }
      
      public static function load(param1:int) : Object
      {
         if(!(param1 in §_-ZH§))
         {
            return {};
         }
         return §_-ZH§[param1];
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var settings:Array = null;
         var i:int = 0;
         var data:Object = null;
         var byteArray:§_-z1i§ = null;
         var length:uint = 0;
         var seenCount:uint = 0;
         var seenList:Array = null;
         var j:int = 0;
         var packet:§_-s2l§ = param1;
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
                  case §_-r2t§:
                     length = byteArray.§_-jk§();
                     j = 0;
                     while(j < length)
                     {
                        data[j] = {};
                        data[j]["class"] = byteArray.readUnsignedByte();
                        data[j]["perk"] = byteArray.§_-jk§();
                        j++;
                     }
                     break;
                  case §_-eS§:
                     j = 0;
                     while(j < §_-d2c§.length)
                     {
                        data[§_-d2c§[j]] = byteArray.readUnsignedByte();
                        j++;
                     }
                     break;
                  case §_-P1g§:
                     data["closeout_period"] = byteArray.§_-jk§();
                     data["stock_package"] = byteArray.§_-jk§();
                     data["news_id"] = byteArray.§_-jk§();
                     break;
                  case §_-M1L§:
                     data["chatState"] = byteArray.readUnsignedByte();
                     break;
                  case §_-O2m§:
                     j = 0;
                     while(j < §_-N10§.§_-X2R§.length)
                     {
                        data[§_-N10§.§_-X2R§[j]] = byteArray.§_-jk§();
                        j++;
                     }
                     break;
                  case §_-gu§:
                     seenCount = byteArray.§_-jk§();
                     seenList = [];
                     j = 0;
                     while(j < seenCount)
                     {
                        seenList.push({
                           "type":byteArray.§_-o1§(),
                           "startSec":byteArray.§_-jk§()
                        });
                        j++;
                     }
                     data["seen"] = seenList;
               }
            }
            catch(e:Error)
            {
               §_-p2U§.add("Error on load settings. Type " + settings[i]);
               Connection.§_-e2T§(§_-u1O§.§_-Q24§,settings[i],new §_-z1i§());
            }
            §_-Q17§.add(byteArray);
            §_-ZH§[settings[i]] = data;
            if(settings[i] in §_-uu§)
            {
               §_-uu§[settings[i]]();
            }
            i += 2;
         }
      }
      
      private static function §_-P2J§() : Array
      {
         return load(§_-gu§)["seen"] || [];
      }
   }
}


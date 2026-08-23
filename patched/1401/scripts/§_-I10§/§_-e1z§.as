package §_-I10§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-ex§;
   
   public class §_-e1z§
   {
      
      public static const §_-a1H§:int = 0;
      
      public static const §_-cd§:int = 1;
      
      public static const VIP:int = 2;
      
      public static const §_-M1w§:int = 4;
      
      public static const §_-y1H§:int = 5;
      
      public static const §_-52V§:int = 6;
      
      public static const §_-I13§:int = 7;
      
      public static const §_-kw§:int = 8;
      
      public static const §_-n21§:int = 9;
      
      public static const §_-W1W§:int = 10;
      
      public static const §_-i1s§:int = 11;
      
      public static const §_-Q1n§:int = 12;
      
      public static const §_-02l§:int = 13;
      
      public static const §_-lJ§:int = 14;
      
      public static const §_-DW§:int = 15;
      
      public static const §_-G2u§:int = 16;
      
      public static const §_-YB§:int = 17;
      
      public static const §_-OJ§:int = 18;
      
      public static const §_-C2y§:int = 19;
      
      public static const §_-j0§:int = 20;
      
      public static const §_-Z9§:int = 21;
      
      private static const §_-T2V§:int = 60;
      
      public static const DATA:Object = {};
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-A3h§:Object = {};
      
      private static var §_-OK§:int = -1;
      
      private static var §_-71f§:String = "";
      
      private static var §_-G2N§:Boolean = false;
      
      private static var §_-i1Q§:int = -1;
      
      DATA[VIP] = {
         "name":gls("VIP-статус"),
         "imageClass":"VIPShopSmallImage",
         "imageScaleXY":1,
         "iconClass":"ImageIconVIP",
         "iconScaleXY":1,
         "iconXY":[0,-5],
         "hasEntity":true
      };
      DATA[§_-n21§] = {
         "name":gls("Безлимитная мана"),
         "imageClass":"ImageIconManaUnlimited",
         "imageScaleXY":4,
         "iconClass":"ImageIconManaUnlimited",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-i1s§] = {
         "name":gls("Безлимитная энергия"),
         "imageClass":"ImageIconEnergyUnlimited",
         "imageScaleXY":4,
         "iconClass":"ImageIconEnergyUnlimited",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-02l§] = {
         "name":gls("Зелье Могущества"),
         "imageClass":"ManaRegenerationImage",
         "imageScaleXY":1,
         "iconClass":"ManaRegenerationImage",
         "iconScaleXY":0.2,
         "iconXY":[0,0],
         "hasEntity":true
      };
      DATA[§_-OJ§] = {
         "name":gls("Безлимитная энергия"),
         "imageClass":"ImageIconEnergyUnlimited",
         "imageScaleXY":4,
         "iconClass":"ImageIconEnergyUnlimited",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-j0§] = {
         "name":gls("Двойные коллекции"),
         "imageClass":"ImageIconDoubleCollection",
         "imageScaleXY":1.5,
         "iconClass":"ImageIconDoubleCollection",
         "iconScaleXY":1.5,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-Z9§] = {
         "name":gls("Двойной опыт"),
         "imageClass":"ImageIconDoubleExperience",
         "imageScaleXY":4,
         "iconClass":"ImageIconDoubleExperience",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      
      public function §_-e1z§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-O2P§]);
         §_-01Y§.§_-c9§(§_-H5§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-Lq§(param1:int) : Boolean
      {
         var _loc2_:int = int(getTimer() / 1000);
         return param1 in §_-A3h§ && §_-A3h§[param1] > _loc2_;
      }
      
      public static function §_-7v§(param1:int) : String
      {
         if(!(param1 in §_-A3h§))
         {
            return "";
         }
         return §_-ex§.§_-d2X§(§_-A3h§[param1] - int(getTimer() / 1000));
      }
      
      public static function get §_-a1h§() : String
      {
         if(§_-i1Q§ == -1)
         {
            return "";
         }
         return §_-ex§.§_-p1x§(§_-T2V§ - (int(getTimer() / 1000) - §_-i1Q§) % §_-T2V§);
      }
      
      public static function get §_-po§() : String
      {
         §_-N2k§();
         return §_-71f§;
      }
      
      public static function get §_-Hc§() : Boolean
      {
         §_-N2k§();
         return §_-G2N§;
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = param1[0];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-A3h§[_loc2_[_loc3_]] = _loc2_[_loc3_ + 1] + int(getTimer() / 1000);
            §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EXPIRATIONS_CHANGE,{"type":int(_loc2_[_loc3_])}));
            _loc3_ += 2;
         }
         if(§_-i1Q§ == -1 && §_-02l§ in §_-A3h§)
         {
            §_-i1Q§ = int(getTimer() / 1000);
         }
      }
      
      private static function §_-H5§() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(getTimer() / 1000);
         for(_loc2_ in §_-A3h§)
         {
            _loc3_ = int(_loc2_);
            if(§_-A3h§[_loc2_] > _loc1_)
            {
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.ON_CHANGE,{"type":_loc3_}));
            }
            else
            {
               delete §_-A3h§[_loc2_];
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EXPIRATIONS_CHANGE,{"type":_loc2_}));
               if(_loc3_ == §_-02l§)
               {
                  §_-i1Q§ = -1;
               }
            }
         }
      }
      
      private static function §_-N2k§() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(getTimer() / 1000);
         if(§_-OK§ == _loc1_)
         {
            return;
         }
         §_-OK§ = _loc1_;
         §_-71f§ = "";
         §_-G2N§ = false;
         for(_loc2_ in DATA)
         {
            if(!DATA[_loc2_].hasEntity)
            {
               _loc3_ = int(_loc2_);
               if(§_-Lq§(_loc3_))
               {
                  §_-G2N§ = true;
                  §_-71f§ += (§_-71f§ == "" ? "" : "\n") + DATA[_loc2_].name + ": <b>" + §_-7v§(_loc3_) + "</b>";
               }
            }
         }
      }
   }
}


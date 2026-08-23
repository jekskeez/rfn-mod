package §_-X1k§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-B1d§;
   
   public class §_-ku§
   {
      
      public static const §_-fz§:int = 0;
      
      public static const §_-S2V§:int = 1;
      
      public static const VIP:int = 2;
      
      public static const §_-42c§:int = 4;
      
      public static const §_-Q2Y§:int = 5;
      
      public static const §_-A3I§:int = 6;
      
      public static const §_-c2h§:int = 7;
      
      public static const §_-92R§:int = 8;
      
      public static const §_-LW§:int = 9;
      
      public static const §_-1J§:int = 10;
      
      public static const §_-Z13§:int = 11;
      
      public static const §_-719§:int = 12;
      
      public static const §_-v2p§:int = 13;
      
      public static const §_-63n§:int = 14;
      
      public static const §_-B1L§:int = 15;
      
      public static const §_-gA§:int = 16;
      
      public static const §_-y1o§:int = 17;
      
      public static const §_-Z2J§:int = 18;
      
      public static const §_-K1B§:int = 19;
      
      public static const §_-3u§:int = 20;
      
      public static const §_-fu§:int = 21;
      
      private static const §_-XE§:int = 60;
      
      public static const DATA:Object = {};
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-Ep§:Object = {};
      
      private static var §_-yq§:int = -1;
      
      private static var §_-vn§:String = "";
      
      private static var §_-in§:Boolean = false;
      
      private static var §_-mp§:int = -1;
      
      DATA[VIP] = {
         "name":gls("VIP-статус"),
         "imageClass":"VIPShopSmallImage",
         "imageScaleXY":1,
         "iconClass":"ImageIconVIP",
         "iconScaleXY":1,
         "iconXY":[0,-5],
         "hasEntity":true
      };
      DATA[§_-LW§] = {
         "name":gls("Безлимитная мана"),
         "imageClass":"ImageIconManaUnlimited",
         "imageScaleXY":4,
         "iconClass":"ImageIconManaUnlimited",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-Z13§] = {
         "name":gls("Безлимитная энергия"),
         "imageClass":"ImageIconEnergyUnlimited",
         "imageScaleXY":4,
         "iconClass":"ImageIconEnergyUnlimited",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-v2p§] = {
         "name":gls("Зелье Могущества"),
         "imageClass":"ManaRegenerationImage",
         "imageScaleXY":1,
         "iconClass":"ManaRegenerationImage",
         "iconScaleXY":0.2,
         "iconXY":[0,0],
         "hasEntity":true
      };
      DATA[§_-Z2J§] = {
         "name":gls("Безлимитная энергия"),
         "imageClass":"ImageIconEnergyUnlimited",
         "imageScaleXY":4,
         "iconClass":"ImageIconEnergyUnlimited",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-3u§] = {
         "name":gls("Двойные коллекции"),
         "imageClass":"ImageIconDoubleCollection",
         "imageScaleXY":1.5,
         "iconClass":"ImageIconDoubleCollection",
         "iconScaleXY":1.5,
         "iconXY":[0,0],
         "hasEntity":false
      };
      DATA[§_-fu§] = {
         "name":gls("Двойной опыт"),
         "imageClass":"ImageIconDoubleExperience",
         "imageScaleXY":4,
         "iconClass":"ImageIconDoubleExperience",
         "iconScaleXY":1,
         "iconXY":[0,0],
         "hasEntity":false
      };
      
      public function §_-ku§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-y2q§]);
         §_-p1V§.§_-63T§(§_-t29§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-R1C§(param1:int) : Boolean
      {
         var _loc2_:int = int(getTimer() / 1000);
         return param1 in §_-Ep§ && §_-Ep§[param1] > _loc2_;
      }
      
      public static function §_-g2V§(param1:int) : String
      {
         if(!(param1 in §_-Ep§))
         {
            return "";
         }
         return §_-B1d§.§_-g2n§(§_-Ep§[param1] - int(getTimer() / 1000));
      }
      
      public static function get §_-q1v§() : String
      {
         if(§_-mp§ == -1)
         {
            return "";
         }
         return §_-B1d§.§_-z2d§(§_-XE§ - (int(getTimer() / 1000) - §_-mp§) % §_-XE§);
      }
      
      public static function get §_-e1n§() : String
      {
         §_-o1t§();
         return §_-vn§;
      }
      
      public static function get §_-wi§() : Boolean
      {
         §_-o1t§();
         return §_-in§;
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = param1[0];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-Ep§[_loc2_[_loc3_]] = _loc2_[_loc3_ + 1] + int(getTimer() / 1000);
            §_-jx§.dispatchEvent(new GameEvent(GameEvent.EXPIRATIONS_CHANGE,{"type":int(_loc2_[_loc3_])}));
            _loc3_ += 2;
         }
         if(§_-mp§ == -1 && §_-v2p§ in §_-Ep§)
         {
            §_-mp§ = int(getTimer() / 1000);
         }
      }
      
      private static function §_-t29§() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(getTimer() / 1000);
         for(_loc2_ in §_-Ep§)
         {
            _loc3_ = int(_loc2_);
            if(§_-Ep§[_loc2_] > _loc1_)
            {
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.ON_CHANGE,{"type":_loc3_}));
            }
            else
            {
               delete §_-Ep§[_loc2_];
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.EXPIRATIONS_CHANGE,{"type":_loc2_}));
               if(_loc3_ == §_-v2p§)
               {
                  §_-mp§ = -1;
               }
            }
         }
      }
      
      private static function §_-o1t§() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:int = int(getTimer() / 1000);
         if(§_-yq§ == _loc1_)
         {
            return;
         }
         §_-yq§ = _loc1_;
         §_-vn§ = "";
         §_-in§ = false;
         for(_loc2_ in DATA)
         {
            if(!DATA[_loc2_].hasEntity)
            {
               _loc3_ = int(_loc2_);
               if(§_-R1C§(_loc3_))
               {
                  §_-in§ = true;
                  §_-vn§ += (§_-vn§ == "" ? "" : "\n") + DATA[_loc2_].name + ": <b>" + §_-g2V§(_loc3_) + "</b>";
               }
            }
         }
      }
   }
}


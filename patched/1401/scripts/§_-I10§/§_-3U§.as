package §_-I10§
{
   import §_-k1c§.§_-M1v§;
   import §_-k1c§.§_-T2m§;
   import com.api.QuestEvent;
   import com.api.Services;
   import com.api.SettingsExistsEvent;
   import events.GameEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import protocol.§_-T2o§;
   
   public class §_-3U§
   {
      
      public static const §_-53§:int = 7;
      
      public static const §_-113§:uint = 20;
      
      public static const §_-y2q§:uint = 1 << §_-q1e§;
      
      public static const §_-Z1I§:uint = 1 << ++§_-q1e§;
      
      public static const §_-H2n§:uint = 1 << ++§_-q1e§;
      
      public static const §_-C2j§:uint = 1 << ++§_-q1e§;
      
      public static const §_-025§:uint = 1 << ++§_-q1e§;
      
      public static const §_-o1p§:uint = 1 << ++§_-q1e§;
      
      public static const §_-p1r§:uint = 1 << ++§_-q1e§;
      
      public static const §_-p2J§:uint = 1 << ++§_-q1e§;
      
      public static const §_-x2g§:Object = {
         "vk":[§_-y2q§,§_-Z1I§,§_-H2n§,§_-p1r§,§_-025§],
         "fb":[§_-y2q§,§_-p1r§,§_-p2J§],
         "sa":[§_-y2q§,§_-Z1I§,§_-p1r§],
         "default":[§_-y2q§,§_-Z1I§,§_-p1r§]
      };
      
      private static const §_-p1m§:Object = {
         "vk":[§_-y2q§,§_-C2j§,§_-p2J§],
         "fb":[§_-y2q§,§_-Z1I§,§_-H2n§,§_-025§,§_-C2j§],
         "sa":[§_-y2q§,§_-H2n§,§_-025§,§_-C2j§,§_-p2J§],
         "default":[§_-y2q§,§_-H2n§,§_-025§,§_-C2j§,§_-p2J§]
      };
      
      public static const §_-QA§:Array = [§_-y2q§,§_-Z1I§,§_-H2n§,§_-C2j§,§_-025§,§_-o1p§,§_-p1r§,§_-p2J§];
      
      private static var §_-q1e§:uint = 0;
      
      private static var _instance:§_-3U§ = null;
      
      private var §_-53C§:String;
      
      public function §_-3U§()
      {
         super();
         _instance = this;
         var _loc1_:Object = §_-k2X§.loaderInfo.parameters as Object;
         if("useApiType" in _loc1_)
         {
            this.§_-53C§ = _loc1_["useApiType"];
         }
         else if("useapitype" in _loc1_)
         {
            this.§_-53C§ = _loc1_["useapitype"];
         }
         else
         {
            this.§_-53C§ = §_-a9§.§_-63Z§;
         }
      }
      
      public static function get §_-LM§() : Boolean
      {
         return _instance.§_-53C§ == "fb" || _instance.§_-53C§ == "vk" || _instance.§_-53C§ == "mm" || _instance.§_-53C§ == "ok";
      }
      
      public static function §_-9T§() : void
      {
         Services.addEventListener(SettingsExistsEvent.LEFT_MENU,_instance.§_-93I§);
         Services.addEventListener(SettingsExistsEvent.NOTIFICATION,_instance.§_-UW§);
         Services.listenGroup(_instance.§_-C27§);
         if(§_-v1w§.get() == 30005 && _instance.§_-53C§ == "fb")
         {
            _instance.§_-J1z§();
         }
         §_-d2x§.addEventListener(GameEvent.EXPERIENCE_CHANGED,_instance.§_-A1O§);
         §_-Bm§.§_-z1M§(§_-T2o§.§_-71z§).listen(_instance.§_-I2Q§);
         _instance.§_-EZ§();
         Services.requestLeftMenu(true);
         Services.requestShared();
         _instance.§_-A1O§();
      }
      
      public static function §_-81g§(param1:int) : Boolean
      {
         return (§_-Bm§.§_-z1M§(§_-T2o§.§_-71z§).value & param1) == param1;
      }
      
      public static function get §_-IY§() : Boolean
      {
         return (§_-Bm§.§_-z1M§(§_-T2o§.§_-71z§).value & §_-o1p§) == §_-o1p§;
      }
      
      public static function get §_-BH§() : Boolean
      {
         var _loc1_:Array = §_-3U§.§_-x2g§[_instance.§_-53C§] || §_-3U§.§_-x2g§["default"];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(!§_-81g§(_loc1_[_loc2_]))
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public static function §_-42§(param1:int) : void
      {
         if(§_-81g§(param1))
         {
            return;
         }
         switch(param1)
         {
            case §_-H2n§:
               Services.requestLeftMenu(true);
               break;
            case §_-Z1I§:
               Services.requestGroup();
               break;
            case §_-025§:
               Services.requestNotification(true);
         }
      }
      
      public static function §_-H2m§(param1:int) : void
      {
         switch(param1)
         {
            case §_-H2n§:
               if(_instance.§_-53C§ == "vk")
               {
                  Services.requestLeftMenu();
               }
               break;
            case §_-Z1I§:
               if(_instance.§_-53C§ == "vk")
               {
                  navigateToURL(new URLRequest(Services.config.vk_groupAddress),"_blank");
               }
               if(_instance.§_-53C§ == "fb")
               {
                  navigateToURL(new URLRequest(Services.config.fb_groupAddress),"_blank");
               }
               if(_instance.§_-53C§ == "mm")
               {
                  navigateToURL(new URLRequest(Services.config.mm_groupAddress),"_blank");
               }
               if(_instance.§_-53C§ == "ok")
               {
                  navigateToURL(new URLRequest(Services.config.ok_groupAddress),"_blank");
               }
               if(_instance.§_-53C§ == "fs")
               {
                  navigateToURL(new URLRequest(Services.config.fs_groupAddress),"_blank");
               }
               break;
            case §_-p2J§:
               _instance.§_-J1z§();
               break;
            case §_-025§:
               if(_instance.§_-53C§ == "vk")
               {
                  Services.requestNotification();
               }
               break;
            case §_-C2j§:
               §_-M1v§.show();
         }
      }
      
      private static function §_-o2j§(param1:int) : void
      {
         if(§_-81g§(param1))
         {
            return;
         }
         var _loc2_:§_-T2o§ = §_-Bm§.§_-z1M§(§_-T2o§.§_-71z§);
         _loc2_.§_-r1g§(_loc2_.value | param1);
         if(§_-T2m§.§_-P20§)
         {
            §_-T2m§.§_-e2t§(param1);
         }
      }
      
      private function §_-EZ§() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:§_-T2o§ = null;
         var _loc1_:Array = §_-3U§.§_-p1m§[this.§_-53C§] || §_-3U§.§_-p1m§["default"];
         for each(_loc2_ in _loc1_)
         {
            switch(_loc2_)
            {
               case §_-H2n§:
                  this.§_-93I§(new SettingsExistsEvent(SettingsExistsEvent.LEFT_MENU,true));
                  break;
               case §_-Z1I§:
                  this.§_-C27§(new QuestEvent("",true));
                  break;
               case §_-p2J§:
                  this.§_-J1z§();
                  break;
               case §_-025§:
                  this.§_-UW§(new SettingsExistsEvent(SettingsExistsEvent.NOTIFICATION,true));
                  break;
               case §_-C2j§:
                  _loc3_ = §_-Bm§.§_-z1M§(§_-T2o§.§_-71z§);
                  _loc3_.§_-r1g§(_loc3_.value | §_-C2j§);
                  break;
               case §_-y2q§:
                  this.§_-W2A§();
            }
         }
      }
      
      private function §_-I2Q§(param1:§_-T2o§) : void
      {
         if(§_-81g§(§_-C2j§))
         {
            return;
         }
         if((param1.value & §_-C2j§) != §_-C2j§)
         {
            return;
         }
         §_-Bm§.§_-z1M§(§_-T2o§.§_-71z§).forget(_instance.§_-I2Q§);
         §_-o2j§(§_-C2j§);
      }
      
      private function §_-W2A§() : void
      {
         if(§_-81g§(§_-y2q§))
         {
            return;
         }
         §_-o2j§(§_-y2q§);
      }
      
      private function §_-C27§(param1:QuestEvent = null) : void
      {
         if(param1 == null || !param1.value || §_-81g§(§_-Z1I§))
         {
            return;
         }
         §_-o2j§(§_-Z1I§);
      }
      
      private function §_-J1z§() : void
      {
         if(§_-81g§(§_-p2J§))
         {
            return;
         }
         §_-o2j§(§_-p2J§);
      }
      
      private function §_-A1O§(param1:GameEvent = null) : void
      {
         if(§_-81g§(§_-p1r§) || §_-d2x§.§_-z2o§ < §_-53§)
         {
            return;
         }
         §_-o2j§(§_-p1r§);
      }
      
      private function §_-93I§(param1:SettingsExistsEvent = null) : void
      {
         if(param1 == null || !param1.isExists || §_-81g§(§_-H2n§))
         {
            return;
         }
         §_-o2j§(§_-H2n§);
      }
      
      private function §_-UW§(param1:SettingsExistsEvent = null) : void
      {
         if(param1 == null || !param1.isExists || §_-81g§(§_-025§))
         {
            return;
         }
         §_-o2j§(§_-025§);
      }
   }
}


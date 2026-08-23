package §_-X1k§
{
   import §_-bN§.§_-710§;
   import §_-bN§.§_-Jp§;
   import com.api.QuestEvent;
   import com.api.Services;
   import com.api.SettingsExistsEvent;
   import events.GameEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import protocol.§_-n2E§;
   
   public class §_-Q2l§
   {
      
      public static const §_-M2n§:int = 7;
      
      public static const §_-M1U§:uint = 20;
      
      public static const §_-sy§:uint = 1 << §_-31t§;
      
      public static const §_-O1w§:uint = 1 << ++§_-31t§;
      
      public static const §_-n2s§:uint = 1 << ++§_-31t§;
      
      public static const §_-Re§:uint = 1 << ++§_-31t§;
      
      public static const §_-Uc§:uint = 1 << ++§_-31t§;
      
      public static const §_-I2y§:uint = 1 << ++§_-31t§;
      
      public static const §_-gg§:uint = 1 << ++§_-31t§;
      
      public static const §_-62r§:uint = 1 << ++§_-31t§;
      
      public static const §_-pY§:Object = {
         "vk":[§_-sy§,§_-O1w§,§_-n2s§,§_-gg§,§_-Uc§],
         "fb":[§_-sy§,§_-gg§,§_-62r§],
         "sa":[§_-sy§,§_-O1w§,§_-gg§],
         "default":[§_-sy§,§_-O1w§,§_-gg§]
      };
      
      private static const §_-ao§:Object = {
         "vk":[§_-sy§,§_-Re§,§_-62r§],
         "fb":[§_-sy§,§_-O1w§,§_-n2s§,§_-Uc§,§_-Re§],
         "sa":[§_-sy§,§_-n2s§,§_-Uc§,§_-Re§,§_-62r§],
         "default":[§_-sy§,§_-n2s§,§_-Uc§,§_-Re§,§_-62r§]
      };
      
      public static const §_-U8§:Array = [§_-sy§,§_-O1w§,§_-n2s§,§_-Re§,§_-Uc§,§_-I2y§,§_-gg§,§_-62r§];
      
      private static var §_-31t§:uint = 0;
      
      private static var _instance:§_-Q2l§ = null;
      
      private var §_-G1U§:String;
      
      public function §_-Q2l§()
      {
         super();
         _instance = this;
         var _loc1_:Object = §_-uR§.loaderInfo.parameters as Object;
         if("useApiType" in _loc1_)
         {
            this.§_-G1U§ = _loc1_["useApiType"];
         }
         else if("useapitype" in _loc1_)
         {
            this.§_-G1U§ = _loc1_["useapitype"];
         }
         else
         {
            this.§_-G1U§ = §_-Zy§.§_-R1A§;
         }
      }
      
      public static function get §_-Xe§() : Boolean
      {
         return _instance.§_-G1U§ == "fb" || _instance.§_-G1U§ == "vk" || _instance.§_-G1U§ == "mm" || _instance.§_-G1U§ == "ok";
      }
      
      public static function §_-03g§() : void
      {
         Services.addEventListener(SettingsExistsEvent.LEFT_MENU,_instance.§_-n6§);
         Services.addEventListener(SettingsExistsEvent.NOTIFICATION,_instance.§_-G1D§);
         Services.listenGroup(_instance.§_-j19§);
         if(§_-A1Y§.get() == 30005 && _instance.§_-G1U§ == "fb")
         {
            _instance.§_-Gh§();
         }
         §_-LZ§.addEventListener(GameEvent.EXPERIENCE_CHANGED,_instance.§_-22l§);
         §_-r12§.§_-73x§(§_-n2E§.§_-F2s§).listen(_instance.§_-c1l§);
         _instance.§_-H2N§();
         Services.requestLeftMenu(true);
         Services.requestShared();
         _instance.§_-22l§();
      }
      
      public static function §_-J2§(param1:int) : Boolean
      {
         return (§_-r12§.§_-73x§(§_-n2E§.§_-F2s§).value & param1) == param1;
      }
      
      public static function get §_-A34§() : Boolean
      {
         return (§_-r12§.§_-73x§(§_-n2E§.§_-F2s§).value & §_-I2y§) == §_-I2y§;
      }
      
      public static function get §_-12q§() : Boolean
      {
         var _loc1_:Array = §_-Q2l§.§_-pY§[_instance.§_-G1U§] || §_-Q2l§.§_-pY§["default"];
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(!§_-J2§(_loc1_[_loc2_]))
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public static function §_-h0§(param1:int) : void
      {
         if(§_-J2§(param1))
         {
            return;
         }
         switch(param1)
         {
            case §_-n2s§:
               Services.requestLeftMenu(true);
               break;
            case §_-O1w§:
               Services.requestGroup();
               break;
            case §_-Uc§:
               Services.requestNotification(true);
         }
      }
      
      public static function §_-XZ§(param1:int) : void
      {
         switch(param1)
         {
            case §_-n2s§:
               if(_instance.§_-G1U§ == "vk")
               {
                  Services.requestLeftMenu();
               }
               break;
            case §_-O1w§:
               if(_instance.§_-G1U§ == "vk")
               {
                  navigateToURL(new URLRequest(Services.config.vk_groupAddress),"_blank");
               }
               if(_instance.§_-G1U§ == "fb")
               {
                  navigateToURL(new URLRequest(Services.config.fb_groupAddress),"_blank");
               }
               if(_instance.§_-G1U§ == "mm")
               {
                  navigateToURL(new URLRequest(Services.config.mm_groupAddress),"_blank");
               }
               if(_instance.§_-G1U§ == "ok")
               {
                  navigateToURL(new URLRequest(Services.config.ok_groupAddress),"_blank");
               }
               if(_instance.§_-G1U§ == "fs")
               {
                  navigateToURL(new URLRequest(Services.config.fs_groupAddress),"_blank");
               }
               break;
            case §_-62r§:
               _instance.§_-Gh§();
               break;
            case §_-Uc§:
               if(_instance.§_-G1U§ == "vk")
               {
                  Services.requestNotification();
               }
               break;
            case §_-Re§:
               §_-Jp§.show();
         }
      }
      
      private static function §_-Xc§(param1:int) : void
      {
         if(§_-J2§(param1))
         {
            return;
         }
         var _loc2_:§_-n2E§ = §_-r12§.§_-73x§(§_-n2E§.§_-F2s§);
         _loc2_.§_-i2T§(_loc2_.value | param1);
         if(§_-710§.§_-u21§)
         {
            §_-710§.§_-71G§(param1);
         }
      }
      
      private function §_-H2N§() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:§_-n2E§ = null;
         var _loc1_:Array = §_-Q2l§.§_-ao§[this.§_-G1U§] || §_-Q2l§.§_-ao§["default"];
         for each(_loc2_ in _loc1_)
         {
            switch(_loc2_)
            {
               case §_-n2s§:
                  this.§_-n6§(new SettingsExistsEvent(SettingsExistsEvent.LEFT_MENU,true));
                  break;
               case §_-O1w§:
                  this.§_-j19§(new QuestEvent("",true));
                  break;
               case §_-62r§:
                  this.§_-Gh§();
                  break;
               case §_-Uc§:
                  this.§_-G1D§(new SettingsExistsEvent(SettingsExistsEvent.NOTIFICATION,true));
                  break;
               case §_-Re§:
                  _loc3_ = §_-r12§.§_-73x§(§_-n2E§.§_-F2s§);
                  _loc3_.§_-i2T§(_loc3_.value | §_-Re§);
                  break;
               case §_-sy§:
                  this.§_-xi§();
            }
         }
      }
      
      private function §_-c1l§(param1:§_-n2E§) : void
      {
         if(§_-J2§(§_-Re§))
         {
            return;
         }
         if((param1.value & §_-Re§) != §_-Re§)
         {
            return;
         }
         §_-r12§.§_-73x§(§_-n2E§.§_-F2s§).forget(_instance.§_-c1l§);
         §_-Xc§(§_-Re§);
      }
      
      private function §_-xi§() : void
      {
         if(§_-J2§(§_-sy§))
         {
            return;
         }
         §_-Xc§(§_-sy§);
      }
      
      private function §_-j19§(param1:QuestEvent = null) : void
      {
         if(param1 == null || !param1.value || §_-J2§(§_-O1w§))
         {
            return;
         }
         §_-Xc§(§_-O1w§);
      }
      
      private function §_-Gh§() : void
      {
         if(§_-J2§(§_-62r§))
         {
            return;
         }
         §_-Xc§(§_-62r§);
      }
      
      private function §_-22l§(param1:GameEvent = null) : void
      {
         if(§_-J2§(§_-gg§) || §_-LZ§.§_-mA§ < §_-M2n§)
         {
            return;
         }
         §_-Xc§(§_-gg§);
      }
      
      private function §_-n6§(param1:SettingsExistsEvent = null) : void
      {
         if(param1 == null || !param1.isExists || §_-J2§(§_-n2s§))
         {
            return;
         }
         §_-Xc§(§_-n2s§);
      }
      
      private function §_-G1D§(param1:SettingsExistsEvent = null) : void
      {
         if(param1 == null || !param1.isExists || §_-J2§(§_-Uc§))
         {
            return;
         }
         §_-Xc§(§_-Uc§);
      }
   }
}


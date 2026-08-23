package
{
   import com.api.Services;
   import flash.external.ExternalInterface;
   
   public class Analytics
   {
      
      private var §_-J2d§:String;
      
      private var §_-53C§:String;
      
      public function Analytics(param1:int = 0)
      {
         super();
         this.§_-J2d§ = §_-a9§.§_-sc§ ? "UA-26927118-4" : "UA-26927118-9";
         var _loc2_:Object = §_-k2X§.loaderInfo.parameters as Object;
         if("useApiType" in _loc2_)
         {
            this.§_-53C§ = _loc2_["useApiType"];
         }
         else if("useapitype" in _loc2_)
         {
            this.§_-53C§ = _loc2_["useapitype"];
         }
         else
         {
            this.§_-53C§ = §_-a9§.§_-63Z§;
         }
         if(this.§_-53C§.toUpperCase() != "MM")
         {
            return;
         }
         this.initGA();
         if(param1 != 0)
         {
            this.setUserID(param1);
         }
         this.count("/LOGIN?" + this.§_-53C§.toUpperCase());
      }
      
      public static function §_-R2A§() : void
      {
         action("DAILY_QUEST/START/" + §_-k1Y§());
      }
      
      public static function §_-O1P§() : void
      {
         action("FULLSCREEN_SHOW/" + §_-k1Y§());
      }
      
      public static function §_-ZF§() : void
      {
         action("GAME_LOADED/" + §_-k1Y§());
      }
      
      public static function §_-u2D§(param1:int) : void
      {
         action("CLIENT_FPS/" + param1);
      }
      
      public static function §_-Tg§(param1:int) : void
      {
         action("CLIENT_FPS_AVG/" + param1);
      }
      
      public static function §_-iv§(param1:int) : void
      {
         action("CLIENT_FPS_MIN/" + param1);
      }
      
      public static function §_-21T§() : void
      {
         action("ACCELERATION_ENABLED/");
      }
      
      public static function §_-T5§(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               action("PLAYER_LOADED/" + §_-k1Y§());
               break;
            case 1:
               action("LOGIN_EXIST/" + §_-k1Y§());
               break;
            case 2:
               action("LOGIN_FAILED/" + §_-k1Y§());
               break;
            case 3:
               action("LOGIN_BLOCKED/" + §_-k1Y§());
               break;
            case 4:
               action("LOGIN_WRONG_VERSION/" + §_-k1Y§());
         }
      }
      
      private static function action(param1:String) : void
      {
         try
         {
            ExternalInterface.call("A.action",param1);
         }
         catch(e:Error)
         {
         }
      }
      
      private static function §_-k1Y§() : String
      {
         switch(Services.netType())
         {
            case §_-a9§.§_-JO§:
               return "VK";
            case §_-a9§.§_-C3f§:
               return "MM";
            case §_-a9§.§_-y1q§:
               return "OK";
            case §_-a9§.§_-kT§:
               return "FS";
            case §_-a9§.§_-f15§:
               return "FB";
            case §_-a9§.§_-3n§:
               return "SA";
            default:
               return "NULL";
         }
      }
      
      private function initGA() : void
      {
         try
         {
            ExternalInterface.call("initGA",this.§_-J2d§);
         }
         catch(e:Error)
         {
         }
      }
      
      private function setUserID(param1:int) : void
      {
         try
         {
            ExternalInterface.call("setUserID",param1);
         }
         catch(e:Error)
         {
         }
      }
      
      private function count(param1:String) : void
      {
         try
         {
            ExternalInterface.call("trackGA",param1);
         }
         catch(e:Error)
         {
         }
      }
   }
}


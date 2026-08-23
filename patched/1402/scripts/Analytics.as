package
{
   import com.api.Services;
   import flash.external.ExternalInterface;
   
   public class Analytics
   {
      
      private var §_-o20§:String;
      
      private var §_-G1U§:String;
      
      public function Analytics(param1:int = 0)
      {
         super();
         this.§_-o20§ = §_-Zy§.§_-BI§ ? "UA-26927118-4" : "UA-26927118-9";
         var _loc2_:Object = §_-uR§.loaderInfo.parameters as Object;
         if("useApiType" in _loc2_)
         {
            this.§_-G1U§ = _loc2_["useApiType"];
         }
         else if("useapitype" in _loc2_)
         {
            this.§_-G1U§ = _loc2_["useapitype"];
         }
         else
         {
            this.§_-G1U§ = §_-Zy§.§_-R1A§;
         }
         if(this.§_-G1U§.toUpperCase() != "MM")
         {
            return;
         }
         this.initGA();
         if(param1 != 0)
         {
            this.setUserID(param1);
         }
         this.count("/LOGIN?" + this.§_-G1U§.toUpperCase());
      }
      
      public static function §_-Uy§() : void
      {
         action("DAILY_QUEST/START/" + §_-Fi§());
      }
      
      public static function §_-R1R§() : void
      {
         action("FULLSCREEN_SHOW/" + §_-Fi§());
      }
      
      public static function §_-q2V§() : void
      {
         action("GAME_LOADED/" + §_-Fi§());
      }
      
      public static function §_-G18§(param1:int) : void
      {
         action("CLIENT_FPS/" + param1);
      }
      
      public static function §_-M2j§(param1:int) : void
      {
         action("CLIENT_FPS_AVG/" + param1);
      }
      
      public static function §_-fQ§(param1:int) : void
      {
         action("CLIENT_FPS_MIN/" + param1);
      }
      
      public static function §_-3o§() : void
      {
         action("ACCELERATION_ENABLED/");
      }
      
      public static function §_-v2g§(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               action("PLAYER_LOADED/" + §_-Fi§());
               break;
            case 1:
               action("LOGIN_EXIST/" + §_-Fi§());
               break;
            case 2:
               action("LOGIN_FAILED/" + §_-Fi§());
               break;
            case 3:
               action("LOGIN_BLOCKED/" + §_-Fi§());
               break;
            case 4:
               action("LOGIN_WRONG_VERSION/" + §_-Fi§());
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
      
      private static function §_-Fi§() : String
      {
         switch(Services.netType())
         {
            case §_-Zy§.§_-Q1M§:
               return "VK";
            case §_-Zy§.§_-32G§:
               return "MM";
            case §_-Zy§.§_-zE§:
               return "OK";
            case §_-Zy§.§_-S2j§:
               return "FS";
            case §_-Zy§.§_-s12§:
               return "FB";
            case §_-Zy§.§_-nn§:
               return "SA";
            default:
               return "NULL";
         }
      }
      
      private function initGA() : void
      {
         try
         {
            ExternalInterface.call("initGA",this.§_-o20§);
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


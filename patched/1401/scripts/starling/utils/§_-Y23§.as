package starling.utils
{
   import §_-kW§.§_-J1k§;
   import flash.display3D.Context3D;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.system.Capabilities;
   import flash.utils.getDefinitionByName;
   
   public class §_-Y23§
   {
      
      private static var §_-RP§:String;
      
      private static var §_-112§:String;
      
      private static var §_-T1b§:Boolean;
      
      private static var §_-G1J§:Boolean = false;
      
      private static var §_-E2H§:Boolean = true;
      
      private static var §_-q19§:Array = [];
      
      private static var §_-gN§:Boolean = true;
      
      public function §_-Y23§()
      {
         super();
         throw new §_-J1k§();
      }
      
      public static function §_-E3§() : void
      {
         var nativeAppClass:Object = null;
         var nativeApp:EventDispatcher = null;
         var appDescriptor:XML = null;
         var ns:Namespace = null;
         var ds:String = null;
         if(§_-G1J§)
         {
            return;
         }
         §_-G1J§ = true;
         §_-RP§ = Capabilities.version.substr(0,3);
         §_-112§ = Capabilities.version.substr(4);
         try
         {
            nativeAppClass = getDefinitionByName("flash.desktop::NativeApplication");
            nativeApp = nativeAppClass["nativeApplication"] as EventDispatcher;
            nativeApp.addEventListener(Event.ACTIVATE,§_-J12§,false,0,true);
            nativeApp.addEventListener(Event.DEACTIVATE,§_-u2v§,false,0,true);
            appDescriptor = nativeApp["applicationDescriptor"];
            ns = appDescriptor.namespace();
            ds = appDescriptor.ns::initialWindow.ns::depthAndStencil.toString().toLowerCase();
            §_-gN§ = ds == "true";
            §_-T1b§ = true;
         }
         catch(e:Error)
         {
            §_-T1b§ = false;
         }
      }
      
      private static function §_-J12§(param1:Object) : void
      {
         var call:Array = null;
         var event:Object = param1;
         §_-E2H§ = true;
         for each(call in §_-q19§)
         {
            try
            {
               call[0].apply(null,call[1]);
            }
            catch(e:Error)
            {
               trace("[Starling] Error in \'executeWhenApplicationIsActive\' call:",e.message);
            }
         }
         §_-q19§ = [];
      }
      
      private static function §_-u2v§(param1:Object) : void
      {
         §_-E2H§ = false;
      }
      
      public static function §_-v2S§(param1:Function, ... rest) : void
      {
         §_-E3§();
         if(§_-E2H§)
         {
            param1.apply(null,rest);
         }
         else
         {
            §_-q19§.push([param1,rest]);
         }
      }
      
      public static function get §_-N2N§() : Boolean
      {
         §_-E3§();
         return §_-E2H§;
      }
      
      public static function get §_-42q§() : Boolean
      {
         §_-E3§();
         return §_-T1b§;
      }
      
      public static function get §_-V2e§() : Boolean
      {
         §_-E3§();
         return /(WIN|MAC|LNX)/.exec(§_-RP§) != null;
      }
      
      public static function get §_-Nw§() : String
      {
         §_-E3§();
         return §_-RP§;
      }
      
      public static function get version() : String
      {
         §_-E3§();
         return §_-112§;
      }
      
      public static function get §_-sA§() : Boolean
      {
         return parseInt(/\d+/.exec(§_-112§)[0]) >= 15;
      }
      
      public static function get §_-l2t§() : Boolean
      {
         return §_-gN§;
      }
      
      public static function get supportsVideoTexture() : Boolean
      {
         return Context3D["supportsVideoTexture"];
      }
   }
}


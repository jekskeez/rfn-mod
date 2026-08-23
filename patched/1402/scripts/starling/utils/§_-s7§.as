package starling.utils
{
   import §_-625§.§_-F1v§;
   import flash.display3D.Context3D;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.system.Capabilities;
   import flash.utils.getDefinitionByName;
   
   public class §_-s7§
   {
      
      private static var §_-bk§:String;
      
      private static var §_-73H§:String;
      
      private static var §_-m2V§:Boolean;
      
      private static var §_-u1y§:Boolean = false;
      
      private static var §_-v2G§:Boolean = true;
      
      private static var §_-1A§:Array = [];
      
      private static var §_-63K§:Boolean = true;
      
      public function §_-s7§()
      {
         super();
         throw new §_-F1v§();
      }
      
      public static function §_-523§() : void
      {
         var nativeAppClass:Object = null;
         var nativeApp:EventDispatcher = null;
         var appDescriptor:XML = null;
         var ns:Namespace = null;
         var ds:String = null;
         if(§_-u1y§)
         {
            return;
         }
         §_-u1y§ = true;
         §_-bk§ = Capabilities.version.substr(0,3);
         §_-73H§ = Capabilities.version.substr(4);
         try
         {
            nativeAppClass = getDefinitionByName("flash.desktop::NativeApplication");
            nativeApp = nativeAppClass["nativeApplication"] as EventDispatcher;
            nativeApp.addEventListener(Event.ACTIVATE,§_-U2J§,false,0,true);
            nativeApp.addEventListener(Event.DEACTIVATE,§_-z25§,false,0,true);
            appDescriptor = nativeApp["applicationDescriptor"];
            ns = appDescriptor.namespace();
            ds = appDescriptor.ns::initialWindow.ns::depthAndStencil.toString().toLowerCase();
            §_-63K§ = ds == "true";
            §_-m2V§ = true;
         }
         catch(e:Error)
         {
            §_-m2V§ = false;
         }
      }
      
      private static function §_-U2J§(param1:Object) : void
      {
         var call:Array = null;
         var event:Object = param1;
         §_-v2G§ = true;
         for each(call in §_-1A§)
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
         §_-1A§ = [];
      }
      
      private static function §_-z25§(param1:Object) : void
      {
         §_-v2G§ = false;
      }
      
      public static function §_-s1z§(param1:Function, ... rest) : void
      {
         §_-523§();
         if(§_-v2G§)
         {
            param1.apply(null,rest);
         }
         else
         {
            §_-1A§.push([param1,rest]);
         }
      }
      
      public static function get §_-K1u§() : Boolean
      {
         §_-523§();
         return §_-v2G§;
      }
      
      public static function get §_-G1c§() : Boolean
      {
         §_-523§();
         return §_-m2V§;
      }
      
      public static function get §_-o1d§() : Boolean
      {
         §_-523§();
         return /(WIN|MAC|LNX)/.exec(§_-bk§) != null;
      }
      
      public static function get §_-Z2d§() : String
      {
         §_-523§();
         return §_-bk§;
      }
      
      public static function get version() : String
      {
         §_-523§();
         return §_-73H§;
      }
      
      public static function get §_-2Y§() : Boolean
      {
         return parseInt(/\d+/.exec(§_-73H§)[0]) >= 15;
      }
      
      public static function get §_-Q1H§() : Boolean
      {
         return §_-63K§;
      }
      
      public static function get supportsVideoTexture() : Boolean
      {
         return Context3D["supportsVideoTexture"];
      }
   }
}


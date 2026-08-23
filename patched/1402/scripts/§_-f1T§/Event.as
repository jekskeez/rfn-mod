package §_-f1T§
{
   import flash.utils.getQualifiedClassName;
   import starling.core.starling_internal;
   import starling.utils.formatString;
   
   use namespace starling_internal;
   
   public class Event
   {
      
      public static const ADDED:String = "added";
      
      public static const ADDED_TO_STAGE:String = "addedToStage";
      
      public static const ENTER_FRAME:String = "enterFrame";
      
      public static const REMOVED:String = "removed";
      
      public static const REMOVED_FROM_STAGE:String = "removedFromStage";
      
      public static const §_-v1C§:String = "triggered";
      
      public static const §_-g2f§:String = "flatten";
      
      public static const RESIZE:String = "resize";
      
      public static const COMPLETE:String = "complete";
      
      public static const CONTEXT3D_CREATE:String = "context3DCreate";
      
      public static const RENDER:String = "render";
      
      public static const §_-mK§:String = "rootCreated";
      
      public static const §_-a2X§:String = "removeFromJuggler";
      
      public static const §_-3j§:String = "texturesRestored";
      
      public static const IO_ERROR:String = "ioError";
      
      public static const SECURITY_ERROR:String = "securityError";
      
      public static const §_-IX§:String = "parseError";
      
      public static const §_-NW§:String = "fatalError";
      
      public static const CHANGE:String = "change";
      
      public static const CANCEL:String = "cancel";
      
      public static const SCROLL:String = "scroll";
      
      public static const OPEN:String = "open";
      
      public static const CLOSE:String = "close";
      
      public static const SELECT:String = "select";
      
      public static const §_-C2o§:String = "ready";
      
      private static var §_-V1X§:Vector.<Event> = new Vector.<Event>(0);
      
      private var §_-t1s§:EventDispatcher;
      
      private var §_-sw§:EventDispatcher;
      
      private var §_-a10§:String;
      
      private var §_-P2B§:Boolean;
      
      private var §_-g1B§:Boolean;
      
      private var §_-91j§:Boolean;
      
      private var §_-g1t§:Object;
      
      public function Event(param1:String, param2:Boolean = false, param3:Object = null)
      {
         super();
         this.§_-a10§ = param1;
         this.§_-P2B§ = param2;
         this.§_-g1t§ = param3;
      }
      
      starling_internal static function §_-11t§(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         if(§_-V1X§.length)
         {
            return §_-V1X§.pop().reset(param1,param2,param3);
         }
         return new Event(param1,param2,param3);
      }
      
      starling_internal static function §_-b3§(param1:Event) : void
      {
         param1.§_-g1t§ = param1.§_-t1s§ = param1.§_-sw§ = null;
         §_-V1X§[§_-V1X§.length] = param1;
      }
      
      public function stopPropagation() : void
      {
         this.§_-g1B§ = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.§_-g1B§ = this.§_-91j§ = true;
      }
      
      public function toString() : String
      {
         return formatString("[{0} type=\"{1}\" bubbles={2}]",getQualifiedClassName(this).split("::").pop(),this.§_-a10§,this.§_-P2B§);
      }
      
      public function get bubbles() : Boolean
      {
         return this.§_-P2B§;
      }
      
      public function get target() : EventDispatcher
      {
         return this.§_-t1s§;
      }
      
      public function get currentTarget() : EventDispatcher
      {
         return this.§_-sw§;
      }
      
      public function get type() : String
      {
         return this.§_-a10§;
      }
      
      public function get data() : Object
      {
         return this.§_-g1t§;
      }
      
      internal function §_-d1F§(param1:EventDispatcher) : void
      {
         this.§_-t1s§ = param1;
      }
      
      internal function §_-V18§(param1:EventDispatcher) : void
      {
         this.§_-sw§ = param1;
      }
      
      internal function setData(param1:Object) : void
      {
         this.§_-g1t§ = param1;
      }
      
      internal function get §_-B22§() : Boolean
      {
         return this.§_-g1B§;
      }
      
      internal function get §_-So§() : Boolean
      {
         return this.§_-91j§;
      }
      
      starling_internal function reset(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         this.§_-a10§ = param1;
         this.§_-P2B§ = param2;
         this.§_-g1t§ = param3;
         this.§_-t1s§ = this.§_-sw§ = null;
         this.§_-g1B§ = this.§_-91j§ = false;
         return this;
      }
   }
}


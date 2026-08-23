package §_-K2c§
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
      
      public static const §_-cp§:String = "triggered";
      
      public static const §_-b2W§:String = "flatten";
      
      public static const RESIZE:String = "resize";
      
      public static const COMPLETE:String = "complete";
      
      public static const CONTEXT3D_CREATE:String = "context3DCreate";
      
      public static const RENDER:String = "render";
      
      public static const §_-q3§:String = "rootCreated";
      
      public static const §_-P2F§:String = "removeFromJuggler";
      
      public static const §_-p17§:String = "texturesRestored";
      
      public static const IO_ERROR:String = "ioError";
      
      public static const SECURITY_ERROR:String = "securityError";
      
      public static const §_-W19§:String = "parseError";
      
      public static const §_-D1K§:String = "fatalError";
      
      public static const CHANGE:String = "change";
      
      public static const CANCEL:String = "cancel";
      
      public static const SCROLL:String = "scroll";
      
      public static const OPEN:String = "open";
      
      public static const CLOSE:String = "close";
      
      public static const SELECT:String = "select";
      
      public static const §_-22d§:String = "ready";
      
      private static var §_-MU§:Vector.<Event> = new Vector.<Event>(0);
      
      private var §_-e2X§:EventDispatcher;
      
      private var §_-62O§:EventDispatcher;
      
      private var §_-D12§:String;
      
      private var §_-E29§:Boolean;
      
      private var §_-so§:Boolean;
      
      private var §_-c22§:Boolean;
      
      private var §_-53H§:Object;
      
      public function Event(param1:String, param2:Boolean = false, param3:Object = null)
      {
         super();
         this.§_-D12§ = param1;
         this.§_-E29§ = param2;
         this.§_-53H§ = param3;
      }
      
      starling_internal static function §_-11x§(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         if(§_-MU§.length)
         {
            return §_-MU§.pop().reset(param1,param2,param3);
         }
         return new Event(param1,param2,param3);
      }
      
      starling_internal static function §_-3h§(param1:Event) : void
      {
         param1.§_-53H§ = param1.§_-e2X§ = param1.§_-62O§ = null;
         §_-MU§[§_-MU§.length] = param1;
      }
      
      public function stopPropagation() : void
      {
         this.§_-so§ = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.§_-so§ = this.§_-c22§ = true;
      }
      
      public function toString() : String
      {
         return formatString("[{0} type=\"{1}\" bubbles={2}]",getQualifiedClassName(this).split("::").pop(),this.§_-D12§,this.§_-E29§);
      }
      
      public function get bubbles() : Boolean
      {
         return this.§_-E29§;
      }
      
      public function get target() : EventDispatcher
      {
         return this.§_-e2X§;
      }
      
      public function get currentTarget() : EventDispatcher
      {
         return this.§_-62O§;
      }
      
      public function get type() : String
      {
         return this.§_-D12§;
      }
      
      public function get data() : Object
      {
         return this.§_-53H§;
      }
      
      internal function §_-F5§(param1:EventDispatcher) : void
      {
         this.§_-e2X§ = param1;
      }
      
      internal function §_-91E§(param1:EventDispatcher) : void
      {
         this.§_-62O§ = param1;
      }
      
      internal function setData(param1:Object) : void
      {
         this.§_-53H§ = param1;
      }
      
      internal function get §_-N13§() : Boolean
      {
         return this.§_-so§;
      }
      
      internal function get §_-w1b§() : Boolean
      {
         return this.§_-c22§;
      }
      
      starling_internal function reset(param1:String, param2:Boolean = false, param3:Object = null) : Event
      {
         this.§_-D12§ = param1;
         this.§_-E29§ = param2;
         this.§_-53H§ = param3;
         this.§_-e2X§ = this.§_-62O§ = null;
         this.§_-so§ = this.§_-c22§ = false;
         return this;
      }
   }
}


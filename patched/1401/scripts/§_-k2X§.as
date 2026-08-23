package
{
   import §_-68§.§_-j2J§;
   import §_-68§.§_-p22§;
   import fl.containers.ScrollPane;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.UncaughtErrorEvent;
   import flash.external.ExternalInterface;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.text.Font;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import utils.§_-2Y§;
   
   public class §_-k2X§ extends MovieClip
   {
      
      private static const §_-tf§:int = 0;
      
      public static var §_-J2e§:Object;
      
      private static const §_-v15§:Array = [0,2002,666].concat([3694,3692,3691,3675,3672]);
      
      private static const §_-43G§:Array = [754];
      
      private static var _instance:§_-k2X§ = null;
      
      private static var §_-y2S§:Boolean = false;
      
      private var §_-k1t§:§_-p22§;
      
      private var game:LoaderInfo;
      
      private var §_-ZF§:Boolean = false;
      
      private var §_-NC§:int = 0;
      
      private var §_-n11§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      private var §_-72a§:MovieClip = null;
      
      private var imageBar:Sprite = null;
      
      private var §_-s8§:§_-22V§ = null;
      
      private var §_-lN§:§_-22V§ = null;
      
      private var §_-022§:TextField;
      
      private var §_-EQ§:ScrollPane;
      
      private var §_-T8§:Sprite;
      
      private var §_-D29§:Boolean = false;
      
      private var §_-E1u§:Sprite = null;
      
      public function §_-k2X§()
      {
         this.§_-022§ = new TextField();
         this.§_-EQ§ = new ScrollPane();
         this.§_-T8§ = new Sprite();
         _instance = this;
         §_-TQ§.add("Running client version " + §_-a9§.§_-Ti§ + "." + §_-a9§.§_-zD§);
         super();
         stop();
         if("useLocale" in loaderInfo.parameters)
         {
            §_-a9§.§_-L2p§ = loaderInfo.parameters["useLocale"];
         }
         if("config" in loaderInfo.parameters)
         {
            §_-a9§.§_-CC§ = loaderInfo.parameters["config"];
         }
         if("protocol" in loaderInfo.parameters)
         {
            §_-a9§.§_-N2q§ = loaderInfo.parameters["protocol"];
         }
         try
         {
            §_-k2X§.§_-U26§(this);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Can\'t set context menu: " + e);
         }
         this.loaderInfo.addEventListener(Event.INIT,this.init);
      }
      
      public static function get loaderInfo() : LoaderInfo
      {
         return _instance.loaderInfo;
      }
      
      public static function get §_-P21§() : Boolean
      {
         return _instance.parent != null;
      }
      
      public static function hide() : void
      {
         if(_instance.parent == null)
         {
            return;
         }
         if(_instance.stage)
         {
            _instance.stage.removeEventListener(Event.RESIZE,_instance.onStageResize);
         }
         _instance.parent.removeChild(_instance);
         if(_instance.§_-n11§ != null)
         {
            _instance.removeChild(_instance.§_-n11§);
            _instance.§_-n11§ = null;
         }
         if(_instance.§_-rm§ != null && _instance.contains(_instance.§_-rm§))
         {
            _instance.removeChild(_instance.§_-rm§);
            _instance.§_-rm§ = null;
         }
      }
      
      public static function setStatus(param1:String) : void
      {
         _instance.setStatus(param1);
      }
      
      public static function showDebug(param1:Boolean = false) : void
      {
         if(!§_-y2S§ && !param1)
         {
            return;
         }
         §_-y2S§ = true;
         _instance.showDebug();
      }
      
      public static function §_-U26§(param1:DisplayObjectContainer) : void
      {
         var _loc2_:ContextMenuItem = new ContextMenuItem(§_-j2J§.gls("Трагедия белок!"),false,false);
         var _loc3_:ContextMenuItem = new ContextMenuItem(§_-j2J§.gls("Версия {0}.{1}",§_-a9§.§_-Ti§,§_-a9§.§_-zD§),false,false);
         var _loc4_:ContextMenu = new ContextMenu();
         _loc4_.hideBuiltInItems();
         _loc4_.customItems.push(_loc2_,_loc3_);
         param1.contextMenu = _loc4_;
      }
      
      public static function §_-fm§(param1:Error) : void
      {
         _instance.§_-313§(new UncaughtErrorEvent(UncaughtErrorEvent.UNCAUGHT_ERROR,true,true,param1));
      }
      
      public static function §_-81z§() : DisplayObject
      {
         return §_-a9§.§_-sc§ ? new ImageLogoRu_default() : new ImageLogoEn_default();
      }
      
      private static function §_-ta§() : MovieClip
      {
         return §_-a9§.§_-sc§ ? new ImagePreloaderBackRu_default() : new ImagePreloaderBackEn_default();
      }
      
      private static function §_-X1T§() : MovieClip
      {
         return new PreLoaderBackGround_default();
      }
      
      public static function §_-335§() : void
      {
         if(Boolean(_instance) && Boolean(_instance.stage))
         {
            _instance.stage.removeEventListener(Event.RESIZE,_instance.onStageResize);
         }
      }
      
      private function §_-f1h§() : void
      {
         var script:String;
         if(!ExternalInterface.available)
         {
            return;
         }
         script = "(function(){function strip(){try{var root=document.getElementById(\"flash-app\");if(root){var tn=String(root.tagName||\"\").toLowerCase();" + "if(tn===\"embed\"){root.removeAttribute(\"flashvars\");}else if(tn===\"object\"){var op=root.getElementsByTagName(\"param\"),oi;" + "for(oi=0;oi<op.length;oi++){if(String(op[oi].getAttribute(\"name\")||\"\").toLowerCase()===\"flashvars\")op[oi].setAttribute(\"value\",\"\");}}" + "else{var objs=root.getElementsByTagName(\"object\"),j,p,i,emb;for(j=0;j<objs.length;j++){p=objs[j].getElementsByTagName(\"param\");for(i=0;i<p.length;i++){if(String(p[i].getAttribute(\"name\")||\"\").toLowerCase()===\"flashvars\")p[i].setAttribute(\"value\",\"\");}}" + "emb=root.getElementsByTagName(\"embed\");for(j=0;j<emb.length;j++){emb[j].removeAttribute(\"flashvars\");}}}}catch(e){}}" + "function wipe(){try{if(window.history&&window.history.replaceState){var l=window.location;window.history.replaceState(null,document.title,l.protocol+\"//\"+l.host+l.pathname+(l.hash||\"\"));}}catch(e){}}" + "strip();" + "try{if(window.mailru&&mailru.loader&&mailru.loader.require){mailru.loader.require(\"api\",function(){if(!mailru.app||!mailru.app.init){wipe();return;}" + "var orig=mailru.app.init;mailru.app.init=function(){var result=orig.apply(this,arguments);wipe();return result;};});}else{wipe();}}catch(e){wipe();}})();";
         try
         {
            ExternalInterface.call("eval",script);
         }
         catch(err:Error)
         {
            §_-TQ§.add("cleanFlashVars: " + err.message);
         }
      }
      
      private function init(param1:Event) : void
      {
         var sprite:Sprite;
         var e:Event = param1;
         this.loaderInfo.removeEventListener(Event.INIT,this.init);
         if(!this.stage)
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
            return;
         }
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         §_-b1M§.§_-a2h§();
         this.§_-f1h§();
         this.stage.scaleMode = StageScaleMode.NO_SCALE;
         this.stage.stageFocusRect = false;
         this.stage.tabChildren = false;
         this.stage.showDefaultContextMenu = false;
         this.stage.color = 23728;
         §_-2Y§.load(§_-a9§.§_-CC§ + "?" + Math.random(),false,null,this.§_-a0§,function(param1:Event):void
         {
            §_-TQ§.add("Can\'t load config from " + §_-a9§.§_-CC§);
         });
         this.§_-n11§ = §_-X1T§();
         addChild(this.§_-n11§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         this.§_-72a§ = §_-ta§();
         this.§_-72a§.x = (§_-a9§.§_-9o§ - this.§_-72a§.width) * 0.5;
         this.§_-72a§.y = 60;
         this.§_-rm§.addChild(this.§_-72a§);
         this.imageBar = this.§_-72a§["imageBar"];
         Font.registerFont(FontRoboto);
         Font.registerFont(FontRobotoBold);
         Font.registerFont(§_-2K§);
         sprite = new Sprite();
         sprite.graphics.beginFill(0,0.25);
         sprite.graphics.drawRoundRectComplex(40,565,820,55,10,10,0,0);
         this.§_-rm§.addChild(sprite);
         this.§_-s8§ = new §_-22V§("",0,586,new TextFormat(§_-22V§.§_-pJ§,20,16777215,null,null,null,null,null,"center"));
         this.§_-s8§.filters = [new DropShadowFilter()];
         this.setStatus(§_-j2J§.gls("Выполняется загрузка приложения"),false);
         this.§_-rm§.addChild(this.§_-s8§);
         this.§_-T8§.graphics.beginFill(16777215);
         this.§_-T8§.graphics.drawRect(0,0,870,500);
         this.§_-T8§.visible = false;
         this.§_-022§.width = 250;
         this.§_-022§.multiline = true;
         this.§_-022§.wordWrap = false;
         this.§_-022§.mouseWheelEnabled = false;
         this.§_-022§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-022§.embedFonts = true;
         this.§_-022§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,12);
         this.§_-T8§.addChild(this.§_-022§);
         this.§_-EQ§.x = 15;
         this.§_-EQ§.y = 15;
         this.§_-EQ§.setSize(870,500);
         this.§_-EQ§.source = this.§_-T8§;
         this.§_-EQ§.visible = false;
         addChild(this.§_-EQ§);
         this.§_-lN§ = new §_-22V§("",this.imageBar.x,this.imageBar.y - 14,new TextFormat(§_-22V§.§_-F2z§,20,4723237,true,null,null,null,null,"center"),this.imageBar.width);
         this.§_-lN§.filters = [new GlowFilter(16760432,1,2,2)];
         this.§_-72a§.addChild(this.§_-lN§);
         this.§_-E1u§ = new Sprite();
         this.§_-E1u§.graphics.beginFill(0,1);
         this.§_-E1u§.graphics.drawRect(0,-this.imageBar.height * 0.5,this.imageBar.width,this.imageBar.height);
         this.§_-E1u§.x = -this.imageBar.width;
         this.imageBar.mask = this.§_-E1u§;
         this.imageBar.addChild(this.§_-E1u§);
         §_-a9§.§_-O1z§ = "mobile" in this.loaderInfo.parameters;
         this.stage.addEventListener(Event.RESIZE,this.onStageResize);
         this.onStageResize();
      }
      
      private function onStageResize(param1:Event = null) : void
      {
         if(!this.stage || !this.§_-n11§ || !this.§_-rm§)
         {
            return;
         }
         var _loc2_:Number = this.stage.stageWidth;
         var _loc3_:Number = this.stage.stageHeight;
         this.§_-n11§.scaleX = this.§_-n11§.scaleY = 1;
         var _loc4_:Number = _loc2_ / §_-a9§.§_-9o§;
         this.§_-n11§.scaleX = this.§_-n11§.scaleY = _loc4_;
         this.§_-n11§.x = (_loc2_ - §_-a9§.§_-9o§ * _loc4_) * 0.5;
         this.§_-n11§.y = (_loc3_ - §_-a9§.§_-31m§ * _loc4_) * 0.5;
         var _loc5_:Number = Math.min(_loc4_,_loc3_ / §_-a9§.§_-31m§);
         this.§_-rm§.scaleX = this.§_-rm§.scaleY = _loc5_;
         this.§_-rm§.x = (_loc2_ - §_-a9§.§_-9o§ * _loc5_) * 0.5;
         this.§_-rm§.y = (_loc3_ - §_-a9§.§_-31m§ * _loc5_) * 0.5;
      }
      
      private function §_-a0§(param1:Event) : void
      {
         §_-a9§.load(JSON.parse(param1.currentTarget.data));
         §_-k2X§.§_-J2e§ = this.loaderInfo.parameters as Object;
         this.§_-k1t§ = new §_-p22§();
         this.§_-k1t§.addEventListener(ProgressEvent.PROGRESS,this.§_-32q§);
         this.§_-k1t§.§_-F1Z§();
         this.game = this.loaderInfo;
         this.game.addEventListener(ProgressEvent.PROGRESS,this.§_-32q§);
         this.game.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.game.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.game.addEventListener(Event.COMPLETE,this.§_-c2D§);
         this.§_-ZF§ = this.game.bytesLoaded == this.game.bytesTotal;
         this.stage.addEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
      }
      
      private function onError(param1:Event) : void
      {
      }
      
      private function setStatus(param1:String, param2:Boolean = true) : void
      {
         if(param2)
         {
         }
         this.§_-s8§.text = param1;
         this.§_-s8§.x = int((§_-a9§.§_-9o§ - this.§_-s8§.textWidth) * 0.5);
         this.§_-s8§.y = 590 - int(this.§_-s8§.textHeight * 0.5);
      }
      
      private function showDebug() : void
      {
         this.§_-022§.text = §_-TQ§.§_-l5§(500);
         this.§_-022§.height = this.§_-022§.textHeight + 20;
         this.§_-T8§.visible = true;
         this.§_-EQ§.visible = true;
         this.§_-EQ§.update();
      }
      
      private function §_-32q§(param1:ProgressEvent) : void
      {
         var _loc2_:Number = this.game.bytesLoaded + this.§_-k1t§.§_-z28§;
         var _loc3_:Number = this.game.bytesTotal + this.§_-k1t§.§_-d2l§;
         if(_loc3_ == 0)
         {
            return;
         }
         this.§_-at§(_loc2_ / _loc3_);
      }
      
      private function §_-at§(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         this.§_-lN§.text = int(param1 * 100).toString() + "%";
         this.§_-E1u§.x = int((param1 - 1) * this.§_-E1u§.width);
      }
      
      private function §_-c2D§(param1:Event) : void
      {
         this.game.removeEventListener(ProgressEvent.PROGRESS,this.§_-32q§);
         this.game.removeEventListener(Event.COMPLETE,this.§_-c2D§);
         this.§_-ZF§ = true;
      }
      
      private function §_-L1Y§(param1:Event) : void
      {
         if(Boolean(this.§_-k1t§) && Boolean(this.§_-k1t§.loaded) && !this.§_-D29§)
         {
            this.§_-D29§ = true;
            play();
            return;
         }
         if(!this.§_-ZF§ || !this.§_-D29§)
         {
            return;
         }
         if(this.game.uncaughtErrorEvents)
         {
            this.game.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.§_-313§);
         }
         stop();
         this.§_-at§(1);
         var _loc2_:Class = this.game.applicationDomain.getDefinition("Main") as Class;
         this.stage.removeEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
         this.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         this.stage.addChild(new _loc2_());
      }
      
      private function §_-313§(param1:UncaughtErrorEvent) : void
      {
         var skipError:int = 0;
         var message:String = null;
         var gameClass:Class = null;
         var variables:URLVariables = null;
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var e:UncaughtErrorEvent = param1;
         e.preventDefault();
         if(!e.error.getStackTrace() && e.errorID != 999)
         {
            return;
         }
         for each(skipError in §_-v15§)
         {
            if(e.error.errorID == skipError)
            {
               return;
            }
         }
         message = e + "\n" + e.error + "\n" + e.error.getStackTrace();
         §_-TQ§.add(message);
         if(§_-43G§.indexOf(e.error.errorID) == -1)
         {
            return;
         }
         try
         {
            gameClass = loaderInfo.applicationDomain.getDefinition("Game") as Class;
            ++this.§_-NC§;
            variables = new URLVariables();
            variables["errno"] = -(e.error.errorID * 10000 + §_-a9§.§_-zD§);
            variables["uid"] = gameClass.selfId;
            variables["version"] = §_-a9§.§_-zD§;
            variables["message"] = §_-TQ§.§_-l5§();
            request = new URLRequest();
            request.url = §_-a9§.§_-e2c§;
            request.method = URLRequestMethod.POST;
            request.data = variables;
            loader = new URLLoader();
            loader.load(request);
         }
         catch(error:Error)
         {
         }
         finally
         {
            if(this.§_-NC§ > §_-k2X§.§_-tf§)
            {
               this.game.uncaughtErrorEvents.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.§_-313§);
            }
         }
      }
   }
}


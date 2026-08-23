package
{
   import §_-s2e§.§_-13B§;
   import §_-s2e§.§_-IM§;
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
   import utils.§_-fE§;
   
   public class §_-uR§ extends MovieClip
   {
      
      private static const §_-21y§:int = 0;
      
      public static var §_-p2P§:Object;
      
      private static const §_-vh§:Array = [0,2002,666].concat([3694,3692,3691,3675,3672]);
      
      private static const §_-pg§:Array = [754];
      
      private static var _instance:§_-uR§ = null;
      
      private static var §_-L2j§:Boolean = false;
      
      private var §_-B1I§:§_-IM§;
      
      private var game:LoaderInfo;
      
      private var §_-q2V§:Boolean = false;
      
      private var §_-wu§:int = 0;
      
      private var §_-22B§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      private var §_-tI§:MovieClip = null;
      
      private var imageBar:Sprite = null;
      
      private var §_-7n§:§_-i5§ = null;
      
      private var §_-33K§:§_-i5§ = null;
      
      private var §_-q2F§:TextField;
      
      private var §_-Qb§:ScrollPane;
      
      private var §_-dd§:Sprite;
      
      private var §_-ba§:Boolean = false;
      
      private var §_-p2A§:Sprite = null;
      
      public function §_-uR§()
      {
         this.§_-q2F§ = new TextField();
         this.§_-Qb§ = new ScrollPane();
         this.§_-dd§ = new Sprite();
         _instance = this;
         §_-p2U§.add("Running client version " + §_-Zy§.§_-p1q§ + "." + §_-Zy§.§_-Z2H§);
         super();
         stop();
         if("useLocale" in loaderInfo.parameters)
         {
            §_-Zy§.§_-73r§ = loaderInfo.parameters["useLocale"];
         }
         if("config" in loaderInfo.parameters)
         {
            §_-Zy§.§_-S2U§ = loaderInfo.parameters["config"];
         }
         if("protocol" in loaderInfo.parameters)
         {
            §_-Zy§.§_-BO§ = loaderInfo.parameters["protocol"];
         }
         try
         {
            §_-uR§.§_-h1A§(this);
         }
         catch(e:Error)
         {
            §_-p2U§.add("Can\'t set context menu: " + e);
         }
         this.loaderInfo.addEventListener(Event.INIT,this.init);
      }
      
      public static function get loaderInfo() : LoaderInfo
      {
         return _instance.loaderInfo;
      }
      
      public static function get §_-41k§() : Boolean
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
         if(_instance.§_-22B§ != null)
         {
            _instance.removeChild(_instance.§_-22B§);
            _instance.§_-22B§ = null;
         }
         if(_instance.§_-03N§ != null && _instance.contains(_instance.§_-03N§))
         {
            _instance.removeChild(_instance.§_-03N§);
            _instance.§_-03N§ = null;
         }
      }
      
      public static function setStatus(param1:String) : void
      {
         _instance.setStatus(param1);
      }
      
      public static function showDebug(param1:Boolean = false) : void
      {
         if(!§_-L2j§ && !param1)
         {
            return;
         }
         §_-L2j§ = true;
         _instance.showDebug();
      }
      
      public static function §_-h1A§(param1:DisplayObjectContainer) : void
      {
         var _loc2_:ContextMenuItem = new ContextMenuItem(§_-13B§.gls("Трагедия белок!"),false,false);
         var _loc3_:ContextMenuItem = new ContextMenuItem(§_-13B§.gls("Версия {0}.{1}",§_-Zy§.§_-p1q§,§_-Zy§.§_-Z2H§),false,false);
         var _loc4_:ContextMenu = new ContextMenu();
         _loc4_.hideBuiltInItems();
         _loc4_.customItems.push(_loc2_,_loc3_);
         param1.contextMenu = _loc4_;
      }
      
      public static function §_-P1h§(param1:Error) : void
      {
         _instance.§_-31§(new UncaughtErrorEvent(UncaughtErrorEvent.UNCAUGHT_ERROR,true,true,param1));
      }
      
      public static function §_-t2O§() : DisplayObject
      {
         return §_-Zy§.§_-BI§ ? new ImageLogoRu_default() : new ImageLogoEn_default();
      }
      
      private static function §_-i2t§() : MovieClip
      {
         return §_-Zy§.§_-BI§ ? new ImagePreloaderBackRu_default() : new ImagePreloaderBackEn_default();
      }
      
      private static function §_-81t§() : MovieClip
      {
         return new PreLoaderBackGround_default();
      }
      
      public static function §_-E2k§() : void
      {
         if(Boolean(_instance) && Boolean(_instance.stage))
         {
            _instance.stage.removeEventListener(Event.RESIZE,_instance.onStageResize);
         }
      }
      
      private function §_-J2G§() : void
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
            §_-p2U§.add("cleanFlashVars: " + err.message);
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
         §_-Vt§.§_-T1z§();
         this.§_-J2G§();
         this.stage.scaleMode = StageScaleMode.NO_SCALE;
         this.stage.stageFocusRect = false;
         this.stage.tabChildren = false;
         this.stage.showDefaultContextMenu = false;
         this.stage.color = 23728;
         §_-fE§.load(§_-Zy§.§_-S2U§ + "?" + Math.random(),false,null,this.§_-FT§,function(param1:Event):void
         {
            §_-p2U§.add("Can\'t load config from " + §_-Zy§.§_-S2U§);
         });
         this.§_-22B§ = §_-81t§();
         addChild(this.§_-22B§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         this.§_-tI§ = §_-i2t§();
         this.§_-tI§.x = (§_-Zy§.§_-21V§ - this.§_-tI§.width) * 0.5;
         this.§_-tI§.y = 60;
         this.§_-03N§.addChild(this.§_-tI§);
         this.imageBar = this.§_-tI§["imageBar"];
         Font.registerFont(FontRoboto);
         Font.registerFont(FontRobotoBold);
         Font.registerFont(§_-71V§);
         sprite = new Sprite();
         sprite.graphics.beginFill(0,0.25);
         sprite.graphics.drawRoundRectComplex(40,565,820,55,10,10,0,0);
         this.§_-03N§.addChild(sprite);
         this.§_-7n§ = new §_-i5§("",0,586,new TextFormat(§_-i5§.§_-p1s§,20,16777215,null,null,null,null,null,"center"));
         this.§_-7n§.filters = [new DropShadowFilter()];
         this.setStatus(§_-13B§.gls("Выполняется загрузка приложения"),false);
         this.§_-03N§.addChild(this.§_-7n§);
         this.§_-dd§.graphics.beginFill(16777215);
         this.§_-dd§.graphics.drawRect(0,0,870,500);
         this.§_-dd§.visible = false;
         this.§_-q2F§.width = 250;
         this.§_-q2F§.multiline = true;
         this.§_-q2F§.wordWrap = false;
         this.§_-q2F§.mouseWheelEnabled = false;
         this.§_-q2F§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-q2F§.embedFonts = true;
         this.§_-q2F§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,12);
         this.§_-dd§.addChild(this.§_-q2F§);
         this.§_-Qb§.x = 15;
         this.§_-Qb§.y = 15;
         this.§_-Qb§.setSize(870,500);
         this.§_-Qb§.source = this.§_-dd§;
         this.§_-Qb§.visible = false;
         addChild(this.§_-Qb§);
         this.§_-33K§ = new §_-i5§("",this.imageBar.x,this.imageBar.y - 14,new TextFormat(§_-i5§.§_-c10§,20,4723237,true,null,null,null,null,"center"),this.imageBar.width);
         this.§_-33K§.filters = [new GlowFilter(16760432,1,2,2)];
         this.§_-tI§.addChild(this.§_-33K§);
         this.§_-p2A§ = new Sprite();
         this.§_-p2A§.graphics.beginFill(0,1);
         this.§_-p2A§.graphics.drawRect(0,-this.imageBar.height * 0.5,this.imageBar.width,this.imageBar.height);
         this.§_-p2A§.x = -this.imageBar.width;
         this.imageBar.mask = this.§_-p2A§;
         this.imageBar.addChild(this.§_-p2A§);
         §_-Zy§.§_-e2k§ = "mobile" in this.loaderInfo.parameters;
         this.stage.addEventListener(Event.RESIZE,this.onStageResize);
         this.onStageResize();
      }
      
      private function onStageResize(param1:Event = null) : void
      {
         if(!this.stage || !this.§_-22B§ || !this.§_-03N§)
         {
            return;
         }
         var _loc2_:Number = this.stage.stageWidth;
         var _loc3_:Number = this.stage.stageHeight;
         this.§_-22B§.scaleX = this.§_-22B§.scaleY = 1;
         var _loc4_:Number = _loc2_ / §_-Zy§.§_-21V§;
         this.§_-22B§.scaleX = this.§_-22B§.scaleY = _loc4_;
         this.§_-22B§.x = (_loc2_ - §_-Zy§.§_-21V§ * _loc4_) * 0.5;
         this.§_-22B§.y = (_loc3_ - §_-Zy§.§_-02T§ * _loc4_) * 0.5;
         var _loc5_:Number = Math.min(_loc4_,_loc3_ / §_-Zy§.§_-02T§);
         this.§_-03N§.scaleX = this.§_-03N§.scaleY = _loc5_;
         this.§_-03N§.x = (_loc2_ - §_-Zy§.§_-21V§ * _loc5_) * 0.5;
         this.§_-03N§.y = (_loc3_ - §_-Zy§.§_-02T§ * _loc5_) * 0.5;
      }
      
      private function §_-FT§(param1:Event) : void
      {
         §_-Zy§.load(JSON.parse(param1.currentTarget.data));
         §_-uR§.§_-p2P§ = this.loaderInfo.parameters as Object;
         this.§_-B1I§ = new §_-IM§();
         this.§_-B1I§.addEventListener(ProgressEvent.PROGRESS,this.§_-V24§);
         this.§_-B1I§.§_-M17§();
         this.game = this.loaderInfo;
         this.game.addEventListener(ProgressEvent.PROGRESS,this.§_-V24§);
         this.game.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.game.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.game.addEventListener(Event.COMPLETE,this.§_-m2J§);
         this.§_-q2V§ = this.game.bytesLoaded == this.game.bytesTotal;
         this.stage.addEventListener(Event.ENTER_FRAME,this.§_-A1X§);
      }
      
      private function onError(param1:Event) : void
      {
      }
      
      private function setStatus(param1:String, param2:Boolean = true) : void
      {
         if(param2)
         {
         }
         this.§_-7n§.text = param1;
         this.§_-7n§.x = int((§_-Zy§.§_-21V§ - this.§_-7n§.textWidth) * 0.5);
         this.§_-7n§.y = 590 - int(this.§_-7n§.textHeight * 0.5);
      }
      
      private function showDebug() : void
      {
         this.§_-q2F§.text = §_-p2U§.§_-93a§(500);
         this.§_-q2F§.height = this.§_-q2F§.textHeight + 20;
         this.§_-dd§.visible = true;
         this.§_-Qb§.visible = true;
         this.§_-Qb§.update();
      }
      
      private function §_-V24§(param1:ProgressEvent) : void
      {
         var _loc2_:Number = this.game.bytesLoaded + this.§_-B1I§.§_-J2I§;
         var _loc3_:Number = this.game.bytesTotal + this.§_-B1I§.§_-O2B§;
         if(_loc3_ == 0)
         {
            return;
         }
         this.§_-CC§(_loc2_ / _loc3_);
      }
      
      private function §_-CC§(param1:Number) : void
      {
         if(param1 > 1)
         {
            param1 = 1;
         }
         this.§_-33K§.text = int(param1 * 100).toString() + "%";
         this.§_-p2A§.x = int((param1 - 1) * this.§_-p2A§.width);
      }
      
      private function §_-m2J§(param1:Event) : void
      {
         this.game.removeEventListener(ProgressEvent.PROGRESS,this.§_-V24§);
         this.game.removeEventListener(Event.COMPLETE,this.§_-m2J§);
         this.§_-q2V§ = true;
      }
      
      private function §_-A1X§(param1:Event) : void
      {
         if(Boolean(this.§_-B1I§) && Boolean(this.§_-B1I§.loaded) && !this.§_-ba§)
         {
            this.§_-ba§ = true;
            play();
            return;
         }
         if(!this.§_-q2V§ || !this.§_-ba§)
         {
            return;
         }
         if(this.game.uncaughtErrorEvents)
         {
            this.game.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.§_-31§);
         }
         stop();
         this.§_-CC§(1);
         var _loc2_:Class = this.game.applicationDomain.getDefinition("Main") as Class;
         this.stage.removeEventListener(Event.ENTER_FRAME,this.§_-A1X§);
         this.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         this.stage.addChild(new _loc2_());
      }
      
      private function §_-31§(param1:UncaughtErrorEvent) : void
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
         for each(skipError in §_-vh§)
         {
            if(e.error.errorID == skipError)
            {
               return;
            }
         }
         message = e + "\n" + e.error + "\n" + e.error.getStackTrace();
         §_-p2U§.add(message);
         if(§_-pg§.indexOf(e.error.errorID) == -1)
         {
            return;
         }
         try
         {
            gameClass = loaderInfo.applicationDomain.getDefinition("Game") as Class;
            ++this.§_-wu§;
            variables = new URLVariables();
            variables["errno"] = -(e.error.errorID * 10000 + §_-Zy§.§_-Z2H§);
            variables["uid"] = gameClass.selfId;
            variables["version"] = §_-Zy§.§_-Z2H§;
            variables["message"] = §_-p2U§.§_-93a§();
            request = new URLRequest();
            request.url = §_-Zy§.§_-p1y§;
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
            if(this.§_-wu§ > §_-uR§.§_-21y§)
            {
               this.game.uncaughtErrorEvents.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.§_-31§);
            }
         }
      }
   }
}


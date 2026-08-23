package starling.core
{
   import §_-81P§.§_-Io§;
   import §_-f1T§.Event;
   import §_-f1T§.EventDispatcher;
   import §_-f1T§.KeyboardEvent;
   import §_-f1T§.ResizeEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-jj§;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.Stage3D;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DRenderMode;
   import flash.display3D.Context3DTriangleFace;
   import flash.display3D.Program3D;
   import flash.errors.IllegalOperationError;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TouchEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.Mouse;
   import flash.ui.Multitouch;
   import flash.ui.MultitouchInputMode;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import starling.display.DisplayObject;
   import starling.display.Stage;
   import starling.utils.§_-42b§;
   import starling.utils.§_-U2x§;
   import starling.utils.§_-s7§;
   import starling.utils.execute;
   
   public class Starling extends EventDispatcher
   {
      
      public static const VERSION:String = "1.8";
      
      private static const §_-53t§:String = "Starling.programs";
      
      private static var §_-CP§:Starling;
      
      private static var §_-ea§:Boolean = true;
      
      private static var §_-t8§:Dictionary = new Dictionary(true);
      
      private static var §_-21i§:Vector.<Starling> = new Vector.<Starling>(0);
      
      private var mStage3D:Stage3D;
      
      private var mStage:starling.display.Stage;
      
      private var §_-31d§:Class;
      
      private var §_-X13§:DisplayObject;
      
      private var §_-63b§:§_-Io§;
      
      private var §_-Q2b§:§_-wz§;
      
      private var §_-23M§:§_-jj§;
      
      private var §_-b20§:int;
      
      private var §_-M2q§:Boolean;
      
      private var §_-c§:Boolean;
      
      private var §_-93b§:Number;
      
      private var §_-a1j§:Boolean;
      
      private var §_-L1g§:§_-N1Q§;
      
      private var §_-y19§:Boolean;
      
      private var §_-71Z§:String;
      
      private var §_-A1o§:Context3D;
      
      private var §_-k1b§:Boolean;
      
      private var §_-h2R§:Boolean;
      
      private var §_-A8§:Boolean;
      
      private var §_-p1G§:Boolean;
      
      private var §_-J16§:Rectangle;
      
      private var §_-l2w§:Rectangle;
      
      private var §_-OZ§:Rectangle;
      
      private var §_-A3n§:flash.display.Stage;
      
      private var §_-Du§:Sprite;
      
      private var §_-D22§:Number;
      
      public function Starling(param1:Class, param2:flash.display.Stage, param3:Rectangle = null, param4:Stage3D = null, param5:String = "auto", param6:Object = "baselineConstrained")
      {
         var _loc7_:String = null;
         super();
         if(param2 == null)
         {
            throw new ArgumentError("Stage must not be null");
         }
         if(param3 == null)
         {
            param3 = new Rectangle(0,0,param2.stageWidth,param2.stageHeight);
         }
         if(param4 == null)
         {
            param4 = param2.stage3Ds[0];
         }
         §_-s7§.§_-523§();
         §_-21i§.push(this);
         this.makeCurrent();
         this.§_-31d§ = param1;
         this.§_-J16§ = param3;
         this.§_-l2w§ = new Rectangle();
         this.mStage3D = param4;
         this.mStage = new starling.display.Stage(param3.width,param3.height,param2.color);
         this.§_-Du§ = new Sprite();
         this.§_-A3n§ = param2;
         this.§_-A3n§.addChild(this.§_-Du§);
         this.§_-D22§ = 1;
         this.§_-23M§ = new §_-jj§(this.mStage);
         this.§_-63b§ = new §_-Io§();
         this.§_-b20§ = 0;
         this.§_-M2q§ = false;
         this.§_-c§ = false;
         this.§_-A8§ = false;
         this.§_-p1G§ = true;
         this.§_-93b§ = getTimer() * 0.001;
         this.§_-Q2b§ = new §_-wz§();
         §_-t8§[param4] = new Dictionary();
         §_-t8§[param4][§_-53t§] = new Dictionary();
         param2.scaleMode = StageScaleMode.NO_SCALE;
         param2.align = StageAlign.TOP_LEFT;
         for each(_loc7_ in this.§_-W1R§)
         {
            param2.addEventListener(_loc7_,this.§_-51§,false,0,true);
         }
         param2.addEventListener(flash.events.Event.ENTER_FRAME,this.§_-A1X§,false,0,true);
         param2.addEventListener(flash.events.KeyboardEvent.KEY_DOWN,this.§_-r1i§,false,0,true);
         param2.addEventListener(flash.events.KeyboardEvent.KEY_UP,this.§_-r1i§,false,0,true);
         param2.addEventListener(flash.events.Event.RESIZE,this.§_-71P§,false,0,true);
         param2.addEventListener(flash.events.Event.MOUSE_LEAVE,this.§_-k2R§,false,0,true);
         this.mStage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,this.§_-42J§,false,10,true);
         this.mStage3D.addEventListener(ErrorEvent.ERROR,this.§_-Q6§,false,10,true);
         if(Boolean(this.mStage3D.context3D) && this.mStage3D.context3D.driverInfo != "Disposed")
         {
            if(param6 == "auto" || param6 is Array)
            {
               throw new ArgumentError("When sharing the context3D, " + "the actual profile has to be supplied");
            }
            this.§_-71Z§ = "profile" in this.mStage3D.context3D ? this.mStage3D.context3D["profile"] : param6 as String;
            this.§_-y19§ = true;
            setTimeout(this.§_-523§,1);
         }
         else
         {
            if(!§_-s7§.§_-Q1H§)
            {
               trace("[Starling] Mask support requires \'depthAndStencil\' to be enabled" + " in the application descriptor.");
            }
            this.§_-y19§ = false;
            this.requestContext3D(param4,param5,param6);
         }
      }
      
      public static function get §_-n1s§() : Starling
      {
         return §_-CP§;
      }
      
      public static function get all() : Vector.<Starling>
      {
         return §_-21i§;
      }
      
      public static function get context() : Context3D
      {
         return §_-CP§ ? §_-CP§.context : null;
      }
      
      public static function get §_-zb§() : §_-Io§
      {
         return §_-CP§ ? §_-CP§.§_-zb§ : null;
      }
      
      public static function get §_-Cj§() : Number
      {
         return §_-CP§ ? §_-CP§.§_-Cj§ : 1;
      }
      
      public static function get §_-72h§() : Boolean
      {
         return Multitouch.inputMode == MultitouchInputMode.TOUCH_POINT;
      }
      
      public static function set §_-72h§(param1:Boolean) : void
      {
         if(§_-CP§)
         {
            throw new IllegalOperationError("\'multitouchEnabled\' must be set before Starling instance is created");
         }
         Multitouch.inputMode = param1 ? MultitouchInputMode.TOUCH_POINT : MultitouchInputMode.NONE;
      }
      
      public static function get §_-B2f§() : Boolean
      {
         return §_-ea§;
      }
      
      public static function set §_-B2f§(param1:Boolean) : void
      {
         if(§_-CP§)
         {
            throw new IllegalOperationError("\'handleLostContext\' must be set before Starling instance is created");
         }
         §_-ea§ = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         this.stop(true);
         this.§_-A3n§.removeEventListener(flash.events.Event.ENTER_FRAME,this.§_-A1X§,false);
         this.§_-A3n§.removeEventListener(flash.events.KeyboardEvent.KEY_DOWN,this.§_-r1i§,false);
         this.§_-A3n§.removeEventListener(flash.events.KeyboardEvent.KEY_UP,this.§_-r1i§,false);
         this.§_-A3n§.removeEventListener(flash.events.Event.RESIZE,this.§_-71P§,false);
         this.§_-A3n§.removeEventListener(flash.events.Event.MOUSE_LEAVE,this.§_-k2R§,false);
         this.§_-A3n§.removeChild(this.§_-Du§);
         this.mStage3D.removeEventListener(flash.events.Event.CONTEXT3D_CREATE,this.§_-42J§,false);
         this.mStage3D.removeEventListener(ErrorEvent.ERROR,this.§_-Q6§,false);
         for each(_loc1_ in this.§_-W1R§)
         {
            this.§_-A3n§.removeEventListener(_loc1_,this.§_-51§,false);
         }
         if(this.mStage)
         {
            this.mStage.dispose();
         }
         if(this.§_-Q2b§)
         {
            this.§_-Q2b§.dispose();
         }
         if(this.§_-23M§)
         {
            this.§_-23M§.dispose();
         }
         if(§_-CP§ == this)
         {
            §_-CP§ = null;
         }
         if(Boolean(this.§_-A1o§) && !this.§_-y19§)
         {
            execute(this.§_-A1o§.dispose,false);
         }
         var _loc2_:int = §_-21i§.indexOf(this);
         if(_loc2_ != -1)
         {
            §_-21i§.splice(_loc2_,1);
         }
      }
      
      private function requestContext3D(param1:Stage3D, param2:String, param3:Object) : void
      {
         var profiles:Array = null;
         var currentProfile:String = null;
         var requestNextProfile:Function = null;
         var onCreated:Function = null;
         var onError:Function = null;
         var stage3D:Stage3D = param1;
         var renderMode:String = param2;
         var profile:Object = param3;
         requestNextProfile = function():void
         {
            currentProfile = profiles.shift();
            try
            {
               execute(mStage3D.requestContext3D,renderMode,currentProfile);
            }
            catch(error:Error)
            {
               if(profiles.length == 0)
               {
                  throw error;
               }
               setTimeout(requestNextProfile,1);
            }
         };
         onCreated = function(param1:flash.events.Event):void
         {
            var _loc2_:Context3D = stage3D.context3D;
            if(renderMode == Context3DRenderMode.AUTO && profiles.length != 0 && _loc2_.driverInfo.indexOf("Software") != -1)
            {
               onError(param1);
            }
            else
            {
               §_-71Z§ = currentProfile;
               onFinished();
            }
         };
         onError = function(param1:flash.events.Event):void
         {
            if(profiles.length != 0)
            {
               param1.stopImmediatePropagation();
               setTimeout(requestNextProfile,1);
            }
            else
            {
               onFinished();
            }
         };
         var onFinished:Function = function():void
         {
            mStage3D.removeEventListener(flash.events.Event.CONTEXT3D_CREATE,onCreated);
            mStage3D.removeEventListener(ErrorEvent.ERROR,onError);
         };
         if(profile == "auto")
         {
            profiles = ["standardExtended","standard","standardConstrained","baselineExtended","baseline","baselineConstrained"];
         }
         else if(profile is String)
         {
            profiles = [profile as String];
         }
         else
         {
            if(!(profile is Array))
            {
               throw new ArgumentError("Profile must be of type \'String\' or \'Array\'");
            }
            profiles = profile as Array;
         }
         this.mStage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,onCreated,false,100);
         this.mStage3D.addEventListener(ErrorEvent.ERROR,onError,false,100);
         requestNextProfile();
      }
      
      private function §_-523§() : void
      {
         this.makeCurrent();
         this.§_-5g§();
         this.§_-O1o§();
         this.§_-23M§.§_-h2r§ = this.§_-M2q§;
         this.§_-93b§ = getTimer() * 0.001;
      }
      
      private function §_-5g§() : void
      {
         this.§_-A1o§ = this.mStage3D.context3D;
         this.§_-A1o§.enableErrorChecking = this.§_-c§;
         this.§_-wx§[§_-53t§] = new Dictionary();
         trace("[Starling] Initialization complete.");
         trace("[Starling] Display Driver:",this.§_-A1o§.driverInfo);
         this.§_-P2s§(true);
         §_-12v§(flash.events.Event.CONTEXT3D_CREATE,false,this.§_-A1o§);
      }
      
      private function §_-O1o§() : void
      {
         if(this.§_-X13§ == null && this.§_-31d§ != null)
         {
            this.§_-X13§ = new this.§_-31d§() as DisplayObject;
            if(this.§_-X13§ == null)
            {
               throw new Error("Invalid root class: " + this.§_-31d§);
            }
            this.mStage.addChildAt(this.§_-X13§,0);
            §_-12v§(§_-f1T§.Event.§_-mK§,false,this.§_-X13§);
         }
      }
      
      public function nextFrame() : void
      {
         var _loc1_:Number = getTimer() * 0.001;
         var _loc2_:Number = _loc1_ - this.§_-93b§;
         this.§_-93b§ = _loc1_;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 1 / this.§_-A3n§.frameRate;
         }
         this.§_-a1Q§(_loc2_);
         this.render();
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         if(!this.§_-J1d§)
         {
            return;
         }
         this.makeCurrent();
         this.§_-23M§.§_-a1Q§(param1);
         this.mStage.§_-a1Q§(param1);
         this.§_-63b§.§_-a1Q§(param1);
      }
      
      public function render() : void
      {
         if(!this.§_-J1d§)
         {
            return;
         }
         this.makeCurrent();
         this.§_-P2s§();
         §_-12v§(§_-f1T§.Event.RENDER);
         var _loc1_:Number = this.§_-J16§.width / this.mStage.stageWidth;
         var _loc2_:Number = this.§_-J16§.height / this.mStage.stageHeight;
         this.§_-A1o§.setDepthTest(false,Context3DCompareMode.ALWAYS);
         this.§_-A1o§.setCulling(Context3DTriangleFace.NONE);
         this.§_-Q2b§.nextFrame();
         this.§_-Q2b§.§_-72H§ = 0;
         this.§_-Q2b§.renderTarget = null;
         this.§_-Q2b§.§_-L1j§(this.§_-J16§.x < 0 ? -this.§_-J16§.x / _loc1_ : 0,this.§_-J16§.y < 0 ? -this.§_-J16§.y / _loc2_ : 0,this.§_-OZ§.width / _loc1_,this.§_-OZ§.height / _loc2_,this.mStage.stageWidth,this.mStage.stageHeight,this.mStage.§_-oy§);
         if(!this.§_-y19§)
         {
            §_-wz§.clear(this.mStage.color,1);
         }
         this.mStage.render(this.§_-Q2b§,1);
         this.§_-Q2b§.§_-z24§();
         if(this.§_-L1g§)
         {
            this.§_-L1g§.§_-t1V§ = this.§_-Q2b§.§_-t1V§;
         }
         if(!this.§_-y19§)
         {
            this.§_-A1o§.present();
         }
      }
      
      private function §_-P2s§(param1:Boolean = false) : void
      {
         if(param1 || this.§_-l2w§.width != this.§_-J16§.width || this.§_-l2w§.height != this.§_-J16§.height || this.§_-l2w§.x != this.§_-J16§.x || this.§_-l2w§.y != this.§_-J16§.y)
         {
            this.§_-l2w§.setTo(this.§_-J16§.x,this.§_-J16§.y,this.§_-J16§.width,this.§_-J16§.height);
            this.§_-OZ§ = this.§_-J16§.intersection(new Rectangle(0,0,this.§_-A3n§.stageWidth,this.§_-A3n§.stageHeight));
            if(!this.§_-y19§)
            {
               if(this.§_-71Z§ == "baselineConstrained")
               {
                  this.configureBackBuffer(32,32,this.§_-b20§,true);
               }
               this.mStage3D.x = this.§_-OZ§.x;
               this.mStage3D.y = this.§_-OZ§.y;
               this.configureBackBuffer(this.§_-OZ§.width,this.§_-OZ§.height,this.§_-b20§,true,this.§_-A8§);
               if(this.§_-A8§ && "contentsScaleFactor" in this.§_-A3n§)
               {
                  this.§_-D22§ = this.§_-A3n§["contentsScaleFactor"];
               }
               else
               {
                  this.§_-D22§ = 1;
               }
            }
         }
      }
      
      private function configureBackBuffer(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false) : void
      {
         param4 &&= §_-s7§.§_-Q1H§;
         param1 = param1 < 32 ? 32 : param1;
         param2 = param2 < 32 ? 32 : param2;
         var _loc6_:Function = this.§_-A1o§.configureBackBuffer;
         var _loc7_:Array = [param1,param2,param3,param4];
         if(_loc6_.length > 4)
         {
            _loc7_.push(param5);
         }
         _loc6_.apply(this.§_-A1o§,_loc7_);
      }
      
      private function §_-E1k§() : void
      {
         this.§_-Du§.x = this.§_-J16§.x;
         this.§_-Du§.y = this.§_-J16§.y;
         this.§_-Du§.scaleX = this.§_-J16§.width / this.mStage.stageWidth;
         this.§_-Du§.scaleY = this.§_-J16§.height / this.mStage.stageHeight;
      }
      
      public function §_-421§(param1:String) : void
      {
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(0,0.8);
         _loc2_.graphics.drawRect(0,0,this.mStage.stageWidth,this.mStage.stageHeight);
         _loc2_.graphics.endFill();
         var _loc3_:TextField = new TextField();
         var _loc4_:TextFormat = new TextFormat("Verdana",14,16777215);
         _loc4_.align = TextFormatAlign.CENTER;
         _loc3_.defaultTextFormat = _loc4_;
         _loc3_.wordWrap = true;
         _loc3_.width = this.mStage.stageWidth * 0.75;
         _loc3_.autoSize = TextFieldAutoSize.CENTER;
         _loc3_.text = param1;
         _loc3_.x = (this.mStage.stageWidth - _loc3_.width) / 2;
         _loc3_.y = (this.mStage.stageHeight - _loc3_.height) / 2;
         _loc3_.background = true;
         _loc3_.backgroundColor = 5570560;
         this.§_-E1k§();
         this.§_-Z29§.addChild(_loc2_);
         this.§_-Z29§.addChild(_loc3_);
         this.stop(true);
         trace("[Starling]",param1);
         §_-12v§(§_-f1T§.Event.§_-NW§,false,param1);
      }
      
      public function makeCurrent() : void
      {
         §_-CP§ = this;
      }
      
      public function start() : void
      {
         this.§_-k1b§ = this.§_-h2R§ = true;
         this.§_-93b§ = getTimer() * 0.001;
      }
      
      public function stop(param1:Boolean = false) : void
      {
         this.§_-k1b§ = false;
         this.§_-h2R§ = !param1;
      }
      
      private function §_-Q6§(param1:ErrorEvent) : void
      {
         var _loc2_:String = null;
         if(param1.errorID == 3702)
         {
            _loc2_ = Capabilities.playerType == "Desktop" ? "renderMode" : "wmode";
            this.§_-421§("Context3D not available! Possible reasons: wrong " + _loc2_ + " or missing device support.");
         }
         else
         {
            this.§_-421§("Stage3D error: " + param1.text);
         }
      }
      
      private function §_-42J§(param1:flash.events.Event) : void
      {
         if(!Starling.§_-B2f§ && Boolean(this.§_-A1o§))
         {
            param1.stopImmediatePropagation();
            this.§_-421§("The application lost the device context!");
            trace("[Starling] Enable \'Starling.handleLostContext\' to avoid this error.");
         }
         else
         {
            this.§_-523§();
         }
      }
      
      private function §_-A1X§(param1:flash.events.Event) : void
      {
         if(!this.§_-y19§)
         {
            if(this.§_-k1b§)
            {
               this.nextFrame();
            }
            else if(this.§_-h2R§)
            {
               this.render();
            }
         }
         this.§_-E1k§();
      }
      
      private function §_-r1i§(param1:flash.events.KeyboardEvent) : void
      {
         if(!this.§_-k1b§)
         {
            return;
         }
         var _loc2_:§_-f1T§.KeyboardEvent = new §_-f1T§.KeyboardEvent(param1.type,param1.charCode,param1.keyCode,param1.keyLocation,param1.ctrlKey,param1.altKey,param1.shiftKey);
         this.makeCurrent();
         if(this.§_-p1G§)
         {
            this.mStage.§_-EE§(_loc2_);
         }
         else
         {
            this.mStage.dispatchEvent(_loc2_);
         }
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
      
      private function §_-71P§(param1:flash.events.Event) : void
      {
         var stageWidth:int = 0;
         var stageHeight:int = 0;
         var dispatchResizeEvent:Function = null;
         var event:flash.events.Event = param1;
         dispatchResizeEvent = function():void
         {
            makeCurrent();
            removeEventListener(flash.events.Event.CONTEXT3D_CREATE,dispatchResizeEvent);
            mStage.dispatchEvent(new ResizeEvent(flash.events.Event.RESIZE,stageWidth,stageHeight));
         };
         stageWidth = int(event.target.stageWidth);
         stageHeight = int(event.target.stageHeight);
         if(this.§_-J1d§)
         {
            dispatchResizeEvent();
         }
         else
         {
            addEventListener(flash.events.Event.CONTEXT3D_CREATE,dispatchResizeEvent);
         }
      }
      
      private function §_-k2R§(param1:flash.events.Event) : void
      {
         this.§_-23M§.§_-Gb§();
      }
      
      private function §_-51§(param1:flash.events.Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc9_:MouseEvent = null;
         var _loc10_:TouchEvent = null;
         if(!this.§_-k1b§)
         {
            return;
         }
         var _loc6_:Number = 1;
         var _loc7_:Number = 1;
         var _loc8_:Number = 1;
         if(param1 is MouseEvent)
         {
            _loc9_ = param1 as MouseEvent;
            _loc2_ = _loc9_.stageX;
            _loc3_ = _loc9_.stageY;
            _loc4_ = 0;
            if(param1.type == MouseEvent.MOUSE_DOWN)
            {
               this.§_-a1j§ = true;
            }
            else if(param1.type == MouseEvent.MOUSE_UP)
            {
               this.§_-a1j§ = false;
            }
         }
         else
         {
            _loc10_ = param1 as TouchEvent;
            if(Mouse.supportsCursor && _loc10_.isPrimaryTouchPoint)
            {
               return;
            }
            _loc2_ = _loc10_.stageX;
            _loc3_ = _loc10_.stageY;
            _loc4_ = _loc10_.touchPointID;
            _loc6_ = _loc10_.pressure;
            _loc7_ = _loc10_.sizeX;
            _loc8_ = _loc10_.sizeY;
         }
         switch(param1.type)
         {
            case TouchEvent.TOUCH_BEGIN:
               _loc5_ = §_-01Z§.§_-N1v§;
               break;
            case TouchEvent.TOUCH_MOVE:
               _loc5_ = §_-01Z§.§_-kg§;
               break;
            case TouchEvent.TOUCH_END:
               _loc5_ = §_-01Z§.§_-1Z§;
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc5_ = §_-01Z§.§_-N1v§;
               break;
            case MouseEvent.MOUSE_UP:
               _loc5_ = §_-01Z§.§_-1Z§;
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc5_ = this.§_-a1j§ ? §_-01Z§.§_-kg§ : §_-01Z§.§_-zX§;
         }
         _loc2_ = this.mStage.stageWidth * (_loc2_ - this.§_-J16§.x) / this.§_-J16§.width;
         _loc3_ = this.mStage.stageHeight * (_loc3_ - this.§_-J16§.y) / this.§_-J16§.height;
         this.§_-23M§.§_-ze§(_loc4_,_loc5_,_loc2_,_loc3_,_loc6_,_loc7_,_loc8_);
         if(param1.type == MouseEvent.MOUSE_UP && Mouse.supportsCursor)
         {
            this.§_-23M§.§_-ze§(_loc4_,§_-01Z§.§_-zX§,_loc2_,_loc3_);
         }
      }
      
      private function get §_-W1R§() : Array
      {
         var _loc1_:Array = [];
         if(§_-72h§)
         {
            _loc1_.push(TouchEvent.TOUCH_BEGIN,TouchEvent.TOUCH_MOVE,TouchEvent.TOUCH_END);
         }
         if(!§_-72h§ || Mouse.supportsCursor)
         {
            _loc1_.push(MouseEvent.MOUSE_DOWN,MouseEvent.MOUSE_MOVE,MouseEvent.MOUSE_UP);
         }
         return _loc1_;
      }
      
      public function §_-01F§(param1:String, param2:ByteArray, param3:ByteArray) : Program3D
      {
         this.§_-Z16§(param1);
         var _loc4_:Program3D = this.§_-A1o§.createProgram();
         _loc4_.upload(param2,param3);
         this.programs[param1] = _loc4_;
         return _loc4_;
      }
      
      public function §_-cI§(param1:String, param2:String, param3:String) : Program3D
      {
         this.§_-Z16§(param1);
         var _loc4_:Program3D = §_-wz§.§_-g2Y§(param2,param3);
         this.programs[param1] = _loc4_;
         return _loc4_;
      }
      
      public function §_-Z16§(param1:String) : void
      {
         var _loc2_:Program3D = this.§_-w1B§(param1);
         if(_loc2_)
         {
            _loc2_.dispose();
            delete this.programs[param1];
         }
      }
      
      public function §_-w1B§(param1:String) : Program3D
      {
         return this.programs[param1] as Program3D;
      }
      
      public function §_-AO§(param1:String) : Boolean
      {
         return param1 in this.programs;
      }
      
      private function get programs() : Dictionary
      {
         return this.§_-wx§[§_-53t§];
      }
      
      public function get §_-5B§() : Boolean
      {
         return this.§_-k1b§;
      }
      
      public function get §_-zb§() : §_-Io§
      {
         return this.§_-63b§;
      }
      
      public function get context() : Context3D
      {
         return this.§_-A1o§;
      }
      
      public function get §_-wx§() : Dictionary
      {
         return §_-t8§[this.mStage3D] as Dictionary;
      }
      
      public function get §_-6I§() : int
      {
         return this.§_-OZ§.width;
      }
      
      public function get §_-G2h§() : int
      {
         return this.§_-OZ§.height;
      }
      
      public function get §_-a2T§() : int
      {
         return this.§_-D22§;
      }
      
      public function get §_-h2r§() : Boolean
      {
         return this.§_-M2q§;
      }
      
      public function set §_-h2r§(param1:Boolean) : void
      {
         this.§_-M2q§ = param1;
         if(this.§_-A1o§)
         {
            this.§_-23M§.§_-h2r§ = param1;
         }
      }
      
      public function get enableErrorChecking() : Boolean
      {
         return this.§_-c§;
      }
      
      public function set enableErrorChecking(param1:Boolean) : void
      {
         this.§_-c§ = param1;
         if(this.§_-A1o§)
         {
            this.§_-A1o§.enableErrorChecking = param1;
         }
      }
      
      public function get antiAliasing() : int
      {
         return this.§_-b20§;
      }
      
      public function set antiAliasing(param1:int) : void
      {
         if(this.§_-b20§ != param1)
         {
            this.§_-b20§ = param1;
            if(this.§_-J1d§)
            {
               this.§_-P2s§(true);
            }
         }
      }
      
      public function get §_-33S§() : Rectangle
      {
         return this.§_-J16§;
      }
      
      public function set §_-33S§(param1:Rectangle) : void
      {
         this.§_-J16§ = param1.clone();
      }
      
      public function get §_-Cj§() : Number
      {
         return this.§_-J16§.width * this.§_-D22§ / this.mStage.stageWidth;
      }
      
      public function get §_-Z29§() : Sprite
      {
         return this.§_-Du§;
      }
      
      public function get §_-yL§() : Boolean
      {
         return Boolean(this.§_-L1g§) && Boolean(this.§_-L1g§.parent);
      }
      
      public function set §_-yL§(param1:Boolean) : void
      {
         if(param1 == this.§_-yL§)
         {
            return;
         }
         if(param1)
         {
            if(this.§_-L1g§)
            {
               this.mStage.addChild(this.§_-L1g§);
            }
            else
            {
               this.showStatsAt();
            }
         }
         else
         {
            this.§_-L1g§.removeFromParent();
         }
      }
      
      public function showStatsAt(param1:String = "left", param2:String = "top", param3:Number = 1) : void
      {
         var onRootCreated:Function = null;
         var stageWidth:int = 0;
         var stageHeight:int = 0;
         var hAlign:String = param1;
         var vAlign:String = param2;
         var scale:Number = param3;
         onRootCreated = function():void
         {
            showStatsAt(hAlign,vAlign,scale);
            removeEventListener(§_-f1T§.Event.§_-mK§,onRootCreated);
         };
         if(this.§_-A1o§ == null)
         {
            addEventListener(§_-f1T§.Event.§_-mK§,onRootCreated);
         }
         else
         {
            stageWidth = this.mStage.stageWidth;
            stageHeight = this.mStage.stageHeight;
            if(this.§_-L1g§ == null)
            {
               this.§_-L1g§ = new §_-N1Q§();
               this.§_-L1g§.touchable = false;
            }
            this.mStage.addChild(this.§_-L1g§);
            this.§_-L1g§.scaleX = this.§_-L1g§.scaleY = scale;
            if(hAlign == §_-U2x§.LEFT)
            {
               this.§_-L1g§.x = 0;
            }
            else if(hAlign == §_-U2x§.RIGHT)
            {
               this.§_-L1g§.x = stageWidth - this.§_-L1g§.width;
            }
            else
            {
               this.§_-L1g§.x = int((stageWidth - this.§_-L1g§.width) / 2);
            }
            if(vAlign == §_-42b§.TOP)
            {
               this.§_-L1g§.y = 0;
            }
            else if(vAlign == §_-42b§.BOTTOM)
            {
               this.§_-L1g§.y = stageHeight - this.§_-L1g§.height;
            }
            else
            {
               this.§_-L1g§.y = int((stageHeight - this.§_-L1g§.height) / 2);
            }
         }
      }
      
      public function get stage() : starling.display.Stage
      {
         return this.mStage;
      }
      
      public function get stage3D() : Stage3D
      {
         return this.mStage3D;
      }
      
      public function get §_-93k§() : flash.display.Stage
      {
         return this.§_-A3n§;
      }
      
      public function get root() : DisplayObject
      {
         return this.§_-X13§;
      }
      
      public function get §_-Li§() : Class
      {
         return this.§_-31d§;
      }
      
      public function set §_-Li§(param1:Class) : void
      {
         if(this.§_-31d§ != null && this.§_-X13§ != null)
         {
            throw new Error("Root class may not change after root has been instantiated");
         }
         if(this.§_-31d§ == null)
         {
            this.§_-31d§ = param1;
            if(this.§_-A1o§)
            {
               this.§_-O1o§();
            }
         }
      }
      
      public function get §_-41X§() : Boolean
      {
         return this.§_-y19§;
      }
      
      public function set §_-41X§(param1:Boolean) : void
      {
         this.§_-y19§ = param1;
      }
      
      public function get profile() : String
      {
         return this.§_-71Z§;
      }
      
      public function get §_-84§() : Boolean
      {
         return this.§_-A8§;
      }
      
      public function set §_-84§(param1:Boolean) : void
      {
         if(this.§_-A8§ != param1)
         {
            this.§_-A8§ = param1;
            if(this.§_-J1d§)
            {
               this.§_-P2s§(true);
            }
         }
      }
      
      public function get §_-t1I§() : Boolean
      {
         return this.§_-p1G§;
      }
      
      public function set §_-t1I§(param1:Boolean) : void
      {
         this.§_-p1G§ = param1;
      }
      
      public function get §_-c1b§() : §_-jj§
      {
         return this.§_-23M§;
      }
      
      public function set §_-c1b§(param1:§_-jj§) : void
      {
         if(param1 != this.§_-23M§)
         {
            this.§_-23M§.dispose();
            this.§_-23M§ = param1;
         }
      }
      
      public function get §_-J1d§() : Boolean
      {
         var _loc1_:String = null;
         if(this.§_-A1o§)
         {
            _loc1_ = this.§_-A1o§.driverInfo;
            return _loc1_ != null && _loc1_ != "" && _loc1_ != "Disposed";
         }
         return false;
      }
   }
}


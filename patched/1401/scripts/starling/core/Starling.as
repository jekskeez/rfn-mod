package starling.core
{
   import §_-K2c§.Event;
   import §_-K2c§.EventDispatcher;
   import §_-K2c§.KeyboardEvent;
   import §_-K2c§.ResizeEvent;
   import §_-K2c§.§_-YR§;
   import §_-K2c§.§_-sj§;
   import §_-m1z§.§_-537§;
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
   import starling.utils.§_-G8§;
   import starling.utils.§_-Y1C§;
   import starling.utils.§_-Y23§;
   import starling.utils.execute;
   
   public class Starling extends EventDispatcher
   {
      
      public static const VERSION:String = "1.8";
      
      private static const §_-F28§:String = "Starling.programs";
      
      private static var §_-X1U§:Starling;
      
      private static var §_-F2w§:Boolean = true;
      
      private static var §_-N1m§:Dictionary = new Dictionary(true);
      
      private static var §_-z1m§:Vector.<Starling> = new Vector.<Starling>(0);
      
      private var mStage3D:Stage3D;
      
      private var mStage:starling.display.Stage;
      
      private var §_-p2g§:Class;
      
      private var §_-mp§:DisplayObject;
      
      private var §_-F1O§:§_-537§;
      
      private var §_-O2j§:§_-T2v§;
      
      private var §_-V16§:§_-YR§;
      
      private var §_-A1K§:int;
      
      private var §_-Cv§:Boolean;
      
      private var §_-90§:Boolean;
      
      private var §_-LZ§:Number;
      
      private var §_-LX§:Boolean;
      
      private var §_-MJ§:§_-Q1Z§;
      
      private var §_-i2p§:Boolean;
      
      private var §_-02c§:String;
      
      private var §_-Mo§:Context3D;
      
      private var §_-U§:Boolean;
      
      private var §_-J2j§:Boolean;
      
      private var §_-b1p§:Boolean;
      
      private var §_-mF§:Boolean;
      
      private var §_-W2u§:Rectangle;
      
      private var §_-a22§:Rectangle;
      
      private var §_-32L§:Rectangle;
      
      private var §_-LW§:flash.display.Stage;
      
      private var §_-03f§:Sprite;
      
      private var §_-73U§:Number;
      
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
         §_-Y23§.§_-E3§();
         §_-z1m§.push(this);
         this.makeCurrent();
         this.§_-p2g§ = param1;
         this.§_-W2u§ = param3;
         this.§_-a22§ = new Rectangle();
         this.mStage3D = param4;
         this.mStage = new starling.display.Stage(param3.width,param3.height,param2.color);
         this.§_-03f§ = new Sprite();
         this.§_-LW§ = param2;
         this.§_-LW§.addChild(this.§_-03f§);
         this.§_-73U§ = 1;
         this.§_-V16§ = new §_-YR§(this.mStage);
         this.§_-F1O§ = new §_-537§();
         this.§_-A1K§ = 0;
         this.§_-Cv§ = false;
         this.§_-90§ = false;
         this.§_-b1p§ = false;
         this.§_-mF§ = true;
         this.§_-LZ§ = getTimer() * 0.001;
         this.§_-O2j§ = new §_-T2v§();
         §_-N1m§[param4] = new Dictionary();
         §_-N1m§[param4][§_-F28§] = new Dictionary();
         param2.scaleMode = StageScaleMode.NO_SCALE;
         param2.align = StageAlign.TOP_LEFT;
         for each(_loc7_ in this.§_-Q4§)
         {
            param2.addEventListener(_loc7_,this.§_-V1M§,false,0,true);
         }
         param2.addEventListener(flash.events.Event.ENTER_FRAME,this.§_-L1Y§,false,0,true);
         param2.addEventListener(flash.events.KeyboardEvent.KEY_DOWN,this.§_-21G§,false,0,true);
         param2.addEventListener(flash.events.KeyboardEvent.KEY_UP,this.§_-21G§,false,0,true);
         param2.addEventListener(flash.events.Event.RESIZE,this.§_-g18§,false,0,true);
         param2.addEventListener(flash.events.Event.MOUSE_LEAVE,this.§_-Cz§,false,0,true);
         this.mStage3D.addEventListener(flash.events.Event.CONTEXT3D_CREATE,this.§_-w2G§,false,10,true);
         this.mStage3D.addEventListener(ErrorEvent.ERROR,this.§_-i2l§,false,10,true);
         if(Boolean(this.mStage3D.context3D) && this.mStage3D.context3D.driverInfo != "Disposed")
         {
            if(param6 == "auto" || param6 is Array)
            {
               throw new ArgumentError("When sharing the context3D, " + "the actual profile has to be supplied");
            }
            this.§_-02c§ = "profile" in this.mStage3D.context3D ? this.mStage3D.context3D["profile"] : param6 as String;
            this.§_-i2p§ = true;
            setTimeout(this.§_-E3§,1);
         }
         else
         {
            if(!§_-Y23§.§_-l2t§)
            {
               trace("[Starling] Mask support requires \'depthAndStencil\' to be enabled" + " in the application descriptor.");
            }
            this.§_-i2p§ = false;
            this.requestContext3D(param4,param5,param6);
         }
      }
      
      public static function get §_-y1l§() : Starling
      {
         return §_-X1U§;
      }
      
      public static function get all() : Vector.<Starling>
      {
         return §_-z1m§;
      }
      
      public static function get context() : Context3D
      {
         return §_-X1U§ ? §_-X1U§.context : null;
      }
      
      public static function get §_-A3B§() : §_-537§
      {
         return §_-X1U§ ? §_-X1U§.§_-A3B§ : null;
      }
      
      public static function get §_-61w§() : Number
      {
         return §_-X1U§ ? §_-X1U§.§_-61w§ : 1;
      }
      
      public static function get §_-22F§() : Boolean
      {
         return Multitouch.inputMode == MultitouchInputMode.TOUCH_POINT;
      }
      
      public static function set §_-22F§(param1:Boolean) : void
      {
         if(§_-X1U§)
         {
            throw new IllegalOperationError("\'multitouchEnabled\' must be set before Starling instance is created");
         }
         Multitouch.inputMode = param1 ? MultitouchInputMode.TOUCH_POINT : MultitouchInputMode.NONE;
      }
      
      public static function get §_-m2K§() : Boolean
      {
         return §_-F2w§;
      }
      
      public static function set §_-m2K§(param1:Boolean) : void
      {
         if(§_-X1U§)
         {
            throw new IllegalOperationError("\'handleLostContext\' must be set before Starling instance is created");
         }
         §_-F2w§ = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         this.stop(true);
         this.§_-LW§.removeEventListener(flash.events.Event.ENTER_FRAME,this.§_-L1Y§,false);
         this.§_-LW§.removeEventListener(flash.events.KeyboardEvent.KEY_DOWN,this.§_-21G§,false);
         this.§_-LW§.removeEventListener(flash.events.KeyboardEvent.KEY_UP,this.§_-21G§,false);
         this.§_-LW§.removeEventListener(flash.events.Event.RESIZE,this.§_-g18§,false);
         this.§_-LW§.removeEventListener(flash.events.Event.MOUSE_LEAVE,this.§_-Cz§,false);
         this.§_-LW§.removeChild(this.§_-03f§);
         this.mStage3D.removeEventListener(flash.events.Event.CONTEXT3D_CREATE,this.§_-w2G§,false);
         this.mStage3D.removeEventListener(ErrorEvent.ERROR,this.§_-i2l§,false);
         for each(_loc1_ in this.§_-Q4§)
         {
            this.§_-LW§.removeEventListener(_loc1_,this.§_-V1M§,false);
         }
         if(this.mStage)
         {
            this.mStage.dispose();
         }
         if(this.§_-O2j§)
         {
            this.§_-O2j§.dispose();
         }
         if(this.§_-V16§)
         {
            this.§_-V16§.dispose();
         }
         if(§_-X1U§ == this)
         {
            §_-X1U§ = null;
         }
         if(Boolean(this.§_-Mo§) && !this.§_-i2p§)
         {
            execute(this.§_-Mo§.dispose,false);
         }
         var _loc2_:int = §_-z1m§.indexOf(this);
         if(_loc2_ != -1)
         {
            §_-z1m§.splice(_loc2_,1);
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
               §_-02c§ = currentProfile;
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
      
      private function §_-E3§() : void
      {
         this.makeCurrent();
         this.§_-BG§();
         this.§_-p12§();
         this.§_-V16§.§_-D2A§ = this.§_-Cv§;
         this.§_-LZ§ = getTimer() * 0.001;
      }
      
      private function §_-BG§() : void
      {
         this.§_-Mo§ = this.mStage3D.context3D;
         this.§_-Mo§.enableErrorChecking = this.§_-90§;
         this.§_-g28§[§_-F28§] = new Dictionary();
         trace("[Starling] Initialization complete.");
         trace("[Starling] Display Driver:",this.§_-Mo§.driverInfo);
         this.§_-P1T§(true);
         §_-g11§(flash.events.Event.CONTEXT3D_CREATE,false,this.§_-Mo§);
      }
      
      private function §_-p12§() : void
      {
         if(this.§_-mp§ == null && this.§_-p2g§ != null)
         {
            this.§_-mp§ = new this.§_-p2g§() as DisplayObject;
            if(this.§_-mp§ == null)
            {
               throw new Error("Invalid root class: " + this.§_-p2g§);
            }
            this.mStage.addChildAt(this.§_-mp§,0);
            §_-g11§(§_-K2c§.Event.§_-q3§,false,this.§_-mp§);
         }
      }
      
      public function nextFrame() : void
      {
         var _loc1_:Number = getTimer() * 0.001;
         var _loc2_:Number = _loc1_ - this.§_-LZ§;
         this.§_-LZ§ = _loc1_;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         if(_loc2_ < 0)
         {
            _loc2_ = 1 / this.§_-LW§.frameRate;
         }
         this.§_-ld§(_loc2_);
         this.render();
      }
      
      public function §_-ld§(param1:Number) : void
      {
         if(!this.§_-q1S§)
         {
            return;
         }
         this.makeCurrent();
         this.§_-V16§.§_-ld§(param1);
         this.mStage.§_-ld§(param1);
         this.§_-F1O§.§_-ld§(param1);
      }
      
      public function render() : void
      {
         if(!this.§_-q1S§)
         {
            return;
         }
         this.makeCurrent();
         this.§_-P1T§();
         §_-g11§(§_-K2c§.Event.RENDER);
         var _loc1_:Number = this.§_-W2u§.width / this.mStage.stageWidth;
         var _loc2_:Number = this.§_-W2u§.height / this.mStage.stageHeight;
         this.§_-Mo§.setDepthTest(false,Context3DCompareMode.ALWAYS);
         this.§_-Mo§.setCulling(Context3DTriangleFace.NONE);
         this.§_-O2j§.nextFrame();
         this.§_-O2j§.§_-o1j§ = 0;
         this.§_-O2j§.renderTarget = null;
         this.§_-O2j§.§_-w2Q§(this.§_-W2u§.x < 0 ? -this.§_-W2u§.x / _loc1_ : 0,this.§_-W2u§.y < 0 ? -this.§_-W2u§.y / _loc2_ : 0,this.§_-32L§.width / _loc1_,this.§_-32L§.height / _loc2_,this.mStage.stageWidth,this.mStage.stageHeight,this.mStage.§_-tJ§);
         if(!this.§_-i2p§)
         {
            §_-T2v§.clear(this.mStage.color,1);
         }
         this.mStage.render(this.§_-O2j§,1);
         this.§_-O2j§.§_-A1U§();
         if(this.§_-MJ§)
         {
            this.§_-MJ§.§_-y2B§ = this.§_-O2j§.§_-y2B§;
         }
         if(!this.§_-i2p§)
         {
            this.§_-Mo§.present();
         }
      }
      
      private function §_-P1T§(param1:Boolean = false) : void
      {
         if(param1 || this.§_-a22§.width != this.§_-W2u§.width || this.§_-a22§.height != this.§_-W2u§.height || this.§_-a22§.x != this.§_-W2u§.x || this.§_-a22§.y != this.§_-W2u§.y)
         {
            this.§_-a22§.setTo(this.§_-W2u§.x,this.§_-W2u§.y,this.§_-W2u§.width,this.§_-W2u§.height);
            this.§_-32L§ = this.§_-W2u§.intersection(new Rectangle(0,0,this.§_-LW§.stageWidth,this.§_-LW§.stageHeight));
            if(!this.§_-i2p§)
            {
               if(this.§_-02c§ == "baselineConstrained")
               {
                  this.configureBackBuffer(32,32,this.§_-A1K§,true);
               }
               this.mStage3D.x = this.§_-32L§.x;
               this.mStage3D.y = this.§_-32L§.y;
               this.configureBackBuffer(this.§_-32L§.width,this.§_-32L§.height,this.§_-A1K§,true,this.§_-b1p§);
               if(this.§_-b1p§ && "contentsScaleFactor" in this.§_-LW§)
               {
                  this.§_-73U§ = this.§_-LW§["contentsScaleFactor"];
               }
               else
               {
                  this.§_-73U§ = 1;
               }
            }
         }
      }
      
      private function configureBackBuffer(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false) : void
      {
         param4 &&= §_-Y23§.§_-l2t§;
         param1 = param1 < 32 ? 32 : param1;
         param2 = param2 < 32 ? 32 : param2;
         var _loc6_:Function = this.§_-Mo§.configureBackBuffer;
         var _loc7_:Array = [param1,param2,param3,param4];
         if(_loc6_.length > 4)
         {
            _loc7_.push(param5);
         }
         _loc6_.apply(this.§_-Mo§,_loc7_);
      }
      
      private function §_-23u§() : void
      {
         this.§_-03f§.x = this.§_-W2u§.x;
         this.§_-03f§.y = this.§_-W2u§.y;
         this.§_-03f§.scaleX = this.§_-W2u§.width / this.mStage.stageWidth;
         this.§_-03f§.scaleY = this.§_-W2u§.height / this.mStage.stageHeight;
      }
      
      public function §_-Vu§(param1:String) : void
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
         this.§_-23u§();
         this.§_-KJ§.addChild(_loc2_);
         this.§_-KJ§.addChild(_loc3_);
         this.stop(true);
         trace("[Starling]",param1);
         §_-g11§(§_-K2c§.Event.§_-D1K§,false,param1);
      }
      
      public function makeCurrent() : void
      {
         §_-X1U§ = this;
      }
      
      public function start() : void
      {
         this.§_-U§ = this.§_-J2j§ = true;
         this.§_-LZ§ = getTimer() * 0.001;
      }
      
      public function stop(param1:Boolean = false) : void
      {
         this.§_-U§ = false;
         this.§_-J2j§ = !param1;
      }
      
      private function §_-i2l§(param1:ErrorEvent) : void
      {
         var _loc2_:String = null;
         if(param1.errorID == 3702)
         {
            _loc2_ = Capabilities.playerType == "Desktop" ? "renderMode" : "wmode";
            this.§_-Vu§("Context3D not available! Possible reasons: wrong " + _loc2_ + " or missing device support.");
         }
         else
         {
            this.§_-Vu§("Stage3D error: " + param1.text);
         }
      }
      
      private function §_-w2G§(param1:flash.events.Event) : void
      {
         if(!Starling.§_-m2K§ && Boolean(this.§_-Mo§))
         {
            param1.stopImmediatePropagation();
            this.§_-Vu§("The application lost the device context!");
            trace("[Starling] Enable \'Starling.handleLostContext\' to avoid this error.");
         }
         else
         {
            this.§_-E3§();
         }
      }
      
      private function §_-L1Y§(param1:flash.events.Event) : void
      {
         if(!this.§_-i2p§)
         {
            if(this.§_-U§)
            {
               this.nextFrame();
            }
            else if(this.§_-J2j§)
            {
               this.render();
            }
         }
         this.§_-23u§();
      }
      
      private function §_-21G§(param1:flash.events.KeyboardEvent) : void
      {
         if(!this.§_-U§)
         {
            return;
         }
         var _loc2_:§_-K2c§.KeyboardEvent = new §_-K2c§.KeyboardEvent(param1.type,param1.charCode,param1.keyCode,param1.keyLocation,param1.ctrlKey,param1.altKey,param1.shiftKey);
         this.makeCurrent();
         if(this.§_-mF§)
         {
            this.mStage.§_-NI§(_loc2_);
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
      
      private function §_-g18§(param1:flash.events.Event) : void
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
         if(this.§_-q1S§)
         {
            dispatchResizeEvent();
         }
         else
         {
            addEventListener(flash.events.Event.CONTEXT3D_CREATE,dispatchResizeEvent);
         }
      }
      
      private function §_-Cz§(param1:flash.events.Event) : void
      {
         this.§_-V16§.§_-Cs§();
      }
      
      private function §_-V1M§(param1:flash.events.Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc9_:MouseEvent = null;
         var _loc10_:TouchEvent = null;
         if(!this.§_-U§)
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
               this.§_-LX§ = true;
            }
            else if(param1.type == MouseEvent.MOUSE_UP)
            {
               this.§_-LX§ = false;
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
               _loc5_ = §_-sj§.§_-ML§;
               break;
            case TouchEvent.TOUCH_MOVE:
               _loc5_ = §_-sj§.§_-i23§;
               break;
            case TouchEvent.TOUCH_END:
               _loc5_ = §_-sj§.§_-L23§;
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc5_ = §_-sj§.§_-ML§;
               break;
            case MouseEvent.MOUSE_UP:
               _loc5_ = §_-sj§.§_-L23§;
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc5_ = this.§_-LX§ ? §_-sj§.§_-i23§ : §_-sj§.§_-X2J§;
         }
         _loc2_ = this.mStage.stageWidth * (_loc2_ - this.§_-W2u§.x) / this.§_-W2u§.width;
         _loc3_ = this.mStage.stageHeight * (_loc3_ - this.§_-W2u§.y) / this.§_-W2u§.height;
         this.§_-V16§.§_-43O§(_loc4_,_loc5_,_loc2_,_loc3_,_loc6_,_loc7_,_loc8_);
         if(param1.type == MouseEvent.MOUSE_UP && Mouse.supportsCursor)
         {
            this.§_-V16§.§_-43O§(_loc4_,§_-sj§.§_-X2J§,_loc2_,_loc3_);
         }
      }
      
      private function get §_-Q4§() : Array
      {
         var _loc1_:Array = [];
         if(§_-22F§)
         {
            _loc1_.push(TouchEvent.TOUCH_BEGIN,TouchEvent.TOUCH_MOVE,TouchEvent.TOUCH_END);
         }
         if(!§_-22F§ || Mouse.supportsCursor)
         {
            _loc1_.push(MouseEvent.MOUSE_DOWN,MouseEvent.MOUSE_MOVE,MouseEvent.MOUSE_UP);
         }
         return _loc1_;
      }
      
      public function §_-P15§(param1:String, param2:ByteArray, param3:ByteArray) : Program3D
      {
         this.§_-G2c§(param1);
         var _loc4_:Program3D = this.§_-Mo§.createProgram();
         _loc4_.upload(param2,param3);
         this.programs[param1] = _loc4_;
         return _loc4_;
      }
      
      public function §_-12E§(param1:String, param2:String, param3:String) : Program3D
      {
         this.§_-G2c§(param1);
         var _loc4_:Program3D = §_-T2v§.§_-W1S§(param2,param3);
         this.programs[param1] = _loc4_;
         return _loc4_;
      }
      
      public function §_-G2c§(param1:String) : void
      {
         var _loc2_:Program3D = this.§_-y20§(param1);
         if(_loc2_)
         {
            _loc2_.dispose();
            delete this.programs[param1];
         }
      }
      
      public function §_-y20§(param1:String) : Program3D
      {
         return this.programs[param1] as Program3D;
      }
      
      public function §_-B3H§(param1:String) : Boolean
      {
         return param1 in this.programs;
      }
      
      private function get programs() : Dictionary
      {
         return this.§_-g28§[§_-F28§];
      }
      
      public function get §_-u1J§() : Boolean
      {
         return this.§_-U§;
      }
      
      public function get §_-A3B§() : §_-537§
      {
         return this.§_-F1O§;
      }
      
      public function get context() : Context3D
      {
         return this.§_-Mo§;
      }
      
      public function get §_-g28§() : Dictionary
      {
         return §_-N1m§[this.mStage3D] as Dictionary;
      }
      
      public function get §_-03H§() : int
      {
         return this.§_-32L§.width;
      }
      
      public function get §_-kK§() : int
      {
         return this.§_-32L§.height;
      }
      
      public function get §_-vA§() : int
      {
         return this.§_-73U§;
      }
      
      public function get §_-D2A§() : Boolean
      {
         return this.§_-Cv§;
      }
      
      public function set §_-D2A§(param1:Boolean) : void
      {
         this.§_-Cv§ = param1;
         if(this.§_-Mo§)
         {
            this.§_-V16§.§_-D2A§ = param1;
         }
      }
      
      public function get enableErrorChecking() : Boolean
      {
         return this.§_-90§;
      }
      
      public function set enableErrorChecking(param1:Boolean) : void
      {
         this.§_-90§ = param1;
         if(this.§_-Mo§)
         {
            this.§_-Mo§.enableErrorChecking = param1;
         }
      }
      
      public function get antiAliasing() : int
      {
         return this.§_-A1K§;
      }
      
      public function set antiAliasing(param1:int) : void
      {
         if(this.§_-A1K§ != param1)
         {
            this.§_-A1K§ = param1;
            if(this.§_-q1S§)
            {
               this.§_-P1T§(true);
            }
         }
      }
      
      public function get §_-B9§() : Rectangle
      {
         return this.§_-W2u§;
      }
      
      public function set §_-B9§(param1:Rectangle) : void
      {
         this.§_-W2u§ = param1.clone();
      }
      
      public function get §_-61w§() : Number
      {
         return this.§_-W2u§.width * this.§_-73U§ / this.mStage.stageWidth;
      }
      
      public function get §_-KJ§() : Sprite
      {
         return this.§_-03f§;
      }
      
      public function get §_-NM§() : Boolean
      {
         return Boolean(this.§_-MJ§) && Boolean(this.§_-MJ§.parent);
      }
      
      public function set §_-NM§(param1:Boolean) : void
      {
         if(param1 == this.§_-NM§)
         {
            return;
         }
         if(param1)
         {
            if(this.§_-MJ§)
            {
               this.mStage.addChild(this.§_-MJ§);
            }
            else
            {
               this.showStatsAt();
            }
         }
         else
         {
            this.§_-MJ§.removeFromParent();
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
            removeEventListener(§_-K2c§.Event.§_-q3§,onRootCreated);
         };
         if(this.§_-Mo§ == null)
         {
            addEventListener(§_-K2c§.Event.§_-q3§,onRootCreated);
         }
         else
         {
            stageWidth = this.mStage.stageWidth;
            stageHeight = this.mStage.stageHeight;
            if(this.§_-MJ§ == null)
            {
               this.§_-MJ§ = new §_-Q1Z§();
               this.§_-MJ§.touchable = false;
            }
            this.mStage.addChild(this.§_-MJ§);
            this.§_-MJ§.scaleX = this.§_-MJ§.scaleY = scale;
            if(hAlign == §_-G8§.LEFT)
            {
               this.§_-MJ§.x = 0;
            }
            else if(hAlign == §_-G8§.RIGHT)
            {
               this.§_-MJ§.x = stageWidth - this.§_-MJ§.width;
            }
            else
            {
               this.§_-MJ§.x = int((stageWidth - this.§_-MJ§.width) / 2);
            }
            if(vAlign == §_-Y1C§.TOP)
            {
               this.§_-MJ§.y = 0;
            }
            else if(vAlign == §_-Y1C§.BOTTOM)
            {
               this.§_-MJ§.y = stageHeight - this.§_-MJ§.height;
            }
            else
            {
               this.§_-MJ§.y = int((stageHeight - this.§_-MJ§.height) / 2);
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
      
      public function get §_-gQ§() : flash.display.Stage
      {
         return this.§_-LW§;
      }
      
      public function get root() : DisplayObject
      {
         return this.§_-mp§;
      }
      
      public function get §_-8Y§() : Class
      {
         return this.§_-p2g§;
      }
      
      public function set §_-8Y§(param1:Class) : void
      {
         if(this.§_-p2g§ != null && this.§_-mp§ != null)
         {
            throw new Error("Root class may not change after root has been instantiated");
         }
         if(this.§_-p2g§ == null)
         {
            this.§_-p2g§ = param1;
            if(this.§_-Mo§)
            {
               this.§_-p12§();
            }
         }
      }
      
      public function get §_-fB§() : Boolean
      {
         return this.§_-i2p§;
      }
      
      public function set §_-fB§(param1:Boolean) : void
      {
         this.§_-i2p§ = param1;
      }
      
      public function get profile() : String
      {
         return this.§_-02c§;
      }
      
      public function get §_-I2T§() : Boolean
      {
         return this.§_-b1p§;
      }
      
      public function set §_-I2T§(param1:Boolean) : void
      {
         if(this.§_-b1p§ != param1)
         {
            this.§_-b1p§ = param1;
            if(this.§_-q1S§)
            {
               this.§_-P1T§(true);
            }
         }
      }
      
      public function get §_-K2a§() : Boolean
      {
         return this.§_-mF§;
      }
      
      public function set §_-K2a§(param1:Boolean) : void
      {
         this.§_-mF§ = param1;
      }
      
      public function get §_-h1v§() : §_-YR§
      {
         return this.§_-V16§;
      }
      
      public function set §_-h1v§(param1:§_-YR§) : void
      {
         if(param1 != this.§_-V16§)
         {
            this.§_-V16§.dispose();
            this.§_-V16§ = param1;
         }
      }
      
      public function get §_-q1S§() : Boolean
      {
         var _loc1_:String = null;
         if(this.§_-Mo§)
         {
            _loc1_ = this.§_-Mo§.driverInfo;
            return _loc1_ != null && _loc1_ != "" && _loc1_ != "Disposed";
         }
         return false;
      }
   }
}


package starling.display
{
   import §_-K2c§.Event;
   import §_-K2c§.EventDispatcher;
   import §_-K2c§.TouchEvent;
   import §_-kW§.§_-J1k§;
   import §_-kW§.§_-Y1U§;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import flash.system.Capabilities;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.getQualifiedClassName;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-G8§;
   import starling.utils.§_-Y1C§;
   import starling.utils.§_-rI§;
   import starling.utils.§_-xD§;
   
   public class DisplayObject extends EventDispatcher
   {
      
      private static var §_-8N§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private static var §_-G2g§:Point = new Point();
      
      private static var sHelperPoint3D:Vector3D = new Vector3D();
      
      private static var §_-8K§:Vector3D = new Vector3D();
      
      private static var §_-02i§:Rectangle = new Rectangle();
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var §_-k1s§:Matrix = new Matrix();
      
      private static var sHelperMatrix3D:Matrix3D = new Matrix3D();
      
      private static var sHelperMatrixAlt3D:Matrix3D = new Matrix3D();
      
      private var §_-N3§:Number;
      
      private var §_-K10§:Number;
      
      private var §_-I1U§:Number;
      
      private var §_-C3Z§:Number;
      
      private var §_-21g§:Number;
      
      private var §_-bg§:Number;
      
      private var §_-H2b§:Number;
      
      private var §_-R2Q§:Number;
      
      private var §_-d2Y§:Number;
      
      private var §_-2z§:Number;
      
      private var §_-O1h§:Boolean;
      
      private var §_-K2Z§:Boolean;
      
      private var §_-91B§:String;
      
      private var §_-W2R§:String;
      
      private var §_-S1w§:Boolean;
      
      private var §_-02V§:DisplayObjectContainer;
      
      private var §_-52z§:Matrix;
      
      private var mTransformationMatrix3D:Matrix3D;
      
      private var §_-j1x§:Boolean;
      
      private var §_-M25§:FragmentFilter;
      
      private var §_-S2e§:Boolean;
      
      private var §_-RY§:DisplayObject;
      
      private var §_-12W§:Boolean;
      
      public function DisplayObject()
      {
         super();
         if(Capabilities.isDebugger && getQualifiedClassName(this) == "starling.display::DisplayObject")
         {
            throw new §_-J1k§();
         }
         this.§_-N3§ = this.§_-K10§ = this.§_-I1U§ = this.§_-C3Z§ = this.§_-d2Y§ = this.§_-H2b§ = this.§_-R2Q§ = 0;
         this.§_-21g§ = this.§_-bg§ = this.§_-2z§ = 1;
         this.§_-O1h§ = this.§_-K2Z§ = true;
         this.§_-91B§ = BlendMode.AUTO;
         this.§_-52z§ = new Matrix();
         this.§_-j1x§ = this.§_-S1w§ = false;
      }
      
      public function dispose() : void
      {
         if(this.§_-M25§)
         {
            this.§_-M25§.dispose();
         }
         if(this.§_-RY§)
         {
            this.§_-RY§.dispose();
         }
         this.§_-b8§();
         this.mask = null;
      }
      
      public function removeFromParent(param1:Boolean = false) : void
      {
         if(this.§_-02V§)
         {
            this.§_-02V§.removeChild(this,param1);
         }
         else if(param1)
         {
            this.dispose();
         }
      }
      
      public function §_-eJ§(param1:DisplayObject, param2:Matrix = null) : Matrix
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObject = null;
         if(param2)
         {
            param2.identity();
         }
         else
         {
            param2 = new Matrix();
         }
         if(param1 == this)
         {
            return param2;
         }
         if(param1 == this.§_-02V§ || param1 == null && this.§_-02V§ == null)
         {
            param2.copyFrom(this.transformationMatrix);
            return param2;
         }
         if(param1 == null || param1 == this.base)
         {
            _loc4_ = this;
            while(_loc4_ != param1)
            {
               param2.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.§_-02V§;
            }
            return param2;
         }
         if(param1.§_-02V§ == this)
         {
            param1.§_-eJ§(this,param2);
            param2.invert();
            return param2;
         }
         _loc3_ = this.§_-Ff§(this,param1);
         _loc4_ = this;
         while(_loc4_ != _loc3_)
         {
            param2.concat(_loc4_.transformationMatrix);
            _loc4_ = _loc4_.§_-02V§;
         }
         if(_loc3_ == param1)
         {
            return param2;
         }
         §_-S19§.identity();
         _loc4_ = param1;
         while(_loc4_ != _loc3_)
         {
            §_-S19§.concat(_loc4_.transformationMatrix);
            _loc4_ = _loc4_.§_-02V§;
         }
         §_-S19§.invert();
         param2.concat(§_-S19§);
         return param2;
      }
      
      public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         throw new §_-Y1U§();
      }
      
      public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!this.§_-O1h§ || !this.§_-K2Z§))
         {
            return null;
         }
         if(Boolean(this.§_-RY§) && !this.§_-O2d§(param1))
         {
            return null;
         }
         if(this.getBounds(this,§_-02i§).containsPoint(param1))
         {
            return this;
         }
         return null;
      }
      
      public function §_-O2d§(param1:Point) : Boolean
      {
         var _loc2_:Point = null;
         if(this.§_-RY§)
         {
            if(this.§_-RY§.stage)
            {
               this.§_-eJ§(this.§_-RY§,§_-k1s§);
            }
            else
            {
               §_-k1s§.copyFrom(this.§_-RY§.transformationMatrix);
               §_-k1s§.invert();
            }
            _loc2_ = param1 == §_-G2g§ ? new Point() : §_-G2g§;
            §_-rI§.§_-Zr§(§_-k1s§,param1,_loc2_);
            return this.§_-RY§.hitTest(_loc2_,true) != null;
         }
         return true;
      }
      
      public function localToGlobal(param1:Point, param2:Point = null) : Point
      {
         if(this.§_-zd§)
         {
            sHelperPoint3D.setTo(param1.x,param1.y,0);
            return this.§_-nX§(sHelperPoint3D,param2);
         }
         this.§_-eJ§(this.base,§_-k1s§);
         return §_-rI§.§_-Zr§(§_-k1s§,param1,param2);
      }
      
      public function globalToLocal(param1:Point, param2:Point = null) : Point
      {
         if(this.§_-zd§)
         {
            this.globalToLocal3D(param1,sHelperPoint3D);
            this.stage.§_-79§(this,§_-8K§);
            return §_-xD§.§_-mR§(§_-8K§,sHelperPoint3D,param2);
         }
         this.§_-eJ§(this.base,§_-k1s§);
         §_-k1s§.invert();
         return §_-rI§.§_-Zr§(§_-k1s§,param1,param2);
      }
      
      public function render(param1:§_-T2v§, param2:Number) : void
      {
         throw new §_-Y1U§();
      }
      
      public function get §_-C31§() : Boolean
      {
         return this.§_-2z§ != 0 && this.§_-O1h§ && !this.§_-12W§ && this.§_-21g§ != 0 && this.§_-bg§ != 0;
      }
      
      public function §_-x2x§(param1:String = "center", param2:String = "center") : void
      {
         var _loc3_:Rectangle = this.getBounds(this,§_-02i§);
         this.§_-j1x§ = true;
         if(param1 == §_-G8§.LEFT)
         {
            this.§_-I1U§ = _loc3_.x;
         }
         else if(param1 == §_-G8§.CENTER)
         {
            this.§_-I1U§ = _loc3_.x + _loc3_.width / 2;
         }
         else
         {
            if(param1 != §_-G8§.RIGHT)
            {
               throw new ArgumentError("Invalid horizontal alignment: " + param1);
            }
            this.§_-I1U§ = _loc3_.x + _loc3_.width;
         }
         if(param2 == §_-Y1C§.TOP)
         {
            this.§_-C3Z§ = _loc3_.y;
         }
         else if(param2 == §_-Y1C§.CENTER)
         {
            this.§_-C3Z§ = _loc3_.y + _loc3_.height / 2;
         }
         else
         {
            if(param2 != §_-Y1C§.BOTTOM)
            {
               throw new ArgumentError("Invalid vertical alignment: " + param2);
            }
            this.§_-C3Z§ = _loc3_.y + _loc3_.height;
         }
      }
      
      public function getTransformationMatrix3D(param1:DisplayObject, param2:Matrix3D = null) : Matrix3D
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObject = null;
         if(param2)
         {
            param2.identity();
         }
         else
         {
            param2 = new Matrix3D();
         }
         if(param1 == this)
         {
            return param2;
         }
         if(param1 == this.§_-02V§ || param1 == null && this.§_-02V§ == null)
         {
            param2.copyFrom(this.transformationMatrix3D);
            return param2;
         }
         if(param1 == null || param1 == this.base)
         {
            _loc4_ = this;
            while(_loc4_ != param1)
            {
               param2.append(_loc4_.transformationMatrix3D);
               _loc4_ = _loc4_.§_-02V§;
            }
            return param2;
         }
         if(param1.§_-02V§ == this)
         {
            param1.getTransformationMatrix3D(this,param2);
            param2.invert();
            return param2;
         }
         _loc3_ = this.§_-Ff§(this,param1);
         _loc4_ = this;
         while(_loc4_ != _loc3_)
         {
            param2.append(_loc4_.transformationMatrix3D);
            _loc4_ = _loc4_.§_-02V§;
         }
         if(_loc3_ == param1)
         {
            return param2;
         }
         sHelperMatrix3D.identity();
         _loc4_ = param1;
         while(_loc4_ != _loc3_)
         {
            sHelperMatrix3D.append(_loc4_.transformationMatrix3D);
            _loc4_ = _loc4_.§_-02V§;
         }
         sHelperMatrix3D.invert();
         param2.append(sHelperMatrix3D);
         return param2;
      }
      
      public function §_-nX§(param1:Vector3D, param2:Point = null) : Point
      {
         var _loc3_:Stage = this.stage;
         if(_loc3_ == null)
         {
            throw new IllegalOperationError("Object not connected to stage");
         }
         this.getTransformationMatrix3D(_loc3_,sHelperMatrixAlt3D);
         §_-rI§.transformPoint3D(sHelperMatrixAlt3D,param1,sHelperPoint3D);
         return §_-xD§.§_-mR§(_loc3_.§_-tJ§,sHelperPoint3D,param2);
      }
      
      public function globalToLocal3D(param1:Point, param2:Vector3D = null) : Vector3D
      {
         var _loc3_:Stage = this.stage;
         if(_loc3_ == null)
         {
            throw new IllegalOperationError("Object not connected to stage");
         }
         this.getTransformationMatrix3D(_loc3_,sHelperMatrixAlt3D);
         sHelperMatrixAlt3D.invert();
         return §_-rI§.transformCoords3D(sHelperMatrixAlt3D,param1.x,param1.y,0,param2);
      }
      
      internal function §_-71V§(param1:DisplayObjectContainer) : void
      {
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != this && _loc2_ != null)
         {
            _loc2_ = _loc2_.§_-02V§;
         }
         if(_loc2_ == this)
         {
            throw new ArgumentError("An object cannot be added as a child to itself or one " + "of its children (or children\'s children, etc.)");
         }
         this.§_-02V§ = param1;
      }
      
      internal function §_-ob§(param1:Boolean) : void
      {
         this.§_-S2e§ = param1;
      }
      
      internal function get §_-A1S§() : Boolean
      {
         return this.§_-12W§;
      }
      
      final private function §_-Re§(param1:Number, param2:Number, param3:Number = 0.0001) : Boolean
      {
         return param1 - param3 < param2 && param1 + param3 > param2;
      }
      
      final private function §_-Ff§(param1:DisplayObject, param2:DisplayObject) : DisplayObject
      {
         var _loc3_:DisplayObject = param1;
         while(_loc3_)
         {
            §_-8N§[§_-8N§.length] = _loc3_;
            _loc3_ = _loc3_.§_-02V§;
         }
         _loc3_ = param2;
         while(Boolean(_loc3_) && §_-8N§.indexOf(_loc3_) == -1)
         {
            _loc3_ = _loc3_.§_-02V§;
         }
         §_-8N§.length = 0;
         if(_loc3_)
         {
            return _loc3_;
         }
         throw new ArgumentError("Object not connected to target");
      }
      
      override public function dispatchEvent(param1:Event) : void
      {
         if(param1.type == Event.REMOVED_FROM_STAGE && this.stage == null)
         {
            return;
         }
         super.dispatchEvent(param1);
      }
      
      override public function addEventListener(param1:String, param2:Function) : void
      {
         if(param1 == Event.ENTER_FRAME && !hasEventListener(param1))
         {
            this.addEventListener(Event.ADDED_TO_STAGE,this.§_-82R§);
            this.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-u1h§);
            if(this.stage)
            {
               this.§_-82R§();
            }
         }
         super.addEventListener(param1,param2);
      }
      
      override public function removeEventListener(param1:String, param2:Function) : void
      {
         super.removeEventListener(param1,param2);
         if(param1 == Event.ENTER_FRAME && !hasEventListener(param1))
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-82R§);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-u1h§);
            this.§_-u1h§();
         }
      }
      
      override public function §_-b8§(param1:String = null) : void
      {
         if((param1 == null || param1 == Event.ENTER_FRAME) && hasEventListener(Event.ENTER_FRAME))
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-82R§);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-u1h§);
            this.§_-u1h§();
         }
         super.§_-b8§(param1);
      }
      
      private function §_-82R§() : void
      {
         Starling.§_-y1l§.stage.§_-O2c§(this);
      }
      
      private function §_-u1h§() : void
      {
         Starling.§_-y1l§.stage.§_-kx§(this);
      }
      
      public function get transformationMatrix() : Matrix
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.§_-j1x§)
         {
            this.§_-j1x§ = false;
            if(this.§_-H2b§ == 0 && this.§_-R2Q§ == 0)
            {
               if(this.§_-d2Y§ == 0)
               {
                  this.§_-52z§.setTo(this.§_-21g§,0,0,this.§_-bg§,this.§_-N3§ - this.§_-I1U§ * this.§_-21g§,this.§_-K10§ - this.§_-C3Z§ * this.§_-bg§);
               }
               else
               {
                  _loc1_ = Math.cos(this.§_-d2Y§);
                  _loc2_ = Math.sin(this.§_-d2Y§);
                  _loc3_ = this.§_-21g§ * _loc1_;
                  _loc4_ = this.§_-21g§ * _loc2_;
                  _loc5_ = this.§_-bg§ * -_loc2_;
                  _loc6_ = this.§_-bg§ * _loc1_;
                  _loc7_ = this.§_-N3§ - this.§_-I1U§ * _loc3_ - this.§_-C3Z§ * _loc5_;
                  _loc8_ = this.§_-K10§ - this.§_-I1U§ * _loc4_ - this.§_-C3Z§ * _loc6_;
                  this.§_-52z§.setTo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
               }
            }
            else
            {
               this.§_-52z§.identity();
               this.§_-52z§.scale(this.§_-21g§,this.§_-bg§);
               §_-rI§.§_-G2U§(this.§_-52z§,this.§_-H2b§,this.§_-R2Q§);
               this.§_-52z§.rotate(this.§_-d2Y§);
               this.§_-52z§.translate(this.§_-N3§,this.§_-K10§);
               if(this.§_-I1U§ != 0 || this.§_-C3Z§ != 0)
               {
                  this.§_-52z§.tx = this.§_-N3§ - this.§_-52z§.a * this.§_-I1U§ - this.§_-52z§.c * this.§_-C3Z§;
                  this.§_-52z§.ty = this.§_-K10§ - this.§_-52z§.b * this.§_-I1U§ - this.§_-52z§.d * this.§_-C3Z§;
               }
            }
         }
         return this.§_-52z§;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         var _loc2_:Number = Math.PI / 4;
         this.§_-j1x§ = false;
         this.§_-52z§.copyFrom(param1);
         this.§_-I1U§ = this.§_-C3Z§ = 0;
         this.§_-N3§ = param1.tx;
         this.§_-K10§ = param1.ty;
         this.§_-H2b§ = Math.atan(-param1.c / param1.d);
         this.§_-R2Q§ = Math.atan(param1.b / param1.a);
         if(this.§_-H2b§ != this.§_-H2b§)
         {
            this.§_-H2b§ = 0;
         }
         if(this.§_-R2Q§ != this.§_-R2Q§)
         {
            this.§_-R2Q§ = 0;
         }
         this.§_-bg§ = this.§_-H2b§ > -_loc2_ && this.§_-H2b§ < _loc2_ ? param1.d / Math.cos(this.§_-H2b§) : -param1.c / Math.sin(this.§_-H2b§);
         this.§_-21g§ = this.§_-R2Q§ > -_loc2_ && this.§_-R2Q§ < _loc2_ ? param1.a / Math.cos(this.§_-R2Q§) : param1.b / Math.sin(this.§_-R2Q§);
         if(this.§_-Re§(this.§_-H2b§,this.§_-R2Q§))
         {
            this.§_-d2Y§ = this.§_-H2b§;
            this.§_-H2b§ = this.§_-R2Q§ = 0;
         }
         else
         {
            this.§_-d2Y§ = 0;
         }
      }
      
      public function get transformationMatrix3D() : Matrix3D
      {
         if(this.mTransformationMatrix3D == null)
         {
            this.mTransformationMatrix3D = new Matrix3D();
         }
         return §_-rI§.convertTo3D(this.transformationMatrix,this.mTransformationMatrix3D);
      }
      
      public function get §_-zd§() : Boolean
      {
         return this.§_-S2e§;
      }
      
      public function get useHandCursor() : Boolean
      {
         return this.§_-S1w§;
      }
      
      public function set useHandCursor(param1:Boolean) : void
      {
         if(param1 == this.§_-S1w§)
         {
            return;
         }
         this.§_-S1w§ = param1;
         if(this.§_-S1w§)
         {
            this.addEventListener(TouchEvent.§_-N1l§,this.§_-V1M§);
         }
         else
         {
            this.removeEventListener(TouchEvent.§_-N1l§,this.§_-V1M§);
         }
      }
      
      private function §_-V1M§(param1:TouchEvent) : void
      {
         Mouse.cursor = param1.§_-V1Y§(this) ? MouseCursor.BUTTON : MouseCursor.AUTO;
      }
      
      public function get bounds() : Rectangle
      {
         return this.getBounds(this.§_-02V§);
      }
      
      public function get width() : Number
      {
         return this.getBounds(this.§_-02V§,§_-02i§).width;
      }
      
      public function set width(param1:Number) : void
      {
         this.scaleX = 1;
         var _loc2_:Number = this.width;
         if(_loc2_ != 0)
         {
            this.scaleX = param1 / _loc2_;
         }
      }
      
      public function get height() : Number
      {
         return this.getBounds(this.§_-02V§,§_-02i§).height;
      }
      
      public function set height(param1:Number) : void
      {
         this.scaleY = 1;
         var _loc2_:Number = this.height;
         if(_loc2_ != 0)
         {
            this.scaleY = param1 / _loc2_;
         }
      }
      
      public function get x() : Number
      {
         return this.§_-N3§;
      }
      
      public function set x(param1:Number) : void
      {
         if(this.§_-N3§ != param1)
         {
            this.§_-N3§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get y() : Number
      {
         return this.§_-K10§;
      }
      
      public function set y(param1:Number) : void
      {
         if(this.§_-K10§ != param1)
         {
            this.§_-K10§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get pivotX() : Number
      {
         return this.§_-I1U§;
      }
      
      public function set pivotX(param1:Number) : void
      {
         if(this.§_-I1U§ != param1)
         {
            this.§_-I1U§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get pivotY() : Number
      {
         return this.§_-C3Z§;
      }
      
      public function set pivotY(param1:Number) : void
      {
         if(this.§_-C3Z§ != param1)
         {
            this.§_-C3Z§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get scaleX() : Number
      {
         return this.§_-21g§;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this.§_-21g§ != param1)
         {
            this.§_-21g§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get scaleY() : Number
      {
         return this.§_-bg§;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this.§_-bg§ != param1)
         {
            this.§_-bg§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get scale() : Number
      {
         return this.scaleX;
      }
      
      public function set scale(param1:Number) : void
      {
         this.scaleX = this.scaleY = param1;
      }
      
      public function get skewX() : Number
      {
         return this.§_-H2b§;
      }
      
      public function set skewX(param1:Number) : void
      {
         param1 = §_-xD§.§_-83r§(param1);
         if(this.§_-H2b§ != param1)
         {
            this.§_-H2b§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get skewY() : Number
      {
         return this.§_-R2Q§;
      }
      
      public function set skewY(param1:Number) : void
      {
         param1 = §_-xD§.§_-83r§(param1);
         if(this.§_-R2Q§ != param1)
         {
            this.§_-R2Q§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get rotation() : Number
      {
         return this.§_-d2Y§;
      }
      
      public function set rotation(param1:Number) : void
      {
         param1 = §_-xD§.§_-83r§(param1);
         if(this.§_-d2Y§ != param1)
         {
            this.§_-d2Y§ = param1;
            this.§_-j1x§ = true;
         }
      }
      
      public function get alpha() : Number
      {
         return this.§_-2z§;
      }
      
      public function set alpha(param1:Number) : void
      {
         this.§_-2z§ = param1 < 0 ? 0 : (param1 > 1 ? 1 : param1);
      }
      
      public function get visible() : Boolean
      {
         return this.§_-O1h§;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.§_-O1h§ = param1;
      }
      
      public function get touchable() : Boolean
      {
         return this.§_-K2Z§;
      }
      
      public function set touchable(param1:Boolean) : void
      {
         this.§_-K2Z§ = param1;
      }
      
      public function get blendMode() : String
      {
         return this.§_-91B§;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.§_-91B§ = param1;
      }
      
      public function get name() : String
      {
         return this.§_-W2R§;
      }
      
      public function set name(param1:String) : void
      {
         this.§_-W2R§ = param1;
      }
      
      public function get filter() : FragmentFilter
      {
         return this.§_-M25§;
      }
      
      public function set filter(param1:FragmentFilter) : void
      {
         this.§_-M25§ = param1;
      }
      
      public function get mask() : DisplayObject
      {
         return this.§_-RY§;
      }
      
      public function set mask(param1:DisplayObject) : void
      {
         if(this.§_-RY§ != param1)
         {
            if(this.§_-RY§)
            {
               this.§_-RY§.§_-12W§ = false;
            }
            if(param1)
            {
               param1.§_-12W§ = true;
            }
            this.§_-RY§ = param1;
         }
      }
      
      public function get parent() : DisplayObjectContainer
      {
         return this.§_-02V§;
      }
      
      public function get base() : DisplayObject
      {
         var _loc1_:DisplayObject = this;
         while(_loc1_.§_-02V§)
         {
            _loc1_ = _loc1_.§_-02V§;
         }
         return _loc1_;
      }
      
      public function get root() : DisplayObject
      {
         var _loc1_:DisplayObject = this;
         while(_loc1_.§_-02V§)
         {
            if(_loc1_.§_-02V§ is Stage)
            {
               return _loc1_;
            }
            _loc1_ = _loc1_.parent;
         }
         return null;
      }
      
      public function get stage() : Stage
      {
         return this.base as Stage;
      }
   }
}


package starling.display
{
   import §_-625§.§_-Bw§;
   import §_-625§.§_-F1v§;
   import §_-f1T§.Event;
   import §_-f1T§.EventDispatcher;
   import §_-f1T§.TouchEvent;
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
   import starling.core.§_-wz§;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-42b§;
   import starling.utils.§_-U2x§;
   import starling.utils.§_-r1p§;
   import starling.utils.§_-t1m§;
   
   public class DisplayObject extends EventDispatcher
   {
      
      private static var §_-718§:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private static var §_-O§:Point = new Point();
      
      private static var sHelperPoint3D:Vector3D = new Vector3D();
      
      private static var §_-kT§:Vector3D = new Vector3D();
      
      private static var §_-T1w§:Rectangle = new Rectangle();
      
      private static var §_-7w§:Matrix = new Matrix();
      
      private static var §_-B1S§:Matrix = new Matrix();
      
      private static var sHelperMatrix3D:Matrix3D = new Matrix3D();
      
      private static var sHelperMatrixAlt3D:Matrix3D = new Matrix3D();
      
      private var §_-1j§:Number;
      
      private var §_-9W§:Number;
      
      private var §_-f3§:Number;
      
      private var §_-c1t§:Number;
      
      private var §_-63t§:Number;
      
      private var §_-L2S§:Number;
      
      private var §_-8h§:Number;
      
      private var §_-lB§:Number;
      
      private var §_-A18§:Number;
      
      private var §_-H1i§:Number;
      
      private var §_-V4§:Boolean;
      
      private var §_-51t§:Boolean;
      
      private var §_-u2C§:String;
      
      private var §_-i2x§:String;
      
      private var §_-K1Q§:Boolean;
      
      private var §_-W20§:DisplayObjectContainer;
      
      private var §_-J2v§:Matrix;
      
      private var mTransformationMatrix3D:Matrix3D;
      
      private var §_-N2F§:Boolean;
      
      private var §_-A2K§:FragmentFilter;
      
      private var §_-D15§:Boolean;
      
      private var §_-k§:DisplayObject;
      
      private var §_-yi§:Boolean;
      
      public function DisplayObject()
      {
         super();
         if(Capabilities.isDebugger && getQualifiedClassName(this) == "starling.display::DisplayObject")
         {
            throw new §_-F1v§();
         }
         this.§_-1j§ = this.§_-9W§ = this.§_-f3§ = this.§_-c1t§ = this.§_-A18§ = this.§_-8h§ = this.§_-lB§ = 0;
         this.§_-63t§ = this.§_-L2S§ = this.§_-H1i§ = 1;
         this.§_-V4§ = this.§_-51t§ = true;
         this.§_-u2C§ = BlendMode.AUTO;
         this.§_-J2v§ = new Matrix();
         this.§_-N2F§ = this.§_-K1Q§ = false;
      }
      
      public function dispose() : void
      {
         if(this.§_-A2K§)
         {
            this.§_-A2K§.dispose();
         }
         if(this.§_-k§)
         {
            this.§_-k§.dispose();
         }
         this.§_-b1M§();
         this.mask = null;
      }
      
      public function removeFromParent(param1:Boolean = false) : void
      {
         if(this.§_-W20§)
         {
            this.§_-W20§.removeChild(this,param1);
         }
         else if(param1)
         {
            this.dispose();
         }
      }
      
      public function §_-R1D§(param1:DisplayObject, param2:Matrix = null) : Matrix
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
         if(param1 == this.§_-W20§ || param1 == null && this.§_-W20§ == null)
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
               _loc4_ = _loc4_.§_-W20§;
            }
            return param2;
         }
         if(param1.§_-W20§ == this)
         {
            param1.§_-R1D§(this,param2);
            param2.invert();
            return param2;
         }
         _loc3_ = this.§_-q15§(this,param1);
         _loc4_ = this;
         while(_loc4_ != _loc3_)
         {
            param2.concat(_loc4_.transformationMatrix);
            _loc4_ = _loc4_.§_-W20§;
         }
         if(_loc3_ == param1)
         {
            return param2;
         }
         §_-7w§.identity();
         _loc4_ = param1;
         while(_loc4_ != _loc3_)
         {
            §_-7w§.concat(_loc4_.transformationMatrix);
            _loc4_ = _loc4_.§_-W20§;
         }
         §_-7w§.invert();
         param2.concat(§_-7w§);
         return param2;
      }
      
      public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         throw new §_-Bw§();
      }
      
      public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!this.§_-V4§ || !this.§_-51t§))
         {
            return null;
         }
         if(Boolean(this.§_-k§) && !this.§_-Dz§(param1))
         {
            return null;
         }
         if(this.getBounds(this,§_-T1w§).containsPoint(param1))
         {
            return this;
         }
         return null;
      }
      
      public function §_-Dz§(param1:Point) : Boolean
      {
         var _loc2_:Point = null;
         if(this.§_-k§)
         {
            if(this.§_-k§.stage)
            {
               this.§_-R1D§(this.§_-k§,§_-B1S§);
            }
            else
            {
               §_-B1S§.copyFrom(this.§_-k§.transformationMatrix);
               §_-B1S§.invert();
            }
            _loc2_ = param1 == §_-O§ ? new Point() : §_-O§;
            §_-r1p§.§_-M7§(§_-B1S§,param1,_loc2_);
            return this.§_-k§.hitTest(_loc2_,true) != null;
         }
         return true;
      }
      
      public function localToGlobal(param1:Point, param2:Point = null) : Point
      {
         if(this.§_-z1T§)
         {
            sHelperPoint3D.setTo(param1.x,param1.y,0);
            return this.§_-f1d§(sHelperPoint3D,param2);
         }
         this.§_-R1D§(this.base,§_-B1S§);
         return §_-r1p§.§_-M7§(§_-B1S§,param1,param2);
      }
      
      public function globalToLocal(param1:Point, param2:Point = null) : Point
      {
         if(this.§_-z1T§)
         {
            this.globalToLocal3D(param1,sHelperPoint3D);
            this.stage.§_-S28§(this,§_-kT§);
            return §_-t1m§.§_-Y1O§(§_-kT§,sHelperPoint3D,param2);
         }
         this.§_-R1D§(this.base,§_-B1S§);
         §_-B1S§.invert();
         return §_-r1p§.§_-M7§(§_-B1S§,param1,param2);
      }
      
      public function render(param1:§_-wz§, param2:Number) : void
      {
         throw new §_-Bw§();
      }
      
      public function get §_-L1e§() : Boolean
      {
         return this.§_-H1i§ != 0 && this.§_-V4§ && !this.§_-yi§ && this.§_-63t§ != 0 && this.§_-L2S§ != 0;
      }
      
      public function §_-i18§(param1:String = "center", param2:String = "center") : void
      {
         var _loc3_:Rectangle = this.getBounds(this,§_-T1w§);
         this.§_-N2F§ = true;
         if(param1 == §_-U2x§.LEFT)
         {
            this.§_-f3§ = _loc3_.x;
         }
         else if(param1 == §_-U2x§.CENTER)
         {
            this.§_-f3§ = _loc3_.x + _loc3_.width / 2;
         }
         else
         {
            if(param1 != §_-U2x§.RIGHT)
            {
               throw new ArgumentError("Invalid horizontal alignment: " + param1);
            }
            this.§_-f3§ = _loc3_.x + _loc3_.width;
         }
         if(param2 == §_-42b§.TOP)
         {
            this.§_-c1t§ = _loc3_.y;
         }
         else if(param2 == §_-42b§.CENTER)
         {
            this.§_-c1t§ = _loc3_.y + _loc3_.height / 2;
         }
         else
         {
            if(param2 != §_-42b§.BOTTOM)
            {
               throw new ArgumentError("Invalid vertical alignment: " + param2);
            }
            this.§_-c1t§ = _loc3_.y + _loc3_.height;
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
         if(param1 == this.§_-W20§ || param1 == null && this.§_-W20§ == null)
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
               _loc4_ = _loc4_.§_-W20§;
            }
            return param2;
         }
         if(param1.§_-W20§ == this)
         {
            param1.getTransformationMatrix3D(this,param2);
            param2.invert();
            return param2;
         }
         _loc3_ = this.§_-q15§(this,param1);
         _loc4_ = this;
         while(_loc4_ != _loc3_)
         {
            param2.append(_loc4_.transformationMatrix3D);
            _loc4_ = _loc4_.§_-W20§;
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
            _loc4_ = _loc4_.§_-W20§;
         }
         sHelperMatrix3D.invert();
         param2.append(sHelperMatrix3D);
         return param2;
      }
      
      public function §_-f1d§(param1:Vector3D, param2:Point = null) : Point
      {
         var _loc3_:Stage = this.stage;
         if(_loc3_ == null)
         {
            throw new IllegalOperationError("Object not connected to stage");
         }
         this.getTransformationMatrix3D(_loc3_,sHelperMatrixAlt3D);
         §_-r1p§.transformPoint3D(sHelperMatrixAlt3D,param1,sHelperPoint3D);
         return §_-t1m§.§_-Y1O§(_loc3_.§_-oy§,sHelperPoint3D,param2);
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
         return §_-r1p§.transformCoords3D(sHelperMatrixAlt3D,param1.x,param1.y,0,param2);
      }
      
      internal function §_-31J§(param1:DisplayObjectContainer) : void
      {
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != this && _loc2_ != null)
         {
            _loc2_ = _loc2_.§_-W20§;
         }
         if(_loc2_ == this)
         {
            throw new ArgumentError("An object cannot be added as a child to itself or one " + "of its children (or children\'s children, etc.)");
         }
         this.§_-W20§ = param1;
      }
      
      internal function §_-02E§(param1:Boolean) : void
      {
         this.§_-D15§ = param1;
      }
      
      internal function get §_-p2S§() : Boolean
      {
         return this.§_-yi§;
      }
      
      final private function §_-62w§(param1:Number, param2:Number, param3:Number = 0.0001) : Boolean
      {
         return param1 - param3 < param2 && param1 + param3 > param2;
      }
      
      final private function §_-q15§(param1:DisplayObject, param2:DisplayObject) : DisplayObject
      {
         var _loc3_:DisplayObject = param1;
         while(_loc3_)
         {
            §_-718§[§_-718§.length] = _loc3_;
            _loc3_ = _loc3_.§_-W20§;
         }
         _loc3_ = param2;
         while(Boolean(_loc3_) && §_-718§.indexOf(_loc3_) == -1)
         {
            _loc3_ = _loc3_.§_-W20§;
         }
         §_-718§.length = 0;
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
            this.addEventListener(Event.ADDED_TO_STAGE,this.§_-12M§);
            this.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-v2O§);
            if(this.stage)
            {
               this.§_-12M§();
            }
         }
         super.addEventListener(param1,param2);
      }
      
      override public function removeEventListener(param1:String, param2:Function) : void
      {
         super.removeEventListener(param1,param2);
         if(param1 == Event.ENTER_FRAME && !hasEventListener(param1))
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-12M§);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-v2O§);
            this.§_-v2O§();
         }
      }
      
      override public function §_-b1M§(param1:String = null) : void
      {
         if((param1 == null || param1 == Event.ENTER_FRAME) && hasEventListener(Event.ENTER_FRAME))
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-12M§);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-v2O§);
            this.§_-v2O§();
         }
         super.§_-b1M§(param1);
      }
      
      private function §_-12M§() : void
      {
         Starling.§_-n1s§.stage.§_-W1U§(this);
      }
      
      private function §_-v2O§() : void
      {
         Starling.§_-n1s§.stage.§_-f1O§(this);
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
         if(this.§_-N2F§)
         {
            this.§_-N2F§ = false;
            if(this.§_-8h§ == 0 && this.§_-lB§ == 0)
            {
               if(this.§_-A18§ == 0)
               {
                  this.§_-J2v§.setTo(this.§_-63t§,0,0,this.§_-L2S§,this.§_-1j§ - this.§_-f3§ * this.§_-63t§,this.§_-9W§ - this.§_-c1t§ * this.§_-L2S§);
               }
               else
               {
                  _loc1_ = Math.cos(this.§_-A18§);
                  _loc2_ = Math.sin(this.§_-A18§);
                  _loc3_ = this.§_-63t§ * _loc1_;
                  _loc4_ = this.§_-63t§ * _loc2_;
                  _loc5_ = this.§_-L2S§ * -_loc2_;
                  _loc6_ = this.§_-L2S§ * _loc1_;
                  _loc7_ = this.§_-1j§ - this.§_-f3§ * _loc3_ - this.§_-c1t§ * _loc5_;
                  _loc8_ = this.§_-9W§ - this.§_-f3§ * _loc4_ - this.§_-c1t§ * _loc6_;
                  this.§_-J2v§.setTo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
               }
            }
            else
            {
               this.§_-J2v§.identity();
               this.§_-J2v§.scale(this.§_-63t§,this.§_-L2S§);
               §_-r1p§.§_-S1b§(this.§_-J2v§,this.§_-8h§,this.§_-lB§);
               this.§_-J2v§.rotate(this.§_-A18§);
               this.§_-J2v§.translate(this.§_-1j§,this.§_-9W§);
               if(this.§_-f3§ != 0 || this.§_-c1t§ != 0)
               {
                  this.§_-J2v§.tx = this.§_-1j§ - this.§_-J2v§.a * this.§_-f3§ - this.§_-J2v§.c * this.§_-c1t§;
                  this.§_-J2v§.ty = this.§_-9W§ - this.§_-J2v§.b * this.§_-f3§ - this.§_-J2v§.d * this.§_-c1t§;
               }
            }
         }
         return this.§_-J2v§;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         var _loc2_:Number = Math.PI / 4;
         this.§_-N2F§ = false;
         this.§_-J2v§.copyFrom(param1);
         this.§_-f3§ = this.§_-c1t§ = 0;
         this.§_-1j§ = param1.tx;
         this.§_-9W§ = param1.ty;
         this.§_-8h§ = Math.atan(-param1.c / param1.d);
         this.§_-lB§ = Math.atan(param1.b / param1.a);
         if(this.§_-8h§ != this.§_-8h§)
         {
            this.§_-8h§ = 0;
         }
         if(this.§_-lB§ != this.§_-lB§)
         {
            this.§_-lB§ = 0;
         }
         this.§_-L2S§ = this.§_-8h§ > -_loc2_ && this.§_-8h§ < _loc2_ ? param1.d / Math.cos(this.§_-8h§) : -param1.c / Math.sin(this.§_-8h§);
         this.§_-63t§ = this.§_-lB§ > -_loc2_ && this.§_-lB§ < _loc2_ ? param1.a / Math.cos(this.§_-lB§) : param1.b / Math.sin(this.§_-lB§);
         if(this.§_-62w§(this.§_-8h§,this.§_-lB§))
         {
            this.§_-A18§ = this.§_-8h§;
            this.§_-8h§ = this.§_-lB§ = 0;
         }
         else
         {
            this.§_-A18§ = 0;
         }
      }
      
      public function get transformationMatrix3D() : Matrix3D
      {
         if(this.mTransformationMatrix3D == null)
         {
            this.mTransformationMatrix3D = new Matrix3D();
         }
         return §_-r1p§.convertTo3D(this.transformationMatrix,this.mTransformationMatrix3D);
      }
      
      public function get §_-z1T§() : Boolean
      {
         return this.§_-D15§;
      }
      
      public function get useHandCursor() : Boolean
      {
         return this.§_-K1Q§;
      }
      
      public function set useHandCursor(param1:Boolean) : void
      {
         if(param1 == this.§_-K1Q§)
         {
            return;
         }
         this.§_-K1Q§ = param1;
         if(this.§_-K1Q§)
         {
            this.addEventListener(TouchEvent.§_-qu§,this.§_-51§);
         }
         else
         {
            this.removeEventListener(TouchEvent.§_-qu§,this.§_-51§);
         }
      }
      
      private function §_-51§(param1:TouchEvent) : void
      {
         Mouse.cursor = param1.§_-BA§(this) ? MouseCursor.BUTTON : MouseCursor.AUTO;
      }
      
      public function get bounds() : Rectangle
      {
         return this.getBounds(this.§_-W20§);
      }
      
      public function get width() : Number
      {
         return this.getBounds(this.§_-W20§,§_-T1w§).width;
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
         return this.getBounds(this.§_-W20§,§_-T1w§).height;
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
         return this.§_-1j§;
      }
      
      public function set x(param1:Number) : void
      {
         if(this.§_-1j§ != param1)
         {
            this.§_-1j§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get y() : Number
      {
         return this.§_-9W§;
      }
      
      public function set y(param1:Number) : void
      {
         if(this.§_-9W§ != param1)
         {
            this.§_-9W§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get pivotX() : Number
      {
         return this.§_-f3§;
      }
      
      public function set pivotX(param1:Number) : void
      {
         if(this.§_-f3§ != param1)
         {
            this.§_-f3§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get pivotY() : Number
      {
         return this.§_-c1t§;
      }
      
      public function set pivotY(param1:Number) : void
      {
         if(this.§_-c1t§ != param1)
         {
            this.§_-c1t§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get scaleX() : Number
      {
         return this.§_-63t§;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this.§_-63t§ != param1)
         {
            this.§_-63t§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get scaleY() : Number
      {
         return this.§_-L2S§;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this.§_-L2S§ != param1)
         {
            this.§_-L2S§ = param1;
            this.§_-N2F§ = true;
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
         return this.§_-8h§;
      }
      
      public function set skewX(param1:Number) : void
      {
         param1 = §_-t1m§.§_-o1S§(param1);
         if(this.§_-8h§ != param1)
         {
            this.§_-8h§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get skewY() : Number
      {
         return this.§_-lB§;
      }
      
      public function set skewY(param1:Number) : void
      {
         param1 = §_-t1m§.§_-o1S§(param1);
         if(this.§_-lB§ != param1)
         {
            this.§_-lB§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get rotation() : Number
      {
         return this.§_-A18§;
      }
      
      public function set rotation(param1:Number) : void
      {
         param1 = §_-t1m§.§_-o1S§(param1);
         if(this.§_-A18§ != param1)
         {
            this.§_-A18§ = param1;
            this.§_-N2F§ = true;
         }
      }
      
      public function get alpha() : Number
      {
         return this.§_-H1i§;
      }
      
      public function set alpha(param1:Number) : void
      {
         this.§_-H1i§ = param1 < 0 ? 0 : (param1 > 1 ? 1 : param1);
      }
      
      public function get visible() : Boolean
      {
         return this.§_-V4§;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.§_-V4§ = param1;
      }
      
      public function get touchable() : Boolean
      {
         return this.§_-51t§;
      }
      
      public function set touchable(param1:Boolean) : void
      {
         this.§_-51t§ = param1;
      }
      
      public function get blendMode() : String
      {
         return this.§_-u2C§;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.§_-u2C§ = param1;
      }
      
      public function get name() : String
      {
         return this.§_-i2x§;
      }
      
      public function set name(param1:String) : void
      {
         this.§_-i2x§ = param1;
      }
      
      public function get filter() : FragmentFilter
      {
         return this.§_-A2K§;
      }
      
      public function set filter(param1:FragmentFilter) : void
      {
         this.§_-A2K§ = param1;
      }
      
      public function get mask() : DisplayObject
      {
         return this.§_-k§;
      }
      
      public function set mask(param1:DisplayObject) : void
      {
         if(this.§_-k§ != param1)
         {
            if(this.§_-k§)
            {
               this.§_-k§.§_-yi§ = false;
            }
            if(param1)
            {
               param1.§_-yi§ = true;
            }
            this.§_-k§ = param1;
         }
      }
      
      public function get parent() : DisplayObjectContainer
      {
         return this.§_-W20§;
      }
      
      public function get base() : DisplayObject
      {
         var _loc1_:DisplayObject = this;
         while(_loc1_.§_-W20§)
         {
            _loc1_ = _loc1_.§_-W20§;
         }
         return _loc1_;
      }
      
      public function get root() : DisplayObject
      {
         var _loc1_:DisplayObject = this;
         while(_loc1_.§_-W20§)
         {
            if(_loc1_.§_-W20§ is Stage)
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


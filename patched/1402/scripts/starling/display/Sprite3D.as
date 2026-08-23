package starling.display
{
   import §_-f1T§.Event;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import starling.core.§_-wz§;
   import starling.utils.§_-r1p§;
   import starling.utils.§_-t1m§;
   import starling.utils.rad2deg;
   
   public class Sprite3D extends DisplayObjectContainer
   {
      
      private static const E:Number = 0.00001;
      
      private static var §_-O§:Vector3D = new Vector3D();
      
      private static var §_-a1c§:Vector3D = new Vector3D();
      
      private static var §_-7w§:Matrix3D = new Matrix3D();
      
      private var §_-SE§:Number;
      
      private var §_-P2E§:Number;
      
      private var §_-De§:Number;
      
      private var §_-h1e§:Number;
      
      private var §_-H1p§:Number;
      
      private var §_-J2v§:Matrix;
      
      private var mTransformationMatrix3D:Matrix3D;
      
      private var §_-M1m§:Boolean;
      
      public function Sprite3D()
      {
         super();
         this.§_-De§ = 1;
         this.§_-SE§ = this.§_-P2E§ = this.§_-h1e§ = this.§_-H1p§ = 0;
         this.§_-J2v§ = new Matrix();
         this.mTransformationMatrix3D = new Matrix3D();
         §_-02E§(true);
         addEventListener(Event.ADDED,this.§_-Jy§);
         addEventListener(Event.REMOVED,this.§_-a2u§);
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         if(this.§_-E1s§)
         {
            super.render(param1,param2);
         }
         else
         {
            param1.§_-z24§();
            param1.pushMatrix3D();
            param1.transformMatrix3D(this);
            super.render(param1,param2);
            param1.§_-z24§();
            param1.popMatrix3D();
         }
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(this.§_-E1s§)
         {
            return super.hitTest(param1,param2);
         }
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         §_-7w§.copyFrom(this.transformationMatrix3D);
         §_-7w§.invert();
         stage.§_-S28§(this,§_-O§);
         §_-r1p§.transformCoords3D(§_-7w§,param1.x,param1.y,0,§_-a1c§);
         §_-t1m§.§_-Y1O§(§_-O§,§_-a1c§,param1);
         return super.hitTest(param1,param2);
      }
      
      private function §_-Jy§(param1:Event) : void
      {
         this.§_-g1b§(param1.target as DisplayObject,true);
      }
      
      private function §_-a2u§(param1:Event) : void
      {
         this.§_-g1b§(param1.target as DisplayObject,false);
      }
      
      private function §_-g1b§(param1:DisplayObject, param2:Boolean) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is Sprite3D)
         {
            return;
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = param1 as DisplayObjectContainer;
            _loc4_ = _loc3_.numChildren;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               this.§_-g1b§(_loc3_.getChildAt(_loc5_),param2);
               _loc5_++;
            }
         }
         param1.§_-02E§(param2);
      }
      
      private function §_-m1F§() : void
      {
         var _loc1_:Number = this.x;
         var _loc2_:Number = this.y;
         var _loc3_:Number = this.scaleX;
         var _loc4_:Number = this.scaleY;
         var _loc5_:Number = this.pivotX;
         var _loc6_:Number = this.pivotY;
         var _loc7_:Number = this.rotation;
         this.mTransformationMatrix3D.identity();
         if(_loc3_ != 1 || _loc4_ != 1 || this.§_-De§ != 1)
         {
            this.mTransformationMatrix3D.appendScale(_loc3_ || E,_loc4_ || E,this.§_-De§ || E);
         }
         if(this.§_-SE§ != 0)
         {
            this.mTransformationMatrix3D.appendRotation(rad2deg(this.§_-SE§),Vector3D.X_AXIS);
         }
         if(this.§_-P2E§ != 0)
         {
            this.mTransformationMatrix3D.appendRotation(rad2deg(this.§_-P2E§),Vector3D.Y_AXIS);
         }
         if(_loc7_ != 0)
         {
            this.mTransformationMatrix3D.appendRotation(rad2deg(_loc7_),Vector3D.Z_AXIS);
         }
         if(_loc1_ != 0 || _loc2_ != 0 || this.§_-H1p§ != 0)
         {
            this.mTransformationMatrix3D.appendTranslation(_loc1_,_loc2_,this.§_-H1p§);
         }
         if(_loc5_ != 0 || _loc6_ != 0 || this.§_-h1e§ != 0)
         {
            this.mTransformationMatrix3D.prependTranslation(-_loc5_,-_loc6_,-this.§_-h1e§);
         }
         if(this.§_-E1s§)
         {
            §_-r1p§.convertTo2D(this.mTransformationMatrix3D,this.§_-J2v§);
         }
         else
         {
            this.§_-J2v§.identity();
         }
      }
      
      final private function get §_-E1s§() : Boolean
      {
         return this.§_-H1p§ > -E && this.§_-H1p§ < E && this.§_-SE§ > -E && this.§_-SE§ < E && this.§_-P2E§ > -E && this.§_-P2E§ < E && this.§_-h1e§ > -E && this.§_-h1e§ < E;
      }
      
      override public function get transformationMatrix() : Matrix
      {
         if(this.§_-M1m§)
         {
            this.§_-m1F§();
            this.§_-M1m§ = false;
         }
         return this.§_-J2v§;
      }
      
      override public function set transformationMatrix(param1:Matrix) : void
      {
         super.transformationMatrix = param1;
         this.§_-SE§ = this.§_-P2E§ = this.§_-h1e§ = this.§_-H1p§ = 0;
         this.§_-M1m§ = true;
      }
      
      override public function get transformationMatrix3D() : Matrix3D
      {
         if(this.§_-M1m§)
         {
            this.§_-m1F§();
            this.§_-M1m§ = false;
         }
         return this.mTransformationMatrix3D;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         this.§_-M1m§ = true;
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         this.§_-M1m§ = true;
      }
      
      public function get z() : Number
      {
         return this.§_-H1p§;
      }
      
      public function set z(param1:Number) : void
      {
         this.§_-H1p§ = param1;
         this.§_-M1m§ = true;
      }
      
      override public function set pivotX(param1:Number) : void
      {
         super.pivotX = param1;
         this.§_-M1m§ = true;
      }
      
      override public function set pivotY(param1:Number) : void
      {
         super.pivotY = param1;
         this.§_-M1m§ = true;
      }
      
      public function get §_-p1m§() : Number
      {
         return this.§_-h1e§;
      }
      
      public function set §_-p1m§(param1:Number) : void
      {
         this.§_-h1e§ = param1;
         this.§_-M1m§ = true;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         super.scaleX = param1;
         this.§_-M1m§ = true;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         super.scaleY = param1;
         this.§_-M1m§ = true;
      }
      
      public function get §_-A1U§() : Number
      {
         return this.§_-De§;
      }
      
      public function set §_-A1U§(param1:Number) : void
      {
         this.§_-De§ = param1;
         this.§_-M1m§ = true;
      }
      
      override public function set skewX(param1:Number) : void
      {
         throw new Error("3D objects do not support skewing");
      }
      
      override public function set skewY(param1:Number) : void
      {
         throw new Error("3D objects do not support skewing");
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         this.§_-M1m§ = true;
      }
      
      public function get §_-Aw§() : Number
      {
         return this.§_-SE§;
      }
      
      public function set §_-Aw§(param1:Number) : void
      {
         this.§_-SE§ = §_-t1m§.§_-o1S§(param1);
         this.§_-M1m§ = true;
      }
      
      public function get §_-g2c§() : Number
      {
         return this.§_-P2E§;
      }
      
      public function set §_-g2c§(param1:Number) : void
      {
         this.§_-P2E§ = §_-t1m§.§_-o1S§(param1);
         this.§_-M1m§ = true;
      }
      
      public function get §_-r26§() : Number
      {
         return rotation;
      }
      
      public function set §_-r26§(param1:Number) : void
      {
         this.rotation = param1;
      }
   }
}


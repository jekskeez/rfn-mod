package starling.display
{
   import §_-K2c§.Event;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import starling.core.§_-T2v§;
   import starling.utils.§_-rI§;
   import starling.utils.§_-xD§;
   import starling.utils.rad2deg;
   
   public class Sprite3D extends DisplayObjectContainer
   {
      
      private static const E:Number = 0.00001;
      
      private static var §_-G2g§:Vector3D = new Vector3D();
      
      private static var §_-h2U§:Vector3D = new Vector3D();
      
      private static var §_-S19§:Matrix3D = new Matrix3D();
      
      private var §_-Hn§:Number;
      
      private var §_-j1a§:Number;
      
      private var §_-K1T§:Number;
      
      private var §_-Nl§:Number;
      
      private var §_-DM§:Number;
      
      private var §_-52z§:Matrix;
      
      private var mTransformationMatrix3D:Matrix3D;
      
      private var §_-nm§:Boolean;
      
      public function Sprite3D()
      {
         super();
         this.§_-K1T§ = 1;
         this.§_-Hn§ = this.§_-j1a§ = this.§_-Nl§ = this.§_-DM§ = 0;
         this.§_-52z§ = new Matrix();
         this.mTransformationMatrix3D = new Matrix3D();
         §_-ob§(true);
         addEventListener(Event.ADDED,this.§_-ZR§);
         addEventListener(Event.REMOVED,this.§_-aO§);
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         if(this.§_-M1O§)
         {
            super.render(param1,param2);
         }
         else
         {
            param1.§_-A1U§();
            param1.pushMatrix3D();
            param1.transformMatrix3D(this);
            super.render(param1,param2);
            param1.§_-A1U§();
            param1.popMatrix3D();
         }
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(this.§_-M1O§)
         {
            return super.hitTest(param1,param2);
         }
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         §_-S19§.copyFrom(this.transformationMatrix3D);
         §_-S19§.invert();
         stage.§_-79§(this,§_-G2g§);
         §_-rI§.transformCoords3D(§_-S19§,param1.x,param1.y,0,§_-h2U§);
         §_-xD§.§_-mR§(§_-G2g§,§_-h2U§,param1);
         return super.hitTest(param1,param2);
      }
      
      private function §_-ZR§(param1:Event) : void
      {
         this.§_-g20§(param1.target as DisplayObject,true);
      }
      
      private function §_-aO§(param1:Event) : void
      {
         this.§_-g20§(param1.target as DisplayObject,false);
      }
      
      private function §_-g20§(param1:DisplayObject, param2:Boolean) : void
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
               this.§_-g20§(_loc3_.getChildAt(_loc5_),param2);
               _loc5_++;
            }
         }
         param1.§_-ob§(param2);
      }
      
      private function §_-a1E§() : void
      {
         var _loc1_:Number = this.x;
         var _loc2_:Number = this.y;
         var _loc3_:Number = this.scaleX;
         var _loc4_:Number = this.scaleY;
         var _loc5_:Number = this.pivotX;
         var _loc6_:Number = this.pivotY;
         var _loc7_:Number = this.rotation;
         this.mTransformationMatrix3D.identity();
         if(_loc3_ != 1 || _loc4_ != 1 || this.§_-K1T§ != 1)
         {
            this.mTransformationMatrix3D.appendScale(_loc3_ || E,_loc4_ || E,this.§_-K1T§ || E);
         }
         if(this.§_-Hn§ != 0)
         {
            this.mTransformationMatrix3D.appendRotation(rad2deg(this.§_-Hn§),Vector3D.X_AXIS);
         }
         if(this.§_-j1a§ != 0)
         {
            this.mTransformationMatrix3D.appendRotation(rad2deg(this.§_-j1a§),Vector3D.Y_AXIS);
         }
         if(_loc7_ != 0)
         {
            this.mTransformationMatrix3D.appendRotation(rad2deg(_loc7_),Vector3D.Z_AXIS);
         }
         if(_loc1_ != 0 || _loc2_ != 0 || this.§_-DM§ != 0)
         {
            this.mTransformationMatrix3D.appendTranslation(_loc1_,_loc2_,this.§_-DM§);
         }
         if(_loc5_ != 0 || _loc6_ != 0 || this.§_-Nl§ != 0)
         {
            this.mTransformationMatrix3D.prependTranslation(-_loc5_,-_loc6_,-this.§_-Nl§);
         }
         if(this.§_-M1O§)
         {
            §_-rI§.convertTo2D(this.mTransformationMatrix3D,this.§_-52z§);
         }
         else
         {
            this.§_-52z§.identity();
         }
      }
      
      final private function get §_-M1O§() : Boolean
      {
         return this.§_-DM§ > -E && this.§_-DM§ < E && this.§_-Hn§ > -E && this.§_-Hn§ < E && this.§_-j1a§ > -E && this.§_-j1a§ < E && this.§_-Nl§ > -E && this.§_-Nl§ < E;
      }
      
      override public function get transformationMatrix() : Matrix
      {
         if(this.§_-nm§)
         {
            this.§_-a1E§();
            this.§_-nm§ = false;
         }
         return this.§_-52z§;
      }
      
      override public function set transformationMatrix(param1:Matrix) : void
      {
         super.transformationMatrix = param1;
         this.§_-Hn§ = this.§_-j1a§ = this.§_-Nl§ = this.§_-DM§ = 0;
         this.§_-nm§ = true;
      }
      
      override public function get transformationMatrix3D() : Matrix3D
      {
         if(this.§_-nm§)
         {
            this.§_-a1E§();
            this.§_-nm§ = false;
         }
         return this.mTransformationMatrix3D;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         this.§_-nm§ = true;
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         this.§_-nm§ = true;
      }
      
      public function get z() : Number
      {
         return this.§_-DM§;
      }
      
      public function set z(param1:Number) : void
      {
         this.§_-DM§ = param1;
         this.§_-nm§ = true;
      }
      
      override public function set pivotX(param1:Number) : void
      {
         super.pivotX = param1;
         this.§_-nm§ = true;
      }
      
      override public function set pivotY(param1:Number) : void
      {
         super.pivotY = param1;
         this.§_-nm§ = true;
      }
      
      public function get §_-f9§() : Number
      {
         return this.§_-Nl§;
      }
      
      public function set §_-f9§(param1:Number) : void
      {
         this.§_-Nl§ = param1;
         this.§_-nm§ = true;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         super.scaleX = param1;
         this.§_-nm§ = true;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         super.scaleY = param1;
         this.§_-nm§ = true;
      }
      
      public function get §_-Rw§() : Number
      {
         return this.§_-K1T§;
      }
      
      public function set §_-Rw§(param1:Number) : void
      {
         this.§_-K1T§ = param1;
         this.§_-nm§ = true;
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
         this.§_-nm§ = true;
      }
      
      public function get §_-G1A§() : Number
      {
         return this.§_-Hn§;
      }
      
      public function set §_-G1A§(param1:Number) : void
      {
         this.§_-Hn§ = §_-xD§.§_-83r§(param1);
         this.§_-nm§ = true;
      }
      
      public function get §_-Z2Z§() : Number
      {
         return this.§_-j1a§;
      }
      
      public function set §_-Z2Z§(param1:Number) : void
      {
         this.§_-j1a§ = §_-xD§.§_-83r§(param1);
         this.§_-nm§ = true;
      }
      
      public function get §_-k2n§() : Number
      {
         return rotation;
      }
      
      public function set §_-k2n§(param1:Number) : void
      {
         this.rotation = param1;
      }
   }
}


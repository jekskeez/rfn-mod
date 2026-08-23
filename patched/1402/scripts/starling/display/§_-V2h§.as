package starling.display
{
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import starling.core.§_-wz§;
   import starling.utils.§_-U2i§;
   
   public class §_-V2h§ extends DisplayObject
   {
      
      private static var §_-O§:Point = new Point();
      
      private static var sHelperPoint3D:Vector3D = new Vector3D();
      
      private static var §_-7w§:Matrix = new Matrix();
      
      private static var sHelperMatrix3D:Matrix3D = new Matrix3D();
      
      private var §_-O2F§:Boolean;
      
      protected var §_-Q1L§:§_-U2i§;
      
      public function §_-V2h§(param1:Number, param2:Number, param3:uint = 16777215, param4:Boolean = true)
      {
         super();
         if(param1 == 0 || param2 == 0)
         {
            throw new ArgumentError("Invalid size: width and height must not be zero");
         }
         this.§_-O2F§ = param3 != 16777215;
         this.§_-Q1L§ = new §_-U2i§(4,param4);
         this.§_-Q1L§.setPosition(0,0,0);
         this.§_-Q1L§.setPosition(1,param1,0);
         this.§_-Q1L§.setPosition(2,0,param2);
         this.§_-Q1L§.setPosition(3,param1,param2);
         this.§_-Q1L§.§_-P15§(param3);
         this.§_-sN§();
      }
      
      protected function §_-sN§() : void
      {
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         if(param1 == this)
         {
            this.§_-Q1L§.getPosition(3,§_-O§);
            param2.setTo(0,0,§_-O§.x,§_-O§.y);
         }
         else if(param1 == parent && rotation == 0)
         {
            _loc3_ = this.scaleX;
            _loc4_ = this.scaleY;
            this.§_-Q1L§.getPosition(3,§_-O§);
            param2.setTo(x - pivotX * _loc3_,y - pivotY * _loc4_,§_-O§.x * _loc3_,§_-O§.y * _loc4_);
            if(_loc3_ < 0)
            {
               param2.width *= -1;
               param2.x -= param2.width;
            }
            if(_loc4_ < 0)
            {
               param2.height *= -1;
               param2.y -= param2.height;
            }
         }
         else if(§_-z1T§ && Boolean(stage))
         {
            stage.§_-S28§(param1,sHelperPoint3D);
            getTransformationMatrix3D(param1,sHelperMatrix3D);
            this.§_-Q1L§.§_-An§(sHelperMatrix3D,sHelperPoint3D,0,4,param2);
         }
         else
         {
            §_-R1D§(param1,§_-7w§);
            this.§_-Q1L§.getBounds(§_-7w§,0,4,param2);
         }
         return param2;
      }
      
      public function §_-218§(param1:int) : uint
      {
         return this.§_-Q1L§.§_-AR§(param1);
      }
      
      public function §_-Nl§(param1:int, param2:uint) : void
      {
         this.§_-Q1L§.setColor(param1,param2);
         this.§_-sN§();
         if(param2 != 16777215)
         {
            this.§_-O2F§ = true;
         }
         else
         {
            this.§_-O2F§ = this.§_-Q1L§.tinted;
         }
      }
      
      public function §_-tr§(param1:int) : Number
      {
         return this.§_-Q1L§.§_-E2h§(param1);
      }
      
      public function §_-b2I§(param1:int, param2:Number) : void
      {
         this.§_-Q1L§.§_-D2h§(param1,param2);
         this.§_-sN§();
         if(param2 != 1)
         {
            this.§_-O2F§ = true;
         }
         else
         {
            this.§_-O2F§ = this.§_-Q1L§.tinted;
         }
      }
      
      public function get color() : uint
      {
         return this.§_-Q1L§.§_-AR§(0);
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-Q1L§.§_-P15§(param1);
         this.§_-sN§();
         if(param1 != 16777215 || alpha != 1)
         {
            this.§_-O2F§ = true;
         }
         else
         {
            this.§_-O2F§ = this.§_-Q1L§.tinted;
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         if(param1 < 1)
         {
            this.§_-O2F§ = true;
         }
         else
         {
            this.§_-O2F§ = this.§_-Q1L§.tinted;
         }
      }
      
      public function §_-z4§(param1:§_-U2i§, param2:int = 0) : void
      {
         this.§_-Q1L§.§_-5D§(param1,param2);
      }
      
      public function §_-qa§(param1:§_-U2i§, param2:int = 0, param3:Matrix = null) : void
      {
         this.§_-Q1L§.§_-93B§(param1,param2,param3,0,4);
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         param1.§_-11O§(this,param2);
      }
      
      public function get tinted() : Boolean
      {
         return this.§_-O2F§;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-Q1L§.premultipliedAlpha;
      }
   }
}


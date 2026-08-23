package starling.display
{
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import starling.core.§_-T2v§;
   import starling.utils.§_-km§;
   
   public class §_-u16§ extends DisplayObject
   {
      
      private static var §_-G2g§:Point = new Point();
      
      private static var sHelperPoint3D:Vector3D = new Vector3D();
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var sHelperMatrix3D:Matrix3D = new Matrix3D();
      
      private var §_-12q§:Boolean;
      
      protected var §_-oW§:§_-km§;
      
      public function §_-u16§(param1:Number, param2:Number, param3:uint = 16777215, param4:Boolean = true)
      {
         super();
         if(param1 == 0 || param2 == 0)
         {
            throw new ArgumentError("Invalid size: width and height must not be zero");
         }
         this.§_-12q§ = param3 != 16777215;
         this.§_-oW§ = new §_-km§(4,param4);
         this.§_-oW§.setPosition(0,0,0);
         this.§_-oW§.setPosition(1,param1,0);
         this.§_-oW§.setPosition(2,0,param2);
         this.§_-oW§.setPosition(3,param1,param2);
         this.§_-oW§.§_-y2J§(param3);
         this.§_-u2K§();
      }
      
      protected function §_-u2K§() : void
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
            this.§_-oW§.getPosition(3,§_-G2g§);
            param2.setTo(0,0,§_-G2g§.x,§_-G2g§.y);
         }
         else if(param1 == parent && rotation == 0)
         {
            _loc3_ = this.scaleX;
            _loc4_ = this.scaleY;
            this.§_-oW§.getPosition(3,§_-G2g§);
            param2.setTo(x - pivotX * _loc3_,y - pivotY * _loc4_,§_-G2g§.x * _loc3_,§_-G2g§.y * _loc4_);
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
         else if(§_-zd§ && Boolean(stage))
         {
            stage.§_-79§(param1,sHelperPoint3D);
            getTransformationMatrix3D(param1,sHelperMatrix3D);
            this.§_-oW§.§_-t14§(sHelperMatrix3D,sHelperPoint3D,0,4,param2);
         }
         else
         {
            §_-eJ§(param1,§_-S19§);
            this.§_-oW§.getBounds(§_-S19§,0,4,param2);
         }
         return param2;
      }
      
      public function §_-h2T§(param1:int) : uint
      {
         return this.§_-oW§.§_-f1b§(param1);
      }
      
      public function §_-Rp§(param1:int, param2:uint) : void
      {
         this.§_-oW§.setColor(param1,param2);
         this.§_-u2K§();
         if(param2 != 16777215)
         {
            this.§_-12q§ = true;
         }
         else
         {
            this.§_-12q§ = this.§_-oW§.tinted;
         }
      }
      
      public function §_-td§(param1:int) : Number
      {
         return this.§_-oW§.§_-s2w§(param1);
      }
      
      public function §_-L1§(param1:int, param2:Number) : void
      {
         this.§_-oW§.§_-t1R§(param1,param2);
         this.§_-u2K§();
         if(param2 != 1)
         {
            this.§_-12q§ = true;
         }
         else
         {
            this.§_-12q§ = this.§_-oW§.tinted;
         }
      }
      
      public function get color() : uint
      {
         return this.§_-oW§.§_-f1b§(0);
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-oW§.§_-y2J§(param1);
         this.§_-u2K§();
         if(param1 != 16777215 || alpha != 1)
         {
            this.§_-12q§ = true;
         }
         else
         {
            this.§_-12q§ = this.§_-oW§.tinted;
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         if(param1 < 1)
         {
            this.§_-12q§ = true;
         }
         else
         {
            this.§_-12q§ = this.§_-oW§.tinted;
         }
      }
      
      public function §_-K2u§(param1:§_-km§, param2:int = 0) : void
      {
         this.§_-oW§.§_-13F§(param1,param2);
      }
      
      public function §_-P16§(param1:§_-km§, param2:int = 0, param3:Matrix = null) : void
      {
         this.§_-oW§.§_-FY§(param1,param2,param3,0,4);
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         param1.§_-v17§(this,param2);
      }
      
      public function get tinted() : Boolean
      {
         return this.§_-12q§;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.§_-oW§.premultipliedAlpha;
      }
   }
}


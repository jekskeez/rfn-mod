package starling.display
{
   import flash.display.Bitmap;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.§_-wz§;
   import starling.textures.Texture;
   import starling.textures.§_-RS§;
   import starling.utils.§_-U2i§;
   
   public class §_-I2q§ extends §_-V2h§
   {
      
      private var §_-A1m§:Texture;
      
      private var §_-22w§:String;
      
      private var §_-o2Q§:§_-U2i§;
      
      private var §_-g1P§:Boolean;
      
      public function §_-I2q§(param1:Texture)
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         if(param1)
         {
            _loc2_ = param1.frame;
            _loc3_ = _loc2_ ? _loc2_.width : param1.width;
            _loc4_ = _loc2_ ? _loc2_.height : param1.height;
            _loc5_ = param1.premultipliedAlpha;
            super(_loc3_,_loc4_,16777215,_loc5_);
            §_-Q1L§.§_-N1O§(0,0,0);
            §_-Q1L§.§_-N1O§(1,1,0);
            §_-Q1L§.§_-N1O§(2,0,1);
            §_-Q1L§.§_-N1O§(3,1,1);
            this.§_-A1m§ = param1;
            this.§_-22w§ = §_-RS§.§_-Ci§;
            this.§_-o2Q§ = new §_-U2i§(4,_loc5_);
            this.§_-g1P§ = true;
            return;
         }
         throw new ArgumentError("Texture cannot be null");
      }
      
      public static function §_-Q1D§(param1:Bitmap, param2:Boolean = true, param3:Number = 1) : §_-I2q§
      {
         return new §_-I2q§(Texture.§_-Q1D§(param1,param2,false,param3));
      }
      
      override protected function §_-sN§() : void
      {
         this.§_-g1P§ = true;
      }
      
      public function §_-D25§() : void
      {
         var _loc1_:Rectangle = this.texture.frame;
         var _loc2_:Number = _loc1_ ? _loc1_.width : this.texture.width;
         var _loc3_:Number = _loc1_ ? _loc1_.height : this.texture.height;
         §_-Q1L§.setPosition(0,0,0);
         §_-Q1L§.setPosition(1,_loc2_,0);
         §_-Q1L§.setPosition(2,0,_loc3_);
         §_-Q1L§.setPosition(3,_loc2_,_loc3_);
         this.§_-sN§();
      }
      
      public function §_-N1O§(param1:int, param2:Point) : void
      {
         §_-Q1L§.§_-N1O§(param1,param2.x,param2.y);
         this.§_-sN§();
      }
      
      public function §_-F1L§(param1:int, param2:Number, param3:Number) : void
      {
         §_-Q1L§.§_-N1O§(param1,param2,param3);
         this.§_-sN§();
      }
      
      public function §_-Yn§(param1:int, param2:Point = null) : Point
      {
         if(param2 == null)
         {
            param2 = new Point();
         }
         §_-Q1L§.§_-Yn§(param1,param2);
         return param2;
      }
      
      override public function §_-z4§(param1:§_-U2i§, param2:int = 0) : void
      {
         this.§_-qa§(param1,param2,null);
      }
      
      override public function §_-qa§(param1:§_-U2i§, param2:int = 0, param3:Matrix = null) : void
      {
         if(this.§_-g1P§)
         {
            this.§_-g1P§ = false;
            §_-Q1L§.§_-5D§(this.§_-o2Q§);
            this.§_-A1m§.§_-B19§(this.§_-o2Q§,0,4);
         }
         this.§_-o2Q§.§_-93B§(param1,param2,param3,0,4);
      }
      
      public function get texture() : Texture
      {
         return this.§_-A1m§;
      }
      
      public function set texture(param1:Texture) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture cannot be null");
         }
         if(param1 != this.§_-A1m§)
         {
            this.§_-A1m§ = param1;
            §_-Q1L§.§_-W2h§(this.§_-A1m§.premultipliedAlpha);
            this.§_-o2Q§.§_-W2h§(this.§_-A1m§.premultipliedAlpha,false);
            this.§_-sN§();
         }
      }
      
      public function get smoothing() : String
      {
         return this.§_-22w§;
      }
      
      public function set smoothing(param1:String) : void
      {
         if(§_-RS§.§_-B2D§(param1))
         {
            this.§_-22w§ = param1;
            return;
         }
         throw new ArgumentError("Invalid smoothing mode: " + param1);
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         param1.§_-11O§(this,param2,this.§_-A1m§,this.§_-22w§);
      }
   }
}


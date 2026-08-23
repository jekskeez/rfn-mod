package starling.display
{
   import flash.display.Bitmap;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.§_-T2v§;
   import starling.textures.Texture;
   import starling.textures.§_-a1g§;
   import starling.utils.§_-km§;
   
   public class §_-jH§ extends §_-u16§
   {
      
      private var §_-W1E§:Texture;
      
      private var §_-v2p§:String;
      
      private var §_-A1N§:§_-km§;
      
      private var §_-C2b§:Boolean;
      
      public function §_-jH§(param1:Texture)
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
            §_-oW§.§_-5m§(0,0,0);
            §_-oW§.§_-5m§(1,1,0);
            §_-oW§.§_-5m§(2,0,1);
            §_-oW§.§_-5m§(3,1,1);
            this.§_-W1E§ = param1;
            this.§_-v2p§ = §_-a1g§.§_-R27§;
            this.§_-A1N§ = new §_-km§(4,_loc5_);
            this.§_-C2b§ = true;
            return;
         }
         throw new ArgumentError("Texture cannot be null");
      }
      
      public static function §_-w1Q§(param1:Bitmap, param2:Boolean = true, param3:Number = 1) : §_-jH§
      {
         return new §_-jH§(Texture.§_-w1Q§(param1,param2,false,param3));
      }
      
      override protected function §_-u2K§() : void
      {
         this.§_-C2b§ = true;
      }
      
      public function §_-T2Q§() : void
      {
         var _loc1_:Rectangle = this.texture.frame;
         var _loc2_:Number = _loc1_ ? _loc1_.width : this.texture.width;
         var _loc3_:Number = _loc1_ ? _loc1_.height : this.texture.height;
         §_-oW§.setPosition(0,0,0);
         §_-oW§.setPosition(1,_loc2_,0);
         §_-oW§.setPosition(2,0,_loc3_);
         §_-oW§.setPosition(3,_loc2_,_loc3_);
         this.§_-u2K§();
      }
      
      public function §_-5m§(param1:int, param2:Point) : void
      {
         §_-oW§.§_-5m§(param1,param2.x,param2.y);
         this.§_-u2K§();
      }
      
      public function §_-D6§(param1:int, param2:Number, param3:Number) : void
      {
         §_-oW§.§_-5m§(param1,param2,param3);
         this.§_-u2K§();
      }
      
      public function §_-H1t§(param1:int, param2:Point = null) : Point
      {
         if(param2 == null)
         {
            param2 = new Point();
         }
         §_-oW§.§_-H1t§(param1,param2);
         return param2;
      }
      
      override public function §_-K2u§(param1:§_-km§, param2:int = 0) : void
      {
         this.§_-P16§(param1,param2,null);
      }
      
      override public function §_-P16§(param1:§_-km§, param2:int = 0, param3:Matrix = null) : void
      {
         if(this.§_-C2b§)
         {
            this.§_-C2b§ = false;
            §_-oW§.§_-13F§(this.§_-A1N§);
            this.§_-W1E§.§_-S1b§(this.§_-A1N§,0,4);
         }
         this.§_-A1N§.§_-FY§(param1,param2,param3,0,4);
      }
      
      public function get texture() : Texture
      {
         return this.§_-W1E§;
      }
      
      public function set texture(param1:Texture) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture cannot be null");
         }
         if(param1 != this.§_-W1E§)
         {
            this.§_-W1E§ = param1;
            §_-oW§.§_-S1Y§(this.§_-W1E§.premultipliedAlpha);
            this.§_-A1N§.§_-S1Y§(this.§_-W1E§.premultipliedAlpha,false);
            this.§_-u2K§();
         }
      }
      
      public function get smoothing() : String
      {
         return this.§_-v2p§;
      }
      
      public function set smoothing(param1:String) : void
      {
         if(§_-a1g§.§_-CQ§(param1))
         {
            this.§_-v2p§ = param1;
            return;
         }
         throw new ArgumentError("Invalid smoothing mode: " + param1);
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         param1.§_-v17§(this,param2,this.§_-W1E§,this.§_-v2p§);
      }
   }
}


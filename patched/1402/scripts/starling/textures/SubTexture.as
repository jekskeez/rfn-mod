package starling.textures
{
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.utils.§_-F2o§;
   import starling.utils.§_-U2i§;
   import starling.utils.§_-r1p§;
   
   public class SubTexture extends Texture
   {
      
      private static var §_-53w§:Point = new Point();
      
      private static var §_-Z2A§:Matrix = new Matrix();
      
      private var §_-W20§:Texture;
      
      private var §_-J1O§:Boolean;
      
      private var §_-zy§:Rectangle;
      
      private var §_-w26§:Rectangle;
      
      private var §_-n1A§:Boolean;
      
      private var §_-sd§:Number;
      
      private var §_-Pb§:Number;
      
      private var §_-J2v§:Matrix;
      
      public function SubTexture(param1:Texture, param2:Rectangle = null, param3:Boolean = false, param4:Rectangle = null, param5:Boolean = false)
      {
         super();
         this.§_-W20§ = param1;
         this.§_-zy§ = param2 ? param2.clone() : new Rectangle(0,0,param1.width,param1.height);
         this.§_-w26§ = param4 ? param4.clone() : null;
         this.§_-J1O§ = param3;
         this.§_-n1A§ = param5;
         this.§_-sd§ = param5 ? this.§_-zy§.height : this.§_-zy§.width;
         this.§_-Pb§ = param5 ? this.§_-zy§.width : this.§_-zy§.height;
         this.§_-J2v§ = new Matrix();
         if(param5)
         {
            this.§_-J2v§.translate(0,-1);
            this.§_-J2v§.rotate(Math.PI / 2);
         }
         if(Boolean(this.§_-w26§) && (this.§_-w26§.x > 0 || this.§_-w26§.y > 0 || this.§_-w26§.right < this.§_-sd§ || this.§_-w26§.bottom < this.§_-Pb§))
         {
            trace("[Starling] Warning: frames inside the texture\'s region are unsupported.");
         }
         this.§_-J2v§.scale(this.§_-zy§.width / this.§_-W20§.width,this.§_-zy§.height / this.§_-W20§.height);
         this.§_-J2v§.translate(this.§_-zy§.x / this.§_-W20§.width,this.§_-zy§.y / this.§_-W20§.height);
      }
      
      override public function dispose() : void
      {
         if(this.§_-J1O§)
         {
            this.§_-W20§.dispose();
         }
         super.dispose();
      }
      
      override public function §_-B19§(param1:§_-U2i§, param2:int, param3:int) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:int = param2 * §_-U2i§.§_-l1J§ + §_-U2i§.§_-F2I§;
         var _loc5_:int = §_-U2i§.§_-l1J§ - 2;
         this.§_-Dh§(param1.§_-H1O§,_loc4_,_loc5_,param3);
         if(this.§_-w26§)
         {
            if(param3 != 4)
            {
               throw new ArgumentError("Textures with a frame can only be used on quads");
            }
            _loc6_ = this.§_-w26§.width + this.§_-w26§.x - this.§_-sd§;
            _loc7_ = this.§_-w26§.height + this.§_-w26§.y - this.§_-Pb§;
            param1.§_-f2U§(param2,-this.§_-w26§.x,-this.§_-w26§.y);
            param1.§_-f2U§(param2 + 1,-_loc6_,-this.§_-w26§.y);
            param1.§_-f2U§(param2 + 2,-this.§_-w26§.x,-_loc7_);
            param1.§_-f2U§(param2 + 3,-_loc6_,-_loc7_);
         }
      }
      
      override public function §_-Dh§(param1:Vector.<Number>, param2:int = 0, param3:int = 0, param4:int = -1) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param4 < 0)
         {
            param4 = (param1.length - param2 - 2) / (param3 + 2) + 1;
         }
         var _loc5_:int = param2 + param4 * (2 + param3);
         var _loc6_:SubTexture = this;
         §_-Z2A§.identity();
         while(_loc6_)
         {
            §_-Z2A§.concat(_loc6_.§_-J2v§);
            _loc6_ = _loc6_.parent as SubTexture;
         }
         var _loc9_:int = param2;
         while(_loc9_ < _loc5_)
         {
            _loc7_ = param1[_loc9_];
            _loc8_ = param1[int(_loc9_ + 1)];
            §_-r1p§.§_-317§(§_-Z2A§,_loc7_,_loc8_,§_-53w§);
            param1[_loc9_] = §_-53w§.x;
            param1[int(_loc9_ + 1)] = §_-53w§.y;
            _loc9_ += 2 + param3;
         }
      }
      
      public function get parent() : Texture
      {
         return this.§_-W20§;
      }
      
      public function get §_-vw§() : Boolean
      {
         return this.§_-J1O§;
      }
      
      public function get rotated() : Boolean
      {
         return this.§_-n1A§;
      }
      
      public function get §_-81V§() : Rectangle
      {
         return this.§_-zy§;
      }
      
      public function get §_-a2t§() : Rectangle
      {
         var _loc1_:Point = new Point();
         var _loc2_:Point = new Point();
         §_-r1p§.§_-317§(this.§_-J2v§,0,0,_loc1_);
         §_-r1p§.§_-317§(this.§_-J2v§,1,1,_loc2_);
         var _loc3_:Rectangle = new Rectangle(_loc1_.x,_loc1_.y,_loc2_.x - _loc1_.x,_loc2_.y - _loc1_.y);
         §_-F2o§.normalize(_loc3_);
         return _loc3_;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.§_-J2v§;
      }
      
      override public function get base() : TextureBase
      {
         return this.§_-W20§.base;
      }
      
      override public function get root() : §_-72X§
      {
         return this.§_-W20§.root;
      }
      
      override public function get format() : String
      {
         return this.§_-W20§.format;
      }
      
      override public function get width() : Number
      {
         return this.§_-sd§;
      }
      
      override public function get height() : Number
      {
         return this.§_-Pb§;
      }
      
      override public function get nativeWidth() : Number
      {
         return this.§_-sd§ * this.scale;
      }
      
      override public function get nativeHeight() : Number
      {
         return this.§_-Pb§ * this.scale;
      }
      
      override public function get mipMapping() : Boolean
      {
         return this.§_-W20§.mipMapping;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         return this.§_-W20§.premultipliedAlpha;
      }
      
      override public function get scale() : Number
      {
         return this.§_-W20§.scale;
      }
      
      override public function get repeat() : Boolean
      {
         return this.§_-W20§.repeat;
      }
      
      override public function get frame() : Rectangle
      {
         return this.§_-w26§;
      }
   }
}


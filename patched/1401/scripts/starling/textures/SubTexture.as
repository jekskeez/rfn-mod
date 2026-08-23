package starling.textures
{
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.utils.§_-U2t§;
   import starling.utils.§_-km§;
   import starling.utils.§_-rI§;
   
   public class SubTexture extends Texture
   {
      
      private static var §_-PP§:Point = new Point();
      
      private static var §_-o1q§:Matrix = new Matrix();
      
      private var §_-02V§:Texture;
      
      private var §_-t1O§:Boolean;
      
      private var §_-i1C§:Rectangle;
      
      private var §_-G2§:Rectangle;
      
      private var §_-G18§:Boolean;
      
      private var §_-q1a§:Number;
      
      private var §_-D1k§:Number;
      
      private var §_-52z§:Matrix;
      
      public function SubTexture(param1:Texture, param2:Rectangle = null, param3:Boolean = false, param4:Rectangle = null, param5:Boolean = false)
      {
         super();
         this.§_-02V§ = param1;
         this.§_-i1C§ = param2 ? param2.clone() : new Rectangle(0,0,param1.width,param1.height);
         this.§_-G2§ = param4 ? param4.clone() : null;
         this.§_-t1O§ = param3;
         this.§_-G18§ = param5;
         this.§_-q1a§ = param5 ? this.§_-i1C§.height : this.§_-i1C§.width;
         this.§_-D1k§ = param5 ? this.§_-i1C§.width : this.§_-i1C§.height;
         this.§_-52z§ = new Matrix();
         if(param5)
         {
            this.§_-52z§.translate(0,-1);
            this.§_-52z§.rotate(Math.PI / 2);
         }
         if(Boolean(this.§_-G2§) && (this.§_-G2§.x > 0 || this.§_-G2§.y > 0 || this.§_-G2§.right < this.§_-q1a§ || this.§_-G2§.bottom < this.§_-D1k§))
         {
            trace("[Starling] Warning: frames inside the texture\'s region are unsupported.");
         }
         this.§_-52z§.scale(this.§_-i1C§.width / this.§_-02V§.width,this.§_-i1C§.height / this.§_-02V§.height);
         this.§_-52z§.translate(this.§_-i1C§.x / this.§_-02V§.width,this.§_-i1C§.y / this.§_-02V§.height);
      }
      
      override public function dispose() : void
      {
         if(this.§_-t1O§)
         {
            this.§_-02V§.dispose();
         }
         super.dispose();
      }
      
      override public function §_-S1b§(param1:§_-km§, param2:int, param3:int) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:int = param2 * §_-km§.§_-L2w§ + §_-km§.§_-i2H§;
         var _loc5_:int = §_-km§.§_-L2w§ - 2;
         this.§_-11B§(param1.§_-T1R§,_loc4_,_loc5_,param3);
         if(this.§_-G2§)
         {
            if(param3 != 4)
            {
               throw new ArgumentError("Textures with a frame can only be used on quads");
            }
            _loc6_ = this.§_-G2§.width + this.§_-G2§.x - this.§_-q1a§;
            _loc7_ = this.§_-G2§.height + this.§_-G2§.y - this.§_-D1k§;
            param1.§_-33z§(param2,-this.§_-G2§.x,-this.§_-G2§.y);
            param1.§_-33z§(param2 + 1,-_loc6_,-this.§_-G2§.y);
            param1.§_-33z§(param2 + 2,-this.§_-G2§.x,-_loc7_);
            param1.§_-33z§(param2 + 3,-_loc6_,-_loc7_);
         }
      }
      
      override public function §_-11B§(param1:Vector.<Number>, param2:int = 0, param3:int = 0, param4:int = -1) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param4 < 0)
         {
            param4 = (param1.length - param2 - 2) / (param3 + 2) + 1;
         }
         var _loc5_:int = param2 + param4 * (2 + param3);
         var _loc6_:SubTexture = this;
         §_-o1q§.identity();
         while(_loc6_)
         {
            §_-o1q§.concat(_loc6_.§_-52z§);
            _loc6_ = _loc6_.parent as SubTexture;
         }
         var _loc9_:int = param2;
         while(_loc9_ < _loc5_)
         {
            _loc7_ = param1[_loc9_];
            _loc8_ = param1[int(_loc9_ + 1)];
            §_-rI§.§_-Sy§(§_-o1q§,_loc7_,_loc8_,§_-PP§);
            param1[_loc9_] = §_-PP§.x;
            param1[int(_loc9_ + 1)] = §_-PP§.y;
            _loc9_ += 2 + param3;
         }
      }
      
      public function get parent() : Texture
      {
         return this.§_-02V§;
      }
      
      public function get §_-I1A§() : Boolean
      {
         return this.§_-t1O§;
      }
      
      public function get rotated() : Boolean
      {
         return this.§_-G18§;
      }
      
      public function get §_-B39§() : Rectangle
      {
         return this.§_-i1C§;
      }
      
      public function get §_-X11§() : Rectangle
      {
         var _loc1_:Point = new Point();
         var _loc2_:Point = new Point();
         §_-rI§.§_-Sy§(this.§_-52z§,0,0,_loc1_);
         §_-rI§.§_-Sy§(this.§_-52z§,1,1,_loc2_);
         var _loc3_:Rectangle = new Rectangle(_loc1_.x,_loc1_.y,_loc2_.x - _loc1_.x,_loc2_.y - _loc1_.y);
         §_-U2t§.normalize(_loc3_);
         return _loc3_;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.§_-52z§;
      }
      
      override public function get base() : TextureBase
      {
         return this.§_-02V§.base;
      }
      
      override public function get root() : §_-n2K§
      {
         return this.§_-02V§.root;
      }
      
      override public function get format() : String
      {
         return this.§_-02V§.format;
      }
      
      override public function get width() : Number
      {
         return this.§_-q1a§;
      }
      
      override public function get height() : Number
      {
         return this.§_-D1k§;
      }
      
      override public function get nativeWidth() : Number
      {
         return this.§_-q1a§ * this.scale;
      }
      
      override public function get nativeHeight() : Number
      {
         return this.§_-D1k§ * this.scale;
      }
      
      override public function get mipMapping() : Boolean
      {
         return this.§_-02V§.mipMapping;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         return this.§_-02V§.premultipliedAlpha;
      }
      
      override public function get scale() : Number
      {
         return this.§_-02V§.scale;
      }
      
      override public function get repeat() : Boolean
      {
         return this.§_-02V§.repeat;
      }
      
      override public function get frame() : Rectangle
      {
         return this.§_-G2§;
      }
   }
}


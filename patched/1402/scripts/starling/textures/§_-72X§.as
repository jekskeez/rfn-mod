package starling.textures
{
   import §_-625§.§_-g2t§;
   import §_-625§.§_-j1b§;
   import §_-f1T§.Event;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display3D.Context3D;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.Camera;
   import flash.net.NetStream;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   import starling.core.Starling;
   import starling.core.§_-wz§;
   import starling.core.starling_internal;
   import starling.utils.Color;
   import starling.utils.execute;
   
   use namespace starling_internal;
   
   public class §_-72X§ extends starling.textures.Texture
   {
      
      private static const TEXTURE_READY:String = "textureReady";
      
      private static var §_-R2d§:Point = new Point();
      
      private var §_-52X§:TextureBase;
      
      private var §_-P2O§:String;
      
      private var §_-sd§:int;
      
      private var §_-Pb§:int;
      
      private var §_-FE§:Boolean;
      
      private var §_-9X§:Boolean;
      
      private var §_-g8§:Boolean;
      
      private var §_-p1i§:Number;
      
      private var §_-HD§:Boolean;
      
      private var §_-Xx§:Function;
      
      private var §_-92y§:Boolean;
      
      private var §_-X2F§:Function;
      
      public function §_-72X§(param1:TextureBase, param2:String, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean = false, param8:Number = 1, param9:Boolean = false)
      {
         super();
         this.§_-p1i§ = param8 <= 0 ? 1 : param8;
         this.§_-52X§ = param1;
         this.§_-P2O§ = param2;
         this.§_-sd§ = param3;
         this.§_-Pb§ = param4;
         this.§_-FE§ = param5;
         this.§_-9X§ = param6;
         this.§_-g8§ = param7;
         this.§_-HD§ = param9;
         this.§_-Xx§ = null;
         this.§_-92y§ = false;
         this.§_-X2F§ = null;
      }
      
      override public function dispose() : void
      {
         if(this.§_-52X§)
         {
            this.§_-52X§.removeEventListener(TEXTURE_READY,this.§_-61x§);
            this.§_-52X§.dispose();
         }
         this.§_-y1f§ = null;
         super.dispose();
      }
      
      public function §_-91J§(param1:Bitmap) : void
      {
         this.§_-YT§(param1.bitmapData);
      }
      
      public function §_-YT§(param1:BitmapData) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:flash.display3D.textures.Texture = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:BitmapData = null;
         var _loc8_:Matrix = null;
         var _loc9_:Rectangle = null;
         if(param1.width != this.§_-sd§ || param1.height != this.§_-Pb§)
         {
            _loc2_ = new BitmapData(this.§_-sd§,this.§_-Pb§,true,0);
            _loc2_.copyPixels(param1,param1.rect,§_-R2d§);
            param1 = _loc2_;
         }
         if(this.§_-52X§ is flash.display3D.textures.Texture)
         {
            _loc3_ = this.§_-52X§ as flash.display3D.textures.Texture;
            _loc3_.uploadFromBitmapData(param1);
            if(this.§_-FE§ && param1.width > 1 && param1.height > 1)
            {
               _loc4_ = param1.width >> 1;
               _loc5_ = param1.height >> 1;
               _loc6_ = 1;
               _loc7_ = new BitmapData(_loc4_,_loc5_,true,0);
               _loc8_ = new Matrix(0.5,0,0,0.5);
               _loc9_ = new Rectangle();
               while(_loc4_ >= 1 || _loc5_ >= 1)
               {
                  _loc9_.width = _loc4_;
                  _loc9_.height = _loc5_;
                  _loc7_.fillRect(_loc9_,0);
                  _loc7_.draw(param1,_loc8_,null,null,null,true);
                  _loc3_.uploadFromBitmapData(_loc7_,_loc6_++);
                  _loc8_.scale(0.5,0.5);
                  _loc4_ >>= 1;
                  _loc5_ >>= 1;
               }
               _loc7_.dispose();
            }
         }
         else
         {
            this.§_-52X§["uploadFromBitmapData"](param1);
         }
         if(_loc2_)
         {
            _loc2_.dispose();
         }
         this.§_-92y§ = true;
      }
      
      public function §_-vI§(param1:ByteArray, param2:int = 0, param3:* = null) : void
      {
         var _loc4_:Boolean = param3 is Function || param3 === true;
         var _loc5_:flash.display3D.textures.Texture = this.§_-52X§ as flash.display3D.textures.Texture;
         if(_loc5_ == null)
         {
            throw new Error("This texture type does not support ATF data");
         }
         if(param3 is Function)
         {
            this.§_-X2F§ = param3 as Function;
            this.§_-52X§.addEventListener(TEXTURE_READY,this.§_-61x§);
         }
         _loc5_.uploadCompressedTextureFromByteArray(param1,param2,_loc4_);
         this.§_-92y§ = true;
      }
      
      public function §_-Xp§(param1:NetStream, param2:Function = null) : void
      {
         this.§_-gT§("NetStream",param1,param2);
      }
      
      public function §_-pO§(param1:Camera, param2:Function = null) : void
      {
         this.§_-gT§("Camera",param1,param2);
      }
      
      internal function §_-gT§(param1:String, param2:Object, param3:Function = null) : void
      {
         var _loc4_:String = getQualifiedClassName(this.§_-52X§);
         if(_loc4_ == "flash.display3D.textures::VideoTexture")
         {
            this.§_-92y§ = true;
            this.§_-X2F§ = param3;
            this.§_-52X§["attach" + param1](param2);
            this.§_-52X§.addEventListener(TEXTURE_READY,this.§_-61x§);
            return;
         }
         throw new Error("This texture type does not support " + param1 + " data");
      }
      
      private function §_-61x§(param1:Object) : void
      {
         this.§_-52X§.removeEventListener(TEXTURE_READY,this.§_-61x§);
         execute(this.§_-X2F§,this);
         this.§_-X2F§ = null;
      }
      
      private function §_-42J§() : void
      {
         this.§_-8L§();
         if(this.§_-Xx§ != null)
         {
            this.§_-Xx§();
         }
         if(!this.§_-92y§)
         {
            this.clear();
         }
      }
      
      starling_internal function §_-8L§() : void
      {
         var _loc1_:Context3D = Starling.context;
         var _loc2_:String = getQualifiedClassName(this.§_-52X§);
         if(_loc2_ == "flash.display3D.textures::Texture")
         {
            this.§_-52X§ = _loc1_.createTexture(this.§_-sd§,this.§_-Pb§,this.§_-P2O§,this.§_-g8§);
         }
         else if(_loc2_ == "flash.display3D.textures::RectangleTexture")
         {
            this.§_-52X§ = _loc1_["createRectangleTexture"](this.§_-sd§,this.§_-Pb§,this.§_-P2O§,this.§_-g8§);
         }
         else
         {
            if(_loc2_ != "flash.display3D.textures::VideoTexture")
            {
               throw new §_-g2t§("Texture type not supported: " + _loc2_);
            }
            this.§_-52X§ = _loc1_["createVideoTexture"]();
         }
         this.§_-92y§ = false;
      }
      
      public function clear(param1:uint = 0, param2:Number = 0) : void
      {
         var _loc3_:Context3D = Starling.context;
         if(_loc3_ == null)
         {
            throw new §_-j1b§();
         }
         if(this.§_-9X§ && param2 < 1)
         {
            param1 = Color.rgb(Color.§_-u1j§(param1) * param2,Color.§_-r1r§(param1) * param2,Color.§_-H1H§(param1) * param2);
         }
         _loc3_.setRenderToTexture(this.§_-52X§);
         try
         {
            §_-wz§.clear(param1,param2);
         }
         catch(e:Error)
         {
         }
         _loc3_.setRenderToBackBuffer();
         this.§_-92y§ = true;
      }
      
      public function get §_-l10§() : Boolean
      {
         return this.§_-g8§;
      }
      
      public function get §_-y1f§() : Function
      {
         return this.§_-Xx§;
      }
      
      public function set §_-y1f§(param1:Function) : void
      {
         Starling.§_-n1s§.removeEventListener(Event.CONTEXT3D_CREATE,this.§_-42J§);
         if(Starling.§_-B2f§ && param1 != null)
         {
            this.§_-Xx§ = param1;
            Starling.§_-n1s§.addEventListener(Event.CONTEXT3D_CREATE,this.§_-42J§);
         }
         else
         {
            this.§_-Xx§ = null;
         }
      }
      
      override public function get base() : TextureBase
      {
         return this.§_-52X§;
      }
      
      override public function get root() : §_-72X§
      {
         return this;
      }
      
      override public function get format() : String
      {
         return this.§_-P2O§;
      }
      
      override public function get width() : Number
      {
         return this.§_-sd§ / this.§_-p1i§;
      }
      
      override public function get height() : Number
      {
         return this.§_-Pb§ / this.§_-p1i§;
      }
      
      override public function get nativeWidth() : Number
      {
         return this.§_-sd§;
      }
      
      override public function get nativeHeight() : Number
      {
         return this.§_-Pb§;
      }
      
      override public function get scale() : Number
      {
         return this.§_-p1i§;
      }
      
      override public function get mipMapping() : Boolean
      {
         return this.§_-FE§;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         return this.§_-9X§;
      }
      
      override public function get repeat() : Boolean
      {
         return this.§_-HD§;
      }
   }
}


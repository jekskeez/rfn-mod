package starling.textures
{
   import §_-K2c§.Event;
   import §_-kW§.§_-F1W§;
   import §_-kW§.§_-F2U§;
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
   import starling.core.§_-T2v§;
   import starling.core.starling_internal;
   import starling.utils.Color;
   import starling.utils.execute;
   
   use namespace starling_internal;
   
   public class §_-n2K§ extends starling.textures.Texture
   {
      
      private static const TEXTURE_READY:String = "textureReady";
      
      private static var §_-12a§:Point = new Point();
      
      private var §_-n2e§:TextureBase;
      
      private var §_-GW§:String;
      
      private var §_-q1a§:int;
      
      private var §_-D1k§:int;
      
      private var §_-j2M§:Boolean;
      
      private var §_-C2W§:Boolean;
      
      private var §_-B3J§:Boolean;
      
      private var §_-n2q§:Number;
      
      private var §_-iO§:Boolean;
      
      private var §_-KP§:Function;
      
      private var §_-a2m§:Boolean;
      
      private var §_-M2d§:Function;
      
      public function §_-n2K§(param1:TextureBase, param2:String, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean = false, param8:Number = 1, param9:Boolean = false)
      {
         super();
         this.§_-n2q§ = param8 <= 0 ? 1 : param8;
         this.§_-n2e§ = param1;
         this.§_-GW§ = param2;
         this.§_-q1a§ = param3;
         this.§_-D1k§ = param4;
         this.§_-j2M§ = param5;
         this.§_-C2W§ = param6;
         this.§_-B3J§ = param7;
         this.§_-iO§ = param9;
         this.§_-KP§ = null;
         this.§_-a2m§ = false;
         this.§_-M2d§ = null;
      }
      
      override public function dispose() : void
      {
         if(this.§_-n2e§)
         {
            this.§_-n2e§.removeEventListener(TEXTURE_READY,this.§_-H1p§);
            this.§_-n2e§.dispose();
         }
         this.§_-x2b§ = null;
         super.dispose();
      }
      
      public function §_-b1f§(param1:Bitmap) : void
      {
         this.§_-B3d§(param1.bitmapData);
      }
      
      public function §_-B3d§(param1:BitmapData) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:flash.display3D.textures.Texture = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:BitmapData = null;
         var _loc8_:Matrix = null;
         var _loc9_:Rectangle = null;
         if(param1.width != this.§_-q1a§ || param1.height != this.§_-D1k§)
         {
            _loc2_ = new BitmapData(this.§_-q1a§,this.§_-D1k§,true,0);
            _loc2_.copyPixels(param1,param1.rect,§_-12a§);
            param1 = _loc2_;
         }
         if(this.§_-n2e§ is flash.display3D.textures.Texture)
         {
            _loc3_ = this.§_-n2e§ as flash.display3D.textures.Texture;
            _loc3_.uploadFromBitmapData(param1);
            if(this.§_-j2M§ && param1.width > 1 && param1.height > 1)
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
            this.§_-n2e§["uploadFromBitmapData"](param1);
         }
         if(_loc2_)
         {
            _loc2_.dispose();
         }
         this.§_-a2m§ = true;
      }
      
      public function §_-a2K§(param1:ByteArray, param2:int = 0, param3:* = null) : void
      {
         var _loc4_:Boolean = param3 is Function || param3 === true;
         var _loc5_:flash.display3D.textures.Texture = this.§_-n2e§ as flash.display3D.textures.Texture;
         if(_loc5_ == null)
         {
            throw new Error("This texture type does not support ATF data");
         }
         if(param3 is Function)
         {
            this.§_-M2d§ = param3 as Function;
            this.§_-n2e§.addEventListener(TEXTURE_READY,this.§_-H1p§);
         }
         _loc5_.uploadCompressedTextureFromByteArray(param1,param2,_loc4_);
         this.§_-a2m§ = true;
      }
      
      public function §_-lG§(param1:NetStream, param2:Function = null) : void
      {
         this.§_-83E§("NetStream",param1,param2);
      }
      
      public function §_-XU§(param1:Camera, param2:Function = null) : void
      {
         this.§_-83E§("Camera",param1,param2);
      }
      
      internal function §_-83E§(param1:String, param2:Object, param3:Function = null) : void
      {
         var _loc4_:String = getQualifiedClassName(this.§_-n2e§);
         if(_loc4_ == "flash.display3D.textures::VideoTexture")
         {
            this.§_-a2m§ = true;
            this.§_-M2d§ = param3;
            this.§_-n2e§["attach" + param1](param2);
            this.§_-n2e§.addEventListener(TEXTURE_READY,this.§_-H1p§);
            return;
         }
         throw new Error("This texture type does not support " + param1 + " data");
      }
      
      private function §_-H1p§(param1:Object) : void
      {
         this.§_-n2e§.removeEventListener(TEXTURE_READY,this.§_-H1p§);
         execute(this.§_-M2d§,this);
         this.§_-M2d§ = null;
      }
      
      private function §_-w2G§() : void
      {
         this.§_-81o§();
         if(this.§_-KP§ != null)
         {
            this.§_-KP§();
         }
         if(!this.§_-a2m§)
         {
            this.clear();
         }
      }
      
      starling_internal function §_-81o§() : void
      {
         var _loc1_:Context3D = Starling.context;
         var _loc2_:String = getQualifiedClassName(this.§_-n2e§);
         if(_loc2_ == "flash.display3D.textures::Texture")
         {
            this.§_-n2e§ = _loc1_.createTexture(this.§_-q1a§,this.§_-D1k§,this.§_-GW§,this.§_-B3J§);
         }
         else if(_loc2_ == "flash.display3D.textures::RectangleTexture")
         {
            this.§_-n2e§ = _loc1_["createRectangleTexture"](this.§_-q1a§,this.§_-D1k§,this.§_-GW§,this.§_-B3J§);
         }
         else
         {
            if(_loc2_ != "flash.display3D.textures::VideoTexture")
            {
               throw new §_-F1W§("Texture type not supported: " + _loc2_);
            }
            this.§_-n2e§ = _loc1_["createVideoTexture"]();
         }
         this.§_-a2m§ = false;
      }
      
      public function clear(param1:uint = 0, param2:Number = 0) : void
      {
         var _loc3_:Context3D = Starling.context;
         if(_loc3_ == null)
         {
            throw new §_-F2U§();
         }
         if(this.§_-C2W§ && param2 < 1)
         {
            param1 = Color.rgb(Color.§_-C3b§(param1) * param2,Color.§_-F1q§(param1) * param2,Color.§_-N1y§(param1) * param2);
         }
         _loc3_.setRenderToTexture(this.§_-n2e§);
         try
         {
            §_-T2v§.clear(param1,param2);
         }
         catch(e:Error)
         {
         }
         _loc3_.setRenderToBackBuffer();
         this.§_-a2m§ = true;
      }
      
      public function get §_-82f§() : Boolean
      {
         return this.§_-B3J§;
      }
      
      public function get §_-x2b§() : Function
      {
         return this.§_-KP§;
      }
      
      public function set §_-x2b§(param1:Function) : void
      {
         Starling.§_-y1l§.removeEventListener(Event.CONTEXT3D_CREATE,this.§_-w2G§);
         if(Starling.§_-m2K§ && param1 != null)
         {
            this.§_-KP§ = param1;
            Starling.§_-y1l§.addEventListener(Event.CONTEXT3D_CREATE,this.§_-w2G§);
         }
         else
         {
            this.§_-KP§ = null;
         }
      }
      
      override public function get base() : TextureBase
      {
         return this.§_-n2e§;
      }
      
      override public function get root() : §_-n2K§
      {
         return this;
      }
      
      override public function get format() : String
      {
         return this.§_-GW§;
      }
      
      override public function get width() : Number
      {
         return this.§_-q1a§ / this.§_-n2q§;
      }
      
      override public function get height() : Number
      {
         return this.§_-D1k§ / this.§_-n2q§;
      }
      
      override public function get nativeWidth() : Number
      {
         return this.§_-q1a§;
      }
      
      override public function get nativeHeight() : Number
      {
         return this.§_-D1k§;
      }
      
      override public function get scale() : Number
      {
         return this.§_-n2q§;
      }
      
      override public function get mipMapping() : Boolean
      {
         return this.§_-j2M§;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         return this.§_-C2W§;
      }
      
      override public function get repeat() : Boolean
      {
         return this.§_-iO§;
      }
   }
}


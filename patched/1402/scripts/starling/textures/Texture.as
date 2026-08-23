package starling.textures
{
   import §_-625§.§_-F1v§;
   import §_-625§.§_-g2t§;
   import §_-625§.§_-j1b§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.textures.Texture;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Rectangle;
   import flash.media.Camera;
   import flash.net.NetStream;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import flash.utils.getQualifiedClassName;
   import starling.core.Starling;
   import starling.utils.Color;
   import starling.utils.§_-U2i§;
   import starling.utils.§_-s7§;
   import starling.utils.execute;
   import starling.utils.getNextPowerOfTwo;
   
   public class Texture
   {
      
      public function Texture()
      {
         super();
         if(Capabilities.isDebugger && getQualifiedClassName(this) == "starling.textures::Texture")
         {
            throw new §_-F1v§();
         }
      }
      
      public static function §_-t2w§(param1:Object, param2:§_-n1m§ = null) : starling.textures.Texture
      {
         var _loc3_:starling.textures.Texture = null;
         if(param1 is Bitmap)
         {
            param1 = (param1 as Bitmap).bitmapData;
         }
         if(param2 == null)
         {
            param2 = new §_-n1m§();
         }
         if(param1 is Class)
         {
            _loc3_ = §_-72B§(param1 as Class,param2.mipMapping,param2.optimizeForRenderToTexture,param2.scale,param2.format,param2.repeat);
         }
         else if(param1 is BitmapData)
         {
            _loc3_ = §_-h2H§(param1 as BitmapData,param2.mipMapping,param2.optimizeForRenderToTexture,param2.scale,param2.format,param2.repeat);
         }
         else
         {
            if(!(param1 is ByteArray))
            {
               throw new ArgumentError("Unsupported \'data\' type: " + getQualifiedClassName(param1));
            }
            _loc3_ = §_-21K§(param1 as ByteArray,param2.scale,param2.mipMapping,param2.§_-s1u§,param2.repeat);
         }
         return _loc3_;
      }
      
      public static function §_-72B§(param1:Class, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : starling.textures.Texture
      {
         var texture:starling.textures.Texture = null;
         var assetClass:Class = param1;
         var mipMapping:Boolean = param2;
         var optimizeForRenderToTexture:Boolean = param3;
         var scale:Number = param4;
         var format:String = param5;
         var repeat:Boolean = param6;
         var asset:Object = new assetClass();
         if(asset is Bitmap)
         {
            texture = starling.textures.Texture.§_-Q1D§(asset as Bitmap,mipMapping,optimizeForRenderToTexture,scale,format,repeat);
            texture.root.§_-y1f§ = function():void
            {
               texture.root.§_-91J§(new assetClass());
            };
         }
         else
         {
            if(!(asset is ByteArray))
            {
               throw new ArgumentError("Invalid asset type: " + getQualifiedClassName(asset));
            }
            texture = starling.textures.Texture.§_-21K§(asset as ByteArray,scale,mipMapping,null,repeat);
            texture.root.§_-y1f§ = function():void
            {
               texture.root.§_-vI§(new assetClass());
            };
         }
         asset = null;
         return texture;
      }
      
      public static function §_-Q1D§(param1:Bitmap, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : starling.textures.Texture
      {
         return §_-h2H§(param1.bitmapData,param2,param3,param4,param5,param6);
      }
      
      public static function §_-h2H§(param1:BitmapData, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : starling.textures.Texture
      {
         var texture:starling.textures.Texture = null;
         var data:BitmapData = param1;
         var generateMipMaps:Boolean = param2;
         var optimizeForRenderToTexture:Boolean = param3;
         var scale:Number = param4;
         var format:String = param5;
         var repeat:Boolean = param6;
         texture = starling.textures.Texture.§_-p2i§(data.width / scale,data.height / scale,true,generateMipMaps,optimizeForRenderToTexture,scale,format,repeat);
         texture.root.§_-YT§(data);
         texture.root.§_-y1f§ = function():void
         {
            texture.root.§_-YT§(data);
         };
         return texture;
      }
      
      public static function §_-21K§(param1:ByteArray, param2:Number = 1, param3:Boolean = true, param4:Function = null, param5:Boolean = false) : starling.textures.Texture
      {
         var atfData:§_-X1w§;
         var nativeTexture:flash.display3D.textures.Texture;
         var concreteTexture:§_-72X§ = null;
         var data:ByteArray = param1;
         var scale:Number = param2;
         var useMipMaps:Boolean = param3;
         var async:Function = param4;
         var repeat:Boolean = param5;
         var context:Context3D = Starling.context;
         if(context == null)
         {
            throw new §_-j1b§();
         }
         atfData = new §_-X1w§(data);
         nativeTexture = context.createTexture(atfData.width,atfData.height,atfData.format,false);
         concreteTexture = new §_-72X§(nativeTexture,atfData.format,atfData.width,atfData.height,useMipMaps && atfData.§_-B2z§ > 1,false,false,scale,repeat);
         concreteTexture.§_-vI§(data,0,async);
         concreteTexture.§_-y1f§ = function():void
         {
            concreteTexture.§_-vI§(data,0);
         };
         return concreteTexture;
      }
      
      public static function §_-D1N§(param1:NetStream, param2:Number = 1, param3:Function = null) : starling.textures.Texture
      {
         var stream:NetStream = param1;
         var scale:Number = param2;
         var onComplete:Function = param3;
         if(stream.client == stream && !("onMetaData" in stream))
         {
            stream.client = {"onMetaData":function(param1:Object):void
            {
            }};
         }
         return §_-rs§("NetStream",stream,scale,onComplete);
      }
      
      public static function §_-4V§(param1:Camera, param2:Number = 1, param3:Function = null) : starling.textures.Texture
      {
         return §_-rs§("Camera",param1,param2,param3);
      }
      
      private static function §_-rs§(param1:String, param2:Object, param3:Number, param4:Function) : starling.textures.Texture
      {
         var context:Context3D;
         var TEXTURE_READY:String = null;
         var base:TextureBase = null;
         var texture:§_-vq§ = null;
         var type:String = param1;
         var attachment:Object = param2;
         var scale:Number = param3;
         var onComplete:Function = param4;
         TEXTURE_READY = "textureReady";
         if(!§_-s7§.supportsVideoTexture)
         {
            throw new §_-g2t§("Video Textures are not supported on this platform");
         }
         context = Starling.context;
         if(context == null)
         {
            throw new §_-j1b§();
         }
         base = context["createVideoTexture"]();
         base["attach" + type](attachment);
         base.addEventListener(TEXTURE_READY,function(param1:Object):void
         {
            base.removeEventListener(TEXTURE_READY,arguments.callee);
            execute(onComplete,texture);
         });
         texture = new §_-vq§(base,scale);
         texture.§_-y1f§ = function():void
         {
            texture.root.§_-gT§(type,attachment);
         };
         return texture;
      }
      
      public static function §_-Q9§(param1:Number, param2:Number, param3:uint = 4294967295, param4:Boolean = false, param5:Number = -1, param6:String = "bgra") : starling.textures.Texture
      {
         var texture:starling.textures.Texture = null;
         var width:Number = param1;
         var height:Number = param2;
         var color:uint = param3;
         var optimizeForRenderToTexture:Boolean = param4;
         var scale:Number = param5;
         var format:String = param6;
         texture = starling.textures.Texture.§_-p2i§(width,height,true,false,optimizeForRenderToTexture,scale,format);
         texture.root.clear(color,Color.§_-E2h§(color) / 255);
         texture.root.§_-y1f§ = function():void
         {
            texture.root.clear(color,Color.§_-E2h§(color) / 255);
         };
         return texture;
      }
      
      public static function §_-p2i§(param1:Number, param2:Number, param3:Boolean = true, param4:Boolean = true, param5:Boolean = false, param6:Number = -1, param7:String = "bgra", param8:Boolean = false) : starling.textures.Texture
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:TextureBase = null;
         if(param6 <= 0)
         {
            param6 = Starling.§_-Cj§;
         }
         var _loc12_:Context3D = Starling.context;
         if(_loc12_ == null)
         {
            throw new §_-j1b§();
         }
         var _loc13_:Number = param1 * param6;
         var _loc14_:Number = param2 * param6;
         var _loc15_:Boolean = !param4 && !param8 && Starling.§_-n1s§.profile != "baselineConstrained" && "createRectangleTexture" in _loc12_ && param7.indexOf("compressed") == -1;
         if(_loc15_)
         {
            _loc9_ = Math.ceil(_loc13_ - 1e-9);
            _loc10_ = Math.ceil(_loc14_ - 1e-9);
            _loc11_ = _loc12_["createRectangleTexture"](_loc9_,_loc10_,param7,param5);
         }
         else
         {
            _loc9_ = getNextPowerOfTwo(_loc13_);
            _loc10_ = getNextPowerOfTwo(_loc14_);
            _loc11_ = _loc12_.createTexture(_loc9_,_loc10_,param7,param5);
         }
         var _loc16_:§_-72X§ = new §_-72X§(_loc11_,param7,_loc9_,_loc10_,param4,param3,param5,param6,param8);
         _loc16_.§_-y1f§ = _loc16_.clear;
         if(_loc9_ - _loc13_ < 0.001 && _loc10_ - _loc14_ < 0.001)
         {
            return _loc16_;
         }
         return new SubTexture(_loc16_,new Rectangle(0,0,param1,param2),true);
      }
      
      public static function §_-L2i§(param1:starling.textures.Texture, param2:Rectangle = null, param3:Rectangle = null, param4:Boolean = false) : starling.textures.Texture
      {
         return new SubTexture(param1,param2,false,param3,param4);
      }
      
      public static function get §_-o1D§() : int
      {
         var _loc1_:Starling = Starling.§_-n1s§;
         var _loc2_:String = _loc1_ ? _loc1_.profile : "baseline";
         if(_loc2_ == "baseline" || _loc2_ == "baselineConstrained")
         {
            return 2048;
         }
         return 4096;
      }
      
      public function dispose() : void
      {
      }
      
      public function §_-B19§(param1:§_-U2i§, param2:int, param3:int) : void
      {
      }
      
      public function §_-Dh§(param1:Vector.<Number>, param2:int = 0, param3:int = 0, param4:int = -1) : void
      {
      }
      
      public function get frame() : Rectangle
      {
         return null;
      }
      
      public function get repeat() : Boolean
      {
         return false;
      }
      
      public function get width() : Number
      {
         return 0;
      }
      
      public function get height() : Number
      {
         return 0;
      }
      
      public function get nativeWidth() : Number
      {
         return 0;
      }
      
      public function get nativeHeight() : Number
      {
         return 0;
      }
      
      public function get scale() : Number
      {
         return 1;
      }
      
      public function get base() : TextureBase
      {
         return null;
      }
      
      public function get root() : §_-72X§
      {
         return null;
      }
      
      public function get format() : String
      {
         return Context3DTextureFormat.BGRA;
      }
      
      public function get mipMapping() : Boolean
      {
         return false;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return false;
      }
   }
}


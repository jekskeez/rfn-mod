package §_-C1l§
{
   import §_-1T§.DisplayObjectManager;
   import §_-1T§.§_-02y§;
   import §_-O24§.§_-l1D§;
   import §_-RI§.§_-52F§;
   import §_-RI§.§_-XK§;
   import §_-RI§.§_-h2I§;
   import avmplus.getQualifiedClassName;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.textures.Texture;
   
   public class §_-a2§
   {
      
      private static const §_-t1y§:int = 2048;
      
      public static var count:int = 0;
      
      private static var §_-j20§:Number = 1;
      
      private static var §_-Pr§:§_-02y§ = null;
      
      public function §_-a2§()
      {
         super();
      }
      
      public static function set §_-v1n§(param1:Number) : void
      {
         §_-j20§ = param1;
      }
      
      public static function get §_-v1n§() : Number
      {
         return §_-j20§;
      }
      
      public static function §_-a3§(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:int = 0;
         if(param1 % 2)
         {
            _loc3_ = param1 > 0 ? 2 : -2;
         }
         if(param2)
         {
            return _loc3_;
         }
         return int(param1 * 0.5) * 2 + _loc3_;
      }
      
      public static function §_-727§() : BitmapData
      {
         var _loc1_:Number = Starling.§_-y1l§.§_-vA§;
         var _loc2_:int = Starling.§_-y1l§.§_-B9§.width;
         var _loc3_:int = Starling.§_-y1l§.§_-B9§.height;
         var _loc4_:§_-T2v§ = new §_-T2v§();
         _loc4_.clear(Starling.§_-y1l§.stage.color,1);
         _loc4_.§_-w2Q§(0,0,Starling.§_-y1l§.stage.stageWidth,Starling.§_-y1l§.stage.stageHeight);
         Starling.§_-y1l§.stage.render(_loc4_,1);
         _loc4_.§_-A1U§();
         var _loc5_:BitmapData = new BitmapData(int(_loc2_ * _loc1_),int(_loc3_ * _loc1_),true);
         Starling.context.drawToBitmapData(_loc5_);
         var _loc6_:BitmapData = new BitmapData(_loc2_,_loc3_,true);
         var _loc7_:Matrix = new Matrix(1 / _loc1_,0,0,1 / _loc1_);
         _loc6_.draw(_loc5_,_loc7_);
         _loc5_.dispose();
         return _loc6_;
      }
      
      public static function §_-A2v§(param1:starling.display.DisplayObject, param2:int, param3:int) : uint
      {
         var pixelsPerPoint:Number;
         var stageWidth:Number;
         var stageHeight:Number;
         var bufferWidth:Number;
         var bufferHeight:Number;
         var absolutePos:Point;
         var support:§_-T2v§;
         var stageBitmapData:BitmapData;
         var scaleX:Number;
         var scaleY:Number;
         var px:int;
         var py:int;
         var color:uint;
         var displayObject:starling.display.DisplayObject = param1;
         var x:int = param2;
         var y:int = param3;
         if(!displayObject.width || !displayObject.height)
         {
            return 0;
         }
         pixelsPerPoint = Starling.§_-y1l§.§_-vA§;
         stageWidth = Starling.§_-y1l§.stage.stageWidth;
         stageHeight = Starling.§_-y1l§.stage.stageHeight;
         bufferWidth = int(Starling.§_-y1l§.§_-B9§.width * pixelsPerPoint);
         bufferHeight = int(Starling.§_-y1l§.§_-B9§.height * pixelsPerPoint);
         absolutePos = new Point();
         support = new §_-T2v§();
         if(displayObject.parent)
         {
            absolutePos = displayObject.parent.localToGlobal(new Point(displayObject.x,displayObject.y));
         }
         support.clear();
         support.§_-w2Q§(0,0,stageWidth,stageHeight);
         support.§_-a2x§(absolutePos.x - displayObject.x,absolutePos.y - displayObject.y);
         support.§_-G3§();
         support.§_-62B§(displayObject);
         displayObject.render(support,1);
         support.§_-n1Z§();
         stageBitmapData = new BitmapData(bufferWidth,bufferHeight,true,0);
         support.§_-A1U§();
         try
         {
            Starling.context.drawToBitmapData(stageBitmapData);
         }
         catch(e:Error)
         {
         }
         scaleX = bufferWidth / stageWidth;
         scaleY = bufferHeight / stageHeight;
         px = int(x * scaleX);
         py = int(y * scaleY);
         if(px < 0 || py < 0 || px >= bufferWidth || py >= bufferHeight)
         {
            return 0;
         }
         color = stageBitmapData.getPixel32(px,py);
         if(color == 16777216 || color == 4278190080)
         {
            color = 0;
         }
         stageBitmapData.dispose();
         return color;
      }
      
      public static function §_-A3m§(param1:flash.display.DisplayObject, param2:Number, param3:Number) : Sprite
      {
         var _loc15_:Rectangle = null;
         var _loc16_:BitmapData = null;
         var _loc17_:Matrix = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc4_:Texture = null;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:String = §_-73c§();
         var _loc8_:String = getQualifiedClassName(param1) + "_fill";
         var _loc9_:int = Math.round(§_-j20§);
         var _loc10_:§_-jH§ = null;
         if(§_-x28§.§_-43X§(_loc8_).length > 0)
         {
            _loc4_ = §_-x28§.§_-43X§(_loc8_)[0].item;
         }
         else
         {
            _loc4_ = §_-l1D§.instance.getTexture(param1);
            if(_loc4_ == null)
            {
               _loc15_ = §_-w2p§(param1,1,1);
               _loc16_ = new BitmapData(_loc15_.width * _loc9_,_loc15_.height * _loc9_,true,0);
               _loc17_ = new Matrix();
               _loc17_.scale(_loc9_,_loc9_);
               _loc16_.draw(param1,_loc17_);
               _loc4_ = §_-43Q§(_loc16_,true);
               if(!(param1 is Shape))
               {
                  §_-x28§.add(_loc8_,_loc4_,false,_loc7_);
               }
               _loc16_.dispose();
               _loc16_ = null;
            }
         }
         var _loc11_:Sprite = new Sprite();
         var _loc12_:Vector.<§_-jH§> = new Vector.<§_-jH§>();
         _loc5_ = Math.ceil(param2 / (_loc4_.width / _loc9_));
         _loc6_ = Math.ceil(param3 / (_loc4_.height / _loc9_));
         var _loc13_:int = 0;
         var _loc14_:int = _loc5_;
         while(_loc13_ < _loc14_)
         {
            _loc18_ = 0;
            _loc19_ = _loc6_;
            while(_loc18_ < _loc19_)
            {
               _loc10_ = new §_-jH§(_loc4_);
               _loc12_.push(_loc10_);
               _loc10_.x = _loc13_ * _loc10_.width;
               _loc10_.y = _loc18_ * _loc10_.height;
               _loc11_.addChild(_loc10_);
               _loc18_++;
            }
            _loc13_++;
         }
         return _loc11_;
      }
      
      public static function §_-ZE§(param1:flash.display.DisplayObject, param2:Boolean = false) : §_-h2I§
      {
         var _loc3_:MovieClip = param1 as MovieClip;
         var _loc4_:§_-h2I§ = new §_-h2I§();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.numChildren)
         {
            _loc4_.§_-83v§(new §_-h2I§(_loc3_.getChildAt(_loc5_),param2));
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function §_-i2y§(param1:*, param2:int = 0, param3:Number = 1, param4:Number = 1, param5:String = null, param6:Boolean = false, param7:Boolean = false) : §_-jH§
      {
         var _loc10_:§_-jH§ = null;
         if(!param5 || param5 is String && param5.length == 0)
         {
            param5 = §_-73c§();
         }
         var _loc8_:Rectangle = §_-w2p§(param1,param3,param4);
         var _loc9_:Texture = §_-l1D§.instance.getTexture(param1);
         if(_loc9_ != null)
         {
            _loc10_ = new §_-jH§(_loc9_);
            _loc10_.scaleX = param3;
            _loc10_.scaleY = param4;
         }
         else
         {
            _loc10_ = new §_-jH§(getTexture(param1,param2,param3,param4,false,param5,param6,param7));
         }
         DisplayObjectManager.getInstance().add(_loc10_,getQualifiedClassName(param1) + ": " + param5);
         _loc10_.pivotX = param2 - _loc8_.x * §_-j20§;
         _loc10_.pivotY = param2 - _loc8_.y * §_-j20§;
         _loc10_.x = param1.x;
         _loc10_.y = param1.y;
         _loc10_.scaleX = _loc10_.scaleY = 1 / §_-j20§;
         return _loc10_;
      }
      
      public static function §_-w2p§(param1:flash.display.DisplayObject, param2:Number = 1, param3:Number = 1) : Rectangle
      {
         var _loc4_:Rectangle = param1.getBounds(param1);
         var _loc5_:int = §_-a3§(_loc4_.x);
         var _loc6_:int = §_-a3§(_loc4_.y);
         var _loc7_:int = §_-a3§(Math.abs(_loc4_.width)) - §_-a3§(_loc4_.x,true);
         var _loc8_:int = §_-a3§(Math.abs(_loc4_.height)) - §_-a3§(_loc4_.y,true);
         if(param2 == 0)
         {
            param2 = param1.scaleX;
         }
         if(param3 == 0)
         {
            param3 = param1.scaleY;
         }
         _loc7_ *= Math.abs(param2);
         _loc8_ *= Math.abs(param3);
         _loc5_ *= Math.abs(param2);
         _loc6_ *= Math.abs(param3);
         if(_loc7_ <= 0)
         {
            _loc7_ = 1;
         }
         if(_loc8_ <= 0)
         {
            _loc8_ = 1;
         }
         if(_loc7_ > §_-t1y§)
         {
            _loc7_ = §_-t1y§;
         }
         if(_loc8_ > §_-t1y§)
         {
            _loc8_ = §_-t1y§;
         }
         return new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public static function getTexture(param1:flash.display.DisplayObject, param2:int = 0, param3:Number = 1, param4:Number = 1, param5:Boolean = false, param6:String = null, param7:Boolean = false, param8:Boolean = false) : Texture
      {
         var rect:Rectangle = null;
         var bd:BitmapData = null;
         var mx:Matrix = null;
         var rescaleX:Number = NaN;
         var rescaleY:Number = NaN;
         var displayObj:flash.display.DisplayObject = param1;
         var z:int = param2;
         var xScale:Number = param3;
         var yScale:Number = param4;
         var repeat:Boolean = param5;
         var from:String = param6;
         var uniq:Boolean = param7;
         var noDelete:Boolean = param8;
         var texture:Texture = null;
         var className:String = getQualifiedClassName(displayObj);
         var len:int = int(§_-x28§.§_-43X§(className).length);
         if(!from || from is String && from.length == 0)
         {
            from = §_-73c§();
         }
         if(len > 0 && !uniq)
         {
            texture = §_-x28§.§_-43X§(className)[len - 1].item;
         }
         else
         {
            try
            {
               rect = §_-w2p§(displayObj,xScale * §_-j20§,yScale * §_-j20§);
               bd = new BitmapData(rect.width,rect.height,true,0);
               mx = new Matrix();
               rescaleX = xScale * §_-j20§;
               rescaleY = yScale * §_-j20§;
               mx.scale(rescaleX,rescaleY);
               mx.translate(z - rect.x,z - rect.y);
               bd.draw(displayObj,mx);
            }
            catch(e:Error)
            {
            }
            texture = §_-43Q§(bd,repeat);
            if(!uniq && !noDelete)
            {
               §_-x28§.add(className,texture,false,from);
            }
            if(uniq && !noDelete)
            {
               §_-x28§.§_-8M§(new §_-XK§(texture,true,from));
            }
            if(bd)
            {
               bd.dispose();
            }
            bd = null;
         }
         return texture;
      }
      
      public static function §_-73c§(param1:int = 4) : String
      {
         var _loc2_:String = "";
         if(§_-TQ§.§_-u24§)
         {
            _loc2_ = new Error().getStackTrace().split("\n",param1 + 1)[param1];
         }
         return _loc2_;
      }
      
      public static function §_-43Q§(param1:BitmapData, param2:Boolean = false) : Texture
      {
         var texture:Texture = null;
         var bmd:BitmapData = param1;
         var repeat:Boolean = param2;
         try
         {
            if(Boolean(bmd) && Boolean(bmd.width > 0) && bmd.height > 0)
            {
               texture = §_-52F§.§_-b2K§(bmd,false,true,1,"bgra",repeat);
            }
         }
         catch(e:Error)
         {
            texture = Texture.§_-31k§(2,2);
            §_-TQ§.add("textureFromBitmapData: " + e.message);
         }
         return texture;
      }
      
      private static function get §_-x28§() : §_-02y§
      {
         if(!§_-Pr§)
         {
            §_-Pr§ = §_-02y§.getInstance();
         }
         return §_-Pr§;
      }
   }
}


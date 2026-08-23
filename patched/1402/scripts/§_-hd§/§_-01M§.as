package §_-hd§
{
   import §_-B37§.§_-Y7§;
   import §_-Mq§.DisplayObjectManager;
   import §_-Mq§.§_-23h§;
   import §_-TK§.§_-Z1n§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-zg§;
   import avmplus.getQualifiedClassName;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.Starling;
   import starling.core.§_-wz§;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   
   public class §_-01M§
   {
      
      private static const §_-R1l§:int = 2048;
      
      public static var count:int = 0;
      
      private static var §_-oa§:Number = 1;
      
      private static var §_-61i§:§_-23h§ = null;
      
      public function §_-01M§()
      {
         super();
      }
      
      public static function set §_-22T§(param1:Number) : void
      {
         §_-oa§ = param1;
      }
      
      public static function get §_-22T§() : Number
      {
         return §_-oa§;
      }
      
      public static function §_-L2H§(param1:Number, param2:Boolean = false) : Number
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
      
      public static function §_-W1z§() : BitmapData
      {
         var _loc1_:Number = Starling.§_-n1s§.§_-a2T§;
         var _loc2_:int = Starling.§_-n1s§.§_-33S§.width;
         var _loc3_:int = Starling.§_-n1s§.§_-33S§.height;
         var _loc4_:§_-wz§ = new §_-wz§();
         _loc4_.clear(Starling.§_-n1s§.stage.color,1);
         _loc4_.§_-L1j§(0,0,Starling.§_-n1s§.stage.stageWidth,Starling.§_-n1s§.stage.stageHeight);
         Starling.§_-n1s§.stage.render(_loc4_,1);
         _loc4_.§_-z24§();
         var _loc5_:BitmapData = new BitmapData(int(_loc2_ * _loc1_),int(_loc3_ * _loc1_),true);
         Starling.context.drawToBitmapData(_loc5_);
         var _loc6_:BitmapData = new BitmapData(_loc2_,_loc3_,true);
         var _loc7_:Matrix = new Matrix(1 / _loc1_,0,0,1 / _loc1_);
         _loc6_.draw(_loc5_,_loc7_);
         _loc5_.dispose();
         return _loc6_;
      }
      
      public static function §_-G2E§(param1:starling.display.DisplayObject, param2:int, param3:int) : uint
      {
         var pixelsPerPoint:Number;
         var stageWidth:Number;
         var stageHeight:Number;
         var bufferWidth:Number;
         var bufferHeight:Number;
         var absolutePos:Point;
         var support:§_-wz§;
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
         pixelsPerPoint = Starling.§_-n1s§.§_-a2T§;
         stageWidth = Starling.§_-n1s§.stage.stageWidth;
         stageHeight = Starling.§_-n1s§.stage.stageHeight;
         bufferWidth = int(Starling.§_-n1s§.§_-33S§.width * pixelsPerPoint);
         bufferHeight = int(Starling.§_-n1s§.§_-33S§.height * pixelsPerPoint);
         absolutePos = new Point();
         support = new §_-wz§();
         if(displayObject.parent)
         {
            absolutePos = displayObject.parent.localToGlobal(new Point(displayObject.x,displayObject.y));
         }
         support.clear();
         support.§_-L1j§(0,0,stageWidth,stageHeight);
         support.§_-32z§(absolutePos.x - displayObject.x,absolutePos.y - displayObject.y);
         support.§_-V1d§();
         support.§_-71k§(displayObject);
         displayObject.render(support,1);
         support.§_-c2N§();
         stageBitmapData = new BitmapData(bufferWidth,bufferHeight,true,0);
         support.§_-z24§();
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
      
      public static function §_-D1J§(param1:flash.display.DisplayObject, param2:Number, param3:Number) : Sprite
      {
         var _loc15_:Rectangle = null;
         var _loc16_:BitmapData = null;
         var _loc17_:Matrix = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc4_:Texture = null;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:String = §_-Y1u§();
         var _loc8_:String = getQualifiedClassName(param1) + "_fill";
         var _loc9_:int = Math.round(§_-oa§);
         var _loc10_:§_-I2q§ = null;
         if(§_-91N§.§_-815§(_loc8_).length > 0)
         {
            _loc4_ = §_-91N§.§_-815§(_loc8_)[0].item;
         }
         else
         {
            _loc4_ = §_-Y7§.instance.getTexture(param1);
            if(_loc4_ == null)
            {
               _loc15_ = §_-rt§(param1,1,1);
               _loc16_ = new BitmapData(_loc15_.width * _loc9_,_loc15_.height * _loc9_,true,0);
               _loc17_ = new Matrix();
               _loc17_.scale(_loc9_,_loc9_);
               _loc16_.draw(param1,_loc17_);
               _loc4_ = §_-w1A§(_loc16_,true);
               if(!(param1 is Shape))
               {
                  §_-91N§.add(_loc8_,_loc4_,false,_loc7_);
               }
               _loc16_.dispose();
               _loc16_ = null;
            }
         }
         var _loc11_:Sprite = new Sprite();
         var _loc12_:Vector.<§_-I2q§> = new Vector.<§_-I2q§>();
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
               _loc10_ = new §_-I2q§(_loc4_);
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
      
      public static function §_-q1k§(param1:flash.display.DisplayObject, param2:Boolean = false) : §_-aS§
      {
         var _loc3_:MovieClip = param1 as MovieClip;
         var _loc4_:§_-aS§ = new §_-aS§();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.numChildren)
         {
            _loc4_.§_-J2J§(new §_-aS§(_loc3_.getChildAt(_loc5_),param2));
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function §_-Z1V§(param1:*, param2:int = 0, param3:Number = 1, param4:Number = 1, param5:String = null, param6:Boolean = false, param7:Boolean = false) : §_-I2q§
      {
         var _loc10_:§_-I2q§ = null;
         if(!param5 || param5 is String && param5.length == 0)
         {
            param5 = §_-Y1u§();
         }
         var _loc8_:Rectangle = §_-rt§(param1,param3,param4);
         var _loc9_:Texture = §_-Y7§.instance.getTexture(param1);
         if(_loc9_ != null)
         {
            _loc10_ = new §_-I2q§(_loc9_);
            _loc10_.scaleX = param3;
            _loc10_.scaleY = param4;
         }
         else
         {
            _loc10_ = new §_-I2q§(getTexture(param1,param2,param3,param4,false,param5,param6,param7));
         }
         DisplayObjectManager.getInstance().add(_loc10_,getQualifiedClassName(param1) + ": " + param5);
         _loc10_.pivotX = param2 - _loc8_.x * §_-oa§;
         _loc10_.pivotY = param2 - _loc8_.y * §_-oa§;
         _loc10_.x = param1.x;
         _loc10_.y = param1.y;
         _loc10_.scaleX = _loc10_.scaleY = 1 / §_-oa§;
         return _loc10_;
      }
      
      public static function §_-rt§(param1:flash.display.DisplayObject, param2:Number = 1, param3:Number = 1) : Rectangle
      {
         var _loc4_:Rectangle = param1.getBounds(param1);
         var _loc5_:int = §_-L2H§(_loc4_.x);
         var _loc6_:int = §_-L2H§(_loc4_.y);
         var _loc7_:int = §_-L2H§(Math.abs(_loc4_.width)) - §_-L2H§(_loc4_.x,true);
         var _loc8_:int = §_-L2H§(Math.abs(_loc4_.height)) - §_-L2H§(_loc4_.y,true);
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
         if(_loc7_ > §_-R1l§)
         {
            _loc7_ = §_-R1l§;
         }
         if(_loc8_ > §_-R1l§)
         {
            _loc8_ = §_-R1l§;
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
         var len:int = int(§_-91N§.§_-815§(className).length);
         if(!from || from is String && from.length == 0)
         {
            from = §_-Y1u§();
         }
         if(len > 0 && !uniq)
         {
            texture = §_-91N§.§_-815§(className)[len - 1].item;
         }
         else
         {
            try
            {
               rect = §_-rt§(displayObj,xScale * §_-oa§,yScale * §_-oa§);
               bd = new BitmapData(rect.width,rect.height,true,0);
               mx = new Matrix();
               rescaleX = xScale * §_-oa§;
               rescaleY = yScale * §_-oa§;
               mx.scale(rescaleX,rescaleY);
               mx.translate(z - rect.x,z - rect.y);
               bd.draw(displayObj,mx);
            }
            catch(e:Error)
            {
            }
            texture = §_-w1A§(bd,repeat);
            if(!uniq && !noDelete)
            {
               §_-91N§.add(className,texture,false,from);
            }
            if(uniq && !noDelete)
            {
               §_-91N§.§_-B2m§(new §_-Z1n§(texture,true,from));
            }
            if(bd)
            {
               bd.dispose();
            }
            bd = null;
         }
         return texture;
      }
      
      public static function §_-Y1u§(param1:int = 4) : String
      {
         var _loc2_:String = "";
         if(§_-p2U§.§_-i10§)
         {
            _loc2_ = new Error().getStackTrace().split("\n",param1 + 1)[param1];
         }
         return _loc2_;
      }
      
      public static function §_-w1A§(param1:BitmapData, param2:Boolean = false) : Texture
      {
         var texture:Texture = null;
         var bmd:BitmapData = param1;
         var repeat:Boolean = param2;
         try
         {
            if(Boolean(bmd) && Boolean(bmd.width > 0) && bmd.height > 0)
            {
               texture = §_-zg§.§_-h2H§(bmd,false,true,1,"bgra",repeat);
            }
         }
         catch(e:Error)
         {
            texture = Texture.§_-p2i§(2,2);
            §_-p2U§.add("textureFromBitmapData: " + e.message);
         }
         return texture;
      }
      
      private static function get §_-91N§() : §_-23h§
      {
         if(!§_-61i§)
         {
            §_-61i§ = §_-23h§.getInstance();
         }
         return §_-61i§;
      }
   }
}


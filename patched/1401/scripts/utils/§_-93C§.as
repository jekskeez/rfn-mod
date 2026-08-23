package utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.ImageDecodingPolicy;
   import flash.system.LoaderContext;
   
   public class §_-93C§
   {
      
      public function §_-93C§()
      {
         super();
      }
      
      public static function init(param1:DisplayObject, param2:Number, param3:Number, param4:Number = 0, param5:Number = 0) : void
      {
         param1.x = param2;
         param1.y = param3;
         if(param4 != 0)
         {
            param1.width = param4;
         }
         if(param5 != 0)
         {
            param1.height = param5;
         }
      }
      
      public static function scale(param1:Bitmap, param2:Number, param3:Number) : Bitmap
      {
         var _loc4_:Bitmap = copy(param1);
         §_-93C§.resize(_loc4_,param2,param3);
         return _loc4_;
      }
      
      public static function copy(param1:Bitmap) : Bitmap
      {
         var _loc2_:BitmapData = param1.bitmapData.clone();
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         _loc3_.smoothing = true;
         _loc3_.pixelSnapping = PixelSnapping.NEVER;
         return _loc3_;
      }
      
      public static function center(param1:Bitmap, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.x = param4 + int((param2 - param1.width) * 0.5);
         param1.y = param5 + int((param3 - param1.height) * 0.5);
      }
      
      public static function load(param1:String, param2:Object, param3:Function, param4:* = null, param5:Boolean = false) : void
      {
         var complete:Function;
         var fail:Function;
         var loader:Loader;
         var request:URLRequest;
         var tries:int;
         var variables:URLVariables = null;
         var key:String = null;
         var url:String = param1;
         var params:Object = param2;
         var onComplete:Function = param3;
         var data:* = param4;
         var async:Boolean = param5;
         var context:LoaderContext = new LoaderContext();
         context.imageDecodingPolicy = async ? ImageDecodingPolicy.ON_LOAD : ImageDecodingPolicy.ON_DEMAND;
         complete = (function(param1:Function, param2:*):Function
         {
            var onComplete:Function = param1;
            var data:* = param2;
            return function(param1:Event):void
            {
               var photo:* = undefined;
               var e:Event = param1;
               try
               {
                  photo = e.currentTarget.content;
                  photo.smoothing = true;
                  photo.pixelSnapping = PixelSnapping.NEVER;
                  onComplete(photo,data);
               }
               catch(e:Error)
               {
                  §_-TQ§.add("Failed to load photo1",e);
                  onComplete(null,data);
               }
            };
         })(onComplete,data);
         fail = (function(param1:Function, param2:*):Function
         {
            var onComplete:Function = param1;
            var data:* = param2;
            return function(param1:Event):void
            {
               §_-TQ§.add("Failed to load photo2",param1);
               onComplete(null,data);
            };
         })(onComplete,data);
         loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,complete);
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,fail);
         loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,fail);
         request = new URLRequest(url);
         request.method = URLRequestMethod.GET;
         if(params != null)
         {
            variables = new URLVariables();
            for(key in params)
            {
               variables[key] = params[key];
            }
            request.data = variables;
         }
         tries = 3;
         while(tries != 0)
         {
            try
            {
               loader.load(request,context);
               return;
            }
            catch(e:Error)
            {
               §_-TQ§.add("Failed to load photo3",e);
            }
            tries--;
         }
         onComplete(null,data);
      }
      
      public static function §_-t2o§(param1:DisplayObject, param2:Number, param3:Number) : Object
      {
         if(param1.width <= param2 && param1.height <= param3)
         {
            return {
               "width":param1.width,
               "height":param1.height
            };
         }
         var _loc4_:Number = param2 / param1.width;
         var _loc5_:Number = param3 / param1.height;
         var _loc6_:Number = _loc4_ < _loc5_ ? _loc4_ : _loc5_;
         var _loc7_:Boolean = _loc4_ == _loc6_;
         var _loc8_:Number = _loc7_ ? param2 : param1.width * _loc6_;
         var _loc9_:Number = !_loc7_ ? param3 : param1.height * _loc6_;
         return {
            "width":int(_loc8_),
            "height":int(_loc9_),
            "ratio":_loc6_
         };
      }
      
      public static function §_-e2o§(param1:DisplayObject, param2:int, param3:int) : Bitmap
      {
         var _loc5_:BitmapData = null;
         var _loc4_:Sprite = new Sprite();
         var _loc6_:DisplayObject = param1;
         _loc6_.width = param2;
         _loc6_.height = param3;
         _loc4_.addChild(_loc6_);
         _loc5_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc5_.draw(_loc4_);
         return new Bitmap(_loc5_);
      }
      
      public static function getBitmapData(param1:DisplayObject, param2:Point = null) : BitmapData
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(param1);
         var _loc4_:BitmapData = new BitmapData(param2 ? int(param2.x) : int(param1.width),param2 ? int(param2.y) : int(param1.height),true,0);
         _loc4_.draw(_loc3_);
         return _loc4_;
      }
      
      public static function §_-id§(param1:BitmapData) : BitmapData
      {
         var _loc2_:Rectangle = param1.getColorBoundsRect(4278190080,0,false);
         if(_loc2_.width == 0 || _loc2_.height == 0)
         {
            return new BitmapData(1,1,true,0);
         }
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.copyPixels(param1,_loc2_,new Point(0,0));
         return _loc3_;
      }
      
      private static function resize(param1:DisplayObject, param2:Number, param3:Number) : void
      {
         var _loc4_:Object = §_-t2o§(param1,param2,param3);
         param1.scaleX = _loc4_["ratio"];
         param1.scaleY = _loc4_["ratio"];
      }
   }
}


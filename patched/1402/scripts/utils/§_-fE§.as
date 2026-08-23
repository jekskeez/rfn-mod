package utils
{
   import §_-q2r§.MultipartURLLoader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class §_-fE§
   {
      
      public function §_-fE§()
      {
         super();
      }
      
      public static function load(param1:String, param2:Boolean, param3:Object = null, param4:Function = null, param5:Function = null, param6:* = null) : URLLoader
      {
         var complete:Function;
         var error:Function;
         var loader:URLLoader;
         var urlVariabels:URLVariables = null;
         var key:* = undefined;
         var url:String = param1;
         var isPost:Boolean = param2;
         var variables:Object = param3;
         var onComplete:Function = param4;
         var onError:Function = param5;
         var data:* = param6;
         var request:URLRequest = new URLRequest();
         if(isPost)
         {
            request.method = URLRequestMethod.POST;
         }
         else
         {
            request.method = URLRequestMethod.GET;
         }
         request.url = url;
         if(variables != null)
         {
            urlVariabels = new URLVariables();
            for(key in variables)
            {
               urlVariabels[key] = variables[key];
            }
            request.data = urlVariabels;
         }
         complete = (function(param1:Function, param2:*):Function
         {
            var onComplete:Function = param1;
            var data:* = param2;
            return function(param1:Event):void
            {
               if(onComplete == null)
               {
                  return;
               }
               if(data == null)
               {
                  onComplete(param1);
               }
               else
               {
                  onComplete(param1,data);
               }
            };
         })(onComplete,data);
         error = (function(param1:Function, param2:*):Function
         {
            var onError:Function = param1;
            var data:* = param2;
            return function(param1:Event):void
            {
               §_-p2U§.add("Failed to load url: " + param1);
               if(onError == null)
               {
                  return;
               }
               if(data == null)
               {
                  onError(param1);
               }
               else
               {
                  onError(param1,data);
               }
            };
         })(onError,data);
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,complete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,error);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,error);
         try
         {
            loader.load(request);
         }
         catch(e:Error)
         {
            error(e);
         }
         return loader;
      }
      
      public static function §_-U1r§(param1:String, param2:ByteArray, param3:Object, param4:Function = null, param5:Function = null) : void
      {
         var key:String = null;
         var url:String = param1;
         var data:ByteArray = param2;
         var variables:Object = param3;
         var onComplete:Function = param4;
         var onError:Function = param5;
         var complete:Function = (function(param1:Function):Function
         {
            var onComplete:Function = param1;
            return function(param1:Event):void
            {
               if(onComplete == null)
               {
                  return;
               }
               onComplete(param1);
            };
         })(onComplete);
         var error:Function = (function(param1:Function):Function
         {
            var onError:Function = param1;
            return function(param1:Event):void
            {
               §_-p2U§.add("Failed to uploadFile: " + param1);
               if(onError == null)
               {
                  return;
               }
               onError(param1);
            };
         })(onError);
         var loader:MultipartURLLoader = new MultipartURLLoader();
         for(key in variables)
         {
            loader.§_-p1c§(key,variables[key]);
         }
         loader.§_-m2R§(data,"photo.png","photo");
         loader.addEventListener(Event.COMPLETE,complete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,error);
         loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,error);
         try
         {
            loader.load(url);
         }
         catch(e:Error)
         {
            error(e);
         }
      }
   }
}


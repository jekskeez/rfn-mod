package utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Matrix;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class §_-qp§ extends Sprite
   {
      
      private var loader:Loader = null;
      
      private var url:String = "";
      
      private var §_-jE§:int = 50;
      
      private var §_-e26§:int = 50;
      
      private var §_-ys§:DisplayObject = null;
      
      private var §_-X25§:Class = null;
      
      private var §_-T1E§:Boolean = false;
      
      public function §_-qp§(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Class = null, param7:Boolean = false)
      {
         var _loc8_:DisplayObject = null;
         var _loc9_:Bitmap = null;
         var _loc10_:BitmapData = null;
         super();
         if(param6 != null)
         {
            this.§_-X25§ = param6;
            this.§_-T1E§ = param7;
            _loc8_ = new this.§_-X25§();
            _loc9_ = null;
            if(this.§_-T1E§)
            {
               _loc10_ = new BitmapData(param4 + 1,param5 + 1,true,16777215);
               _loc10_.draw(_loc8_,new Matrix(param4 / _loc8_.width,0,0,param5 / _loc8_.height,0,0));
               _loc9_ = new Bitmap(_loc10_);
               _loc9_.smoothing = true;
               §_-TQ§.add("rastredImage");
               this.§_-ys§ = _loc9_;
            }
            else
            {
               _loc8_.width = param4;
               _loc8_.height = param5;
               §_-TQ§.add("defaultImage");
               this.§_-ys§ = _loc8_;
            }
            addChild(this.§_-ys§);
         }
         this.§_-jE§ = param4;
         this.§_-e26§ = param5;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoad);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§_-31n§);
         this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§_-31n§);
         this.url = param1;
         if(this.url != "")
         {
            this.loader.load(new URLRequest(this.url),new LoaderContext(true));
         }
         this.x = param2;
         this.y = param3;
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         this.reset();
         this.url = "loaded_from_bytes";
         this.loader.loadBytes(param1);
      }
      
      public function load(param1:String) : void
      {
         var url:String = param1;
         if(!url)
         {
            this.reset();
            return;
         }
         if(url.indexOf("http:") > -1)
         {
            url = url.replace("http","https");
         }
         if(url == this.url)
         {
            return;
         }
         this.reset();
         this.url = url;
         try
         {
            this.loader.load(new URLRequest(this.url),new LoaderContext(true));
         }
         catch(e:Error)
         {
            §_-TQ§.add("PhotoLoader->load:" + e.message);
            §_-TQ§.add("this.url: " + this.url);
         }
      }
      
      public function reset() : void
      {
         var _loc3_:BitmapData = null;
         this.url = "";
         §_-TQ§.add("reset");
         if(this.§_-X25§ == null)
         {
            if(this.§_-ys§ != null)
            {
               removeChild(this.§_-ys§);
               this.§_-ys§ = null;
            }
            return;
         }
         if(this.§_-ys§ != null && !(this.§_-ys§ is this.§_-X25§))
         {
            removeChild(this.§_-ys§);
            this.§_-ys§ = null;
         }
         if(this.§_-ys§ != null)
         {
            return;
         }
         var _loc1_:DisplayObject = new this.§_-X25§();
         _loc1_.width = this.§_-jE§;
         _loc1_.height = this.§_-e26§;
         var _loc2_:Bitmap = null;
         if(this.§_-T1E§)
         {
            _loc3_ = new BitmapData(_loc1_.width + 1,_loc1_.height + 1,true,16777215);
            _loc3_.draw(_loc1_);
            _loc2_ = new Bitmap(_loc3_);
            _loc2_.smoothing = true;
            this.§_-ys§ = _loc2_;
         }
         else
         {
            this.§_-ys§ = _loc1_;
         }
         addChild(this.§_-ys§);
      }
      
      private function onLoad(param1:Event) : void
      {
         var e:Event = param1;
         try
         {
            this.loader.content.width = Math.min(this.loader.content.width,this.§_-jE§);
            this.loader.content.height = Math.min(this.loader.content.height,this.§_-e26§);
            this.loader.content.scaleY = this.loader.content.scaleX = Math.min(this.loader.content.scaleX,this.loader.content.scaleY);
            this.loader.content.x = (this.§_-jE§ - this.loader.content.width) * 0.5;
            this.loader.content.y = (this.§_-e26§ - this.loader.content.height) * 0.5;
            §_-TQ§.add("onLoad",this.§_-ys§,this.§_-ys§ ? contains(this.§_-ys§) : "null");
            if(this.§_-ys§ != null && contains(this.§_-ys§))
            {
               removeChild(this.§_-ys§);
            }
            (this.loader.content as Bitmap).smoothing = true;
            this.§_-ys§ = this.loader;
            addChild(this.§_-ys§);
         }
         catch(error:Error)
         {
            §_-TQ§.add("PhotoLoader->onLoad" + error.message);
         }
      }
      
      private function §_-31n§(param1:Event) : void
      {
         §_-TQ§.add("PhotoLoader: Fail to load url: ",this.url);
         this.reset();
      }
   }
}


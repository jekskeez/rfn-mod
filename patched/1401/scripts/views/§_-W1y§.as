package views
{
   import §_-I10§.§_-g2W§;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public class §_-W1y§ extends Sprite
   {
      
      protected var movieLoader:MovieClip = null;
      
      protected var image:Loader = new Loader();
      
      protected var callback:Function;
      
      private var id:int = -1;
      
      private var loaded:Boolean = false;
      
      private var §_-p1X§:URLLoader;
      
      public function §_-W1y§(param1:int, param2:Boolean = true, param3:Function = null)
      {
         super();
         this.id = param1;
         this.callback = param3;
         this.movieLoader = new MoviePreload();
         this.movieLoader.x = (312 - 36) * 0.5;
         this.movieLoader.y = (222 - 36) * 0.5;
         addChild(this.movieLoader);
         this.image.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-R9§);
         this.image.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.image.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         addChild(this.image);
         if(param2)
         {
            this.load();
         }
      }
      
      override public function get width() : Number
      {
         return 312 * this.scaleX;
      }
      
      override public function get height() : Number
      {
         return 222 * this.scaleY;
      }
      
      public function load() : void
      {
         if(this.loaded)
         {
            return;
         }
         this.loaded = true;
         var _loc1_:String = this.id in §_-g2W§.§_-12e§ ? §_-g2W§.§_-12e§[this.id] : "";
         this.§_-p1X§ = new URLLoader();
         this.§_-p1X§.dataFormat = URLLoaderDataFormat.BINARY;
         this.§_-p1X§.addEventListener(Event.COMPLETE,this.onLoaded);
         this.§_-p1X§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.§_-p1X§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-p1X§.load(new URLRequest(§_-a9§.§_-t2x§ + "clothes/packages/ImagePackage" + this.id + ".png" + _loc1_));
      }
      
      protected function §_-R9§(param1:Event) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.image.numChildren)
         {
            if(this.image.getChildAt(_loc2_) is Bitmap)
            {
               (this.image.getChildAt(_loc2_) as Bitmap).smoothing = true;
            }
            _loc2_++;
         }
         this.movieLoader.visible = false;
         this.dispatchEvent(new Event(Event.COMPLETE));
         if(this.callback != null)
         {
            this.callback();
         }
      }
      
      private function onLoaded(param1:Event) : void
      {
         if((param1.currentTarget as URLLoader).data.length == 0)
         {
            return;
         }
         var _loc2_:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.image.loadBytes((param1.currentTarget as URLLoader).data,_loc2_);
      }
      
      private function onError(param1:Event) : void
      {
         §_-TQ§.add("Failed to load PackageImage[Event]:" + param1.toString());
      }
   }
}


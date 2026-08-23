package views
{
   import §_-X1k§.§_-P2x§;
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
   
   public class §_-332§ extends Sprite
   {
      
      private static var §_-UW§:Object = {};
      
      protected var movieLoader:MovieClip = null;
      
      protected var image:Loader = new Loader();
      
      private var id:int = -1;
      
      private var loaded:Boolean = false;
      
      private var §_-w1f§:URLLoader;
      
      public function §_-332§(param1:int, param2:Boolean = true)
      {
         super();
         this.id = param1;
         this.movieLoader = new MoviePreload();
         this.movieLoader.x = (70 - 36) * 0.5;
         this.movieLoader.y = (60 - 36) * 0.5;
         addChild(this.movieLoader);
         this.image.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-03l§);
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
         return 70 * this.scaleX;
      }
      
      override public function get height() : Number
      {
         return 60 * this.scaleY;
      }
      
      public function load() : void
      {
         var _loc2_:LoaderContext = null;
         if(this.loaded)
         {
            return;
         }
         this.loaded = true;
         if(this.id in §_-UW§)
         {
            _loc2_ = new LoaderContext(false,ApplicationDomain.currentDomain);
            this.image.loadBytes(§_-UW§[this.id],_loc2_);
            return;
         }
         var _loc1_:String = this.id in §_-P2x§.§_-W1W§ ? §_-P2x§.§_-W1W§[this.id] : "";
         this.§_-w1f§ = new URLLoader();
         this.§_-w1f§.dataFormat = URLLoaderDataFormat.BINARY;
         this.§_-w1f§.addEventListener(Event.COMPLETE,this.onLoaded);
         this.§_-w1f§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.§_-w1f§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-w1f§.load(new URLRequest(§_-Zy§.§_-Y13§ + "clothes/accessories_small/ImageAccessorySmall_" + this.id + ".png" + _loc1_));
      }
      
      protected function §_-03l§(param1:Event) : void
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
      }
      
      private function onLoaded(param1:Event) : void
      {
         if((param1.currentTarget as URLLoader).data.length == 0)
         {
            return;
         }
         var _loc2_:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.image.loadBytes((param1.currentTarget as URLLoader).data,_loc2_);
         §_-UW§[this.id] = (param1.currentTarget as URLLoader).data;
      }
      
      private function onError(param1:Event) : void
      {
         §_-p2U§.add("Failed to load ClothesImage[Event]:" + param1.toString());
      }
   }
}


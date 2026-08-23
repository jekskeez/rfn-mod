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
   
   public class §_-O1q§ extends Sprite
   {
      
      private var loader:Loader = null;
      
      private var url:String = "";
      
      private var §_-4q§:int = 50;
      
      private var §_-w2V§:int = 50;
      
      private var §_-Sh§:DisplayObject = null;
      
      private var §_-V2e§:Class = null;
      
      private var §_-B3v§:Boolean = false;
      
      public function §_-O1q§(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Class = null, param7:Boolean = false)
      {
         var _loc8_:DisplayObject = null;
         var _loc9_:Bitmap = null;
         var _loc10_:BitmapData = null;
         super();
         if(param6 != null)
         {
            this.§_-V2e§ = param6;
            this.§_-B3v§ = param7;
            _loc8_ = new this.§_-V2e§();
            _loc9_ = null;
            if(this.§_-B3v§)
            {
               _loc10_ = new BitmapData(param4 + 1,param5 + 1,true,16777215);
               _loc10_.draw(_loc8_,new Matrix(param4 / _loc8_.width,0,0,param5 / _loc8_.height,0,0));
               _loc9_ = new Bitmap(_loc10_);
               _loc9_.smoothing = true;
               §_-p2U§.add("rastredImage");
               this.§_-Sh§ = _loc9_;
            }
            else
            {
               _loc8_.width = param4;
               _loc8_.height = param5;
               §_-p2U§.add("defaultImage");
               this.§_-Sh§ = _loc8_;
            }
            addChild(this.§_-Sh§);
         }
         this.§_-4q§ = param4;
         this.§_-w2V§ = param5;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoad);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§_-Ub§);
         this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§_-Ub§);
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
            §_-p2U§.add("PhotoLoader->load:" + e.message);
            §_-p2U§.add("this.url: " + this.url);
         }
      }
      
      public function reset() : void
      {
         var _loc3_:BitmapData = null;
         this.url = "";
         §_-p2U§.add("reset");
         if(this.§_-V2e§ == null)
         {
            if(this.§_-Sh§ != null)
            {
               removeChild(this.§_-Sh§);
               this.§_-Sh§ = null;
            }
            return;
         }
         if(this.§_-Sh§ != null && !(this.§_-Sh§ is this.§_-V2e§))
         {
            removeChild(this.§_-Sh§);
            this.§_-Sh§ = null;
         }
         if(this.§_-Sh§ != null)
         {
            return;
         }
         var _loc1_:DisplayObject = new this.§_-V2e§();
         _loc1_.width = this.§_-4q§;
         _loc1_.height = this.§_-w2V§;
         var _loc2_:Bitmap = null;
         if(this.§_-B3v§)
         {
            _loc3_ = new BitmapData(_loc1_.width + 1,_loc1_.height + 1,true,16777215);
            _loc3_.draw(_loc1_);
            _loc2_ = new Bitmap(_loc3_);
            _loc2_.smoothing = true;
            this.§_-Sh§ = _loc2_;
         }
         else
         {
            this.§_-Sh§ = _loc1_;
         }
         addChild(this.§_-Sh§);
      }
      
      private function onLoad(param1:Event) : void
      {
         var e:Event = param1;
         try
         {
            this.loader.content.width = Math.min(this.loader.content.width,this.§_-4q§);
            this.loader.content.height = Math.min(this.loader.content.height,this.§_-w2V§);
            this.loader.content.scaleY = this.loader.content.scaleX = Math.min(this.loader.content.scaleX,this.loader.content.scaleY);
            this.loader.content.x = (this.§_-4q§ - this.loader.content.width) * 0.5;
            this.loader.content.y = (this.§_-w2V§ - this.loader.content.height) * 0.5;
            §_-p2U§.add("onLoad",this.§_-Sh§,this.§_-Sh§ ? contains(this.§_-Sh§) : "null");
            if(this.§_-Sh§ != null && contains(this.§_-Sh§))
            {
               removeChild(this.§_-Sh§);
            }
            (this.loader.content as Bitmap).smoothing = true;
            this.§_-Sh§ = this.loader;
            addChild(this.§_-Sh§);
         }
         catch(error:Error)
         {
            §_-p2U§.add("PhotoLoader->onLoad" + error.message);
         }
      }
      
      private function §_-Ub§(param1:Event) : void
      {
         §_-p2U§.add("PhotoLoader: Fail to load url: ",this.url);
         this.reset();
      }
   }
}


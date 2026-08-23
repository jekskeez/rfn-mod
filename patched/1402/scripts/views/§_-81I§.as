package views
{
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public class §_-81I§ extends Sprite
   {
      
      private var §_-32y§:String = "";
      
      private var §_-s2w§:String = "";
      
      private var §_-Yw§:MovieClip = null;
      
      private var loader:Loader = null;
      
      private var context:LoaderContext;
      
      private var §_-Ig§:Object = {};
      
      private var currentContent:DisplayObject = null;
      
      public function §_-81I§()
      {
         super();
         this.§_-Yw§ = new MoviePreload();
         this.§_-Yw§.x = int((320 - this.§_-Yw§.width) * 0.5);
         this.§_-Yw§.y = int((145 - this.§_-Yw§.height) * 0.5);
         addChild(this.§_-Yw§);
         this.context = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoad);
      }
      
      public function set §_-Hk§(param1:String) : void
      {
         if(param1 == "")
         {
            this.visible = false;
            this.§_-32y§ = "";
            this.§_-s2w§ = "";
            return;
         }
         this.visible = true;
         this.§_-32y§ = param1;
         if(this.§_-Ig§[param1] != null)
         {
            this.§_-s2w§ = "";
            this.§_-S1s§(this.§_-Ig§[param1] as DisplayObject);
            return;
         }
         if(this.§_-s2w§ != "" && this.§_-s2w§ != param1)
         {
            try
            {
               this.loader.close();
            }
            catch(e:Error)
            {
            }
         }
         this.§_-s2w§ = param1;
         this.§_-Yw§.visible = true;
         this.loader.load(new URLRequest(§_-Zy§.§_-q2K§ + param1 + ".swf?37"),this.context);
      }
      
      public function §_-dq§() : void
      {
         this.§_-Ig§ = {};
         this.§_-s2w§ = "";
         if(Boolean(this.currentContent) && Boolean(this.currentContent.parent))
         {
            this.currentContent.parent.removeChild(this.currentContent);
         }
         this.currentContent = null;
      }
      
      private function §_-S1s§(param1:DisplayObject) : void
      {
         if(Boolean(this.currentContent) && Boolean(this.currentContent.parent))
         {
            this.currentContent.parent.removeChild(this.currentContent);
         }
         this.currentContent = param1;
         addChild(this.currentContent);
         this.§_-Yw§.visible = false;
      }
      
      private function onLoad(param1:Event) : void
      {
         var _loc2_:DisplayObject = this.loader.content;
         if(this.§_-s2w§ == "" || this.§_-s2w§ != this.§_-32y§)
         {
            this.§_-s2w§ = "";
            return;
         }
         this.§_-Ig§[this.§_-s2w§] = _loc2_;
         this.§_-s2w§ = "";
         this.§_-S1s§(_loc2_);
      }
   }
}


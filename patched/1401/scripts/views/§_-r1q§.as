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
   
   public class §_-r1q§ extends Sprite
   {
      
      private var §_-N2g§:String = "";
      
      private var §_-Z2I§:String = "";
      
      private var §_-821§:MovieClip = null;
      
      private var loader:Loader = null;
      
      private var context:LoaderContext;
      
      private var §_-x1o§:Object = {};
      
      private var currentContent:DisplayObject = null;
      
      public function §_-r1q§()
      {
         super();
         this.§_-821§ = new MoviePreload();
         this.§_-821§.x = int((320 - this.§_-821§.width) * 0.5);
         this.§_-821§.y = int((145 - this.§_-821§.height) * 0.5);
         addChild(this.§_-821§);
         this.context = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoad);
      }
      
      public function set §_-L2B§(param1:String) : void
      {
         if(param1 == "")
         {
            this.visible = false;
            this.§_-N2g§ = "";
            this.§_-Z2I§ = "";
            return;
         }
         this.visible = true;
         this.§_-N2g§ = param1;
         if(this.§_-x1o§[param1] != null)
         {
            this.§_-Z2I§ = "";
            this.§_-q2d§(this.§_-x1o§[param1] as DisplayObject);
            return;
         }
         if(this.§_-Z2I§ != "" && this.§_-Z2I§ != param1)
         {
            try
            {
               this.loader.close();
            }
            catch(e:Error)
            {
            }
         }
         this.§_-Z2I§ = param1;
         this.§_-821§.visible = true;
         this.loader.load(new URLRequest(§_-a9§.§_-J2G§ + param1 + ".swf?37"),this.context);
      }
      
      public function §_-d2v§() : void
      {
         this.§_-x1o§ = {};
         this.§_-Z2I§ = "";
         if(Boolean(this.currentContent) && Boolean(this.currentContent.parent))
         {
            this.currentContent.parent.removeChild(this.currentContent);
         }
         this.currentContent = null;
      }
      
      private function §_-q2d§(param1:DisplayObject) : void
      {
         if(Boolean(this.currentContent) && Boolean(this.currentContent.parent))
         {
            this.currentContent.parent.removeChild(this.currentContent);
         }
         this.currentContent = param1;
         addChild(this.currentContent);
         this.§_-821§.visible = false;
      }
      
      private function onLoad(param1:Event) : void
      {
         var _loc2_:DisplayObject = this.loader.content;
         if(this.§_-Z2I§ == "" || this.§_-Z2I§ != this.§_-N2g§)
         {
            this.§_-Z2I§ = "";
            return;
         }
         this.§_-x1o§[this.§_-Z2I§] = _loc2_;
         this.§_-Z2I§ = "";
         this.§_-q2d§(_loc2_);
      }
   }
}


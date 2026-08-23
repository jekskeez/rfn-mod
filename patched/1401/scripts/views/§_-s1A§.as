package views
{
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class §_-s1A§ extends Sprite
   {
      
      private var §_-r1i§:int;
      
      private var smooth:Boolean;
      
      private var bg:DisplayObject = null;
      
      private var photo:Loader = new Loader();
      
      private var player:Player = null;
      
      private var §_-p1X§:URLLoader;
      
      public function §_-s1A§(param1:int, param2:Boolean = true)
      {
         super();
         this.§_-r1i§ = param1;
         this.smooth = param2;
         var _loc3_:Sprite = new Sprite();
         addChild(_loc3_);
         this.bg = new NonPhotoImage();
         this.bg.width = param1;
         this.bg.scaleY = this.bg.scaleX;
         _loc3_.addChild(this.bg);
         this.photo.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§_-Xj§);
         this.photo.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.photo.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         _loc3_.addChild(this.photo);
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(0);
         _loc4_.graphics.drawRoundRect(0,0,param1,param1,int(param1 * 0.3),int(param1 * 0.3));
         _loc3_.mask = _loc4_;
         addChild(_loc4_);
      }
      
      public function §_-031§(param1:Player) : void
      {
         var player:Player = param1;
         if(player == this.player)
         {
            return;
         }
         this.bg.visible = true;
         this.photo.unload();
         if(this.player)
         {
            this.player.removeEventListener(this.§_-P9§);
         }
         this.player = player;
         if(!("photo_big" in this.player))
         {
            this.player.addEventListener(§_-hF§.§_-31X§,this.§_-P9§);
            Game.request(this.player["id"],§_-hF§.§_-31X§,false);
            return;
         }
         try
         {
            this.§_-k2h§(this.player["photo_big"]);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Failed to loadPhoto:" + e.errorID + " " + e.message);
         }
      }
      
      public function §_-P9§(param1:Player) : void
      {
         this.§_-k2h§(param1["photo_big"]);
         param1.removeEventListener(this.§_-P9§);
      }
      
      private function §_-k2h§(param1:String) : void
      {
         this.§_-p1X§ = new URLLoader();
         this.§_-p1X§.dataFormat = URLLoaderDataFormat.BINARY;
         this.§_-p1X§.addEventListener(Event.COMPLETE,this.onLoaded);
         this.§_-p1X§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.§_-p1X§.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.§_-p1X§.load(new URLRequest(param1));
      }
      
      private function onLoaded(param1:Event) : void
      {
         var _loc2_:ByteArray = (param1.currentTarget as URLLoader).data;
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.photo.loadBytes((param1.currentTarget as URLLoader).data,_loc3_);
      }
      
      private function §_-Xj§(param1:Event) : void
      {
         this.photo.width = this.photo.height = this.§_-r1i§;
         this.photo.scaleY = this.photo.scaleX = Math.max(this.photo.scaleY,this.photo.scaleX);
         this.photo.x = int((this.§_-r1i§ - this.photo.width) * 0.5);
         this.photo.y = int((this.§_-r1i§ - this.photo.height) * 0.5);
         this.bg.visible = false;
      }
      
      private function onError(param1:Event) : void
      {
         if(this.player.id == Game.selfId)
         {
            Game.self["photoBig"] = "";
            Game.§_-tR§({
               "name":Game.self["name"],
               "sex":Game.self["sex"]
            });
         }
         §_-TQ§.add("Failed to load Photo[Event]:" + param1.toString());
      }
   }
}


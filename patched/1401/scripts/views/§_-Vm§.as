package views
{
   import §_-42B§.TweenMax;
   import §_-T2y§.§_-92z§;
   import §_-r2A§.§_-E2G§;
   import buttons.§_-T2z§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.utils.setTimeout;
   
   public class §_-Vm§
   {
      
      private static var _instance:§_-Vm§;
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,18,16777215,null,null,null,null,null,"center");
      
      private var §_-XN§:TweenMax = null;
      
      private var §_-H17§:DisplayObject = null;
      
      private var sprite:Sprite;
      
      private var §_-m2X§:Sprite;
      
      private var §_-X2p§:SkyAnimation;
      
      private var §_-Z12§:§_-T2z§;
      
      private var fieldLoading:§_-22V§;
      
      private var movieLoader:MovieClip;
      
      private var _isOpened:Boolean;
      
      private var §_-EW§:Boolean = false;
      
      public function §_-Vm§()
      {
         this.sprite = new Sprite();
         this.§_-m2X§ = new Sprite();
         super();
         _instance = this;
         this.§_-X2p§ = new SkyAnimation();
         this.§_-X2p§.cacheAsBitmap = true;
         this.§_-X2p§.stop();
         this.§_-X2p§.addEventListener("Closed",function(param1:Event):void
         {
            _isOpened = false;
            fieldLoading.visible = true;
            movieLoader.visible = true;
         });
         this.§_-X2p§.addEventListener("Opened",function(param1:Event):void
         {
            _isOpened = true;
            fieldLoading.visible = false;
            movieLoader.visible = false;
         });
         this.sprite.addChild(this.§_-X2p§);
         this.§_-H17§ = §_-k2X§.§_-81z§();
         this.§_-H17§.scaleX = this.§_-H17§.scaleY = 1.2;
         this.§_-H17§.x = -(this.§_-H17§.width * 0.5);
         this.§_-H17§.visible = false;
         this.§_-m2X§.addChild(this.§_-H17§);
         this.§_-Z12§ = new §_-T2z§(gls("Отмена"),[§_-i2c§,§_-i2c§,§_-i2c§],ButtonSkyAnimationCancel,8,-2);
         this.§_-Z12§.x = -70;
         this.§_-Z12§.y = 230;
         this.§_-Z12§.addEventListener(MouseEvent.CLICK,this.§_-K1H§);
         this.§_-m2X§.addChild(this.§_-Z12§);
         this.fieldLoading = new §_-22V§(gls("Загрузка..."),0,180,new TextFormat(§_-22V§.§_-pJ§,16,16777215));
         this.fieldLoading.x = -int(this.fieldLoading.textWidth * 0.5);
         this.fieldLoading.filters = [new DropShadowFilter(2,45,0,1,4,4)];
         this.fieldLoading.visible = false;
         this.§_-m2X§.addChild(this.fieldLoading);
         this.movieLoader = new MoviePreload();
         this.movieLoader.scaleX = this.movieLoader.scaleY = 1.75;
         this.movieLoader.x = this.fieldLoading.x + (this.fieldLoading.width - this.movieLoader.width) * 0.5;
         this.movieLoader.y = this.fieldLoading.y - this.movieLoader.height - 5;
         this.movieLoader.visible = false;
         this.§_-m2X§.addChild(this.movieLoader);
         this.sprite.x = int(§_-a9§.§_-9o§ * 0.5);
         this.sprite.y = int(§_-a9§.§_-31m§ * 0.5);
         this.sprite.addChild(this.§_-m2X§);
         this._isOpened = true;
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
      }
      
      public static function get instance() : §_-Vm§
      {
         if(!_instance)
         {
            _instance = new §_-Vm§();
         }
         return _instance;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.sprite.visible = param1;
      }
      
      public function get §_-g1G§() : Boolean
      {
         return this._isOpened;
      }
      
      public function close(param1:Boolean = true, param2:int = 0) : void
      {
         this.§_-5W§();
         if(this.§_-X2p§.isPlaying)
         {
            setTimeout(this.close,1);
            return;
         }
         if(this._isOpened)
         {
            Game.§_-d2t§.addChild(this.sprite);
            this.§_-X2p§.gotoAndPlay(param2);
            this.§_-Z12§.visible = param1;
            this.§_-H17§.visible = true;
            if(param2 == 0)
            {
               if(this.§_-XN§)
               {
                  this.§_-XN§.§_-h2r§();
               }
               this.§_-H17§.y = -500;
               this.§_-XN§ = TweenMax.to(this.§_-H17§,0.3,{
                  "y":-250,
                  "delay":0.5,
                  "ease":§_-E2G§.easeOut,
                  "alpha":1
               });
            }
            else
            {
               this.§_-H17§.y = -250;
            }
         }
      }
      
      public function open(param1:Function = null) : void
      {
         if(this.§_-X2p§.isPlaying)
         {
            setTimeout(this.open,1,param1);
            return;
         }
         if(param1 != null)
         {
            param1();
         }
         if(!this._isOpened)
         {
            Game.§_-d2t§.addChild(this.sprite);
            this.§_-X2p§.gotoAndPlay(98);
            this.§_-Z12§.visible = false;
            if(this.§_-XN§)
            {
               this.§_-XN§.§_-h2r§();
            }
            this.§_-H17§.y = -250;
            this.§_-XN§ = TweenMax.to(this.§_-H17§,0.3,{
               "y":-500,
               "ease":§_-E2G§.easeIn,
               "alpha":0,
               "onComplete":this.onComplete
            });
         }
      }
      
      private function §_-K1H§(param1:MouseEvent) : void
      {
         this.open();
         §_-92z§.§_-U17§();
      }
      
      private function onComplete() : void
      {
         Game.§_-d2t§.removeChild(this.sprite);
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(Game.starling.stage.stageWidth == §_-a9§.§_-9o§ == this.§_-EW§)
         {
            _loc2_ = Math.max(Game.starling.stage.stageWidth / §_-a9§.§_-9o§,Game.starling.stage.stageHeight / §_-a9§.§_-31m§);
            _loc3_ = Math.min(Game.starling.stage.stageWidth / §_-a9§.§_-9o§,Game.starling.stage.stageHeight / §_-a9§.§_-31m§);
            this.sprite.scaleX = this.sprite.scaleY = 1;
            this.§_-X2p§.scaleX = this.§_-X2p§.scaleY = _loc2_;
            if(§_-a9§.§_-O1z§)
            {
               this.§_-m2X§.scaleX = this.§_-m2X§.scaleY = _loc3_;
            }
            this.sprite.x = int(Game.starling.stage.stageWidth * 0.5);
            this.sprite.y = int(Game.starling.stage.stageHeight * 0.5);
            this.§_-EW§ = !this.§_-EW§;
         }
      }
   }
}


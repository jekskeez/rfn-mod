package views
{
   import §_-22D§.TweenMax;
   import §_-Kc§.§_-i1a§;
   import §_-c2C§.§_-u24§;
   import buttons.§_-Q1W§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.utils.setTimeout;
   
   public class §_-aW§
   {
      
      private static var _instance:§_-aW§;
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,18,16777215,null,null,null,null,null,"center");
      
      private var §_-li§:TweenMax = null;
      
      private var §_-q3§:DisplayObject = null;
      
      private var sprite:Sprite;
      
      private var §_-K2Q§:Sprite;
      
      private var §_-cM§:SkyAnimation;
      
      private var §_-93y§:§_-Q1W§;
      
      private var fieldLoading:§_-i5§;
      
      private var movieLoader:MovieClip;
      
      private var _isOpened:Boolean;
      
      private var §_-Z1Z§:Boolean = false;
      
      public function §_-aW§()
      {
         this.sprite = new Sprite();
         this.§_-K2Q§ = new Sprite();
         super();
         _instance = this;
         this.§_-cM§ = new SkyAnimation();
         this.§_-cM§.cacheAsBitmap = true;
         this.§_-cM§.stop();
         this.§_-cM§.addEventListener("Closed",function(param1:Event):void
         {
            _isOpened = false;
            fieldLoading.visible = true;
            movieLoader.visible = true;
         });
         this.§_-cM§.addEventListener("Opened",function(param1:Event):void
         {
            _isOpened = true;
            fieldLoading.visible = false;
            movieLoader.visible = false;
         });
         this.sprite.addChild(this.§_-cM§);
         this.§_-q3§ = §_-uR§.§_-t2O§();
         this.§_-q3§.scaleX = this.§_-q3§.scaleY = 1.2;
         this.§_-q3§.x = -(this.§_-q3§.width * 0.5);
         this.§_-q3§.visible = false;
         this.§_-K2Q§.addChild(this.§_-q3§);
         this.§_-93y§ = new §_-Q1W§(gls("Отмена"),[§_-W2P§,§_-W2P§,§_-W2P§],ButtonSkyAnimationCancel,8,-2);
         this.§_-93y§.x = -70;
         this.§_-93y§.y = 230;
         this.§_-93y§.addEventListener(MouseEvent.CLICK,this.§_-m5§);
         this.§_-K2Q§.addChild(this.§_-93y§);
         this.fieldLoading = new §_-i5§(gls("Загрузка..."),0,180,new TextFormat(§_-i5§.§_-p1s§,16,16777215));
         this.fieldLoading.x = -int(this.fieldLoading.textWidth * 0.5);
         this.fieldLoading.filters = [new DropShadowFilter(2,45,0,1,4,4)];
         this.fieldLoading.visible = false;
         this.§_-K2Q§.addChild(this.fieldLoading);
         this.movieLoader = new MoviePreload();
         this.movieLoader.scaleX = this.movieLoader.scaleY = 1.75;
         this.movieLoader.x = this.fieldLoading.x + (this.fieldLoading.width - this.movieLoader.width) * 0.5;
         this.movieLoader.y = this.fieldLoading.y - this.movieLoader.height - 5;
         this.movieLoader.visible = false;
         this.§_-K2Q§.addChild(this.movieLoader);
         this.sprite.x = int(§_-Zy§.§_-21V§ * 0.5);
         this.sprite.y = int(§_-Zy§.§_-02T§ * 0.5);
         this.sprite.addChild(this.§_-K2Q§);
         this._isOpened = true;
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
      }
      
      public static function get instance() : §_-aW§
      {
         if(!_instance)
         {
            _instance = new §_-aW§();
         }
         return _instance;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.sprite.visible = param1;
      }
      
      public function get §_-Bh§() : Boolean
      {
         return this._isOpened;
      }
      
      public function close(param1:Boolean = true, param2:int = 0) : void
      {
         this.§_-w2y§();
         if(this.§_-cM§.isPlaying)
         {
            setTimeout(this.close,1);
            return;
         }
         if(this._isOpened)
         {
            Game.§_-q1L§.addChild(this.sprite);
            this.§_-cM§.gotoAndPlay(param2);
            this.§_-93y§.visible = param1;
            this.§_-q3§.visible = true;
            if(param2 == 0)
            {
               if(this.§_-li§)
               {
                  this.§_-li§.§_-kl§();
               }
               this.§_-q3§.y = -500;
               this.§_-li§ = TweenMax.to(this.§_-q3§,0.3,{
                  "y":-250,
                  "delay":0.5,
                  "ease":§_-i1a§.easeOut,
                  "alpha":1
               });
            }
            else
            {
               this.§_-q3§.y = -250;
            }
         }
      }
      
      public function open(param1:Function = null) : void
      {
         if(this.§_-cM§.isPlaying)
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
            Game.§_-q1L§.addChild(this.sprite);
            this.§_-cM§.gotoAndPlay(98);
            this.§_-93y§.visible = false;
            if(this.§_-li§)
            {
               this.§_-li§.§_-kl§();
            }
            this.§_-q3§.y = -250;
            this.§_-li§ = TweenMax.to(this.§_-q3§,0.3,{
               "y":-500,
               "ease":§_-i1a§.easeIn,
               "alpha":0,
               "onComplete":this.onComplete
            });
         }
      }
      
      private function §_-m5§(param1:MouseEvent) : void
      {
         this.open();
         §_-u24§.§_-q2C§();
      }
      
      private function onComplete() : void
      {
         Game.§_-q1L§.removeChild(this.sprite);
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(Game.starling.stage.stageWidth == §_-Zy§.§_-21V§ == this.§_-Z1Z§)
         {
            _loc2_ = Math.max(Game.starling.stage.stageWidth / §_-Zy§.§_-21V§,Game.starling.stage.stageHeight / §_-Zy§.§_-02T§);
            _loc3_ = Math.min(Game.starling.stage.stageWidth / §_-Zy§.§_-21V§,Game.starling.stage.stageHeight / §_-Zy§.§_-02T§);
            this.sprite.scaleX = this.sprite.scaleY = 1;
            this.§_-cM§.scaleX = this.§_-cM§.scaleY = _loc2_;
            if(§_-Zy§.§_-e2k§)
            {
               this.§_-K2Q§.scaleX = this.§_-K2Q§.scaleY = _loc3_;
            }
            this.sprite.x = int(Game.starling.stage.stageWidth * 0.5);
            this.sprite.y = int(Game.starling.stage.stageHeight * 0.5);
            this.§_-Z1Z§ = !this.§_-Z1Z§;
         }
      }
   }
}


package views
{
   import §_-22D§.TweenMax;
   import §_-J19§.§_-534§;
   import §_-S1n§.§_-sY§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-ku§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-s2e§.§_-U2d§;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-P1G§ extends Sprite
   {
      
      private var §_-z1a§:§_-sY§;
      
      private var §_-11V§:Sprite;
      
      private var §_-9L§:TweenMax = null;
      
      private var §_-R2j§:Timer = new Timer(15 * 1000,1);
      
      private var §_-o2z§:§_-032§;
      
      public function §_-P1G§()
      {
         super();
         this.visible = false;
         this.init();
         §_-LZ§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-On§);
         §_-hO§.addEventListener(GameEvent.ENERGY_CHANGED,this.§_-dL§);
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-P2v§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-P2v§);
         §_-ku§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,this.§_-91E§);
      }
      
      private function init() : void
      {
         this.§_-11V§ = new Sprite();
         addChild(this.§_-11V§);
         var _loc1_:PowerBarBackground = new PowerBarBackground();
         _loc1_.cacheAsBitmap = true;
         this.§_-11V§.addChild(_loc1_);
         addEventListener(MouseEvent.CLICK,this.§_-21e§);
         var _loc2_:§_-c2I§ = new §_-c2I§();
         _loc2_.x = 31;
         _loc2_.y = 10;
         this.§_-11V§.addChild(_loc2_);
         var _loc3_:§_-E2m§ = new §_-E2m§();
         _loc3_.x = _loc2_.x;
         _loc3_.y = 17;
         this.§_-11V§.addChild(_loc3_);
         this.§_-o2z§ = new §_-032§();
         this.§_-o2z§.x = _loc3_.x;
         this.§_-o2z§.y = 24;
         this.§_-11V§.addChild(this.§_-o2z§);
         this.§_-z1a§ = new §_-sY§(this.§_-11V§);
         this.§_-R2j§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-Wk§);
         this.§_-p2B§();
      }
      
      private function §_-21e§(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         GameSounds.play(§_-RH§.§_-K10§);
         §_-U2d§.load(function():void
         {
            §_-534§.§_-R2X§(§_-534§.§_-22n§,true);
         });
      }
      
      private function §_-On§(param1:GameEvent) : void
      {
         this.§_-o2z§.§_-1S§();
      }
      
      private function §_-dL§(param1:GameEvent) : void
      {
         if(param1.data["value"] > 29)
         {
            if(this.§_-9L§ != null)
            {
               this.§_-9L§.§_-kl§();
               this.§_-9L§ = null;
               this.§_-11V§.filters = [];
            }
            return;
         }
         if(!(§_-t2c§.active is §_-u24§))
         {
            return;
         }
         if(this.§_-9L§ != null)
         {
            return;
         }
         this.startGlowAnimation();
      }
      
      private function §_-Wk§(param1:TimerEvent) : void
      {
         if(this.§_-9L§ == null)
         {
            return;
         }
         this.§_-9L§.§_-kl§();
         this.§_-9L§ = null;
         this.§_-11V§.filters = [];
      }
      
      private function startGlowAnimation() : void
      {
         this.§_-9L§ = TweenMax.to(this.§_-11V§,1,{
            "glowFilter":{
               "color":16763904,
               "alpha":1,
               "blurX":8,
               "blurY":8,
               "strength":1.8
            },
            "onComplete":function():void
            {
               §_-9L§ = TweenMax.to(§_-11V§,1.3,{
                  "glowFilter":{
                     "color":16763904,
                     "alpha":0,
                     "blurX":0,
                     "blurY":0,
                     "strength":0
                  },
                  "onComplete":function():void
                  {
                     startGlowAnimation();
                  }
               });
            }
         });
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(this.§_-9L§ == null || this.§_-9L§ != null && this.§_-R2j§.running)
         {
            return;
         }
         this.§_-R2j§.reset();
         this.§_-R2j§.start();
      }
      
      private function §_-P2v§(param1:GameEvent) : void
      {
         this.§_-p2B§();
      }
      
      private function §_-91E§(param1:GameEvent) : void
      {
         this.§_-p2B§();
      }
      
      private function §_-p2B§() : void
      {
         this.§_-o2z§.§_-R1O§ = §_-F1Z§.§_-O1u§ || §_-ku§.§_-R1C§(§_-ku§.§_-fu§);
      }
   }
}


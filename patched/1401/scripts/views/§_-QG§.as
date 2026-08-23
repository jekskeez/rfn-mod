package views
{
   import §_-42B§.TweenMax;
   import §_-68§.§_-EI§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-e1z§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-e1G§.§_-F1u§;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-QG§ extends Sprite
   {
      
      private var §_-5p§:§_-F1u§;
      
      private var §_-x19§:Sprite;
      
      private var §_-O20§:TweenMax = null;
      
      private var §_-l12§:Timer = new Timer(15 * 1000,1);
      
      private var §_-33B§:§_-13m§;
      
      public function §_-QG§()
      {
         super();
         this.visible = false;
         this.init();
         §_-d2x§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-iE§);
         §_-Z1F§.addEventListener(GameEvent.ENERGY_CHANGED,this.§_-22C§);
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-v2D§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-v2D§);
         §_-e1z§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,this.§_-c1Q§);
      }
      
      private function init() : void
      {
         this.§_-x19§ = new Sprite();
         addChild(this.§_-x19§);
         var _loc1_:PowerBarBackground = new PowerBarBackground();
         _loc1_.cacheAsBitmap = true;
         this.§_-x19§.addChild(_loc1_);
         addEventListener(MouseEvent.CLICK,this.§_-WD§);
         var _loc2_:§_-41k§ = new §_-41k§();
         _loc2_.x = 31;
         _loc2_.y = 10;
         this.§_-x19§.addChild(_loc2_);
         var _loc3_:§_-X22§ = new §_-X22§();
         _loc3_.x = _loc2_.x;
         _loc3_.y = 17;
         this.§_-x19§.addChild(_loc3_);
         this.§_-33B§ = new §_-13m§();
         this.§_-33B§.x = _loc3_.x;
         this.§_-33B§.y = 24;
         this.§_-x19§.addChild(this.§_-33B§);
         this.§_-5p§ = new §_-F1u§(this.§_-x19§);
         this.§_-l12§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-i2R§);
         this.§_-72Z§();
      }
      
      private function §_-WD§(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         GameSounds.play(§_-43Z§.§_-o1e§);
         §_-EI§.load(function():void
         {
            §_-m1L§.§_-Y1T§(§_-m1L§.§_-326§,true);
         });
      }
      
      private function §_-iE§(param1:GameEvent) : void
      {
         this.§_-33B§.§_-h1E§();
      }
      
      private function §_-22C§(param1:GameEvent) : void
      {
         if(param1.data["value"] > 29)
         {
            if(this.§_-O20§ != null)
            {
               this.§_-O20§.§_-h2r§();
               this.§_-O20§ = null;
               this.§_-x19§.filters = [];
            }
            return;
         }
         if(!(§_-71o§.active is §_-92z§))
         {
            return;
         }
         if(this.§_-O20§ != null)
         {
            return;
         }
         this.startGlowAnimation();
      }
      
      private function §_-i2R§(param1:TimerEvent) : void
      {
         if(this.§_-O20§ == null)
         {
            return;
         }
         this.§_-O20§.§_-h2r§();
         this.§_-O20§ = null;
         this.§_-x19§.filters = [];
      }
      
      private function startGlowAnimation() : void
      {
         this.§_-O20§ = TweenMax.to(this.§_-x19§,1,{
            "glowFilter":{
               "color":16763904,
               "alpha":1,
               "blurX":8,
               "blurY":8,
               "strength":1.8
            },
            "onComplete":function():void
            {
               §_-O20§ = TweenMax.to(§_-x19§,1.3,{
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
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(this.§_-O20§ == null || this.§_-O20§ != null && this.§_-l12§.running)
         {
            return;
         }
         this.§_-l12§.reset();
         this.§_-l12§.start();
      }
      
      private function §_-v2D§(param1:GameEvent) : void
      {
         this.§_-72Z§();
      }
      
      private function §_-c1Q§(param1:GameEvent) : void
      {
         this.§_-72Z§();
      }
      
      private function §_-72Z§() : void
      {
         this.§_-33B§.§_-h1Z§ = §_-Br§.§_-f2k§ || §_-e1z§.§_-Lq§(§_-e1z§.§_-Z9§);
      }
   }
}


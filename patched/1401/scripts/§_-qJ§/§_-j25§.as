package §_-qJ§
{
   import §_-83V§.§_-o29§;
   import §_-RI§.§_-h2I§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-j25§ extends §_-h2I§
   {
      
      private static const §_-vt§:int = 1500;
      
      private var §_-Z2W§:Timer = null;
      
      private var itemId:int = -1;
      
      private var hero:Hero = null;
      
      private var §_-C5§:§_-f2w§ = null;
      
      public function §_-j25§()
      {
         super();
         this.§_-Z2W§ = new Timer(§_-vt§,1);
         this.§_-Z2W§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-Y2E§);
      }
      
      public function §_-L1T§(param1:Hero, param2:int) : void
      {
         this.itemId = param2;
         this.hero = param1;
         this.hero.heroView.§_-cn§(param2,§_-o29§.§_-Y1l§,§_-vt§);
         this.§_-Z2W§.reset();
         this.§_-Z2W§.start();
      }
      
      public function dispose() : void
      {
         this.hero = null;
         this.§_-Z2W§.stop();
         this.§_-Z2W§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-Y2E§);
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.removeFromParent();
         if(this.§_-C5§)
         {
            this.§_-C5§.dispose();
         }
      }
      
      private function §_-Y2E§(param1:TimerEvent) : void
      {
         if(this.hero == null || this.hero.isDead || this.hero.inHollow || this.itemId == 0)
         {
            return;
         }
         if(this.§_-C5§)
         {
            if(§_-ws§(this.§_-C5§))
            {
               removeChildStarling(this.§_-C5§,true);
            }
            else
            {
               this.§_-C5§.dispose();
            }
            this.§_-C5§ = null;
         }
         this.§_-C5§ = new §_-f2w§(this.itemId);
         this.§_-C5§.scaleXY(1);
         §_-83v§(this.§_-C5§);
      }
   }
}


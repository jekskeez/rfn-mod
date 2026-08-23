package §_-921§
{
   import §_-8Q§.§_-u1i§;
   import §_-TK§.§_-aS§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-DK§ extends §_-aS§
   {
      
      private static const §_-Q1U§:int = 1500;
      
      private var §_-V28§:Timer = null;
      
      private var itemId:int = -1;
      
      private var hero:Hero = null;
      
      private var §_-m2M§:§_-U2R§ = null;
      
      public function §_-DK§()
      {
         super();
         this.§_-V28§ = new Timer(§_-Q1U§,1);
         this.§_-V28§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-EL§);
      }
      
      public function §_-M19§(param1:Hero, param2:int) : void
      {
         this.itemId = param2;
         this.hero = param1;
         this.hero.heroView.§_-YN§(param2,§_-u1i§.§_-13j§,§_-Q1U§);
         this.§_-V28§.reset();
         this.§_-V28§.start();
      }
      
      public function dispose() : void
      {
         this.hero = null;
         this.§_-V28§.stop();
         this.§_-V28§.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-EL§);
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.removeFromParent();
         if(this.§_-m2M§)
         {
            this.§_-m2M§.dispose();
         }
      }
      
      private function §_-EL§(param1:TimerEvent) : void
      {
         if(this.hero == null || this.hero.isDead || this.hero.inHollow || this.itemId == 0)
         {
            return;
         }
         if(this.§_-m2M§)
         {
            if(§_-U2E§(this.§_-m2M§))
            {
               removeChildStarling(this.§_-m2M§,true);
            }
            else
            {
               this.§_-m2M§.dispose();
            }
            this.§_-m2M§ = null;
         }
         this.§_-m2M§ = new §_-U2R§(this.itemId);
         this.§_-m2M§.scaleXY(1);
         §_-J2J§(this.§_-m2M§);
      }
   }
}


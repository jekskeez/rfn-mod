package game
{
   import §_-42B§.TweenMax;
   import §_-RI§.§_-h2I§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-Z2x§ extends §_-h2I§
   {
      
      public static const §_-vt§:int = 6000;
      
      private var timer:Timer;
      
      protected var §_-o2s§:§_-h2I§ = null;
      
      public function §_-Z2x§()
      {
         super();
         this.timer = new Timer(1000,1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.stop);
      }
      
      override public function set scaleX(param1:Number) : void
      {
      }
      
      override public function set scaleY(param1:Number) : void
      {
      }
      
      public function §_-Y2E§(param1:int, param2:int, param3:int = 0) : void
      {
         if(this.§_-o2s§ != null)
         {
            if(this.§_-ws§(this.§_-o2s§))
            {
               removeChildStarling(this.§_-o2s§);
            }
            this.§_-o2s§ = null;
         }
         this.§_-g1q§(param1,param2);
         if(!this.§_-o2s§)
         {
            return;
         }
         §_-83v§(this.§_-o2s§);
         TweenMax.to(this.§_-o2s§,0.5,{
            "y":-this.§_-o2s§.height,
            "alpha":1
         });
         if(param3 == 0)
         {
            this.timer.stop();
            return;
         }
         this.timer.delay = param3;
         this.timer.reset();
         this.timer.start();
      }
      
      public function dispose() : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.stop);
         this.stop(null);
      }
      
      protected function §_-g1q§(param1:int, param2:int) : void
      {
      }
      
      protected function stop(param1:TimerEvent) : void
      {
         if(this.§_-o2s§ != null && §_-ws§(this.§_-o2s§))
         {
            removeChildStarling(this.§_-o2s§);
         }
         this.§_-o2s§ = null;
      }
   }
}


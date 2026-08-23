package game
{
   import §_-22D§.TweenMax;
   import §_-TK§.§_-aS§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class §_-ZP§ extends §_-aS§
   {
      
      public static const §_-Q1U§:int = 6000;
      
      private var timer:Timer;
      
      protected var §_-YK§:§_-aS§ = null;
      
      public function §_-ZP§()
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
      
      public function §_-EL§(param1:int, param2:int, param3:int = 0) : void
      {
         if(this.§_-YK§ != null)
         {
            if(this.§_-U2E§(this.§_-YK§))
            {
               removeChildStarling(this.§_-YK§);
            }
            this.§_-YK§ = null;
         }
         this.§_-r1Z§(param1,param2);
         if(!this.§_-YK§)
         {
            return;
         }
         §_-J2J§(this.§_-YK§);
         TweenMax.to(this.§_-YK§,0.5,{
            "y":-this.§_-YK§.height,
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
      
      protected function §_-r1Z§(param1:int, param2:int) : void
      {
      }
      
      protected function stop(param1:TimerEvent) : void
      {
         if(this.§_-YK§ != null && §_-U2E§(this.§_-YK§))
         {
            removeChildStarling(this.§_-YK§);
         }
         this.§_-YK§ = null;
      }
   }
}


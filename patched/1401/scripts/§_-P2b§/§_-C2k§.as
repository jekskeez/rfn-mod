package §_-P2b§
{
   import §_-A3e§.§_-rl§;
   import flash.display.MovieClip;
   
   public class §_-C2k§ extends §_-rl§
   {
      
      private var §_-n11§:MovieClip = null;
      
      public function §_-C2k§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "cowabunga";
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function §_-Y2U§() : MovieClip
      {
         return new RafaelPerkView();
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.view)
         {
            this.view.addFrameScript(this.view.totalFrames - 1,function():void
            {
               view.stop();
            });
         }
      }
   }
}


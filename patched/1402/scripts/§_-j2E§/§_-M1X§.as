package §_-j2E§
{
   import §_-p2L§.§_-t2P§;
   import flash.display.MovieClip;
   
   public class §_-M1X§ extends §_-t2P§
   {
      
      private var §_-22B§:MovieClip = null;
      
      public function §_-M1X§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "cowabunga";
      }
      
      override public function get activeTime() : Number
      {
         return 5;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function §_-o2B§() : MovieClip
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


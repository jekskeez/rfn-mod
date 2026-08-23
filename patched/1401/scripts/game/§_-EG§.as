package game
{
   import §_-RI§.§_-d2d§;
   import flash.display.MovieClip;
   
   public class §_-EG§ extends §_-Z2x§
   {
      
      private var icon:§_-d2d§;
      
      public function §_-EG§()
      {
         super();
      }
      
      public function set view(param1:MovieClip) : void
      {
         if(this.icon)
         {
            this.icon.removeFromParent();
         }
         this.icon = new §_-d2d§(param1);
      }
      
      override protected function §_-g1q§(param1:int, param2:int) : void
      {
         if(Boolean(param1) || Boolean(param2))
         {
         }
         this.§_-o2s§ = this.icon;
         this.§_-o2s§.scaleX = this.§_-o2s§.scaleY = 0.8;
      }
   }
}


package game
{
   import §_-TK§.§_-f1u§;
   import flash.display.MovieClip;
   
   public class §_-420§ extends §_-ZP§
   {
      
      private var icon:§_-f1u§;
      
      public function §_-420§()
      {
         super();
      }
      
      public function set view(param1:MovieClip) : void
      {
         if(this.icon)
         {
            this.icon.removeFromParent();
         }
         this.icon = new §_-f1u§(param1);
      }
      
      override protected function §_-r1Z§(param1:int, param2:int) : void
      {
         if(Boolean(param1) || Boolean(param2))
         {
         }
         this.§_-YK§ = this.icon;
         this.§_-YK§.scaleX = this.§_-YK§.scaleY = 0.8;
      }
   }
}


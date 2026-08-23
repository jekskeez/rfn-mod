package §_-P2b§
{
   import §_-A3e§.§_-p8§;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   
   public class §_-Hf§ extends §_-p8§
   {
      
      public function §_-Hf§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "grom";
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get power() : Number
      {
         return 50;
      }
      
      override protected function get radius() : Number
      {
         return 15;
      }
      
      override protected function §_-Y2U§() : void
      {
         this.view = new §_-d2d§(new TorPerkView());
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.view.play();
         this.view.x = this.hero.x;
         this.view.y = this.hero.y + 20;
         this.hero.game.map.§_-G12§.§_-83v§(this.view);
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
            this.view = null;
         }
         super.dispose();
      }
      
      private function §_-r5§(param1:Event) : void
      {
         if(!this.hero || !this.hero.game || !this.hero.game.map)
         {
            return;
         }
         if(!this.view)
         {
            return;
         }
         if(this.view.currentFrame >= 13)
         {
            §_-Q2q§();
         }
         if(this.view.currentFrame < 43)
         {
            return;
         }
         this.view.stop();
         this.hero.game.map.§_-G12§.removeChildStarling(this.view);
      }
   }
}


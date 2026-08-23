package §_-j2E§
{
   import §_-TK§.§_-f1u§;
   import §_-p2L§.§_-m15§;
   import flash.events.Event;
   
   public class §_-W1h§ extends §_-m15§
   {
      
      public function §_-W1h§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "grom";
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
      
      override protected function §_-o2B§() : void
      {
         this.view = new §_-f1u§(new TorPerkView());
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.view.play();
         this.view.x = this.hero.x;
         this.view.y = this.hero.y + 20;
         this.hero.game.map.§_-h2T§.§_-J2J§(this.view);
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
            this.view = null;
         }
         super.dispose();
      }
      
      private function §_-52w§(param1:Event) : void
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
            §_-O10§();
         }
         if(this.view.currentFrame < 43)
         {
            return;
         }
         this.view.stop();
         this.hero.game.map.§_-h2T§.removeChildStarling(this.view);
      }
   }
}


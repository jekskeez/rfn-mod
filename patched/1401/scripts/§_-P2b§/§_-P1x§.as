package §_-P2b§
{
   import §_-I10§.§_-g2W§;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-P1x§ extends §_-H2N§ implements §_-01l§
   {
      
      private var view:MovieClip = null;
      
      private var §_-m1Z§:Boolean = false;
      
      public function §_-P1x§(param1:Hero)
      {
         super(param1);
         this.view = new PersianTransformation();
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-h2P§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.view.addEventListener("Transform",this.§_-817§);
         this.view.addEventListener(Event.CHANGE,this.§_-V5§);
         this.view.gotoAndPlay(0);
         this.hero.§_-72F§(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.§_-Wt§ = false;
         this.hero.heroView.§_-o2z§();
         if(this.view.isPlaying)
         {
            this.hero.changeView();
         }
         this.§_-h2P§();
         if(this.§_-m1Z§)
         {
            this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
         }
         this.§_-m1Z§ = false;
      }
      
      protected function get §_-yG§() : Array
      {
         return [§_-g2W§.§_-714§];
      }
      
      private function §_-817§(param1:Event) : void
      {
         this.view.removeEventListener("Transform",this.§_-817§);
         this.hero.heroView.setClothing(this.§_-yG§);
         this.hero.§_-Wt§ = true;
         this.§_-m1Z§ = true;
         this.hero.heroView.§_-420§(new SpikesProofButton());
      }
      
      private function §_-V5§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-V5§);
         this.hero.changeView();
      }
      
      private function §_-h2P§() : void
      {
         if(!this.view.isPlaying)
         {
            return;
         }
         this.view.stop();
         this.view.removeEventListener("Transform",this.§_-817§);
         this.view.removeEventListener(Event.CHANGE,this.§_-V5§);
      }
   }
}


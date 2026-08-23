package §_-j2E§
{
   import §_-X1k§.§_-P2x§;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class §_-W1E§ extends §_-92f§ implements §_-x1v§
   {
      
      private var view:MovieClip = null;
      
      private var §_-W13§:Boolean = false;
      
      public function §_-W1E§(param1:Hero)
      {
         super(param1);
         this.view = new PersianTransformation();
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
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
         this.§_-41M§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.view.addEventListener("Transform",this.§_-63i§);
         this.view.addEventListener(Event.CHANGE,this.§_-Y24§);
         this.view.gotoAndPlay(0);
         this.hero.§_-s28§(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.§_-C28§ = false;
         this.hero.heroView.§_-A2l§();
         if(this.view.isPlaying)
         {
            this.hero.changeView();
         }
         this.§_-41M§();
         if(this.§_-W13§)
         {
            this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
         }
         this.§_-W13§ = false;
      }
      
      protected function get §_-43a§() : Array
      {
         return [§_-P2x§.§_-x1Y§];
      }
      
      private function §_-63i§(param1:Event) : void
      {
         this.view.removeEventListener("Transform",this.§_-63i§);
         this.hero.heroView.setClothing(this.§_-43a§);
         this.hero.§_-C28§ = true;
         this.§_-W13§ = true;
         this.hero.heroView.§_-C1X§(new SpikesProofButton());
      }
      
      private function §_-Y24§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-Y24§);
         this.hero.changeView();
      }
      
      private function §_-41M§() : void
      {
         if(!this.view.isPlaying)
         {
            return;
         }
         this.view.stop();
         this.view.removeEventListener("Transform",this.§_-63i§);
         this.view.removeEventListener(Event.CHANGE,this.§_-Y24§);
      }
   }
}


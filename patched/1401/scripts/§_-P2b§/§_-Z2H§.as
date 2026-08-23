package §_-P2b§
{
   public class §_-Z2H§ extends §_-H2N§ implements §_-01l§
   {
      
      private var transform:Boolean = false;
      
      private var §_-t22§:§_-b2V§;
      
      public function §_-Z2H§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "PerkRacer";
         this.transform = false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.hero.armadillo = false;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override protected function activate() : void
      {
         if(this.transform)
         {
            this.deactivate();
            return;
         }
         if(this.hero.heroView.running || this.hero.heroView.§_-k2P§)
         {
            return;
         }
         super.activate();
         this.§_-t22§ = new §_-b2V§(["RacerRunView","RacerStandView"]);
         this.hero.changeView(this.§_-t22§);
         this.transform = true;
         this.hero.armadillo = true;
         this.hero.§_-EO§ = true;
         this.hero.mass *= 4;
         this.hero.jumpVelocity -= 9;
         this.hero.runSpeed *= 2.5;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
         this.transform = false;
         this.hero.armadillo = false;
         this.hero.§_-EO§ = false;
         this.hero.mass /= 4;
         this.hero.jumpVelocity += 9;
         this.hero.runSpeed /= 2.5;
      }
   }
}


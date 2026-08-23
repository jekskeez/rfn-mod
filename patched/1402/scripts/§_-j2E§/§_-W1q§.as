package §_-j2E§
{
   public class §_-W1q§ extends §_-92f§ implements §_-x1v§
   {
      
      private var transform:Boolean = false;
      
      private var §_-AA§:§_-I22§;
      
      public function §_-W1q§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "PerkRacer";
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
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
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
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override protected function activate() : void
      {
         if(this.transform)
         {
            this.deactivate();
            return;
         }
         if(this.hero.heroView.running || this.hero.heroView.§_-52A§)
         {
            return;
         }
         super.activate();
         this.§_-AA§ = new §_-I22§(["RacerRunView","RacerStandView"]);
         this.hero.changeView(this.§_-AA§);
         this.transform = true;
         this.hero.armadillo = true;
         this.hero.§_-6l§ = true;
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
         this.hero.§_-6l§ = false;
         this.hero.mass /= 4;
         this.hero.jumpVelocity += 9;
         this.hero.runSpeed /= 2.5;
      }
   }
}


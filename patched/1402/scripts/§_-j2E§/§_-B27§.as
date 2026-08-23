package §_-j2E§
{
   public class §_-B27§ extends §_-92f§
   {
      
      private var §_-E2P§:Boolean = false;
      
      private var §_-X11§:Number = 0;
      
      private var §_-H1f§:int = 0;
      
      public function §_-B27§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-BY§ = true;
         this.§_-v2L§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-BY§ = false;
         if(Boolean(this.hero) && this.hero.isSelf)
         {
            this.hero.heroView.§_-A2l§();
         }
      }
      
      protected function get bonus() : Number
      {
         return 0.15;
      }
      
      private function set §_-BY§(param1:Boolean) : void
      {
         if(this.§_-E2P§ == param1)
         {
            return;
         }
         this.§_-E2P§ = param1;
         if(param1)
         {
            this.§_-X11§ = this.hero.runSpeed * this.bonus;
            this.§_-H1f§ = this.hero.jumpVelocity * this.bonus;
         }
         this.hero.runSpeed += this.§_-X11§ * (param1 ? 1 : -1);
         this.hero.jumpVelocity += this.§_-H1f§ * (param1 ? 1 : -1);
      }
      
      private function §_-v2L§() : void
      {
         if(!this.hero)
         {
            return;
         }
         if(this.hero.isSelf)
         {
            this.hero.heroView.§_-C1X§(new HighSpeedButton());
         }
      }
   }
}


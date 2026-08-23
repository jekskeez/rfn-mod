package §_-P2b§
{
   public class §_-x1m§ extends §_-H2N§
   {
      
      private var §_-21K§:Boolean = false;
      
      private var §_-h2K§:Number = 0;
      
      private var §_-c3§:int = 0;
      
      public function §_-x1m§(param1:Hero)
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
         this.§_-738§ = true;
         this.§_-A2O§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-738§ = false;
         if(Boolean(this.hero) && this.hero.isSelf)
         {
            this.hero.heroView.§_-o2z§();
         }
      }
      
      protected function get bonus() : Number
      {
         return 0.15;
      }
      
      private function set §_-738§(param1:Boolean) : void
      {
         if(this.§_-21K§ == param1)
         {
            return;
         }
         this.§_-21K§ = param1;
         if(param1)
         {
            this.§_-h2K§ = this.hero.runSpeed * this.bonus;
            this.§_-c3§ = this.hero.jumpVelocity * this.bonus;
         }
         this.hero.runSpeed += this.§_-h2K§ * (param1 ? 1 : -1);
         this.hero.jumpVelocity += this.§_-c3§ * (param1 ? 1 : -1);
      }
      
      private function §_-A2O§() : void
      {
         if(!this.hero)
         {
            return;
         }
         if(this.hero.isSelf)
         {
            this.hero.heroView.§_-420§(new HighSpeedButton());
         }
      }
   }
}


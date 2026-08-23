package §_-vK§
{
   public class §_-WC§ extends §_-q4§
   {
      
      public function §_-WC§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-B1u§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.game.cast.§_-ad§ = §_-Nu§() / 100;
         if(!this.§_-41W§)
         {
            return;
         }
         this.hero.§_-Qk§ = false;
         this.hero.§_-pr§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.§_-Qk§ = true;
         this.hero.§_-71x§();
         if(!this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         this.hero.game.cast.§_-ad§ = 0;
      }
   }
}


package §_-o10§
{
   public class §_-k14§ extends §_-Vd§
   {
      
      public function §_-k14§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-x1e§;
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
         this.hero.game.cast.§_-Q1h§ = §_-bx§() / 100;
         if(!this.§_-53U§)
         {
            return;
         }
         this.hero.§_-62v§ = false;
         this.hero.§_-S13§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.§_-62v§ = true;
         this.hero.§_-NI§();
         if(!this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         this.hero.game.cast.§_-Q1h§ = 0;
      }
   }
}


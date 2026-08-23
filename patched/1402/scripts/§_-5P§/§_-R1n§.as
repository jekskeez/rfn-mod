package §_-5P§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-R1n§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      public function §_-R1n§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-lH§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-z20§ = true;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new InvisibleButton().upState,1,0,gls("Невидимка"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-z20§ = false;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


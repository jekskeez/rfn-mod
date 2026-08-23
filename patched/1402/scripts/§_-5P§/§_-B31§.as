package §_-5P§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-B31§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      public function §_-B31§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-ek§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-42S§ = true;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new HeadWalkerButton().upState,1,0,gls("Белка-Варвар"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-42S§ = false;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


package §_-5P§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-r2x§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      public function §_-r2x§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-r4§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         ++this.hero.§_-d22§;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new DoubleJumpButton().upState,1,0,gls("Двойной прыжок"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         --this.hero.§_-d22§;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


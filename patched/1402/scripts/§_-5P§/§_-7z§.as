package §_-5P§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-7z§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      public function §_-7z§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-o2v§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.scale = 0.5;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new SmallSizeButton().upState,1,0,gls("Малыш"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.scale = 1;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


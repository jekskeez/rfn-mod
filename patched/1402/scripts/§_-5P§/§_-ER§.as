package §_-5P§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-ER§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      private var bonus:Number = 0;
      
      public function §_-ER§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-ms§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.bonus = this.hero.friction * 10000;
         this.hero.friction += this.bonus;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new HightFrictionButton().upState,1,0,gls("Цепкие лапки"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.friction -= this.bonus;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


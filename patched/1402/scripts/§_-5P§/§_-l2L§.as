package §_-5P§
{
   import §_-U19§.§_-k2u§;
   import §_-U19§.§_-su§;
   import §_-cm§.§_-Q2h§;
   
   public class §_-l2L§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      private var §_-R1j§:Number;
      
      public function §_-l2L§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-z1d§;
      }
      
      override protected function activate() : void
      {
         var _loc2_:§_-k2u§ = null;
         super.activate();
         var _loc1_:Number = 0.2;
         for each(_loc2_ in this.hero.perkController.§_-O1i§)
         {
            if(_loc2_.id == §_-su§.§_-Bs§)
            {
               _loc1_ += _loc2_.bonus / 100;
            }
         }
         this.§_-R1j§ = this.hero.runSpeed * _loc1_;
         this.hero.runSpeed += this.§_-R1j§;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new HighSpeedButton().upState,1,0,gls("Белка-молния"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.runSpeed -= this.§_-R1j§;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


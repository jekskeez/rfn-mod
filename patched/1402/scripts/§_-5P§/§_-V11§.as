package §_-5P§
{
   import §_-U19§.§_-k2u§;
   import §_-U19§.§_-su§;
   import §_-cm§.§_-Q2h§;
   
   public class §_-V11§ extends §_-H2l§
   {
      
      private var buff:§_-Q2h§ = null;
      
      private var §_-Q2J§:int;
      
      public function §_-V11§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-m1Q§;
      }
      
      override protected function activate() : void
      {
         var _loc2_:§_-k2u§ = null;
         super.activate();
         var _loc1_:Number = 0.2;
         for each(_loc2_ in this.hero.perkController.§_-O1i§)
         {
            if(_loc2_.id == §_-su§.§_-X2W§)
            {
               _loc1_ += _loc2_.bonus / 100;
            }
         }
         this.§_-Q2J§ = this.hero.jumpVelocity * _loc1_;
         this.hero.jumpVelocity += this.§_-Q2J§;
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new HighJumpButton().upState,1,0,gls("Высокий прыжок"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.jumpVelocity -= this.§_-Q2J§;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


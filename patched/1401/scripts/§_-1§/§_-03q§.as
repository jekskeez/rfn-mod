package §_-1§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-03q§ extends §_-K19§
   {
      
      private var buff:§_-03i§ = null;
      
      private var bonus:Number = 0;
      
      public function §_-03q§(param1:Hero)
      {
         super(param1);
         this.§_-i2D§ = §_-tY§.§_-T2J§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.bonus = this.hero.friction * 10000;
         this.hero.friction += this.bonus;
         if(!this.buff)
         {
            this.buff = new §_-03i§(new HightFrictionButton().upState,1,0,gls("Цепкие лапки"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.friction -= this.bonus;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-v2K§();
      }
   }
}


package §_-1§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-Y2x§ extends §_-K19§
   {
      
      private var buff:§_-03i§ = null;
      
      public function §_-Y2x§(param1:Hero)
      {
         super(param1);
         this.§_-i2D§ = §_-tY§.§_-B1z§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-i12§ = true;
         if(!this.buff)
         {
            this.buff = new §_-03i§(new HeadWalkerButton().upState,1,0,gls("Белка-Варвар"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-i12§ = false;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-v2K§();
      }
   }
}


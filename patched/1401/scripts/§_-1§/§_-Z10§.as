package §_-1§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-Z10§ extends §_-K19§
   {
      
      private var buff:§_-03i§ = null;
      
      public function §_-Z10§(param1:Hero)
      {
         super(param1);
         this.§_-i2D§ = §_-tY§.§_-w12§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.scale = 0.5;
         if(!this.buff)
         {
            this.buff = new §_-03i§(new SmallSizeButton().upState,1,0,gls("Малыш"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.scale = 1;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-v2K§();
      }
   }
}


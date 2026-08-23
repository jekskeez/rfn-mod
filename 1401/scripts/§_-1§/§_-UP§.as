package §_-1§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-UP§ extends §_-K19§
   {
      
      private var buff:§_-03i§ = null;
      
      public function §_-UP§(param1:Hero)
      {
         super(param1);
         this.§_-i2D§ = §_-tY§.§_-625§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         ++this.hero.§_-e2I§;
         if(!this.buff)
         {
            this.buff = new §_-03i§(new DoubleJumpButton().upState,1,0,gls("Двойной прыжок"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         --this.hero.§_-e2I§;
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-v2K§();
      }
   }
}


package §_-1§
{
   import §_-T1r§.§_-03i§;
   
   public class §_-uV§ extends §_-K19§
   {
      
      private static const §_-c1f§:Number = 1;
      
      private var buff:§_-03i§ = null;
      
      public function §_-uV§(param1:Hero)
      {
         super(param1);
         this.§_-i2D§ = §_-tY§.§_-12s§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-j§.push(§_-c1f§);
         if(!this.buff)
         {
            this.buff = new §_-03i§(new SlowFallButton().upState,1,0,gls("Белка-летяга"));
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         var _loc1_:int = this.hero.§_-j§.indexOf(§_-c1f§);
         if(_loc1_ != -1)
         {
            this.hero.§_-j§.splice(_loc1_,1);
         }
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-v2K§();
      }
   }
}


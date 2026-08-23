package §_-5P§
{
   import §_-cm§.§_-Q2h§;
   
   public class §_-y22§ extends §_-H2l§
   {
      
      private static const §_-22x§:Number = 1;
      
      private var buff:§_-Q2h§ = null;
      
      public function §_-y22§(param1:Hero)
      {
         super(param1);
         this.§_-T2a§ = §_-Z1f§.§_-h2X§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-F1u§.push(§_-22x§);
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new SlowFallButton().upState,1,0,gls("Белка-летяга"));
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         var _loc1_:int = this.hero.§_-F1u§.indexOf(§_-22x§);
         if(_loc1_ != -1)
         {
            this.hero.§_-F1u§.splice(_loc1_,1);
         }
         this.hero.removeBuff(this.buff);
         this.hero.heroView.§_-515§();
      }
   }
}


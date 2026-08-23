package §_-vK§
{
   public class §_-ln§ extends §_-21O§
   {
      
      private var §_-e2a§:int = 0;
      
      public function §_-ln§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-22s§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-e2a§ = this.hero.mass * (§_-Nu§() / 100);
         this.hero.mass += this.§_-e2a§;
         if(!this.buff)
         {
            this.buff = §_-T1G§(0);
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.mass -= this.§_-e2a§;
         this.hero.removeBuff(this.buff);
      }
   }
}


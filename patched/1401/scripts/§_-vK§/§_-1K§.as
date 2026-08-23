package §_-vK§
{
   public class §_-1K§ extends §_-21O§
   {
      
      private var §_-f2S§:Number;
      
      public function §_-1K§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-Xs§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-f2S§ = this.hero.§_-U2L§ * (1 + §_-Nu§() / 100);
         this.hero.§_-U2L§ *= this.§_-f2S§;
         if(!this.buff)
         {
            this.buff = §_-T1G§(0.5);
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-U2L§ /= this.§_-f2S§;
         this.hero.removeBuff(this.buff);
      }
      
      override public function get activeTime() : Number
      {
         return this.§_-41W§ ? 15 : 10;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
   }
}


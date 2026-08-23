package §_-o10§
{
   public class §_-62T§ extends §_-S2w§
   {
      
      private var §_-7O§:Number;
      
      public function §_-62T§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-u2N§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-7O§ = this.hero.§_-Y§ * (1 + §_-bx§() / 100);
         this.hero.§_-Y§ *= this.§_-7O§;
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.§_-Y§ /= this.§_-7O§;
         this.hero.removeBuff(this.buff);
      }
      
      override public function get activeTime() : Number
      {
         return this.§_-53U§ ? 15 : 10;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
   }
}


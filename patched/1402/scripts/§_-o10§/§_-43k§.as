package §_-o10§
{
   public class §_-43k§ extends §_-S2w§
   {
      
      private var §_-DJ§:int = 0;
      
      public function §_-43k§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-C25§;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-DJ§ = this.hero.mass * (§_-bx§() / 100);
         this.hero.mass += this.§_-DJ§;
         if(!this.buff)
         {
            this.buff = §_-K5§(0);
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.mass -= this.§_-DJ§;
         this.hero.removeBuff(this.buff);
      }
   }
}


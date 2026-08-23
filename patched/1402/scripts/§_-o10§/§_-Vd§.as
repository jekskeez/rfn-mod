package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   import §_-n1h§.§_-xV§;
   
   public class §_-Vd§ extends §_-p1B§ implements §_-xV§
   {
      
      public function §_-Vd§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-S2A§ = "";
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.buff)
         {
            this.buff = §_-K5§(0);
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.hero)
         {
            this.hero.removeBuff(this.buff);
         }
      }
      
      override protected function §_-BS§(param1:SquirrelEvent) : void
      {
         if(!param1.player.shaman || this.active || !this.available)
         {
            return;
         }
         this.active = true;
      }
   }
}


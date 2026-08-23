package §_-o10§
{
   public class §_-n1x§ extends §_-S2w§
   {
      
      public function §_-n1x§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-rQ§;
      }
      
      override public function get maxCountUse() : int
      {
         if(!Game.toggle)
         {
            return 2147483647;
         }
         return §_-s2t§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.immortal = true;
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.immortal = false;
         this.hero.removeBuff(this.buff);
      }
      
      override public function get activeTime() : Number
      {
         if(!Game.toggle)
         {
            return 180;
         }
         return §_-bx§();
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         if(!Game.toggle)
         {
            return 0;
         }
         return 60;
      }
   }
}


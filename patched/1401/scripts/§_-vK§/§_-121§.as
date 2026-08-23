package §_-vK§
{
   public class §_-121§ extends §_-21O§
   {
      
      public function §_-121§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-a1c§;
      }
      
      override public function get maxCountUse() : int
      {
         if(!Game.toggle)
         {
            return 2147483647;
         }
         return §_-OD§();
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.immortal = true;
         if(!this.buff)
         {
            this.buff = §_-T1G§(0.5);
         }
         this.hero.§_-Aj§(this.buff);
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
         return §_-Nu§();
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


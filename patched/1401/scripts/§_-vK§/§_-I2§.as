package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   
   public class §_-I2§ extends §_-21O§
   {
      
      public function §_-I2§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-A2A§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(this.§_-41W§)
         {
            if(!this.buff)
            {
               this.buff = §_-T1G§(0);
            }
            this.hero.§_-Aj§(this.buff);
         }
         else
         {
            if(!this.buff)
            {
               this.buff = §_-T1G§(0.5);
            }
            this.hero.§_-Aj§(this.buff);
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.game.cast.§_-T2l§ = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-41W§)
         {
            this.hero.removeBuff(this.buff);
         }
         else
         {
            this.hero.removeBuff(this.buff);
         }
         if(!this.hero.game || !this.hero.game.cast || !this.hero.isSelf)
         {
            return;
         }
         this.hero.game.cast.§_-T2l§ = false;
      }
      
      override protected function §_-S2Z§(param1:SquirrelEvent) : void
      {
         super.§_-S2Z§(param1);
         if(!param1.player.shaman || this.active || !super.available || !this.§_-41W§)
         {
            return;
         }
         this.active = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-41W§ ? 0 : 20;
      }
      
      override public function get activeTime() : Number
      {
         return this.§_-41W§ ? 0 : §_-Nu§();
      }
   }
}


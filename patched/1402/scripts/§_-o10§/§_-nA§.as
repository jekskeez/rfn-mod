package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   
   public class §_-nA§ extends §_-S2w§
   {
      
      public function §_-nA§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-83o§;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         if(this.§_-53U§)
         {
            if(!this.buff)
            {
               this.buff = §_-K5§(0);
            }
            this.hero.§_-W1T§(this.buff);
         }
         else
         {
            if(!this.buff)
            {
               this.buff = §_-K5§(0.5);
            }
            this.hero.§_-W1T§(this.buff);
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.game.cast.§_-Q1I§ = true;
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-53U§)
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
         this.hero.game.cast.§_-Q1I§ = false;
      }
      
      override protected function §_-BS§(param1:SquirrelEvent) : void
      {
         super.§_-BS§(param1);
         if(!param1.player.shaman || this.active || !super.available || !this.§_-53U§)
         {
            return;
         }
         this.active = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-53U§ ? 0 : 20;
      }
      
      override public function get activeTime() : Number
      {
         return this.§_-53U§ ? 0 : §_-bx§();
      }
   }
}


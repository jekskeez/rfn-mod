package §_-j2E§
{
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class §_-g2B§ extends §_-92f§
   {
      
      private static const §_-sS§:Number = 5;
      
      public function §_-g2B§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-n19§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.§_-F1u§.push(§_-sS§);
         this.hero.jumpVelocity *= 1.2;
         this.hero.addEventListener(Hero.§_-y2y§,this.§_-G2J§);
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.heroView.§_-C1X§(new SlowFallButton());
      }
      
      private function §_-G2J§(param1:Event) : void
      {
         if(!this || !this.active || !this.hero || !this.hero.onFloor || !param1 || !this.hero.isSelf)
         {
            return;
         }
         GameSounds.play(§_-n19§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(Hero.§_-y2y§,this.§_-G2J§);
         this.hero.changeView();
         var _loc1_:int = this.hero.§_-F1u§.indexOf(§_-sS§);
         if(_loc1_ != -1)
         {
            this.hero.§_-F1u§.splice(_loc1_,1);
         }
         this.hero.jumpVelocity /= 1.2;
         if(this.hero.isSelf)
         {
            this.hero.heroView.§_-A2l§();
         }
      }
   }
}


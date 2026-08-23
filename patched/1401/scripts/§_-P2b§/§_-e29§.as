package §_-P2b§
{
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class §_-e29§ extends §_-H2N§
   {
      
      private static const §_-w23§:Number = 5;
      
      public function §_-e29§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-U1O§;
         this.§_-mw§ = true;
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
         this.hero.§_-j§.push(§_-w23§);
         this.hero.jumpVelocity *= 1.2;
         this.hero.addEventListener(Hero.§_-H2j§,this.§_-gI§);
         if(!this.hero.isSelf)
         {
            return;
         }
         this.hero.heroView.§_-420§(new SlowFallButton());
      }
      
      private function §_-gI§(param1:Event) : void
      {
         if(!this || !this.active || !this.hero || !this.hero.onFloor || !param1 || !this.hero.isSelf)
         {
            return;
         }
         GameSounds.play(§_-U1O§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(Hero.§_-H2j§,this.§_-gI§);
         this.hero.changeView();
         var _loc1_:int = this.hero.§_-j§.indexOf(§_-w23§);
         if(_loc1_ != -1)
         {
            this.hero.§_-j§.splice(_loc1_,1);
         }
         this.hero.jumpVelocity /= 1.2;
         if(this.hero.isSelf)
         {
            this.hero.heroView.§_-o2z§();
         }
      }
   }
}


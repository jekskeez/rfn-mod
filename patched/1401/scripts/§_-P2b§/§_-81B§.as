package §_-P2b§
{
   import flash.events.Event;
   
   public class §_-81B§ extends §_-H2N§
   {
      
      private static const §_-Z1D§:Number = 0.5;
      
      protected var §_-c3§:Number = 0;
      
      public function §_-81B§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
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
         this.§_-c3§ = this.hero.jumpVelocity * §_-Z1D§;
         this.hero.jumpVelocity += this.§_-c3§;
         this.hero.addEventListener(Hero.EVENT_UP_END,this.§_-gI§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.jumpVelocity -= this.§_-c3§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      protected function §_-gI§(param1:Event) : void
      {
         this.hero.removeEventListener(Hero.EVENT_UP_END,this.§_-gI§);
         this.active = false;
      }
   }
}


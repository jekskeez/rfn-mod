package §_-j2E§
{
   import flash.events.Event;
   
   public class §_-M10§ extends §_-92f§
   {
      
      private static const §_-531§:Number = 0.5;
      
      protected var §_-H1f§:Number = 0;
      
      public function §_-M10§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
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
         this.§_-H1f§ = this.hero.jumpVelocity * §_-531§;
         this.hero.jumpVelocity += this.§_-H1f§;
         this.hero.addEventListener(Hero.EVENT_UP_END,this.§_-G2J§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.hero.jumpVelocity -= this.§_-H1f§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      protected function §_-G2J§(param1:Event) : void
      {
         this.hero.removeEventListener(Hero.EVENT_UP_END,this.§_-G2J§);
         this.active = false;
      }
   }
}


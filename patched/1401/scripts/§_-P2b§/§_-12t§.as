package §_-P2b§
{
   public class §_-12t§ extends §_-H2N§
   {
      
      private static const §_-K2e§:Number = 3;
      
      private var §_-738§:Boolean = false;
      
      public function §_-12t§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "viking";
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-738§)
         {
            this.§_-738§ = false;
            this.hero.runSpeed -= §_-K2e§;
         }
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.hero.runSpeed += §_-K2e§;
         this.§_-738§ = true;
      }
   }
}


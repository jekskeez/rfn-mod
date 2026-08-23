package §_-j2E§
{
   public class §_-I2M§ extends §_-92f§
   {
      
      private static const §_-P2j§:Number = 3;
      
      private var §_-BY§:Boolean = false;
      
      public function §_-I2M§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "viking";
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
         if(this.§_-BY§)
         {
            this.§_-BY§ = false;
            this.hero.runSpeed -= §_-P2j§;
         }
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(!this.hero.game)
         {
            return;
         }
         this.hero.runSpeed += §_-P2j§;
         this.§_-BY§ = true;
      }
   }
}


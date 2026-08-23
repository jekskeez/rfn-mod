package §_-j2E§
{
   import §_-I1q§.§_-Z2G§;
   import §_-td§.GameMapNet;
   import protocol.§_-s2l§;
   
   public class §_-E2H§ extends §_-92f§
   {
      
      public function §_-E2H§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function activate() : void
      {
         super.activate();
         (this.hero.game.map as GameMapNet).§_-o1j§(this.hero.id,this.energyObject);
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-C1i§];
      }
      
      protected function get energyObject() : §_-Z2G§
      {
         return null;
      }
   }
}


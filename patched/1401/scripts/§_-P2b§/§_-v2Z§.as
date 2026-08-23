package §_-P2b§
{
   import §_-A2x§.GameMapNet;
   import §_-u2r§.§_-R1r§;
   import protocol.§_-S2I§;
   
   public class §_-v2Z§ extends §_-H2N§
   {
      
      public function §_-v2Z§(param1:Hero)
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
         (this.hero.game.map as GameMapNet).§_-x25§(this.hero.id,this.energyObject);
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-w1R§];
      }
      
      protected function get energyObject() : §_-R1r§
      {
         return null;
      }
   }
}


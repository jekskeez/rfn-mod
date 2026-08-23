package §_-P2b§
{
   import §_-u2r§.§_-03L§;
   import §_-u2r§.§_-R1r§;
   
   public class §_-b27§ extends §_-v2Z§
   {
      
      public function §_-b27§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "leprechaun";
      }
      
      override protected function get energyObject() : §_-R1r§
      {
         return new §_-03L§();
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
   }
}


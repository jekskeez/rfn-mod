package §_-j2E§
{
   import §_-I1q§.§_-OW§;
   import §_-I1q§.§_-Z2G§;
   
   public class §_-p2§ extends §_-E2H§
   {
      
      public function §_-p2§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "leprechaun";
      }
      
      override protected function get energyObject() : §_-Z2G§
      {
         return new §_-OW§();
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
   }
}


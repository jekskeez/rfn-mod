package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-12Z§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-s2Y§ extends §_-j1k§
   {
      
      public function §_-s2Y§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 2;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-12Z§).aging = false;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-12Z§;
      }
   }
}


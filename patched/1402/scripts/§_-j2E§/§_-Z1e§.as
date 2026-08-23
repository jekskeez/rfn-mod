package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-h1L§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-Z1e§ extends §_-j1k§
   {
      
      public function §_-Z1e§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-h1L§).lifeTime = 15 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-h1L§;
      }
   }
}


package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-436§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-m1A§ extends §_-j1k§
   {
      
      public function §_-m1A§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-436§).lifeTime = 15 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-436§;
      }
   }
}


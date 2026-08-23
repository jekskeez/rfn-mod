package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-f2F§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-sv§ extends §_-j1k§
   {
      
      public function §_-sv§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 3;
      }
      
      override protected function get §_-m1g§() : Number
      {
         return 3;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-f2F§).lifeTime = 15 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-f2F§;
      }
   }
}


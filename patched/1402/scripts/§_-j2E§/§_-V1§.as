package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-Z1E§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-V1§ extends §_-j1k§
   {
      
      public function §_-V1§(param1:Hero)
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
         (param1 as §_-Z1E§).lifeTime = 7 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-Z1E§;
      }
   }
}


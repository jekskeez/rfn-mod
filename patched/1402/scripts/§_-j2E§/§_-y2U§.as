package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-1U§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-y2U§ extends §_-j1k§
   {
      
      public function §_-y2U§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 3;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-1U§;
      }
      
      override protected function get §_-m1g§() : Number
      {
         return 0;
      }
      
      override protected function get §_-532§() : Number
      {
         return 1;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-1U§).lifeTime = 10 * 1000;
      }
   }
}


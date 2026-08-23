package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-p2J§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-n16§ extends §_-j1k§
   {
      
      public function §_-n16§(param1:Hero)
      {
         super(param1);
         this.§_-i1J§ = true;
         this.§_-S2A§ = §_-VF§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-p2J§).lifeTime = 10 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-p2J§;
      }
      
      override protected function get §_-m1g§() : Number
      {
         return 0;
      }
      
      override protected function get §_-532§() : Number
      {
         return -2;
      }
   }
}


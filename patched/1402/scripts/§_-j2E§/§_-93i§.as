package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-je§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-93i§ extends §_-j1k§
   {
      
      public function §_-93i§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-je§).lifeTime = 25 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-je§;
      }
   }
}


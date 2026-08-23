package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-51Y§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-tt§ extends §_-j1k§
   {
      
      public function §_-tt§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-51Y§).type = int(Math.random() * 5);
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-51Y§;
      }
   }
}


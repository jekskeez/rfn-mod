package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-a2B§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-NR§ extends §_-j1k§
   {
      
      public function §_-NR§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "PerkHippieFlower";
      }
      
      override public function get totalCooldown() : Number
      {
         return 18;
      }
      
      override protected function get §_-m1g§() : Number
      {
         return 4;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-a2B§).lifeTime = 18 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-a2B§;
      }
   }
}


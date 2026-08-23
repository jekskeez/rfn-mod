package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-m25§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-n2j§ extends §_-j1k§
   {
      
      public function §_-n2j§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-S2d§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 3;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-m25§;
      }
      
      override protected function get §_-m1g§() : Number
      {
         return 0;
      }
      
      override protected function get §_-532§() : Number
      {
         return -1.5;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-m25§).§_-t1e§ = this.hero.heroView.direction;
      }
   }
}


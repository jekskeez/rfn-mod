package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-02o§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-T2m§ extends §_-j1k§
   {
      
      public function §_-T2m§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 1;
      }
      
      override protected function get §_-532§() : Number
      {
         return -1;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-02o§).lifeTime = 5 * 1000;
         (param1 as §_-02o§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-02o§;
      }
   }
}


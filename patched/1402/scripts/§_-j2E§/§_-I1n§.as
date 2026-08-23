package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-d2w§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-I1n§ extends §_-j1k§
   {
      
      public function §_-I1n§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-S2d§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function get §_-532§() : Number
      {
         return -1;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-d2w§).lifeTime = 2 * 1000;
         (param1 as §_-d2w§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-d2w§;
      }
   }
}


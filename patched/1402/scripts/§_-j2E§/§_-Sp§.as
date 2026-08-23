package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-r27§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-Sp§ extends §_-j1k§
   {
      
      public function §_-Sp§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 6;
      }
      
      override protected function get §_-532§() : Number
      {
         return -1;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-r27§).lifeTime = 5 * 1000;
         (param1 as §_-r27§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-r27§;
      }
   }
}


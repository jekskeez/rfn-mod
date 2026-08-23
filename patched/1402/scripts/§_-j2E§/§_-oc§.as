package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-IY§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-oc§ extends §_-j1k§
   {
      
      public function §_-oc§(param1:Hero)
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
         return -2;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-IY§).lifeTime = 3 * 1000;
         (param1 as §_-IY§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-IY§;
      }
   }
}


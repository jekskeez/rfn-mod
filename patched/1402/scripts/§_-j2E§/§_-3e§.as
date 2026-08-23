package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-33d§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-3e§ extends §_-j1k§
   {
      
      public function §_-3e§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get §_-532§() : Number
      {
         return -1;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-33d§;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-33d§).direction = this.hero.heroView.direction;
      }
   }
}


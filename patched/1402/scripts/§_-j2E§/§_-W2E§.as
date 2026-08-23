package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-h2W§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-W2E§ extends §_-j1k§
   {
      
      public function §_-W2E§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-VF§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override protected function get §_-m1g§() : Number
      {
         return 2;
      }
      
      override protected function get §_-532§() : Number
      {
         return 1;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-52A§;
      }
      
      override protected function §_-6u§(param1:GameBody) : void
      {
         (param1 as §_-h2W§).lifeTime = 15 * 1000;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-h2W§;
      }
   }
}


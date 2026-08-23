package §_-j2E§
{
   import §_-8Q§.§_-EY§;
   import §_-p2L§.§_-j1k§;
   
   public class §_-k2L§ extends §_-j1k§
   {
      
      public function §_-k2L§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "rembo";
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get startCooldown() : Number
      {
         return 10;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-EY§;
      }
      
      override protected function get §_-532§() : Number
      {
         return 1.5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.§_-52A§;
      }
   }
}


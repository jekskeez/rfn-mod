package §_-P2b§
{
   import §_-83V§.§_-NU§;
   import §_-A3e§.§_-C1§;
   
   public class §_-aI§ extends §_-C1§
   {
      
      public function §_-aI§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "rembo";
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get startCooldown() : Number
      {
         return 10;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-NU§;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return 1.5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.§_-k2P§;
      }
   }
}


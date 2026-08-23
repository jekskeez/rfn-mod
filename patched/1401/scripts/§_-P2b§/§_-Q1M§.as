package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-L2i§;
   
   public class §_-Q1M§ extends §_-C1§
   {
      
      public function §_-Q1M§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.running && !this.hero.heroView.§_-k2P§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return -1;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-L2i§;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-L2i§).direction = this.hero.heroView.direction;
      }
   }
}


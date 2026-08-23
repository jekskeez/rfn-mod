package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-418§;
   
   public class §_-p2h§ extends §_-C1§
   {
      
      public function §_-p2h§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-g1g§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 10;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return -2;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-418§).lifeTime = 3 * 1000;
         (param1 as §_-418§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-418§;
      }
   }
}


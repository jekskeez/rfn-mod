package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-a2g§;
   
   public class §_-S2P§ extends §_-C1§
   {
      
      public function §_-S2P§(param1:Hero)
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
         return -1;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-a2g§).lifeTime = 2 * 1000;
         (param1 as §_-a2g§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-a2g§;
      }
   }
}


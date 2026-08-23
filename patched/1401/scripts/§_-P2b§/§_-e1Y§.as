package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-f2u§;
   
   public class §_-e1Y§ extends §_-C1§
   {
      
      public function §_-e1Y§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 1;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return -1;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-f2u§).lifeTime = 5 * 1000;
         (param1 as §_-f2u§).direction = this.hero.heroView.direction;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-f2u§;
      }
   }
}


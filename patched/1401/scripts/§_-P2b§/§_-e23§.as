package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-23b§;
   
   public class §_-e23§ extends §_-C1§
   {
      
      public function §_-e23§(param1:Hero)
      {
         super(param1);
         this.§_-mw§ = true;
         this.§_-it§ = §_-iP§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-23b§).lifeTime = 10 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-23b§;
      }
      
      override protected function get §_-t1B§() : Number
      {
         return 0;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return -2;
      }
   }
}


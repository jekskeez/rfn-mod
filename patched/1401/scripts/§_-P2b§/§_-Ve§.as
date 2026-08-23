package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-mv§;
   
   public class §_-Ve§ extends §_-C1§
   {
      
      public function §_-Ve§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 3;
      }
      
      override protected function get §_-t1B§() : Number
      {
         return 3;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-mv§).lifeTime = 15 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-mv§;
      }
   }
}


package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-D1C§;
   
   public class §_-p7§ extends §_-C1§
   {
      
      public function §_-p7§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 2;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-D1C§).aging = false;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-D1C§;
      }
   }
}


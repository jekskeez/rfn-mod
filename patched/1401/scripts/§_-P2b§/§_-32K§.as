package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-Y1K§;
   
   public class §_-32K§ extends §_-C1§
   {
      
      public function §_-32K§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-Y1K§).lifeTime = 7 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-Y1K§;
      }
   }
}


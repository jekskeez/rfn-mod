package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-21v§;
   
   public class §_-W2f§ extends §_-C1§
   {
      
      public function §_-W2f§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-21v§).lifeTime = 15 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-21v§;
      }
   }
}


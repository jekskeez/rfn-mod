package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-71Y§;
   
   public class §_-C2R§ extends §_-C1§
   {
      
      public function §_-C2R§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-71Y§).type = int(Math.random() * 5);
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-71Y§;
      }
   }
}


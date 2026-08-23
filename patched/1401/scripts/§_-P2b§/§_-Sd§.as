package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-CS§;
   
   public class §_-Sd§ extends §_-C1§
   {
      
      public function §_-Sd§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-CS§).lifeTime = 25 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-CS§;
      }
   }
}


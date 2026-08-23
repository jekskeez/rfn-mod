package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-Ye§;
   
   public class §_-tw§ extends §_-C1§
   {
      
      public function §_-tw§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get §_-t1B§() : Number
      {
         return 8;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-Ye§).lifeTime = 20 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-Ye§;
      }
   }
}


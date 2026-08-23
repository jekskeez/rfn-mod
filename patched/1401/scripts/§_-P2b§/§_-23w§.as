package §_-P2b§
{
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-n1f§;
   
   public class §_-23w§ extends §_-C1§
   {
      
      public function §_-23w§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-n1f§;
      }
      
      override protected function get §_-t1B§() : Number
      {
         return 10;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return 3;
      }
   }
}


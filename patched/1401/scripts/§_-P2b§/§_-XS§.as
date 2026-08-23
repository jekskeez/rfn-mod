package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-6j§;
   
   public class §_-XS§ extends §_-C1§
   {
      
      public function §_-XS§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-iP§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 3;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-6j§;
      }
      
      override protected function get §_-t1B§() : Number
      {
         return 0;
      }
      
      override protected function get §_-v2i§() : Number
      {
         return 1;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-6j§).lifeTime = 10 * 1000;
      }
   }
}


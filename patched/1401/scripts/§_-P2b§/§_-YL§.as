package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-12U§;
   
   public class §_-YL§ extends §_-C1§
   {
      
      public function §_-YL§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "PerkHippieFlower";
      }
      
      override public function get totalCooldown() : Number
      {
         return 18;
      }
      
      override protected function get §_-t1B§() : Number
      {
         return 4;
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         (param1 as §_-12U§).lifeTime = 18 * 1000;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-12U§;
      }
   }
}


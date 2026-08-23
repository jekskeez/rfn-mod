package §_-o10§
{
   import §_-Q2§.§_-61n§;
   
   public class §_-u1k§ extends §_-Z23§
   {
      
      public function §_-u1k§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-B3i§;
      }
      
      override protected function §_-02B§() : void
      {
         this.castObject = new §_-61n§();
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-53U§ ? 0 : 10;
      }
      
      override public function get maxCountUse() : int
      {
         return §_-bx§();
      }
   }
}


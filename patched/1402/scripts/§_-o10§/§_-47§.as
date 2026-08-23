package §_-o10§
{
   import §_-Q2§.§_-Il§;
   
   public class §_-47§ extends §_-Z23§
   {
      
      public function §_-47§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-A2x§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-Il§ = new §_-Il§();
         _loc1_.radius *= §_-bx§() / 100 + 1;
         _loc1_.playerId = this.hero.id;
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
      
      override protected function get maxCastCount() : int
      {
         return this.§_-53U§ ? 2 : 1;
      }
   }
}


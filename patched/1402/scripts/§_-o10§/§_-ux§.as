package §_-o10§
{
   import §_-Q2§.§_-x12§;
   
   public class §_-ux§ extends §_-Z23§
   {
      
      public function §_-ux§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-e2z§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-x12§ = new §_-x12§();
         _loc1_.§_-w20§ = §_-bx§() * 1000;
         _loc1_.lifeTime = §_-s2t§() * 1000;
         _loc1_.playerId = this.hero.id;
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return 50;
      }
   }
}


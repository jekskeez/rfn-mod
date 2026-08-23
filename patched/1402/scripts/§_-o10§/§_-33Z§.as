package §_-o10§
{
   import §_-Q2§.§_-3K§;
   import §_-Q2§.§_-52B§;
   import §_-Q2§.§_-W5§;
   import §_-Q2§.§_-Y2o§;
   
   public class §_-33Z§ extends §_-Z23§
   {
      
      public function §_-33Z§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-Q1n§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-Y2o§ = null;
         switch(this.hero.team)
         {
            case Hero.§_-PM§:
            case Hero.§_-m28§:
               _loc1_ = new §_-W5§();
               break;
            case Hero.§_-i1Y§:
               _loc1_ = new §_-52B§();
               break;
            case Hero.§_-l1B§:
               _loc1_ = new §_-3K§();
         }
         _loc1_.aging = !this.§_-53U§;
         if(_loc1_.aging)
         {
            _loc1_.lifeTime = §_-bx§() * 1000;
         }
         this.castObject = _loc1_;
      }
   }
}


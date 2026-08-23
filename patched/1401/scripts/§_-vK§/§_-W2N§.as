package §_-vK§
{
   import §_-b1B§.§_-42T§;
   import §_-b1B§.§_-K2g§;
   import §_-b1B§.§_-Y2L§;
   import §_-b1B§.§_-tI§;
   
   public class §_-W2N§ extends §_-O2o§
   {
      
      public function §_-W2N§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-g23§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-K2g§ = null;
         switch(this.hero.team)
         {
            case Hero.§_-JL§:
            case Hero.§_-O18§:
               _loc1_ = new §_-tI§();
               break;
            case Hero.§_-114§:
               _loc1_ = new §_-Y2L§();
               break;
            case Hero.§_-17§:
               _loc1_ = new §_-42T§();
         }
         _loc1_.aging = !this.§_-41W§;
         if(_loc1_.aging)
         {
            _loc1_.lifeTime = §_-Nu§() * 1000;
         }
         this.castObject = _loc1_;
      }
   }
}


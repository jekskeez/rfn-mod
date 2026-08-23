package §_-b1B§
{
   import §_-637§.BodyDestructor;
   import §_-637§.§_-Ft§;
   import game.mainGame.Cast;
   
   public class §_-I1e§ extends BodyDestructor implements §_-Ft§
   {
      
      private var §_-Mf§:Cast = null;
      
      public function §_-I1e§()
      {
         super();
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Mf§.§_-R1d§ = 0;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-R1d§ = NaN;
      }
   }
}


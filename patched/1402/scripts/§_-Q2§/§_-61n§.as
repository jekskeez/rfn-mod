package §_-Q2§
{
   import §_-F5§.BodyDestructor;
   import §_-F5§.§_-Y1d§;
   import game.mainGame.Cast;
   
   public class §_-61n§ extends BodyDestructor implements §_-Y1d§
   {
      
      private var §_-42p§:Cast = null;
      
      public function §_-61n§()
      {
         super();
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-42p§.§_-B3f§ = 0;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-B3f§ = NaN;
      }
   }
}


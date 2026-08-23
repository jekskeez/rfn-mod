package §_-F19§
{
   import §_-A2x§.GameMapNet;
   import §_-A2x§.§_-01J§;
   import §_-A2x§.§_-Ar§;
   
   public class §_-l0§ extends §_-Ar§
   {
      
      private var §_-72G§:Boolean;
      
      public function §_-l0§(param1:Boolean = false)
      {
         this.§_-72G§ = param1;
         super();
      }
      
      override protected function init() : void
      {
         this.cast = new §_-01J§(this);
         this.map = new GameMapNet(this);
         this.squirrels = new §_-p2§(this.§_-72G§);
      }
   }
}


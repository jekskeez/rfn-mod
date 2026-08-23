package §_-qJ§
{
   import §_-A2x§.§_-01J§;
   import §_-A2x§.§_-Ar§;
   
   public class §_-20§ extends §_-Ar§
   {
      
      private var §_-H1z§:Boolean = false;
      
      public function §_-20§(param1:Boolean = false)
      {
         this.§_-H1z§ = param1;
         super();
      }
      
      override protected function init() : void
      {
         this.cast = new §_-01J§(this);
         this.map = new §_-4t§(this);
         this.squirrels = new §_-w1j§(this.§_-H1z§);
      }
   }
}


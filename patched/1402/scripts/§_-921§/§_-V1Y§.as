package §_-921§
{
   import §_-td§.§_-vO§;
   import §_-td§.§_-z2w§;
   
   public class §_-V1Y§ extends §_-vO§
   {
      
      private var §_-635§:Boolean = false;
      
      public function §_-V1Y§(param1:Boolean = false)
      {
         this.§_-635§ = param1;
         super();
      }
      
      override protected function init() : void
      {
         this.cast = new §_-z2w§(this);
         this.map = new §_-I2p§(this);
         this.squirrels = new §_-t1q§(this.§_-635§);
      }
   }
}


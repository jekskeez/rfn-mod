package §_-O1O§
{
   import §_-td§.GameMapNet;
   import §_-td§.§_-vO§;
   import §_-td§.§_-z2w§;
   
   public class §_-l2E§ extends §_-vO§
   {
      
      private var §_-I2f§:Boolean;
      
      public function §_-l2E§(param1:Boolean = false)
      {
         this.§_-I2f§ = param1;
         super();
      }
      
      override protected function init() : void
      {
         this.cast = new §_-z2w§(this);
         this.map = new GameMapNet(this);
         this.squirrels = new §_-H1P§(this.§_-I2f§);
      }
   }
}


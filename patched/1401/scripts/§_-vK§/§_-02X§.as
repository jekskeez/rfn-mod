package §_-vK§
{
   import §_-b1B§.§_-I1e§;
   
   public class §_-02X§ extends §_-O2o§
   {
      
      public function §_-02X§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-53z§;
      }
      
      override protected function §_-I2a§() : void
      {
         this.castObject = new §_-I1e§();
      }
      
      override public function get totalCooldown() : Number
      {
         return this.§_-41W§ ? 0 : 10;
      }
      
      override public function get maxCountUse() : int
      {
         return §_-Nu§();
      }
   }
}


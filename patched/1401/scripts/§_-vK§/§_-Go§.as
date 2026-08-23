package §_-vK§
{
   import §_-b1B§.§_-I2Y§;
   
   public class §_-Go§ extends §_-O2o§
   {
      
      public static const §_-s2W§:int = 50;
      
      public function §_-Go§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-5A§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-I2Y§ = new §_-I2Y§();
         _loc1_.force *= 1 + §_-Nu§() / 100;
         if(this.§_-41W§)
         {
            _loc1_.velocity *= 1 + §_-s2W§ / 100;
         }
         this.castObject = _loc1_;
      }
   }
}


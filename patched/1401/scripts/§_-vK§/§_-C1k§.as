package §_-vK§
{
   import §_-b1B§.§_-C1z§;
   import §_-b1B§.§_-dx§;
   
   public class §_-C1k§ extends §_-O2o§
   {
      
      public function §_-C1k§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-l1z§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:* = this.§_-41W§ ? new §_-C1z§() : new §_-dx§();
         _loc1_.lifeTime = §_-Nu§() * 1000;
         this.castObject = _loc1_;
      }
   }
}


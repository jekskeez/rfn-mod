package §_-vK§
{
   import §_-u2r§.§_-92D§;
   
   public class §_-yV§ extends §_-O2o§
   {
      
      public static const §_-z2K§:Number = 40;
      
      public function §_-yV§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-v1l§;
      }
      
      override public function get totalCooldown() : Number
      {
         return 1.2;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-92D§ = new §_-92D§();
         _loc1_.maxVelocity += _loc1_.maxVelocity * §_-Nu§() / 100;
         if(this.§_-41W§)
         {
            _loc1_.§_-Hu§ *= 1 + §_-z2K§ / 100;
         }
         this.castObject = _loc1_;
      }
   }
}


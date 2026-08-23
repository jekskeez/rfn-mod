package §_-vK§
{
   import §_-83V§.§_-co§;
   
   public class §_-w2h§ extends §_-O2o§
   {
      
      public static const §_-P2q§:int = 20;
      
      public static const §_-X1F§:int = 20;
      
      public static const §_-v14§:int = 20;
      
      public function §_-w2h§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-N2s§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-co§ = null;
         _loc1_ = new §_-co§();
         if(this.§_-e1P§ == 3)
         {
            _loc1_.power *= 1 + §_-X1F§ / 100;
         }
         if(this.§_-d1K§ >= 2)
         {
            _loc1_.radius *= 1 + §_-v14§ / 100;
         }
         _loc1_.§_-838§ = !this.§_-41W§;
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return §_-P2q§ - §_-Nu§();
      }
   }
}


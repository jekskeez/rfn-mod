package §_-vK§
{
   import §_-b1B§.§_-ql§;
   
   public class §_-Q1R§ extends §_-O2o§
   {
      
      public function §_-Q1R§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-93§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-ql§ = new §_-ql§();
         _loc1_.§_-y1K§ = §_-Nu§() * 1000;
         _loc1_.lifeTime = §_-OD§() * 1000;
         _loc1_.playerId = this.hero.id;
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return 50;
      }
   }
}


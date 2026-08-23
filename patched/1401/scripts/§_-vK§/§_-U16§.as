package §_-vK§
{
   import §_-b1B§.§_-N1s§;
   
   public class §_-U16§ extends §_-O2o§
   {
      
      public function §_-U16§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-Au§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-N1s§ = new §_-N1s§();
         _loc1_.radius *= §_-Nu§() / 100 + 1;
         _loc1_.playerId = this.hero.id;
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
      
      override protected function get maxCastCount() : int
      {
         return this.§_-41W§ ? 2 : 1;
      }
   }
}


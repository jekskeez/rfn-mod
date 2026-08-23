package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-b1B§.§_-R1n§;
   
   public class §_-R2F§ extends §_-O2o§
   {
      
      private static const §_-d1J§:int = 10000;
      
      public function §_-R2F§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-y1Q§;
      }
      
      override protected function §_-I2a§() : void
      {
         var _loc1_:§_-R1n§ = new §_-R1n§();
         var _loc2_:Number = 20 * (1 + §_-Nu§() / 100);
         _loc1_.outSize = new b2Vec2(_loc2_,_loc2_);
         if(this.§_-41W§)
         {
            _loc1_.lifeTime += §_-d1J§;
         }
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get maxCastCount() : int
      {
         return this.§_-41W§ ? 2 : 1;
      }
   }
}


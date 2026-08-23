package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Q2§.§_-e1r§;
   
   public class §_-53P§ extends §_-Z23§
   {
      
      private static const §_-32B§:int = 10000;
      
      public function §_-53P§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-M2H§;
      }
      
      override protected function §_-02B§() : void
      {
         var _loc1_:§_-e1r§ = new §_-e1r§();
         var _loc2_:Number = 20 * (1 + §_-bx§() / 100);
         _loc1_.outSize = new b2Vec2(_loc2_,_loc2_);
         if(this.§_-53U§)
         {
            _loc1_.lifeTime += §_-32B§;
         }
         this.castObject = _loc1_;
      }
      
      override public function get totalCooldown() : Number
      {
         return 20;
      }
      
      override protected function get maxCastCount() : int
      {
         return this.§_-53U§ ? 2 : 1;
      }
   }
}


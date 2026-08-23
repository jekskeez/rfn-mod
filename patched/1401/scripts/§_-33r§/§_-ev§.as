package §_-33r§
{
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Vec2;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   
   public class §_-ev§ extends §_-AP§
   {
      
      private var power:Number = 0;
      
      private var §_-F1D§:Number = 0;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-ev§(param1:Number, param2:Number, param3:Number)
      {
         super(param1);
         this.power = param2;
         this.§_-F1D§ = param3;
      }
      
      override public function §_-g1A§(param1:Number) : void
      {
         super.update(param1);
         var _loc2_:b2Vec2 = this.hero.velocity;
         _loc2_.x *= this.§_-F1D§;
         _loc2_.MulM(this.hero.body.GetTransform().R.GetInverse(new b2Mat22()));
         _loc2_.y = -this.power;
         _loc2_.MulM(this.hero.body.GetTransform().R);
         this.hero.body.SetLinearVelocity(_loc2_);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.disableEffect(§_-93d§.§_-Z11§);
            this.§_-A38§ = null;
         }
         else
         {
            this.§_-A38§ = param1.applyEffect(§_-93d§.§_-Z11§);
         }
         super.hero = param1;
      }
   }
}


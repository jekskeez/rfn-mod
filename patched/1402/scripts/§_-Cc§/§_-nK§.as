package §_-Cc§
{
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Vec2;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   
   public class §_-nK§ extends §_-pp§
   {
      
      private var power:Number = 0;
      
      private var §_-Qq§:Number = 0;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-nK§(param1:Number, param2:Number, param3:Number)
      {
         super(param1);
         this.power = param2;
         this.§_-Qq§ = param3;
      }
      
      override public function §_-k20§(param1:Number) : void
      {
         super.update(param1);
         var _loc2_:b2Vec2 = this.hero.velocity;
         _loc2_.x *= this.§_-Qq§;
         _loc2_.MulM(this.hero.body.GetTransform().R.GetInverse(new b2Mat22()));
         _loc2_.y = -this.power;
         _loc2_.MulM(this.hero.body.GetTransform().R);
         this.hero.body.SetLinearVelocity(_loc2_);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.disableEffect(§_-w10§.§_-A1N§);
            this.§_-W1u§ = null;
         }
         else
         {
            this.§_-W1u§ = param1.applyEffect(§_-w10§.§_-A1N§);
         }
         super.hero = param1;
      }
   }
}


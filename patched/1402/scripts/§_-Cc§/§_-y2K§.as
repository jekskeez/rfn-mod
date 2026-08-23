package §_-Cc§
{
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Vec2;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   
   public class §_-y2K§ extends §_-pp§
   {
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-y2K§(param1:Number)
      {
         super(param1);
      }
      
      override public function §_-k20§(param1:Number) : void
      {
         super.update(param1);
         var _loc2_:b2Vec2 = this.hero.velocity;
         _loc2_.MulM(this.hero.body.GetTransform().R.GetInverse(new b2Mat22()));
         _loc2_.y = -2;
         _loc2_.MulM(this.hero.body.GetTransform().R);
         this.hero.body.SetLinearVelocity(_loc2_);
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null && this.hero != null)
         {
            this.hero.climbing = false;
            this.hero.disableEffect(§_-w10§.§_-k1Y§);
            this.§_-W1u§ = null;
         }
         else
         {
            this.§_-W1u§ = param1.applyEffect(§_-w10§.§_-k1Y§);
            param1.climbing = true;
         }
         super.hero = param1;
      }
   }
}


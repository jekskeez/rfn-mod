package §_-Cc§
{
   import Box2D.Common.Math.b2Mat22;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   
   public class §_-it§ extends §_-pp§ implements §_-B3z§
   {
      
      private var power:Number = 0;
      
      private var §_-8x§:Boolean = false;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-it§(param1:Number, param2:Number)
      {
         super(param1);
         this.power = param2;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 == this.§_-8x§)
         {
            return;
         }
         this.§_-8x§ = param1;
         if(param1)
         {
            this.§_-W1u§ = this.hero.applyEffect(§_-w10§.§_-F21§);
            this.§_-W1u§.§_-q22§ = Math.PI * 0.5;
         }
         else
         {
            this.hero.disableEffect(§_-w10§.§_-F21§);
            this.§_-W1u§ = null;
         }
      }
      
      override public function set hero(param1:Hero) : void
      {
         if(param1 == null)
         {
            this.active = false;
         }
         super.hero = param1;
      }
      
      public function get active() : Boolean
      {
         return this.§_-8x§;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.active)
         {
            return;
         }
         this.hero.velocity.MulM(this.hero.body.GetTransform().R.GetInverse(new b2Mat22()));
         this.hero.velocity.y = -this.power;
         this.hero.velocity.MulM(this.hero.body.GetTransform().R);
         this.hero.body.SetLinearVelocity(this.hero.velocity);
      }
   }
}


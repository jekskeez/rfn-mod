package §_-33r§
{
   import Box2D.Common.Math.b2Mat22;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   
   public class §_-q2D§ extends §_-AP§ implements §_-i8§
   {
      
      private var power:Number = 0;
      
      private var §_-c1w§:Boolean = false;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-q2D§(param1:Number, param2:Number)
      {
         super(param1);
         this.power = param2;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(param1 == this.§_-c1w§)
         {
            return;
         }
         this.§_-c1w§ = param1;
         if(param1)
         {
            this.§_-A38§ = this.hero.applyEffect(§_-93d§.§_-aZ§);
            this.§_-A38§.§_-Y1m§ = Math.PI * 0.5;
         }
         else
         {
            this.hero.disableEffect(§_-93d§.§_-aZ§);
            this.§_-A38§ = null;
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
         return this.§_-c1w§;
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


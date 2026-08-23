package §_-33r§
{
   import Box2D.Common.Math.b2Mat22;
   
   public class §_-C2I§ extends §_-AP§
   {
      
      private var power:Number = 0;
      
      public function §_-C2I§(param1:Number, param2:Number)
      {
         super(param1);
         this.power = param2;
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         if(!this.hero || !this.hero.onFloor)
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


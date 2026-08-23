package §_-81N§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2TimeStep;
   import §_-83V§.§_-44§;
   
   public class §_-l2C§ extends b2Controller
   {
      
      public var bubble:§_-44§ = null;
      
      public var force:b2Vec2 = new b2Vec2(0,-2500);
      
      public var §_-pI§:Number = -10;
      
      public function §_-l2C§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         if(!param1)
         {
         }
         if(Boolean(this.bubble) && Boolean(this.bubble.body) && this.bubble.body.GetLinearVelocity().y > this.§_-pI§)
         {
            this.bubble.body.ApplyForce(this.force,this.bubble.body.GetWorldCenter());
         }
      }
   }
}


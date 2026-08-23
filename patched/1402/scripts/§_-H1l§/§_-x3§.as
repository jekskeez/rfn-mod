package §_-H1l§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2TimeStep;
   import §_-8Q§.§_-427§;
   
   public class §_-x3§ extends b2Controller
   {
      
      public var bubble:§_-427§ = null;
      
      public var force:b2Vec2 = new b2Vec2(0,-2500);
      
      public var §_-11g§:Number = -10;
      
      public function §_-x3§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         if(!param1)
         {
         }
         if(Boolean(this.bubble) && Boolean(this.bubble.body) && this.bubble.body.GetLinearVelocity().y > this.§_-11g§)
         {
            this.bubble.body.ApplyForce(this.force,this.bubble.body.GetWorldCenter());
         }
      }
   }
}


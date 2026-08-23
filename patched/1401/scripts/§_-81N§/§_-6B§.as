package §_-81N§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2TimeStep;
   import §_-83V§.BalloonBody;
   
   public class §_-6B§ extends b2Controller
   {
      
      public var balloon:BalloonBody;
      
      public var §_-Z2U§:b2Vec2 = new b2Vec2(0,-0.1);
      
      public var active:Boolean = true;
      
      public var force:b2Vec2 = new b2Vec2(0,-2500);
      
      public function §_-6B§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         if(!param1)
         {
         }
         if(Boolean(this.balloon) && Boolean(this.balloon.body.GetLinearVelocity().y > this.balloon.§_-y2W§) && this.active)
         {
            this.balloon.body.ApplyForce(this.force,this.balloon.body.GetWorldPoint(this.§_-Z2U§));
         }
      }
   }
}


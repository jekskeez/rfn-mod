package §_-H1l§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2TimeStep;
   import §_-8Q§.BalloonBody;
   
   public class §_-hE§ extends b2Controller
   {
      
      public var balloon:BalloonBody;
      
      public var §_-m1i§:b2Vec2 = new b2Vec2(0,-0.1);
      
      public var active:Boolean = true;
      
      public var force:b2Vec2 = new b2Vec2(0,-2500);
      
      public function §_-hE§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         if(!param1)
         {
         }
         if(Boolean(this.balloon) && Boolean(this.balloon.body.GetLinearVelocity().y > this.balloon.§_-x22§) && this.active)
         {
            this.balloon.body.ApplyForce(this.force,this.balloon.body.GetWorldPoint(this.§_-m1i§));
         }
      }
   }
}


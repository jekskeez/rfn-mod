package §_-H1l§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2TimeStep;
   import §_-j2H§.§_-L2K§;
   
   public class §_-bJ§ extends b2Controller
   {
      
      public var §_-I0§:§_-L2K§;
      
      public function §_-bJ§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         if(!param1)
         {
         }
         if(this.§_-I0§ == null || this.§_-I0§.body == null || this.§_-I0§.body.body == null)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.§_-I0§.body.body.GetLocalVector(this.§_-I0§.body.body.GetLinearVelocityFromLocalPoint(this.§_-I0§.position));
         if(_loc2_.Length() > this.§_-I0§.maxVelocity)
         {
            return;
         }
         var _loc3_:b2Body = this.§_-I0§.body.body;
         _loc3_.SetAwake(true);
         var _loc4_:Number = this.§_-I0§.angle + this.§_-I0§.body.angle;
         var _loc5_:b2Vec2 = new b2Vec2(Math.cos(_loc4_),Math.sin(_loc4_));
         _loc5_.Multiply(this.§_-I0§.force);
         _loc3_.ApplyForce(_loc5_,_loc3_.GetWorldPoint(this.§_-I0§.position));
      }
   }
}


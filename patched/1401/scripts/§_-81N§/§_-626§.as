package §_-81N§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2TimeStep;
   import §_-B1O§.§_-J1X§;
   
   public class §_-626§ extends b2Controller
   {
      
      public var §_-u2z§:§_-J1X§;
      
      public function §_-626§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         if(!param1)
         {
         }
         if(this.§_-u2z§ == null || this.§_-u2z§.body == null || this.§_-u2z§.body.body == null)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.§_-u2z§.body.body.GetLocalVector(this.§_-u2z§.body.body.GetLinearVelocityFromLocalPoint(this.§_-u2z§.position));
         if(_loc2_.Length() > this.§_-u2z§.maxVelocity)
         {
            return;
         }
         var _loc3_:b2Body = this.§_-u2z§.body.body;
         _loc3_.SetAwake(true);
         var _loc4_:Number = this.§_-u2z§.angle + this.§_-u2z§.body.angle;
         var _loc5_:b2Vec2 = new b2Vec2(Math.cos(_loc4_),Math.sin(_loc4_));
         _loc5_.Multiply(this.§_-u2z§.force);
         _loc3_.ApplyForce(_loc5_,_loc3_.GetWorldPoint(this.§_-u2z§.position));
      }
   }
}


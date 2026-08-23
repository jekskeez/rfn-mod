package §_-H1l§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2Controller;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2TimeStep;
   
   public class §_-sC§ extends b2Controller
   {
      
      public var §_-Ab§:Array = null;
      
      public function §_-sC§()
      {
         super();
      }
      
      override public function Step(param1:b2TimeStep) : void
      {
         var _loc5_:b2Body = null;
         var _loc6_:b2Vec2 = null;
         if(!param1)
         {
         }
         if(!this.§_-Ab§)
         {
            return;
         }
         var _loc2_:Array = this.§_-Ab§.concat();
         var _loc3_:Hero = null;
         var _loc4_:* = int(_loc2_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc3_ = _loc2_[_loc4_];
            if(_loc3_ && !_loc3_.isDead && !_loc3_.inHollow && _loc3_.up && _loc3_.§_-K13§)
            {
               _loc3_.climbing = true;
               _loc5_ = _loc3_.body;
               if(!(!_loc5_ || !_loc5_.GetWorld() || !_loc5_.GetWorld().GetGravity() || _loc5_.GetLinearVelocity().y < -10))
               {
                  _loc6_ = _loc5_.GetWorld().GetGravity().Copy();
                  _loc6_.Multiply(_loc5_.GetMass() * 3);
                  _loc6_.NegativeSelf();
                  _loc5_.ApplyForce(_loc6_,_loc5_.GetWorldCenter());
               }
            }
            _loc4_--;
         }
      }
   }
}


package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   
   public class §_-lx§ extends §_-N2o§ implements §_-22J§
   {
      
      private static const §_-kI§:Number = 23.6;
      
      public function §_-lx§()
      {
         super(false);
         §_-71E§ = new this.leftClass().width - 12;
         §_-x2A§ -= 2;
         draw();
      }
      
      override public function get landSound() : String
      {
         return "land_swamp";
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2PolygonShape = null;
         var _loc3_:b2FixtureDef = null;
         if(!this.body)
         {
            this.body = param1.CreateBody(§_-E2n§);
            this.body.SetUserData(this);
            _loc2_ = b2PolygonShape.AsOrientedBox((this.§_-y19§.width - 40) * 0.5 / Game.§_-x2P§,§_-kI§ * 0.5 / Game.§_-x2P§,new b2Vec2((this.§_-y19§.width - 40) * 0.5 / Game.§_-x2P§,§_-kI§ * 0.5 / Game.§_-x2P§));
            _loc3_ = new b2FixtureDef(_loc2_,this,friction,restitution,density,this.categories,this.maskBits,0);
            this.body.CreateFixture(_loc3_);
         }
         super.build(param1);
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new SwampIcon());
      }
      
      override public function beginContact(param1:b2Contact) : void
      {
      }
      
      override public function endContact(param1:b2Contact) : void
      {
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         if(param1.GetFixtureA().GetUserData() == this)
         {
            this.§_-v7§(param1.GetFixtureB().GetBody(),_loc3_.m_points[0]);
         }
         else
         {
            this.§_-v7§(param1.GetFixtureA().GetBody(),_loc3_.m_points[1]);
         }
      }
      
      override public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function get leftClass() : Class
      {
         return SwampLeft;
      }
      
      override protected function get middleClass() : Class
      {
         return SwampMiddle;
      }
      
      override protected function get rightClass() : Class
      {
         return SwampRight;
      }
      
      private function §_-v7§(param1:b2Body, param2:b2Vec2) : void
      {
         if(param1 == this.body || param2.x == 0 && param2.y == 0)
         {
            return;
         }
         var _loc3_:b2Vec2 = param1.GetLinearVelocity();
         var _loc4_:Number = Number(param1.GetAngularVelocity());
         _loc3_.x *= 0.8;
         _loc3_.y *= 0.8;
         _loc4_ *= 0.8;
         param1.SetLinearVelocity(_loc3_);
         param1.SetAngularVelocity(_loc4_);
      }
   }
}


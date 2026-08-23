package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-b2X§;
   
   public class §_-A22§ extends GameBody implements §_-22J§, §_-b2X§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(79 * 0.5 / Game.§_-x2P§,75 * 0.5 / Game.§_-x2P§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public function §_-A22§()
      {
         super();
         §_-83v§(new §_-h2I§(new SeaGrassView()));
         this.fixed = true;
         this.§_-x2x§();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
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
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
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


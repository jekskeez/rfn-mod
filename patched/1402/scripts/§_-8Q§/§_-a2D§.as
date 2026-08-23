package §_-8Q§
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
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-j9§;
   
   public class §_-a2D§ extends GameBody implements §_-Pn§, §_-j9§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(79 * 0.5 / Game.§_-12A§,75 * 0.5 / Game.§_-12A§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public function §_-a2D§()
      {
         super();
         §_-J2J§(new §_-aS§(new SeaGrassView()));
         this.fixed = true;
         this.§_-i18§();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
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
            this.§_-j1M§(param1.GetFixtureB().GetBody(),_loc3_.m_points[0]);
         }
         else
         {
            this.§_-j1M§(param1.GetFixtureA().GetBody(),_loc3_.m_points[1]);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-j1M§(param1:b2Body, param2:b2Vec2) : void
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


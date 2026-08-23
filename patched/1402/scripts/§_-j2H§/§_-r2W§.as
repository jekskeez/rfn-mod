package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-Cc§.§_-73t§;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   import game.mainGame.§_-q2c§;
   
   public class §_-r2W§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(1.5,1);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0,500,§_-53X§,§_-C3c§);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      public function §_-r2W§()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§(new this.viewClass());
         _loc1_.§_-i18§();
         §_-J2J§(_loc1_);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetUserData(this);
         super.build(param1);
         this.fixed = true;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc2_);
         var _loc3_:b2Vec2 = _loc2_.m_normal.Copy();
         if(param1.GetFixtureB().GetUserData() == this)
         {
            _loc3_ = _loc3_.GetNegative();
         }
         var _loc4_:b2Vec2 = this.body != null ? new b2Vec2(Math.cos(this.body.GetAngle() - Math.PI * 0.5),Math.sin(this.body.GetAngle() - Math.PI * 0.5)) : new b2Vec2(0,0);
         if(b2Math.Dot(_loc3_,_loc4_) < 0.5)
         {
            return;
         }
         var _loc5_:Hero = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         if(!_loc5_)
         {
            _loc5_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc5_ != null && this.§_-aY§(_loc5_))
         {
            _loc5_.dispatchEvent(new Event(Hero.§_-G0§));
            _loc5_.§_-b2d§ = Hero.§_-e2H§;
            _loc5_.§_-kl§();
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         this.beginContact(param1);
      }
      
      protected function get viewClass() : Class
      {
         return RibsView;
      }
      
      private function §_-aY§(param1:Hero) : Boolean
      {
         return !(param1.heroView.§_-t2V§ && (param1.heroView.§_-t2V§ as §_-23o§).§_-b2J§ || param1.§_-C28§ || param1.armadillo || param1.inHollow || param1.behaviourController.getState(§_-73t§) != null);
      }
   }
}


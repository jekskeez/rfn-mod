package §_-B1O§
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
   import §_-33r§.§_-hu§;
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   import game.mainGame.§_-V§;
   
   public class §_-222§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(1.5,1);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0,500,§_-52X§,§_-FN§);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      public function §_-222§()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§(new this.viewClass());
         _loc1_.§_-x2x§();
         §_-83v§(_loc1_);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
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
         if(_loc5_ != null && this.§_-QD§(_loc5_))
         {
            _loc5_.dispatchEvent(new Event(Hero.§_-aj§));
            _loc5_.§_-L1A§ = Hero.§_-W2x§;
            _loc5_.§_-h2r§();
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
      
      private function §_-QD§(param1:Hero) : Boolean
      {
         return !(param1.heroView.§_-Wk§ && (param1.heroView.§_-Wk§ as §_-31F§).§_-62l§ || param1.§_-Wt§ || param1.armadillo || param1.inHollow || param1.behaviourController.getState(§_-hu§) != null);
      }
   }
}


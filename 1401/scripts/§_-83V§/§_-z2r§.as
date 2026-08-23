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
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-d2d§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-f2A§;
   import sounds.GameSounds;
   
   public class §_-z2r§ extends GameBody implements §_-21e§, §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(29 / Game.§_-x2P§,8 / Game.§_-x2P§,new b2Vec2());
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsOrientedBox(22 / Game.§_-x2P§,2 / Game.§_-x2P§,new b2Vec2(0,-8 / Game.§_-x2P§));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[0,0]];
      
      protected var §_-B21§:b2Fixture;
      
      protected var view:§_-d2d§;
      
      public var bouncingFactor:Number = 250;
      
      public function §_-z2r§()
      {
         super();
         this.view = new §_-d2d§(new BouncerView());
         this.view.stop();
         this.view.loop = false;
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         this.§_-B21§ = this.body.CreateFixture(FIXTURE_DEF2);
         this.§_-B21§.SetUserData(this);
         super.build(param1);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.bouncingFactor]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.bouncingFactor = param1[1][0];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.view.gotoAndPlay(0);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(this.body.GetTransform().R.col2.y * _loc3_.m_normal.y >= 0);
         }
         else
         {
            param1.SetEnabled(this.body.GetTransform().R.col2.y * _loc3_.m_normal.y < 0);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         var _loc3_:Hero = null;
         if(param1.GetFixtureA().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureA().GetUserData() as Hero;
         }
         if(param1.GetFixtureB().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureB().GetUserData() as Hero;
         }
         if(!_loc3_)
         {
            return;
         }
         GameSounds.play("batut_light");
         _loc3_.velocity = new b2Vec2();
         var _loc4_:b2Vec2 = this.body.GetTransform().R.col2.Copy();
         _loc4_.Multiply(-this.bouncingFactor);
         _loc3_.§_-53N§(_loc4_);
         if(_loc3_.id == Game.selfId)
         {
            GameSounds.playUnrepeatable("batut_medium");
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
   }
}


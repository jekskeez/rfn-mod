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
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import sounds.GameSounds;
   
   public class §_-m1m§ extends GameBody implements §_-e2t§, §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(29 / Game.§_-12A§,8 / Game.§_-12A§,new b2Vec2());
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsOrientedBox(22 / Game.§_-12A§,2 / Game.§_-12A§,new b2Vec2(0,-8 / Game.§_-12A§));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[0,0]];
      
      protected var §_-N3§:b2Fixture;
      
      protected var view:§_-f1u§;
      
      public var bouncingFactor:Number = 250;
      
      public function §_-m1m§()
      {
         super();
         this.view = new §_-f1u§(new BouncerView());
         this.view.stop();
         this.view.loop = false;
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         this.§_-N3§ = this.body.CreateFixture(FIXTURE_DEF2);
         this.§_-N3§.SetUserData(this);
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.bouncingFactor]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
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
         _loc3_.§_-PT§(_loc4_);
         if(_loc3_.id == Game.selfId)
         {
            GameSounds.playUnrepeatable("batut_medium");
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
   }
}


package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-L1q§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class Trampoline extends GameBody implements §_-e2t§, §_-Pn§, §_-L1q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-a17§:int = -100;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(29 / Game.§_-12A§,7 / Game.§_-12A§,new b2Vec2());
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsOrientedBox(22 / Game.§_-12A§,3 / Game.§_-12A§,new b2Vec2(0,-(5 / Game.§_-12A§)));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,1.5,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[0,0]];
      
      private var §_-N3§:b2Fixture;
      
      private var view:§_-aS§;
      
      public function Trampoline()
      {
         super();
         this.view = new §_-f1u§(new TrampolineView());
         §_-J2J§(this.view);
         this.view.stop();
         this.view.loop = false;
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1 && this.§_-t2F§ == §_-u1O§.§_-Ag§ && §_-t2c§.active is §_-u24§;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(this.§_-sP§(Game.selfId))
         {
            this.alpha = 0.2;
         }
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
         if(this.§_-sP§(Game.selfId))
         {
            this.alpha = 0.2;
         }
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
         var _loc3_:b2Fixture = param1.GetFixtureA().GetUserData() == this ? param1.GetFixtureB() : param1.GetFixtureA();
         if(!(_loc3_.GetBody().GetUserData() is Hero))
         {
            param1.SetEnabled(false);
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
         var _loc4_:Number = Number(param1.GetManifold().m_points[0].m_normalImpulse);
         if(_loc3_.id != Game.selfId)
         {
            return;
         }
         if(_loc4_ < 400)
         {
            GameSounds.playUnrepeatable("batut_light");
         }
         else if(_loc4_ < 550)
         {
            GameSounds.playUnrepeatable("batut_medium");
         }
         else
         {
            GameSounds.playUnrepeatable("batut_heavy");
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
   }
}


package §_-83V§
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
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-FD§;
   import game.mainGame.entity.§_-f2A§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class Trampoline extends GameBody implements §_-21e§, §_-22J§, §_-FD§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-xk§:int = -100;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(29 / Game.§_-x2P§,7 / Game.§_-x2P§,new b2Vec2());
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsOrientedBox(22 / Game.§_-x2P§,3 / Game.§_-x2P§,new b2Vec2(0,-(5 / Game.§_-x2P§)));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,1.5,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[0,0]];
      
      private var §_-B21§:b2Fixture;
      
      private var view:§_-h2I§;
      
      public function Trampoline()
      {
         super();
         this.view = new §_-d2d§(new TrampolineView());
         §_-83v§(this.view);
         this.view.stop();
         this.view.loop = false;
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1 && this.§_-123§ == §_-h2B§.§_-S1J§ && §_-71o§.active is §_-92z§;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(this.§_-d2E§(Game.selfId))
         {
            this.alpha = 0.2;
         }
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
         if(this.§_-d2E§(Game.selfId))
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
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
   }
}


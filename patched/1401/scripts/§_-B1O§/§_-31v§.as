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
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   import game.mainGame.§_-V§;
   
   public class §_-31v§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(65 / Game.§_-x2P§,5 / Game.§_-x2P§,new b2Vec2(0,-1.95));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var hero:Hero = null;
      
      public function §_-31v§()
      {
         super();
         this.view = new §_-d2d§(new AntimagicImg());
         this.view.loop = true;
         this.view.stop();
         §_-83v§(this.view);
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         this.§_-L1Z§();
         super.dispose();
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!_loc2_ || _loc2_.inHollow || _loc2_.isHare || _loc2_.isDead)
         {
            return;
         }
         if(_loc2_.id > 0 && _loc2_.id != Game.selfId)
         {
            return;
         }
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:b2Vec2 = _loc3_.m_normal.Copy();
         if(param1.GetFixtureB().GetUserData() == this)
         {
            _loc4_ = _loc4_.GetNegative();
         }
         var _loc5_:b2Vec2 = this.body != null ? new b2Vec2(Math.cos(this.body.GetAngle() - Math.PI * 0.5),Math.sin(this.body.GetAngle() - Math.PI * 0.5)) : new b2Vec2(0,0);
         if(b2Math.Dot(_loc4_,_loc5_) < 0.5)
         {
            return;
         }
         this.§_-6P§(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         if(!this.hero)
         {
            return;
         }
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!_loc2_ || this.hero != _loc2_)
         {
            return;
         }
         this.§_-L1Z§();
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-6P§(param1:Hero) : void
      {
         this.hero = param1;
         param1.perksAvailable = false;
         param1.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         param1.perkController.§_-vg§();
         param1.perkController.§_-m2W§();
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-L1Z§();
      }
      
      private function §_-L1Z§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.perksAvailable = true;
         this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         this.hero.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.hero = null;
      }
   }
}


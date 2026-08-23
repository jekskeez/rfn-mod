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
   import §_-TK§.§_-f1u§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   import game.mainGame.§_-q2c§;
   
   public class §_-H1C§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(65 / Game.§_-12A§,5 / Game.§_-12A§,new b2Vec2(0,-1.95));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var hero:Hero = null;
      
      public function §_-H1C§()
      {
         super();
         this.view = new §_-f1u§(new AntimagicImg());
         this.view.loop = true;
         this.view.stop();
         §_-J2J§(this.view);
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
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
         this.§_-V14§();
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
         this.§_-X16§(_loc2_);
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
         this.§_-V14§();
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-X16§(param1:Hero) : void
      {
         this.hero = param1;
         param1.perksAvailable = false;
         param1.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         param1.perkController.§_-F1U§();
         param1.perkController.§_-2O§();
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-V14§();
      }
      
      private function §_-V14§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.perksAvailable = true;
         this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         this.hero.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.hero = null;
      }
   }
}


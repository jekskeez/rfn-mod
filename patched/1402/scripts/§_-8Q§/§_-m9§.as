package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-hd§.§_-01M§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-w1u§;
   import particles.Explode;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-m9§ extends GameBody implements §_-Pn§, §_-w1u§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-k2B§:uint = 3;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(§_-k2B§,§_-k2B§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.3,0.1,0.8,§_-53X§,§_-C3c§,0);
      
      private static const §_-52v§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:DisplayObject = null;
      
      private var destroyed:Boolean = false;
      
      private var hero:Hero = null;
      
      private var §_-C1I§:b2Joint = null;
      
      private var §_-ua§:int = -1;
      
      public function §_-m9§()
      {
         super();
         this.view = this.§_-U25§();
         this.view.x = -30;
         this.view.y = -30;
         §_-J2J§(this.view);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      public function get landSound() : String
      {
         return "glass";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-52v§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         if(this.§_-ua§ != -1)
         {
            this.pinSquirrel(this.§_-ua§);
         }
      }
      
      public function §_-U25§() : §_-aS§
      {
         return new §_-aS§(new GlassBox());
      }
      
      override public function dispose() : void
      {
         this.§_-V14§();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         if(this.hero != null)
         {
            _loc1_.push(this.hero.id);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(1 in param1)
         {
            this.§_-ua§ = param1[1];
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.hero != null || this.destroyed)
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
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.§_-424§ || _loc2_.hasJoints("glassBox"))
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
         this.§_-Z2m§(_loc2_.id);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(this.destroyed)
         {
            return;
         }
         if(param2.normalImpulses[0] < 650)
         {
            return;
         }
         var _loc3_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ != null && this.hero == null)
         {
            return;
         }
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         this.destroyed = true;
         var _loc4_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc4_);
         this.§_-AI§(_loc4_.m_points[0],this.§_-21H§.gravity,param2.normalImpulses[0]);
      }
      
      private function §_-EL§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.view.visible = false;
         var _loc4_:§_-aS§ = §_-01M§.§_-q1k§(new GlassBoxPieces(),true);
         §_-J2J§(_loc4_);
         Explode.§_-t1j§(_loc4_,param1,param2,param3);
      }
      
      private function §_-Z2m§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.pinSquirrel(param1);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pinBoxGlassSquirrel":[this.id,param1]}));
         }
      }
      
      private function §_-AI§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         if(this.§_-21H§ is §_-62b§)
         {
            setTimeout(this.§_-th§,0,param1,param2,param3);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"destroyGlass":[this.id,[param1.x,param1.y],[param2.x,param2.y],param3]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-21H§ || this.hero != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("glassBox") || _loc2_.§_-424§)
         {
            return;
         }
         this.hero = _loc2_;
         this.hero.§_-Kv§ = true;
         this.hero.§_-S2Y§ = 1;
         this.hero.§_-J2J§(this.view);
         this.view.y -= 11;
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-y2S§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-K1I§,this.§_-A1R§);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2(0,1.1);
         _loc3_.localAnchorB = new b2Vec2();
         _loc3_.enableLimit = true;
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         _loc3_.bodyA = this.body;
         _loc3_.bodyB = _loc2_.body;
         this.§_-C1I§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-C1I§.SetUserData("glassBox");
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
         §_-J2J§(this.view);
         this.view.y += 11;
         this.hero.§_-S2Y§ = 0;
         this.hero.§_-Kv§ = false;
         this.hero.body.SetAngularVelocity(0);
         this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-y2S§,this.§_-A1R§);
         this.hero.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-K1I§,this.§_-A1R§);
         this.hero = null;
         if(this.§_-C1I§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-C1I§);
            this.§_-C1I§ = null;
         }
      }
      
      private function §_-th§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.§_-EL§(param1,param2,param3);
         if(!this.§_-21H§)
         {
            return;
         }
         this.§_-21H§.map.remove(this,true);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("pinBoxGlassSquirrel" in _loc2_)
         {
            if(_loc2_["pinBoxGlassSquirrel"][0] != this.id)
            {
               return;
            }
            this.pinSquirrel(_loc2_["pinBoxGlassSquirrel"][1]);
         }
         if("destroyGlass" in _loc2_)
         {
            if(_loc2_["destroyGlass"][0] != this.id)
            {
               return;
            }
            this.§_-th§(new b2Vec2(_loc2_["destroyGlass"][1][0],_loc2_["destroyGlass"][1][1]),new b2Vec2(_loc2_["destroyGlass"][2][0],_loc2_["destroyGlass"][2][1]),_loc2_["destroyGlass"][3]);
         }
      }
   }
}


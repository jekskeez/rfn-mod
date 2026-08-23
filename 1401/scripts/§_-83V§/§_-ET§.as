package §_-83V§
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
   import §_-51g§.§_-22J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-YY§;
   import particles.Explode;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-ET§ extends GameBody implements §_-22J§, §_-YY§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-F2L§:uint = 3;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(§_-F2L§,§_-F2L§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.3,0.1,0.8,§_-52X§,§_-FN§,0);
      
      private static const §_-T18§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:DisplayObject = null;
      
      private var destroyed:Boolean = false;
      
      private var hero:Hero = null;
      
      private var §_-i2J§:b2Joint = null;
      
      private var §_-tD§:int = -1;
      
      public function §_-ET§()
      {
         super();
         this.view = this.§_-61E§();
         this.view.x = -30;
         this.view.y = -30;
         §_-83v§(this.view);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      public function get landSound() : String
      {
         return "glass";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-T18§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         if(this.§_-tD§ != -1)
         {
            this.pinSquirrel(this.§_-tD§);
         }
      }
      
      public function §_-61E§() : §_-h2I§
      {
         return new §_-h2I§(new GlassBox());
      }
      
      override public function dispose() : void
      {
         this.§_-L1Z§();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         if(this.hero != null)
         {
            _loc1_.push(this.hero.id);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(1 in param1)
         {
            this.§_-tD§ = param1[1];
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
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.§_-j2i§ || _loc2_.hasJoints("glassBox"))
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
         this.§_-oJ§(_loc2_.id);
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
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         this.destroyed = true;
         var _loc4_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc4_);
         this.§_-i9§(_loc4_.m_points[0],this.§_-H2D§.gravity,param2.normalImpulses[0]);
      }
      
      private function §_-Y2E§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.view.visible = false;
         var _loc4_:§_-h2I§ = §_-a2§.§_-ZE§(new GlassBoxPieces(),true);
         §_-83v§(_loc4_);
         Explode.§_-v2F§(_loc4_,param1,param2,param3);
      }
      
      private function §_-oJ§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.pinSquirrel(param1);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pinBoxGlassSquirrel":[this.id,param1]}));
         }
      }
      
      private function §_-i9§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         if(this.§_-H2D§ is §_-A32§)
         {
            setTimeout(this.§_-b16§,0,param1,param2,param3);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"destroyGlass":[this.id,[param1.x,param1.y],[param2.x,param2.y],param3]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§ || this.hero != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("glassBox") || _loc2_.§_-j2i§)
         {
            return;
         }
         this.hero = _loc2_;
         this.hero.§_-SR§ = true;
         this.hero.§_-S2R§ = 1;
         this.hero.§_-83v§(this.view);
         this.view.y -= 11;
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-Y1J§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-tl§,this.§_-jf§);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2(0,1.1);
         _loc3_.localAnchorB = new b2Vec2();
         _loc3_.enableLimit = true;
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         _loc3_.bodyA = this.body;
         _loc3_.bodyB = _loc2_.body;
         this.§_-i2J§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-i2J§.SetUserData("glassBox");
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
         §_-83v§(this.view);
         this.view.y += 11;
         this.hero.§_-S2R§ = 0;
         this.hero.§_-SR§ = false;
         this.hero.body.SetAngularVelocity(0);
         this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-Y1J§,this.§_-jf§);
         this.hero.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-tl§,this.§_-jf§);
         this.hero = null;
         if(this.§_-i2J§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-i2J§);
            this.§_-i2J§ = null;
         }
      }
      
      private function §_-b16§(param1:b2Vec2, param2:b2Vec2, param3:Number) : void
      {
         this.§_-Y2E§(param1,param2,param3);
         if(!this.§_-H2D§)
         {
            return;
         }
         this.§_-H2D§.map.remove(this,true);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
            this.§_-b16§(new b2Vec2(_loc2_["destroyGlass"][1][0],_loc2_["destroyGlass"][1][1]),new b2Vec2(_loc2_["destroyGlass"][2][0],_loc2_["destroyGlass"][2][1]),_loc2_["destroyGlass"][3]);
         }
      }
   }
}


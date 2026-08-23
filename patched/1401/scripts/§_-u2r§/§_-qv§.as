package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-A2x§.§_-Ar§;
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-f2A§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-Z1S§;
   
   public class §_-qv§ extends GameBody implements §_-21e§, §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(6 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,0.5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[0,0]];
      
      private var joint:b2RevoluteJoint;
      
      private var view:§_-h2I§;
      
      private var §_-p1H§:§_-h2I§;
      
      private var active:Boolean = true;
      
      private var §_-42S§:Boolean = false;
      
      private var §_-k2P§:Boolean = true;
      
      private var §_-uP§:b2Vec2;
      
      private var controller:b2ConstantAccelController;
      
      public function §_-qv§()
      {
         super();
         this.view = new §_-h2I§(new GumInAir());
         this.view.visible = false;
         §_-83v§(this.view);
         this.§_-p1H§ = new §_-h2I§(new GumSticked());
         §_-83v§(this.§_-p1H§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
         if(!this.§_-m1I§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-50,0)));
         }
         this.view.visible = true;
         this.§_-p1H§.visible = false;
         this.§_-uP§ = this.position.Copy();
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         setTimeout(this.§_-u2o§,2000,this);
      }
      
      override public function get position() : b2Vec2
      {
         return super.position;
      }
      
      override public function set position(param1:b2Vec2) : void
      {
         super.position = param1;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            this.body.SetBullet(this.body.GetLinearVelocity().Length() > 10);
            if(!this.§_-k2P§ || this.body.GetLinearVelocity().Length() < 10)
            {
               this.§_-cN§();
            }
            this.§_-1p§();
         }
      }
      
      override public function dispose() : void
      {
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.§_-cN§();
         this.§_-x24§();
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         if(param1 is Object || param1 is Array)
         {
            super.§_-41M§(param1);
            this.playerId = param1[1][0];
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2Body = param1.GetFixtureA().GetBody().GetUserData() == this ? param1.GetFixtureB().GetBody() : param1.GetFixtureA().GetBody();
         if(_loc2_.GetUserData() is §_-qv§)
         {
            return;
         }
         if(_loc2_.GetUserData() is Hero)
         {
            if((_loc2_.GetUserData() as Hero).isSelf && !(_loc2_.GetUserData() as Hero).isHare && !(_loc2_.GetUserData() as Hero).isDead && !(_loc2_.GetUserData() as Hero).inHollow)
            {
               setTimeout(this.infect,1,_loc2_.GetUserData() as Hero);
            }
            return;
         }
         this.§_-w6§(param1);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2Body = param1.GetFixtureA().GetBody().GetUserData() == this ? param1.GetFixtureB().GetBody() : param1.GetFixtureA().GetBody();
         if(_loc3_.GetUserData() is Hero || _loc3_.GetUserData() is §_-qv§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-u2o§(param1:§_-qv§) : void
      {
         if(param1)
         {
            param1.§_-k2P§ = false;
         }
      }
      
      private function §_-1p§() : void
      {
         if(!this.joint)
         {
            return;
         }
         if(b2Math.SubtractVV(this.joint.GetAnchorA(),this.joint.GetAnchorB()).Length() > 1)
         {
            this.§_-x24§();
         }
      }
      
      private function §_-w6§(param1:b2Contact) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         if(this.joint)
         {
            return;
         }
         var _loc2_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc2_);
         var _loc3_:Point = new Point(_loc2_.m_normal.x,_loc2_.m_normal.y);
         if(param1.GetFixtureA().GetBody().GetUserData() == this)
         {
            _loc3_.x = -_loc3_.x;
            _loc3_.y = -_loc3_.y;
         }
         this.§_-p1H§.rotation = §_-Z1S§.getAngle(new Point(),_loc3_) - this.rotation + 90;
         var _loc4_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc4_.Initialize(param1.GetFixtureA().GetBody(),param1.GetFixtureB().GetBody(),this.position);
         _loc4_.collideConnected = false;
         _loc4_.enableLimit = true;
         _loc4_.upperAngle = 0;
         _loc4_.lowerAngle = 0;
         this.joint = this.§_-H2D§.world.CreateJoint(_loc4_) as b2RevoluteJoint;
         this.§_-p1H§.visible = true;
         this.view.visible = false;
         this.§_-k2P§ = false;
      }
      
      private function §_-x24§() : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         if(!this.joint)
         {
            return;
         }
         this.§_-H2D§.world.DestroyJoint(this.joint);
         this.joint = null;
         this.§_-p1H§.visible = false;
         this.view.visible = true;
      }
      
      private function infect(param1:Hero, param2:Boolean = false) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         if(param1.§_-h1n§)
         {
            return;
         }
         if(!this.active)
         {
            return;
         }
         if(param1.game is §_-Ar§ && !param2)
         {
            if(!this.§_-42S§)
            {
               Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"Gummed":[this.id,param1.id,this.playerId]}));
               if(this.playerId == Game.selfId)
               {
                  Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-T1A§,1);
               }
            }
            this.§_-42S§ = true;
            return;
         }
         param1.§_-h1n§ = true;
         this.active = false;
         if(param1.isSelf)
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!this.active)
         {
            return;
         }
         var _loc2_:Object = param1[1];
         if(!("Gummed" in _loc2_))
         {
            return;
         }
         if(_loc2_["Gummed"][0] != this.id)
         {
            return;
         }
         this.infect(this.§_-H2D§.squirrels.get(_loc2_["Gummed"][1]),true);
         if(_loc2_["Gummed"][2] == Game.selfId)
         {
            Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-T1A§,1);
         }
      }
      
      private function §_-cN§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.§_-H2D§.world.RemoveController(this.controller);
         this.controller.Clear();
         this.controller = null;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
   }
}


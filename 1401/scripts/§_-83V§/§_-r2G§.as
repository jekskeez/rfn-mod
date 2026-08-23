package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import flash.filters.GlowFilter;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-FD§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-r2G§ extends GameBody implements §_-22J§, §_-FD§
   {
      
      private static const §_-31P§:int = 2;
      
      private static const §_-j1b§:int = 7;
      
      private static const §_-p2O§:Number = 5;
      
      private static const §_-gb§:Number = 3;
      
      private static const filter:GlowFilter = new GlowFilter(16724787,1,6,6,2,1,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(32 / Game.§_-x2P§);
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,0.5,§_-V§.§_-9H§,§_-V§.§_-j1I§ | §_-V§.§_-9H§,0);
      
      private static const SHAPE2:b2CircleShape = new b2CircleShape(32 / Game.§_-x2P§);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,100,0.1,1,§_-V§.§_-31M§,§_-V§.§_-qV§,0);
      
      private var view:§_-h2I§ = null;
      
      private var §_-RH§:b2Body = null;
      
      private var joint:b2RevoluteJoint = null;
      
      private var timeUpdate:Number;
      
      public var motorSpeed:Number = 0;
      
      public function §_-r2G§()
      {
         super();
         this.motorSpeed = §_-31P§;
         this.timeUpdate = §_-gb§;
         this.view = new §_-h2I§(new BalanceWheelImg());
         this.view.§_-x2x§();
         §_-83v§(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.motorSpeed = Math.min(this.motorSpeed + param1 * (§_-j1b§ - §_-31P§) / §_-p2O§,§_-j1b§);
         if(this.joint)
         {
            this.joint.SetMotorSpeed(this.motorSpeed);
         }
         if(Boolean(this.§_-RH§) && Boolean(this.view))
         {
            this.view.rotation = this.§_-RH§.GetAngle() * Game.R2D;
         }
         if(this.personalId != Game.selfId)
         {
            return;
         }
         this.timeUpdate -= param1;
         if(this.timeUpdate > 0)
         {
            return;
         }
         this.timeUpdate = §_-gb§;
         Connection.§_-Li§(§_-h2B§.§_-D1s§,§_-h2B§.§_-T2p§,[this.id,this.position.x,this.position.y,this.angle,this.linearVelocity.x,this.linearVelocity.y,this.angularVelocity]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.filters = this.personalId == Game.selfId ? [filter] : [];
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         super.build(param1);
         this.§_-RH§ = param1.CreateBody(§_-E2n§);
         this.§_-RH§.CreateFixture(FIXTURE_DEF1);
         this.§_-RH§.SetPositionAndAngle(this.position,this.angle);
         this.body.SetFixedRotation(true);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.Initialize(this.body,this.§_-RH§,this.§_-RH§.GetWorldCenter());
         _loc2_.collideConnected = false;
         _loc2_.enableMotor = true;
         _loc2_.motorSpeed = this.motorSpeed;
         _loc2_.maxMotorTorque = 100000000;
         this.joint = this.body.GetWorld().CreateJoint(_loc2_) as b2RevoluteJoint;
      }
      
      override public function dispose() : void
      {
         var _loc1_:b2Fixture = null;
         if(this.joint)
         {
            this.body.GetWorld().DestroyJoint(this.joint);
            this.joint = null;
         }
         if(this.§_-RH§)
         {
            _loc1_ = this.§_-RH§.GetFixtureList();
            while(_loc1_)
            {
               _loc1_.SetUserData(null);
               _loc1_ = _loc1_.GetNext();
            }
            this.§_-RH§.SetUserData(null);
            this.§_-RH§.GetWorld().DestroyBody(this.§_-RH§);
            this.§_-RH§ = null;
         }
         this.view = null;
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
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(!param2)
         {
         }
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc3_ == this)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ is §_-r2G§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
   }
}


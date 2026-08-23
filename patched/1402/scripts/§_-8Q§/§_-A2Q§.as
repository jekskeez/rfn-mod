package §_-8Q§
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
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import flash.filters.GlowFilter;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-L1q§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-A2Q§ extends GameBody implements §_-Pn§, §_-L1q§
   {
      
      private static const §_-33m§:int = 2;
      
      private static const §_-43L§:int = 7;
      
      private static const §_-17§:Number = 5;
      
      private static const §_-v1t§:Number = 3;
      
      private static const filter:GlowFilter = new GlowFilter(16724787,1,6,6,2,1,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(32 / Game.§_-12A§);
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,0.5,§_-q2c§.§_-Dx§,§_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§,0);
      
      private static const SHAPE2:b2CircleShape = new b2CircleShape(32 / Game.§_-12A§);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,100,0.1,1,§_-q2c§.§_-ti§,§_-q2c§.§_-rT§,0);
      
      private var view:§_-aS§ = null;
      
      private var §_-I2d§:b2Body = null;
      
      private var joint:b2RevoluteJoint = null;
      
      private var timeUpdate:Number;
      
      public var motorSpeed:Number = 0;
      
      public function §_-A2Q§()
      {
         super();
         this.motorSpeed = §_-33m§;
         this.timeUpdate = §_-v1t§;
         this.view = new §_-aS§(new BalanceWheelImg());
         this.view.§_-i18§();
         §_-J2J§(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.motorSpeed = Math.min(this.motorSpeed + param1 * (§_-43L§ - §_-33m§) / §_-17§,§_-43L§);
         if(this.joint)
         {
            this.joint.SetMotorSpeed(this.motorSpeed);
         }
         if(Boolean(this.§_-I2d§) && Boolean(this.view))
         {
            this.view.rotation = this.§_-I2d§.GetAngle() * Game.R2D;
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
         this.timeUpdate = §_-v1t§;
         Connection.§_-e2T§(§_-u1O§.§_-gm§,§_-u1O§.§_-W2l§,[this.id,this.position.x,this.position.y,this.angle,this.linearVelocity.x,this.linearVelocity.y,this.angularVelocity]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.filters = this.personalId == Game.selfId ? [filter] : [];
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         super.build(param1);
         this.§_-I2d§ = param1.CreateBody(§_-41z§);
         this.§_-I2d§.CreateFixture(FIXTURE_DEF1);
         this.§_-I2d§.SetPositionAndAngle(this.position,this.angle);
         this.body.SetFixedRotation(true);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.Initialize(this.body,this.§_-I2d§,this.§_-I2d§.GetWorldCenter());
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
         if(this.§_-I2d§)
         {
            _loc1_ = this.§_-I2d§.GetFixtureList();
            while(_loc1_)
            {
               _loc1_.SetUserData(null);
               _loc1_ = _loc1_.GetNext();
            }
            this.§_-I2d§.SetUserData(null);
            this.§_-I2d§.GetWorld().DestroyBody(this.§_-I2d§);
            this.§_-I2d§ = null;
         }
         this.view = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
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
         if(_loc3_ is §_-A2Q§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
   }
}


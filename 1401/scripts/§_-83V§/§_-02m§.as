package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-Rj§.§_-A32§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-02m§ extends GameBody implements §_-Q2k§, §_-s2K§
   {
      
      private static const §_-52X§:uint = 8;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§;
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(25 / Game.§_-x2P§);
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,0.5,§_-52X§,§_-FN§,0);
      
      private static const SHAPE2:b2CircleShape = new b2CircleShape(10 / Game.§_-x2P§);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.2,0.1,1,§_-52X§,§_-V§.§_-j1I§,0);
      
      private var §_-RH§:b2Body = null;
      
      private var joint:b2RevoluteJoint = null;
      
      private var §_-i2J§:b2RevoluteJoint = null;
      
      private var §_-tD§:int = -1;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 30000;
      
      private var §_-01O§:Boolean = false;
      
      public var hero:Hero = null;
      
      public var §_-hy§:b2Vec2 = null;
      
      public var motorSpeed:Number = 10;
      
      public function §_-02m§()
      {
         super();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:b2Vec2 = null;
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         this.fixedRotation = true;
         super.build(param1);
         this.§_-RH§ = param1.CreateBody(§_-E2n§);
         this.§_-RH§.CreateFixture(FIXTURE_DEF1);
         this.§_-RH§.SetPositionAndAngle(this.position,this.angle);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.Initialize(this.body,this.§_-RH§,this.body.GetWorldCenter());
         _loc2_.collideConnected = false;
         _loc2_.enableMotor = true;
         _loc2_.motorSpeed = this.motorSpeed;
         _loc2_.maxMotorTorque = 100000000;
         this.joint = this.body.GetWorld().CreateJoint(_loc2_) as b2RevoluteJoint;
         if(this.§_-tD§ != -1)
         {
            this.pinSquirrel(this.§_-tD§);
         }
         else if(this.hero)
         {
            this.pinSquirrel(this.hero.id);
         }
         if(this.§_-hy§ != null)
         {
            _loc3_ = this.§_-hy§.Copy();
            _loc3_.Multiply(1000);
            this.§_-RH§.ApplyImpulse(_loc3_,this.§_-RH§.GetWorldCenter());
            this.§_-hy§ = null;
            this.motorSpeed = Math.abs(this.motorSpeed) * (_loc3_.x > 0 ? 1 : -1);
            this.joint.SetMotorSpeed(this.motorSpeed);
         }
         if(!(this.hero && this.hero.isSelf))
         {
            return;
         }
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
      }
      
      override public function dispose() : void
      {
         var _loc1_:b2Fixture = null;
         this.§_-L1Z§();
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
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         var _loc2_:Array = [this.lifeTime,this.motorSpeed];
         _loc2_.push(this.§_-hy§ ? [this.§_-hy§.x,this.§_-hy§.y] : null);
         if(this.hero != null)
         {
            _loc2_.push(this.hero.id);
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1[1];
         this.lifeTime = _loc2_[0];
         this.motorSpeed = _loc2_[1];
         this.§_-hy§ = _loc2_[2] != null ? new b2Vec2(_loc2_[2][0],_loc2_[2][1]) : null;
         if(3 in _loc2_)
         {
            this.§_-tD§ = _loc2_[3];
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            if(!this.aging || this.§_-01O§)
            {
               return;
            }
            this.§_-C2o§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-b16§();
            }
         }
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("centrifugeDisc"))
         {
            return;
         }
         this.hero = _loc2_;
         this.hero.changeView(new CentrifugeHero());
         this.hero.isStopped = true;
         this.hero.perksAvailable = false;
         _loc2_.perkController.§_-vg§();
         _loc2_.perkController.§_-m2W§();
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-Y1J§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-tl§,this.§_-jf§);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.§_-RH§;
         _loc2_.§_-K18§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-i2J§ = this.body.GetWorld().CreateJoint(_loc3_) as b2RevoluteJoint;
         this.§_-i2J§.SetUserData("centrifugeDisc");
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-L1Z§();
         setTimeout(this.§_-b16§,0);
      }
      
      private function §_-L1Z§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
         this.hero.isStopped = false;
         this.hero.perksAvailable = true;
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
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(Game.chat.hasFocus())
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.LEFT:
            case Keyboard.A:
               if(this.motorSpeed < 0)
               {
                  return;
               }
               this.§_-T0§();
               break;
            case Keyboard.RIGHT:
            case Keyboard.D:
               if(this.motorSpeed > 0)
               {
                  return;
               }
               this.§_-T0§();
         }
      }
      
      private function §_-T0§() : void
      {
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.switchDirection(this.position);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"switchDirection":[this.id,[this.position.x,this.position.y]]}));
         }
      }
      
      private function switchDirection(param1:b2Vec2) : void
      {
         this.position = param1;
         this.§_-RH§.SetLinearVelocity(new b2Vec2(-this.§_-RH§.GetLinearVelocity().x,this.§_-RH§.GetLinearVelocity().y));
         this.joint.SetMotorSpeed(this.joint.GetMotorSpeed() * -1);
         this.motorSpeed = this.joint.GetMotorSpeed();
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("switchDirection" in _loc2_)
         {
            if(_loc2_["switchDirection"][0] != this.id)
            {
               return;
            }
            this.switchDirection(new b2Vec2(_loc2_["switchDirection"][1][0],_loc2_["switchDirection"][1][1]));
         }
      }
   }
}


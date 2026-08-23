package §_-8Q§
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
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-NA§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-t2d§ extends GameBody implements §_-71b§, §_-NA§
   {
      
      private static const §_-53X§:uint = 8;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§;
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(25 / Game.§_-12A§);
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const SHAPE2:b2CircleShape = new b2CircleShape(10 / Game.§_-12A§);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.2,0.1,1,§_-53X§,§_-q2c§.§_-wI§,0);
      
      private var §_-I2d§:b2Body = null;
      
      private var joint:b2RevoluteJoint = null;
      
      private var §_-C1I§:b2RevoluteJoint = null;
      
      private var §_-ua§:int = -1;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 30000;
      
      private var §_-C1L§:Boolean = false;
      
      public var hero:Hero = null;
      
      public var §_-n2a§:b2Vec2 = null;
      
      public var motorSpeed:Number = 10;
      
      public function §_-t2d§()
      {
         super();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:b2Vec2 = null;
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         this.fixedRotation = true;
         super.build(param1);
         this.§_-I2d§ = param1.CreateBody(§_-41z§);
         this.§_-I2d§.CreateFixture(FIXTURE_DEF1);
         this.§_-I2d§.SetPositionAndAngle(this.position,this.angle);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.Initialize(this.body,this.§_-I2d§,this.body.GetWorldCenter());
         _loc2_.collideConnected = false;
         _loc2_.enableMotor = true;
         _loc2_.motorSpeed = this.motorSpeed;
         _loc2_.maxMotorTorque = 100000000;
         this.joint = this.body.GetWorld().CreateJoint(_loc2_) as b2RevoluteJoint;
         if(this.§_-ua§ != -1)
         {
            this.pinSquirrel(this.§_-ua§);
         }
         else if(this.hero)
         {
            this.pinSquirrel(this.hero.id);
         }
         if(this.§_-n2a§ != null)
         {
            _loc3_ = this.§_-n2a§.Copy();
            _loc3_.Multiply(1000);
            this.§_-I2d§.ApplyImpulse(_loc3_,this.§_-I2d§.GetWorldCenter());
            this.§_-n2a§ = null;
            this.motorSpeed = Math.abs(this.motorSpeed) * (_loc3_.x > 0 ? 1 : -1);
            this.joint.SetMotorSpeed(this.motorSpeed);
         }
         if(!(this.hero && this.hero.isSelf))
         {
            return;
         }
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
      }
      
      override public function dispose() : void
      {
         var _loc1_:b2Fixture = null;
         this.§_-V14§();
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
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         var _loc2_:Array = [this.lifeTime,this.motorSpeed];
         _loc2_.push(this.§_-n2a§ ? [this.§_-n2a§.x,this.§_-n2a§.y] : null);
         if(this.hero != null)
         {
            _loc2_.push(this.hero.id);
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1[1];
         this.lifeTime = _loc2_[0];
         this.motorSpeed = _loc2_[1];
         this.§_-n2a§ = _loc2_[2] != null ? new b2Vec2(_loc2_[2][0],_loc2_[2][1]) : null;
         if(3 in _loc2_)
         {
            this.§_-ua§ = _loc2_[3];
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            if(!this.aging || this.§_-C1L§)
            {
               return;
            }
            this.§_-Q26§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-th§();
            }
         }
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("centrifugeDisc"))
         {
            return;
         }
         this.hero = _loc2_;
         this.hero.changeView(new CentrifugeHero());
         this.hero.isStopped = true;
         this.hero.perksAvailable = false;
         _loc2_.perkController.§_-F1U§();
         _loc2_.perkController.§_-2O§();
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-y2S§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-K1I§,this.§_-A1R§);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.§_-I2d§;
         _loc2_.§_-ZW§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-C1I§ = this.body.GetWorld().CreateJoint(_loc3_) as b2RevoluteJoint;
         this.§_-C1I§.SetUserData("centrifugeDisc");
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-V14§();
         setTimeout(this.§_-th§,0);
      }
      
      private function §_-V14§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
         this.hero.isStopped = false;
         this.hero.perksAvailable = true;
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
      
      private function §_-73S§(param1:KeyboardEvent) : void
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
               this.§_-r1l§();
               break;
            case Keyboard.RIGHT:
            case Keyboard.D:
               if(this.motorSpeed > 0)
               {
                  return;
               }
               this.§_-r1l§();
         }
      }
      
      private function §_-r1l§() : void
      {
         if(!this.hero || !this.hero.isSelf)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.switchDirection(this.position);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"switchDirection":[this.id,[this.position.x,this.position.y]]}));
         }
      }
      
      private function switchDirection(param1:b2Vec2) : void
      {
         this.position = param1;
         this.§_-I2d§.SetLinearVelocity(new b2Vec2(-this.§_-I2d§.GetLinearVelocity().x,this.§_-I2d§.GetLinearVelocity().y));
         this.joint.SetMotorSpeed(this.joint.GetMotorSpeed() * -1);
         this.motorSpeed = this.joint.GetMotorSpeed();
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
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


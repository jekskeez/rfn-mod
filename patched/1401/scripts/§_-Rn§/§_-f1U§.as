package §_-Rn§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-637§.§_-J14§;
   import §_-83V§.GameBody;
   import §_-B1O§.ClickButton;
   import §_-B1O§.§_-W2U§;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.filters.GlowFilter;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-s2K§;
   import utils.§_-41A§;
   import utils.§_-X2Z§;
   
   public class §_-f1U§ extends §_-h2I§ implements §_-63Q§, §_-C2x§, §_-I2G§, §_-03u§, §_-Tm§, §_-J14§
   {
      
      private static const §_-N1H§:GlowFilter = new GlowFilter(10679079,1,2,2,5);
      
      public var world:b2World = null;
      
      public var flipFlop:Boolean;
      
      protected var joint:b2RevoluteJoint = null;
      
      protected var §_-t1E§:GameBody = null;
      
      protected var §_-m1I§:Boolean = false;
      
      private var §_-G1q§:Boolean;
      
      private var §_-J2F§:Number = 0;
      
      private var §_-22Y§:Number = 0;
      
      private var §_-G1p§:Boolean;
      
      private var §_-pi§:Boolean;
      
      private var §_-db§:Number = 0;
      
      private var §_-u20§:Number = 0;
      
      private var §_-B10§:Array = null;
      
      private var §_-N2y§:§_-h2I§ = new §_-h2I§(new JointDot());
      
      private var §_-b15§:§_-h2I§ = new §_-h2I§(new PinLimited());
      
      private var §_-424§:§_-h2I§ = new §_-h2I§(new PinUnlimited());
      
      private var §_-Oo§:§_-h2I§ = new §_-h2I§(new MotorIcon());
      
      private var §_-f1B§:b2RevoluteJointDef = null;
      
      private var §_-c1T§:int = -1;
      
      private var §_-q16§:int = -1;
      
      private var §_-re§:GameBody = null;
      
      private var §_-E1p§:b2Vec2 = null;
      
      private var §_-b24§:Number = 0;
      
      public function §_-f1U§()
      {
         super();
         this.§_-b15§.x = -this.§_-b15§.width * 0.5;
         this.§_-b15§.y = -this.§_-b15§.height * 0.5;
         §_-83v§(this.§_-b15§);
         this.§_-424§.x = -this.§_-424§.width * 0.5;
         this.§_-424§.y = -this.§_-424§.height * 0.5;
         §_-83v§(this.§_-424§);
         this.§_-N2y§.x = -this.§_-N2y§.width * 0.5;
         this.§_-N2y§.y = -this.§_-N2y§.height * 0.5;
         §_-83v§(this.§_-N2y§);
         this.§_-Oo§.§_-x2x§();
         this.§_-Oo§.y = 2;
         this.§_-Oo§.x = 2;
         §_-83v§(this.§_-Oo§);
         this.toWorld = false;
         this.limited = false;
         this.motorEnabled = false;
         this.§_-f1B§ = new b2RevoluteJointDef();
         this.§_-f1B§.localAnchorA = null;
         this.§_-f1B§.localAnchorB = null;
      }
      
      public function set body(param1:GameBody) : void
      {
         if(this.parentStarling != null && Boolean(this.§_-t1E§))
         {
            this.parentStarling.removeChildStarling(this,false);
         }
         this.§_-t1E§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.§_-83v§(this);
      }
      
      public function get body() : GameBody
      {
         return this.§_-t1E§;
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      public function set toWorld(param1:Boolean) : void
      {
         this.§_-G1q§ = param1;
         this.§_-N2y§.visible = !param1;
      }
      
      public function get toWorld() : Boolean
      {
         return this.§_-G1q§;
      }
      
      public function set limited(param1:Boolean) : void
      {
         this.§_-pi§ = param1;
         this.§_-b15§.visible = param1;
         this.§_-424§.visible = !param1;
         this.§_-q1r§();
      }
      
      public function get limited() : Boolean
      {
         return this.§_-pi§;
      }
      
      public function get maxLimit() : Number
      {
         return this.§_-db§;
      }
      
      public function set maxLimit(param1:Number) : void
      {
         this.§_-db§ = param1;
         this.§_-q1r§();
      }
      
      public function get minLimit() : Number
      {
         return this.§_-u20§;
      }
      
      public function set minLimit(param1:Number) : void
      {
         this.§_-u20§ = param1;
         this.§_-q1r§();
      }
      
      public function set motorSpeed(param1:Number) : void
      {
         this.§_-J2F§ = param1;
         this.§_-Oo§.scaleX = -param1 / Math.abs(param1);
         this.§_-Oo§.§_-x2x§();
         this.§_-Oo§.x = 2 * (this.§_-Oo§.scaleX > 0 ? 1 : -1);
         this.§_-A3Y§();
      }
      
      public function get motorSpeed() : Number
      {
         return this.§_-J2F§;
      }
      
      public function set motorTorque(param1:Number) : void
      {
         this.§_-22Y§ = param1;
         this.§_-A3Y§();
      }
      
      public function get motorTorque() : Number
      {
         return this.§_-22Y§;
      }
      
      public function set motorEnabled(param1:Boolean) : void
      {
         this.§_-G1p§ = param1;
         this.§_-Oo§.visible = param1;
         this.§_-A3Y§();
      }
      
      public function get motorEnabled() : Boolean
      {
         return this.§_-G1p§;
      }
      
      public function build(param1:b2World) : void
      {
         this.world = param1;
         this.§_-m1I§ = true;
         var _loc2_:b2Vec2 = this.§_-t2c§;
         this.§_-23U§ = this.§_-23U§ ? this.§_-23U§ : (this.world.userData as SquirrelGame).map.getObject(this.§_-q16§) as GameBody;
         this.body = this.body ? this.body : (this.world.userData as SquirrelGame).map.getObject(this.§_-c1T§) as GameBody;
         if(this.body == null)
         {
            this.§_-rX§(param1,_loc2_);
         }
         if(this.§_-23U§ == null && !this.toWorld)
         {
            this.§_-s0§(param1,_loc2_);
         }
         this.§_-z2n§();
         if(this.body == null || this.§_-23U§ == null && !this.toWorld)
         {
            this.visible = false;
            return;
         }
         if(!this.toWorld && this.limited && this.body.fixedRotation && this.§_-23U§.fixedRotation)
         {
            this.body.fixedRotation = false;
         }
         if(this.§_-f1B§.localAnchorA != null)
         {
            this.§_-f1B§.bodyA = this.body.body;
            this.§_-f1B§.bodyB = this.toWorld ? param1.GetGroundBody() : this.§_-23U§.body;
         }
         else
         {
            this.§_-f1B§.Initialize(this.body.body,this.toWorld ? param1.GetGroundBody() : this.§_-23U§.body,_loc2_);
         }
         this.§_-f1B§.collideConnected = false;
         this.§_-f1B§.userData = this;
         this.position = this.§_-f1B§.localAnchorA;
         this.joint = param1.CreateJoint(this.§_-f1B§) as b2RevoluteJoint;
         this.visible = this.joint != null && !(this.§_-23U§ is §_-W2U§ || this.§_-23U§ is ClickButton || this.body is §_-W2U§ || this.body is ClickButton);
         this.§_-q1r§();
         this.§_-A3Y§();
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:Array = [this.position.x,this.position.y];
         _loc1_.push([this.motorEnabled,this.motorSpeed,this.motorTorque,this.limited,this.maxLimit,this.minLimit,this.flipFlop]);
         if(this.§_-f1B§.localAnchorA != null)
         {
            _loc1_.push([this.body.id,[this.§_-f1B§.localAnchorA.x,this.§_-f1B§.localAnchorA.y],this.§_-23U§ ? this.§_-23U§.id : -1,[this.§_-f1B§.localAnchorB.x,this.§_-f1B§.localAnchorB.y],this.§_-f1B§.referenceAngle,this.motorEnabled]);
         }
         return _loc1_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0],param1[1]);
         if(!(2 in param1))
         {
            return;
         }
         this.motorEnabled = Boolean(param1[2][0]);
         this.motorSpeed = param1[2][1];
         this.motorTorque = param1[2][2];
         this.limited = Boolean(param1[2][3]);
         this.maxLimit = param1[2][4];
         this.minLimit = param1[2][5];
         this.flipFlop = Boolean(param1[2][6]);
         this.§_-f1B§ = new b2RevoluteJointDef();
         this.§_-f1B§.localAnchorA = null;
         if(!(3 in param1))
         {
            return;
         }
         this.§_-c1T§ = param1[3][0];
         this.§_-f1B§.localAnchorA = new b2Vec2(param1[3][1][0],param1[3][1][1]);
         this.§_-q16§ = param1[3][2];
         this.§_-f1B§.localAnchorB = new b2Vec2(param1[3][3][0],param1[3][3][1]);
         this.§_-f1B§.referenceAngle = param1[3][4];
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      public function dispose() : void
      {
         this.§_-z2n§();
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.§_-23U§ = null;
         this.body = null;
         if(this.joint == null)
         {
            return;
         }
         this.joint.SetUserData(null);
         this.world.DestroyJoint(this.joint);
         this.joint = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:b2Vec2 = null;
         if(this.joint == null && this.body != null && !this.toWorld && !this.§_-m1I§)
         {
            _loc2_ = §_-41A§.GetWorldPoint(this.body,this.position);
            this.§_-s0§(this.world,_loc2_);
            if(Boolean(this.§_-23U§) && Boolean(this.§_-23U§.body))
            {
               this.§_-m2V§ = this.§_-23U§.body.GetLocalPoint(_loc2_);
               this.§_-b24§ = this.§_-23U§.angle - this.body.angle;
            }
         }
         if(!this.flipFlop || this.joint == null)
         {
            return;
         }
         if(this.joint.GetJointAngle() > this.joint.GetUpperLimit())
         {
            this.joint.SetMotorSpeed(-Math.abs(this.joint.GetMotorSpeed()));
         }
         if(this.joint.GetJointAngle() < this.joint.GetLowerLimit())
         {
            this.joint.SetMotorSpeed(Math.abs(this.joint.GetMotorSpeed()));
         }
      }
      
      public function set game(param1:SquirrelGame) : void
      {
      }
      
      public function §_-qB§() : void
      {
         if(this.§_-23U§ == null || this.§_-23U§.body == null || this.§_-f1B§ == null)
         {
            return;
         }
         this.§_-f1B§.localAnchorA = this.position;
         this.§_-f1B§.localAnchorB = this.§_-23U§.body.GetLocalPoint(this.§_-t2c§);
         this.§_-f1B§.referenceAngle = this.§_-23U§.angle - this.body.angle;
      }
      
      public function §_-PS§() : void
      {
      }
      
      public function §_-23§() : void
      {
      }
      
      public function get §_-m2V§() : b2Vec2
      {
         return this.§_-E1p§;
      }
      
      public function set §_-m2V§(param1:b2Vec2) : void
      {
         this.§_-E1p§ = param1;
      }
      
      public function get §_-23U§() : GameBody
      {
         return this.§_-re§;
      }
      
      public function set §_-23U§(param1:GameBody) : void
      {
         if(this.§_-re§ == param1)
         {
            return;
         }
         this.§_-z2n§();
         this.§_-re§ = param1;
         if(this.§_-re§ == null)
         {
            return;
         }
         this.§_-re§.filters = this.§_-re§.filters.concat([§_-N1H§]);
      }
      
      private function §_-A3Y§() : void
      {
         if(this.joint == null)
         {
            return;
         }
         this.joint.EnableMotor(this.motorTorque != 0 && this.motorEnabled);
         this.joint.SetMotorSpeed(this.motorSpeed);
         this.joint.SetMaxMotorTorque(this.motorTorque);
      }
      
      private function §_-rX§(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-B10§ = [];
         param1.QueryPoint(this.§_-wT§,param2);
         this.body = §_-X2Z§.§_-C16§(this.§_-B10§,this.parentStarling.getChildStarlingIndex(this)) as GameBody;
         this.§_-B10§ = null;
      }
      
      private function §_-wT§(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.§_-23U§)
         {
            this.§_-B10§.push(_loc2_.GetUserData());
         }
         return true;
      }
      
      private function §_-s0§(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-B10§ = [];
         param1.QueryPoint(this.§_-et§,param2);
         if(Boolean(this.parentStarling) && Boolean(this.parentStarling.parentStarling) && this.parentStarling.parentStarling is Cast)
         {
            this.§_-23U§ = §_-X2Z§.§_-C16§(this.§_-B10§) as GameBody;
         }
         else
         {
            this.§_-23U§ = §_-X2Z§.§_-C16§(this.§_-B10§,(this.body == null ? this.parentStarling : this.body.parentStarling).getChildStarlingIndex(this.body == null ? this : this.parentStarling)) as GameBody;
         }
         this.§_-B10§ = null;
      }
      
      private function §_-et§(param1:b2Fixture) : Boolean
      {
         var _loc2_:* = param1.GetBody().GetUserData();
         if(_loc2_ is GameBody && !(_loc2_ is §_-s2K§) && _loc2_ != this.body)
         {
            this.§_-B10§.push(_loc2_);
         }
         return true;
      }
      
      private function get §_-t2c§() : b2Vec2
      {
         if(this.body == null)
         {
            return this.position;
         }
         return §_-41A§.GetWorldPoint(this.body,this.position);
      }
      
      private function §_-q1r§() : void
      {
         if(this.joint == null)
         {
            return;
         }
         this.joint.EnableLimit(this.limited);
         this.joint.SetLimits(this.minLimit,this.maxLimit);
      }
      
      private function §_-z2n§() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = undefined;
         if(this.§_-re§ != null)
         {
            _loc1_ = this.§_-re§.filters;
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_ is GlowFilter && (_loc2_ as GlowFilter).color == §_-N1H§.color)
               {
                  _loc1_.splice(_loc1_.indexOf(_loc2_),1);
               }
            }
            this.§_-re§.filters = _loc1_;
         }
      }
   }
}


package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2RevoluteJoint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-F5§.§_-Q1r§;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-j2H§.ClickButton;
   import §_-j2H§.§_-01P§;
   import flash.filters.GlowFilter;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-NA§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-11I§;
   import utils.§_-H1o§;
   
   public class §_-X1G§ extends §_-aS§ implements §_-xn§, §_-l2r§, §_-U1I§, §_-3l§, §_-F1c§, §_-Q1r§
   {
      
      private static const §_-qh§:GlowFilter = new GlowFilter(10679079,1,2,2,5);
      
      public var world:b2World = null;
      
      public var flipFlop:Boolean;
      
      protected var joint:b2RevoluteJoint = null;
      
      protected var §_-dY§:GameBody = null;
      
      protected var §_-32u§:Boolean = false;
      
      private var §_-Q2K§:Boolean;
      
      private var §_-e1y§:Number = 0;
      
      private var §_-J12§:Number = 0;
      
      private var §_-J2C§:Boolean;
      
      private var §_-yR§:Boolean;
      
      private var §_-V2d§:Number = 0;
      
      private var §_-H2b§:Number = 0;
      
      private var §_-up§:Array = null;
      
      private var §_-S2g§:§_-aS§ = new §_-aS§(new JointDot());
      
      private var §_-H2P§:§_-aS§ = new §_-aS§(new PinLimited());
      
      private var §_-dk§:§_-aS§ = new §_-aS§(new PinUnlimited());
      
      private var §_-W1c§:§_-aS§ = new §_-aS§(new MotorIcon());
      
      private var §_-cJ§:b2RevoluteJointDef = null;
      
      private var §_-h2v§:int = -1;
      
      private var §_-83i§:int = -1;
      
      private var §_-F1l§:GameBody = null;
      
      private var §_-92p§:b2Vec2 = null;
      
      private var §_-P2f§:Number = 0;
      
      public function §_-X1G§()
      {
         super();
         this.§_-H2P§.x = -this.§_-H2P§.width * 0.5;
         this.§_-H2P§.y = -this.§_-H2P§.height * 0.5;
         §_-J2J§(this.§_-H2P§);
         this.§_-dk§.x = -this.§_-dk§.width * 0.5;
         this.§_-dk§.y = -this.§_-dk§.height * 0.5;
         §_-J2J§(this.§_-dk§);
         this.§_-S2g§.x = -this.§_-S2g§.width * 0.5;
         this.§_-S2g§.y = -this.§_-S2g§.height * 0.5;
         §_-J2J§(this.§_-S2g§);
         this.§_-W1c§.§_-i18§();
         this.§_-W1c§.y = 2;
         this.§_-W1c§.x = 2;
         §_-J2J§(this.§_-W1c§);
         this.toWorld = false;
         this.limited = false;
         this.motorEnabled = false;
         this.§_-cJ§ = new b2RevoluteJointDef();
         this.§_-cJ§.localAnchorA = null;
         this.§_-cJ§.localAnchorB = null;
      }
      
      public function set body(param1:GameBody) : void
      {
         if(this.parentStarling != null && Boolean(this.§_-dY§))
         {
            this.parentStarling.removeChildStarling(this,false);
         }
         this.§_-dY§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.§_-J2J§(this);
      }
      
      public function get body() : GameBody
      {
         return this.§_-dY§;
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function set toWorld(param1:Boolean) : void
      {
         this.§_-Q2K§ = param1;
         this.§_-S2g§.visible = !param1;
      }
      
      public function get toWorld() : Boolean
      {
         return this.§_-Q2K§;
      }
      
      public function set limited(param1:Boolean) : void
      {
         this.§_-yR§ = param1;
         this.§_-H2P§.visible = param1;
         this.§_-dk§.visible = !param1;
         this.§_-A2c§();
      }
      
      public function get limited() : Boolean
      {
         return this.§_-yR§;
      }
      
      public function get maxLimit() : Number
      {
         return this.§_-V2d§;
      }
      
      public function set maxLimit(param1:Number) : void
      {
         this.§_-V2d§ = param1;
         this.§_-A2c§();
      }
      
      public function get minLimit() : Number
      {
         return this.§_-H2b§;
      }
      
      public function set minLimit(param1:Number) : void
      {
         this.§_-H2b§ = param1;
         this.§_-A2c§();
      }
      
      public function set motorSpeed(param1:Number) : void
      {
         this.§_-e1y§ = param1;
         this.§_-W1c§.scaleX = -param1 / Math.abs(param1);
         this.§_-W1c§.§_-i18§();
         this.§_-W1c§.x = 2 * (this.§_-W1c§.scaleX > 0 ? 1 : -1);
         this.§_-tf§();
      }
      
      public function get motorSpeed() : Number
      {
         return this.§_-e1y§;
      }
      
      public function set motorTorque(param1:Number) : void
      {
         this.§_-J12§ = param1;
         this.§_-tf§();
      }
      
      public function get motorTorque() : Number
      {
         return this.§_-J12§;
      }
      
      public function set motorEnabled(param1:Boolean) : void
      {
         this.§_-J2C§ = param1;
         this.§_-W1c§.visible = param1;
         this.§_-tf§();
      }
      
      public function get motorEnabled() : Boolean
      {
         return this.§_-J2C§;
      }
      
      public function build(param1:b2World) : void
      {
         this.world = param1;
         this.§_-32u§ = true;
         var _loc2_:b2Vec2 = this.§_-B3G§;
         this.§_-22h§ = this.§_-22h§ ? this.§_-22h§ : (this.world.userData as SquirrelGame).map.getObject(this.§_-83i§) as GameBody;
         this.body = this.body ? this.body : (this.world.userData as SquirrelGame).map.getObject(this.§_-h2v§) as GameBody;
         if(this.body == null)
         {
            this.§_-T1S§(param1,_loc2_);
         }
         if(this.§_-22h§ == null && !this.toWorld)
         {
            this.§_-J1R§(param1,_loc2_);
         }
         this.§_-q25§();
         if(this.body == null || this.§_-22h§ == null && !this.toWorld)
         {
            this.visible = false;
            return;
         }
         if(!this.toWorld && this.limited && this.body.fixedRotation && this.§_-22h§.fixedRotation)
         {
            this.body.fixedRotation = false;
         }
         if(this.§_-cJ§.localAnchorA != null)
         {
            this.§_-cJ§.bodyA = this.body.body;
            this.§_-cJ§.bodyB = this.toWorld ? param1.GetGroundBody() : this.§_-22h§.body;
         }
         else
         {
            this.§_-cJ§.Initialize(this.body.body,this.toWorld ? param1.GetGroundBody() : this.§_-22h§.body,_loc2_);
         }
         this.§_-cJ§.collideConnected = false;
         this.§_-cJ§.userData = this;
         this.position = this.§_-cJ§.localAnchorA;
         this.joint = param1.CreateJoint(this.§_-cJ§) as b2RevoluteJoint;
         this.visible = this.joint != null && !(this.§_-22h§ is §_-01P§ || this.§_-22h§ is ClickButton || this.body is §_-01P§ || this.body is ClickButton);
         this.§_-A2c§();
         this.§_-tf§();
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [this.position.x,this.position.y];
         _loc1_.push([this.motorEnabled,this.motorSpeed,this.motorTorque,this.limited,this.maxLimit,this.minLimit,this.flipFlop]);
         if(this.§_-cJ§.localAnchorA != null)
         {
            _loc1_.push([this.body.id,[this.§_-cJ§.localAnchorA.x,this.§_-cJ§.localAnchorA.y],this.§_-22h§ ? this.§_-22h§.id : -1,[this.§_-cJ§.localAnchorB.x,this.§_-cJ§.localAnchorB.y],this.§_-cJ§.referenceAngle,this.motorEnabled]);
         }
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
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
         this.§_-cJ§ = new b2RevoluteJointDef();
         this.§_-cJ§.localAnchorA = null;
         if(!(3 in param1))
         {
            return;
         }
         this.§_-h2v§ = param1[3][0];
         this.§_-cJ§.localAnchorA = new b2Vec2(param1[3][1][0],param1[3][1][1]);
         this.§_-83i§ = param1[3][2];
         this.§_-cJ§.localAnchorB = new b2Vec2(param1[3][3][0],param1[3][3][1]);
         this.§_-cJ§.referenceAngle = param1[3][4];
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
         this.§_-q25§();
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.§_-22h§ = null;
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
         if(this.joint == null && this.body != null && !this.toWorld && !this.§_-32u§)
         {
            _loc2_ = §_-11I§.GetWorldPoint(this.body,this.position);
            this.§_-J1R§(this.world,_loc2_);
            if(Boolean(this.§_-22h§) && Boolean(this.§_-22h§.body))
            {
               this.§_-B3K§ = this.§_-22h§.body.GetLocalPoint(_loc2_);
               this.§_-P2f§ = this.§_-22h§.angle - this.body.angle;
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
      
      public function §_-03o§() : void
      {
         if(this.§_-22h§ == null || this.§_-22h§.body == null || this.§_-cJ§ == null)
         {
            return;
         }
         this.§_-cJ§.localAnchorA = this.position;
         this.§_-cJ§.localAnchorB = this.§_-22h§.body.GetLocalPoint(this.§_-B3G§);
         this.§_-cJ§.referenceAngle = this.§_-22h§.angle - this.body.angle;
      }
      
      public function §_-t2Q§() : void
      {
      }
      
      public function §_-Va§() : void
      {
      }
      
      public function get §_-B3K§() : b2Vec2
      {
         return this.§_-92p§;
      }
      
      public function set §_-B3K§(param1:b2Vec2) : void
      {
         this.§_-92p§ = param1;
      }
      
      public function get §_-22h§() : GameBody
      {
         return this.§_-F1l§;
      }
      
      public function set §_-22h§(param1:GameBody) : void
      {
         if(this.§_-F1l§ == param1)
         {
            return;
         }
         this.§_-q25§();
         this.§_-F1l§ = param1;
         if(this.§_-F1l§ == null)
         {
            return;
         }
         this.§_-F1l§.filters = this.§_-F1l§.filters.concat([§_-qh§]);
      }
      
      private function §_-tf§() : void
      {
         if(this.joint == null)
         {
            return;
         }
         this.joint.EnableMotor(this.motorTorque != 0 && this.motorEnabled);
         this.joint.SetMotorSpeed(this.motorSpeed);
         this.joint.SetMaxMotorTorque(this.motorTorque);
      }
      
      private function §_-T1S§(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-up§ = [];
         param1.QueryPoint(this.§_-c1E§,param2);
         this.body = §_-H1o§.§_-XF§(this.§_-up§,this.parentStarling.getChildStarlingIndex(this)) as GameBody;
         this.§_-up§ = null;
      }
      
      private function §_-c1E§(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.§_-22h§)
         {
            this.§_-up§.push(_loc2_.GetUserData());
         }
         return true;
      }
      
      private function §_-J1R§(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-up§ = [];
         param1.QueryPoint(this.§_-G20§,param2);
         if(Boolean(this.parentStarling) && Boolean(this.parentStarling.parentStarling) && this.parentStarling.parentStarling is Cast)
         {
            this.§_-22h§ = §_-H1o§.§_-XF§(this.§_-up§) as GameBody;
         }
         else
         {
            this.§_-22h§ = §_-H1o§.§_-XF§(this.§_-up§,(this.body == null ? this.parentStarling : this.body.parentStarling).getChildStarlingIndex(this.body == null ? this : this.parentStarling)) as GameBody;
         }
         this.§_-up§ = null;
      }
      
      private function §_-G20§(param1:b2Fixture) : Boolean
      {
         var _loc2_:* = param1.GetBody().GetUserData();
         if(_loc2_ is GameBody && !(_loc2_ is §_-NA§) && _loc2_ != this.body)
         {
            this.§_-up§.push(_loc2_);
         }
         return true;
      }
      
      private function get §_-B3G§() : b2Vec2
      {
         if(this.body == null)
         {
            return this.position;
         }
         return §_-11I§.GetWorldPoint(this.body,this.position);
      }
      
      private function §_-A2c§() : void
      {
         if(this.joint == null)
         {
            return;
         }
         this.joint.EnableLimit(this.limited);
         this.joint.SetLimits(this.minLimit,this.maxLimit);
      }
      
      private function §_-q25§() : void
      {
         var _loc1_:Array = null;
         var _loc2_:* = undefined;
         if(this.§_-F1l§ != null)
         {
            _loc1_ = this.§_-F1l§.filters;
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_ is GlowFilter && (_loc2_ as GlowFilter).color == §_-qh§.color)
               {
                  _loc1_.splice(_loc1_.indexOf(_loc2_),1);
               }
            }
            this.§_-F1l§.filters = _loc1_;
         }
      }
   }
}


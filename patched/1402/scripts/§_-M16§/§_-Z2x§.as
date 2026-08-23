package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2LineJoint;
   import Box2D.Dynamics.Joints.b2LineJointDef;
   import Box2D.Dynamics.Joints.b2PrismaticJoint;
   import Box2D.Dynamics.Joints.b2PrismaticJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.display.Shape;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.entity.§_-L1d§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-H1o§;
   
   public class §_-Z2x§ extends §_-aS§ implements §_-U1I§, §_-hQ§, §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-L1d§, §_-Q2d§
   {
      
      private var anchor0:§_-gy§ = null;
      
      private var §_-72M§:§_-X1W§ = null;
      
      private var body0:GameBody = null;
      
      private var body1:GameBody = null;
      
      private var §_-up§:Array = null;
      
      private var §_-13a§:Boolean = false;
      
      private var §_-cJ§:* = null;
      
      private var body0Id:int = -1;
      
      private var body1Id:int = -1;
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      private var view:§_-aS§ = new §_-aS§(new PinLimited());
      
      private var §_-e1y§:Number = 0;
      
      private var §_-k9§:Number = 0;
      
      private var §_-J2C§:Boolean = false;
      
      private var §_-yR§:Boolean = false;
      
      private var §_-V2d§:Number = 0;
      
      private var §_-H2b§:Number = 0;
      
      public var flipFlop:Boolean = false;
      
      public var §_-F2m§:§_-aS§ = new §_-aS§();
      
      public function §_-Z2x§()
      {
         super();
         this.anchor0 = new §_-gy§(this);
         this.§_-72M§ = new §_-X1W§(this);
         this.view.§_-i18§();
         this.§_-QY§();
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         §_-J2J§(this.§_-F2m§);
         param1.add(this.anchor0);
         param1.add(this.§_-72M§);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         this.§_-tM§();
         this.update();
      }
      
      private function §_-QY§() : void
      {
         this.view.x = -10 * Game.§_-12A§;
         §_-J2J§(this.§_-F2m§);
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.lineStyle(4,this.fixedRotation ? uint(16729670) : uint(16711231));
         _loc1_.graphics.moveTo(this.view.x,this.view.y);
         _loc1_.graphics.lineTo(this.anchor0.x,this.anchor0.y);
         _loc1_.graphics.endFill();
         this.§_-F2m§.§_-J2J§(new §_-aS§(_loc1_));
         §_-J2J§(this.view);
         §_-J2J§(this.anchor0);
         §_-J2J§(this.§_-72M§);
      }
      
      private function §_-tM§() : void
      {
         var _loc1_:b2Vec2 = this.position.Copy();
         _loc1_.Add(new b2Vec2(-5,0));
         this.anchor0.position = _loc1_;
         _loc1_.Add(new b2Vec2(10,0));
         this.§_-72M§.position = _loc1_;
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         param1.remove(this.§_-72M§);
      }
      
      public function get fixedRotation() : Boolean
      {
         return !this.§_-13a§;
      }
      
      public function set fixedRotation(param1:Boolean) : void
      {
         this.§_-13a§ = !param1;
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
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      override public function get rotation() : Number
      {
         return 0;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      public function build(param1:b2World) : void
      {
         this.anchor0.visible = false;
         this.§_-72M§.visible = false;
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         this.world = param1;
         if(this.§_-cJ§ == null)
         {
            if(this.body0 == null)
            {
               this.findBody0(param1,this.anchor0.position);
            }
            if(this.body1 == null)
            {
               this.findBody1(param1,this.§_-72M§.position);
            }
         }
         else
         {
            this.body0 = (param1.userData as SquirrelGame).map.getObject(this.body0Id) as GameBody;
            this.body1 = (param1.userData as SquirrelGame).map.getObject(this.body1Id) as GameBody;
         }
         if(this.body0 == null && this.body1 == null)
         {
            return;
         }
         var _loc2_:b2Body = this.body0 ? this.body0.body : param1.GetGroundBody();
         var _loc3_:b2Body = this.body1 ? this.body1.body : param1.GetGroundBody();
         if(this.§_-cJ§ != null)
         {
            this.§_-cJ§.bodyA = _loc2_;
            this.§_-cJ§.bodyB = _loc3_;
         }
         else
         {
            this.§_-cJ§ = this.§_-13a§ ? new b2LineJointDef() : new b2PrismaticJointDef();
            this.§_-cJ§.Initialize(_loc2_,_loc3_,this.§_-72M§.position,new b2Vec2(Math.cos(this.§_-72M§.angle),Math.sin(this.§_-72M§.angle)));
         }
         this.§_-cJ§.enableMotor = this.motorEnabled;
         this.§_-cJ§.motorSpeed = this.motorSpeed;
         this.§_-cJ§.maxMotorForce = this.motorForce;
         this.§_-cJ§.enableLimit = this.limited;
         this.§_-cJ§.lowerTranslation = this.minLimit;
         this.§_-cJ§.upperTranslation = this.maxLimit;
         this.joint = param1.CreateJoint(this.§_-cJ§);
         this.anchor0.position = this.§_-cJ§.localAnchorA;
         this.§_-72M§.position = this.§_-cJ§.localAnchorB;
         if(this.body0 != null)
         {
            this.body0.§_-J2J§(this.anchor0);
         }
         if(this.body1 != null)
         {
            this.body1.§_-J2J§(this.§_-72M§);
         }
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.§_-72M§.position.x,this.§_-72M§.position.y,this.§_-72M§.angle]);
         _loc1_.push(this.§_-13a§);
         _loc1_.push([this.limited,this.minLimit,this.maxLimit]);
         _loc1_.push([this.motorEnabled,this.motorSpeed,this.motorForce,this.flipFlop]);
         if(this.§_-cJ§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,this.body1 ? this.body1.id : -1,[this.§_-cJ§.localAnchorA.x,this.§_-cJ§.localAnchorA.y],[this.§_-cJ§.localAnchorB.x,this.§_-cJ§.localAnchorB.y],[this.§_-cJ§.localAxisA.x,this.§_-cJ§.localAxisA.y],this.§_-cJ§ is b2PrismaticJointDef ? this.§_-cJ§.referenceAngle : 0]);
         }
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.§_-72M§.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.§_-72M§.angle = param1[2][2];
         this.§_-13a§ = Boolean(param1[3]);
         this.limited = Boolean(param1[4][0]);
         this.minLimit = param1[4][1];
         this.maxLimit = param1[4][2];
         this.motorEnabled = Boolean(param1[5][0]);
         this.motorSpeed = param1[5][1];
         this.motorForce = param1[5][2];
         this.flipFlop = Boolean(param1[5][3]);
         if(!(6 in param1))
         {
            return;
         }
         this.body0Id = param1[6][0];
         this.body1Id = param1[6][1];
         this.§_-cJ§ = this.§_-13a§ ? new b2LineJointDef() : new b2PrismaticJointDef();
         this.§_-cJ§.localAnchorA = new b2Vec2(param1[6][2][0],param1[6][2][1]);
         this.§_-cJ§.localAnchorB = new b2Vec2(param1[6][3][0],param1[6][3][1]);
         this.§_-cJ§.localAxisA = new b2Vec2(param1[6][4][0],param1[6][4][1]);
         if(!this.§_-13a§)
         {
            this.§_-cJ§.referenceAngle = param1[6][5];
         }
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         this.removeFromParent();
         this.view.removeFromParent();
         if(this.anchor0 != null)
         {
            this.anchor0.dispose();
         }
         this.anchor0 = null;
         if(this.§_-72M§ != null)
         {
            this.§_-72M§.dispose();
         }
         this.§_-72M§ = null;
         if(this.joint != null)
         {
            this.world.DestroyJoint(this.joint);
         }
         this.joint = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc6_:Shape = null;
         this.rotation = 0;
         var _loc2_:* = this.joint;
         if(this.flipFlop && _loc2_ != null)
         {
            if(_loc2_.GetJointTranslation() > _loc2_.GetUpperLimit())
            {
               _loc2_.SetMotorSpeed(-Math.abs(_loc2_.GetMotorSpeed()));
            }
            if(_loc2_.GetJointTranslation() < _loc2_.GetLowerLimit())
            {
               _loc2_.SetMotorSpeed(Math.abs(_loc2_.GetMotorSpeed()));
            }
         }
         var _loc3_:b2Vec2 = this.joint ? this.joint.GetAnchorA() : this.anchor0.position;
         _loc3_.Multiply(Game.§_-12A§);
         var _loc4_:b2Vec2 = this.joint ? this.joint.GetAnchorB() : this.§_-72M§.position;
         _loc4_.Multiply(Game.§_-12A§);
         var _loc5_:b2Vec2 = new b2Vec2((_loc3_.x + _loc4_.x) * 0.5,(_loc3_.y + _loc4_.y) * 0.5);
         this.x = _loc5_.x;
         this.y = _loc5_.y;
         _loc3_.Subtract(_loc5_);
         _loc4_.Subtract(_loc5_);
         if(param1 == 0)
         {
            if(this.§_-F2m§)
            {
               while(this.§_-F2m§.numChildren > 0)
               {
                  this.§_-F2m§.§_-av§(0);
               }
            }
            _loc6_ = new Shape();
            _loc6_.graphics.lineStyle(4,this.fixedRotation ? uint(16729670) : uint(16711231));
            _loc6_.graphics.moveTo(_loc3_.x,_loc3_.y);
            _loc6_.graphics.lineTo(_loc4_.x,_loc4_.y);
            _loc6_.graphics.endFill();
            this.§_-F2m§.§_-J2J§(new §_-aS§(_loc6_));
         }
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.§_-72M§);
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
      }
      
      public function get motorSpeed() : Number
      {
         return this.§_-e1y§;
      }
      
      public function set motorSpeed(param1:Number) : void
      {
         this.§_-e1y§ = param1;
         this.§_-tf§();
      }
      
      public function get motorForce() : Number
      {
         return this.§_-k9§;
      }
      
      public function set motorForce(param1:Number) : void
      {
         this.§_-k9§ = param1;
         this.§_-tf§();
      }
      
      public function get motorEnabled() : Boolean
      {
         return this.§_-J2C§;
      }
      
      public function set motorEnabled(param1:Boolean) : void
      {
         this.§_-J2C§ = param1;
         this.§_-tf§();
      }
      
      public function get limited() : Boolean
      {
         return this.§_-yR§;
      }
      
      public function set limited(param1:Boolean) : void
      {
         this.§_-yR§ = param1;
         this.§_-A2c§();
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
      
      private function §_-tf§() : void
      {
         if(this.joint == null)
         {
            return;
         }
         if(this.joint is b2PrismaticJoint)
         {
            (this.joint as b2PrismaticJoint).EnableMotor(this.motorEnabled);
            (this.joint as b2PrismaticJoint).SetMotorSpeed(this.motorSpeed);
            (this.joint as b2PrismaticJoint).SetMaxMotorForce(this.motorForce);
         }
         if(this.joint is b2LineJoint)
         {
            (this.joint as b2LineJoint).EnableMotor(this.motorEnabled);
            (this.joint as b2LineJoint).SetMotorSpeed(this.motorSpeed);
            (this.joint as b2LineJoint).SetMaxMotorForce(this.motorForce);
         }
      }
      
      private function §_-A2c§() : void
      {
         if(this.joint == null)
         {
            return;
         }
         if(this.joint is b2PrismaticJoint)
         {
            (this.joint as b2PrismaticJoint).SetLimits(this.minLimit,this.maxLimit);
            (this.joint as b2PrismaticJoint).EnableLimit(this.limited);
         }
         if(this.joint is b2LineJoint)
         {
            (this.joint as b2LineJoint).SetLimits(this.minLimit,this.maxLimit);
            (this.joint as b2LineJoint).EnableLimit(this.limited);
         }
      }
      
      private function findBody0(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-up§ = [];
         param1.QueryPoint(this.queryBody0,param2);
         this.body0 = §_-H1o§.§_-XF§(this.§_-up§,this.anchor0.parentStarling.getChildStarlingIndex(this.anchor0)) as GameBody;
         this.§_-up§ = null;
      }
      
      private function queryBody0(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.body1)
         {
            this.§_-up§.push(_loc2_.GetUserData());
         }
         return true;
      }
      
      private function findBody1(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-up§ = [];
         param1.QueryPoint(this.queryBody1,param2);
         this.body1 = §_-H1o§.§_-XF§(this.§_-up§,this.§_-72M§.parentStarling.getChildStarlingIndex(this.§_-72M§)) as GameBody;
         this.§_-up§ = null;
      }
      
      private function queryBody1(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.body0)
         {
            this.§_-up§.push(_loc2_.GetUserData());
         }
         return true;
      }
   }
}


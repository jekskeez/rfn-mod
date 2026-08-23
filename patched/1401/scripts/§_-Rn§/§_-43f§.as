package §_-Rn§
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
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import flash.display.Shape;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-A2f§;
   import utils.§_-X2Z§;
   
   public class §_-43f§ extends §_-h2I§ implements §_-I2G§, §_-72o§, §_-63Q§, §_-03u§, §_-C2x§, §_-Tm§, §_-A2f§, §_-8B§
   {
      
      private var anchor0:§_-dv§ = null;
      
      private var §_-M12§:§_-51e§ = null;
      
      private var body0:GameBody = null;
      
      private var body1:GameBody = null;
      
      private var §_-B10§:Array = null;
      
      private var §_-V3§:Boolean = false;
      
      private var §_-f1B§:* = null;
      
      private var body0Id:int = -1;
      
      private var body1Id:int = -1;
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      private var view:§_-h2I§ = new §_-h2I§(new PinLimited());
      
      private var §_-J2F§:Number = 0;
      
      private var §_-l1H§:Number = 0;
      
      private var §_-G1p§:Boolean = false;
      
      private var §_-pi§:Boolean = false;
      
      private var §_-db§:Number = 0;
      
      private var §_-u20§:Number = 0;
      
      public var flipFlop:Boolean = false;
      
      public var §_-M1W§:§_-h2I§ = new §_-h2I§();
      
      public function §_-43f§()
      {
         super();
         this.anchor0 = new §_-dv§(this);
         this.§_-M12§ = new §_-51e§(this);
         this.view.§_-x2x§();
         this.§_-43x§();
      }
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         §_-83v§(this.§_-M1W§);
         param1.add(this.anchor0);
         param1.add(this.§_-M12§);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         this.§_-K1V§();
         this.update();
      }
      
      private function §_-43x§() : void
      {
         this.view.x = -10 * Game.§_-x2P§;
         §_-83v§(this.§_-M1W§);
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.lineStyle(4,this.fixedRotation ? uint(16729670) : uint(16711231));
         _loc1_.graphics.moveTo(this.view.x,this.view.y);
         _loc1_.graphics.lineTo(this.anchor0.x,this.anchor0.y);
         _loc1_.graphics.endFill();
         this.§_-M1W§.§_-83v§(new §_-h2I§(_loc1_));
         §_-83v§(this.view);
         §_-83v§(this.anchor0);
         §_-83v§(this.§_-M12§);
      }
      
      private function §_-K1V§() : void
      {
         var _loc1_:b2Vec2 = this.position.Copy();
         _loc1_.Add(new b2Vec2(-5,0));
         this.anchor0.position = _loc1_;
         _loc1_.Add(new b2Vec2(10,0));
         this.§_-M12§.position = _loc1_;
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         param1.remove(this.§_-M12§);
      }
      
      public function get fixedRotation() : Boolean
      {
         return !this.§_-V3§;
      }
      
      public function set fixedRotation(param1:Boolean) : void
      {
         this.§_-V3§ = !param1;
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
         this.§_-M12§.visible = false;
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         this.world = param1;
         if(this.§_-f1B§ == null)
         {
            if(this.body0 == null)
            {
               this.findBody0(param1,this.anchor0.position);
            }
            if(this.body1 == null)
            {
               this.findBody1(param1,this.§_-M12§.position);
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
         if(this.§_-f1B§ != null)
         {
            this.§_-f1B§.bodyA = _loc2_;
            this.§_-f1B§.bodyB = _loc3_;
         }
         else
         {
            this.§_-f1B§ = this.§_-V3§ ? new b2LineJointDef() : new b2PrismaticJointDef();
            this.§_-f1B§.Initialize(_loc2_,_loc3_,this.§_-M12§.position,new b2Vec2(Math.cos(this.§_-M12§.angle),Math.sin(this.§_-M12§.angle)));
         }
         this.§_-f1B§.enableMotor = this.motorEnabled;
         this.§_-f1B§.motorSpeed = this.motorSpeed;
         this.§_-f1B§.maxMotorForce = this.motorForce;
         this.§_-f1B§.enableLimit = this.limited;
         this.§_-f1B§.lowerTranslation = this.minLimit;
         this.§_-f1B§.upperTranslation = this.maxLimit;
         this.joint = param1.CreateJoint(this.§_-f1B§);
         this.anchor0.position = this.§_-f1B§.localAnchorA;
         this.§_-M12§.position = this.§_-f1B§.localAnchorB;
         if(this.body0 != null)
         {
            this.body0.§_-83v§(this.anchor0);
         }
         if(this.body1 != null)
         {
            this.body1.§_-83v§(this.§_-M12§);
         }
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.§_-M12§.position.x,this.§_-M12§.position.y,this.§_-M12§.angle]);
         _loc1_.push(this.§_-V3§);
         _loc1_.push([this.limited,this.minLimit,this.maxLimit]);
         _loc1_.push([this.motorEnabled,this.motorSpeed,this.motorForce,this.flipFlop]);
         if(this.§_-f1B§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,this.body1 ? this.body1.id : -1,[this.§_-f1B§.localAnchorA.x,this.§_-f1B§.localAnchorA.y],[this.§_-f1B§.localAnchorB.x,this.§_-f1B§.localAnchorB.y],[this.§_-f1B§.localAxisA.x,this.§_-f1B§.localAxisA.y],this.§_-f1B§ is b2PrismaticJointDef ? this.§_-f1B§.referenceAngle : 0]);
         }
         return _loc1_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.§_-M12§.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.§_-M12§.angle = param1[2][2];
         this.§_-V3§ = Boolean(param1[3]);
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
         this.§_-f1B§ = this.§_-V3§ ? new b2LineJointDef() : new b2PrismaticJointDef();
         this.§_-f1B§.localAnchorA = new b2Vec2(param1[6][2][0],param1[6][2][1]);
         this.§_-f1B§.localAnchorB = new b2Vec2(param1[6][3][0],param1[6][3][1]);
         this.§_-f1B§.localAxisA = new b2Vec2(param1[6][4][0],param1[6][4][1]);
         if(!this.§_-V3§)
         {
            this.§_-f1B§.referenceAngle = param1[6][5];
         }
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
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
         if(this.§_-M12§ != null)
         {
            this.§_-M12§.dispose();
         }
         this.§_-M12§ = null;
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
         _loc3_.Multiply(Game.§_-x2P§);
         var _loc4_:b2Vec2 = this.joint ? this.joint.GetAnchorB() : this.§_-M12§.position;
         _loc4_.Multiply(Game.§_-x2P§);
         var _loc5_:b2Vec2 = new b2Vec2((_loc3_.x + _loc4_.x) * 0.5,(_loc3_.y + _loc4_.y) * 0.5);
         this.x = _loc5_.x;
         this.y = _loc5_.y;
         _loc3_.Subtract(_loc5_);
         _loc4_.Subtract(_loc5_);
         if(param1 == 0)
         {
            if(this.§_-M1W§)
            {
               while(this.§_-M1W§.numChildren > 0)
               {
                  this.§_-M1W§.§_-n2T§(0);
               }
            }
            _loc6_ = new Shape();
            _loc6_.graphics.lineStyle(4,this.fixedRotation ? uint(16729670) : uint(16711231));
            _loc6_.graphics.moveTo(_loc3_.x,_loc3_.y);
            _loc6_.graphics.lineTo(_loc4_.x,_loc4_.y);
            _loc6_.graphics.endFill();
            this.§_-M1W§.§_-83v§(new §_-h2I§(_loc6_));
         }
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.§_-M12§);
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
      }
      
      public function get motorSpeed() : Number
      {
         return this.§_-J2F§;
      }
      
      public function set motorSpeed(param1:Number) : void
      {
         this.§_-J2F§ = param1;
         this.§_-A3Y§();
      }
      
      public function get motorForce() : Number
      {
         return this.§_-l1H§;
      }
      
      public function set motorForce(param1:Number) : void
      {
         this.§_-l1H§ = param1;
         this.§_-A3Y§();
      }
      
      public function get motorEnabled() : Boolean
      {
         return this.§_-G1p§;
      }
      
      public function set motorEnabled(param1:Boolean) : void
      {
         this.§_-G1p§ = param1;
         this.§_-A3Y§();
      }
      
      public function get limited() : Boolean
      {
         return this.§_-pi§;
      }
      
      public function set limited(param1:Boolean) : void
      {
         this.§_-pi§ = param1;
         this.§_-q1r§();
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
      
      private function §_-A3Y§() : void
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
      
      private function §_-q1r§() : void
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
         this.§_-B10§ = [];
         param1.QueryPoint(this.queryBody0,param2);
         this.body0 = §_-X2Z§.§_-C16§(this.§_-B10§,this.anchor0.parentStarling.getChildStarlingIndex(this.anchor0)) as GameBody;
         this.§_-B10§ = null;
      }
      
      private function queryBody0(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.body1)
         {
            this.§_-B10§.push(_loc2_.GetUserData());
         }
         return true;
      }
      
      private function findBody1(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-B10§ = [];
         param1.QueryPoint(this.queryBody1,param2);
         this.body1 = §_-X2Z§.§_-C16§(this.§_-B10§,this.§_-M12§.parentStarling.getChildStarlingIndex(this.§_-M12§)) as GameBody;
         this.§_-B10§ = null;
      }
      
      private function queryBody1(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.body0)
         {
            this.§_-B10§.push(_loc2_.GetUserData());
         }
         return true;
      }
   }
}


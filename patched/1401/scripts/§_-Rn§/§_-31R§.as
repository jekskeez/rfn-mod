package §_-Rn§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import §_-f17§.§_-Gn§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-A2f§;
   import utils.§_-X2Z§;
   
   public class §_-31R§ extends §_-h2I§ implements §_-I2G§, §_-72o§, §_-63Q§, §_-03u§, §_-C2x§, §_-Tm§, §_-A2f§
   {
      
      private var body0:GameBody = null;
      
      private var body1:GameBody = null;
      
      private var §_-B10§:Array = null;
      
      private var §_-f1B§:b2DistanceJointDef = null;
      
      private var body0Id:int = -1;
      
      private var body1Id:int = -1;
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      private var view:§_-h2I§ = new §_-h2I§(new RopeJointView());
      
      private var spring:§_-Gn§ = new §_-Gn§();
      
      public var damping:Number = 0;
      
      public var frequency:Number = 1;
      
      public var anchor0:§_-dv§ = null;
      
      public var anchor1:§_-dv§ = null;
      
      public var pin0:§_-h2I§ = null;
      
      public var pin1:§_-h2I§ = null;
      
      public function §_-31R§()
      {
         super();
         §_-83v§(this.view);
         this.§_-w6§();
      }
      
      private function §_-w6§() : void
      {
         this.pin0 = new §_-h2I§(new PinUnlimited());
         this.pin1 = new §_-h2I§(new PinUnlimited());
         this.pin0.§_-x2x§();
         this.pin1.§_-x2x§();
         this.anchor0 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
         this.anchor1 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:Point = new Point(param1.getRect(this.parentStarling).x,param1.getRect(this.parentStarling).y);
         var _loc3_:Point = new Point(param1.getRect(this.parentStarling).x,param1.getRect(this.parentStarling).y + param1.height);
         var _loc4_:Point = new Point(param1.getRect(this.parentStarling).x + param1.width,param1.getRect(this.parentStarling).y);
         var _loc5_:Point = new Point(param1.getRect(this.parentStarling).x + param1.width,param1.getRect(this.parentStarling).y + param1.height);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || this.anchor0.x > _loc2_.x && this.anchor0.x < _loc4_.x && this.anchor0.y > _loc2_.y && this.anchor0.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-e2n§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
      }
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         §_-83v§(this.spring);
         §_-83v§(this.pin0);
         §_-83v§(this.pin1);
         param1.add(this.anchor0);
         param1.add(this.anchor1);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-31.5 / Game.§_-x2P§,0));
         this.anchor0.position = _loc2_;
         _loc2_.Add(new b2Vec2(63 / Game.§_-x2P§,0));
         this.anchor1.position = _loc2_;
         this.update();
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         param1.remove(this.anchor1);
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
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         §_-83v§(this.spring);
         §_-83v§(this.pin0);
         §_-83v§(this.pin1);
         this.update();
         this.world = param1;
         if(this.§_-f1B§ == null)
         {
            if(this.body0 == null)
            {
               this.findBody0(param1,this.anchor0.position);
            }
            if(this.body1 == null)
            {
               this.findBody1(param1,this.anchor1.position);
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
            this.§_-f1B§ = new b2DistanceJointDef();
            this.§_-f1B§.Initialize(_loc2_,_loc3_,this.anchor0.position,this.anchor1.position);
         }
         this.§_-f1B§.dampingRatio = this.damping;
         this.§_-f1B§.frequencyHz = this.frequency;
         this.§_-f1B§.collideConnected = true;
         this.joint = param1.CreateJoint(this.§_-f1B§);
         this.anchor0.position = this.§_-f1B§.localAnchorA;
         this.anchor1.position = this.§_-f1B§.localAnchorB;
         if(this.body0 != null)
         {
            this.body0.§_-83v§(this.anchor0);
         }
         if(this.body1 != null)
         {
            this.body1.§_-83v§(this.anchor1);
         }
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         _loc1_.push([this.frequency,this.damping]);
         if(this.§_-f1B§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,this.body1 ? this.body1.id : -1,[this.§_-f1B§.localAnchorA.x,this.§_-f1B§.localAnchorA.y],[this.§_-f1B§.localAnchorB.x,this.§_-f1B§.localAnchorB.y],this.§_-f1B§.length]);
         }
         return _loc1_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.anchor1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.frequency = param1[3][0];
         this.damping = param1[3][1];
         if(!(4 in param1))
         {
            return;
         }
         this.§_-f1B§ = new b2DistanceJointDef();
         this.body0Id = param1[4][0];
         this.body1Id = param1[4][1];
         this.§_-f1B§.localAnchorA = new b2Vec2(param1[4][2][0],param1[4][2][1]);
         this.§_-f1B§.localAnchorB = new b2Vec2(param1[4][3][0],param1[4][3][1]);
         if(4 in param1[4])
         {
            this.§_-f1B§.length = param1[4][4];
         }
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         this.removeFromParent();
         if(this.anchor0 != null)
         {
            this.anchor0.dispose();
         }
         this.anchor0 = null;
         if(this.anchor1 != null)
         {
            this.anchor1.dispose();
         }
         this.anchor1 = null;
         if(this.joint != null)
         {
            this.world.DestroyJoint(this.joint);
         }
         this.joint = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         this.rotation = 0;
         var _loc2_:b2Vec2 = this.joint ? this.joint.GetAnchorA() : this.anchor0.position;
         _loc2_.Multiply(Game.§_-x2P§);
         var _loc3_:b2Vec2 = this.joint ? this.joint.GetAnchorB() : this.anchor1.position;
         _loc3_.Multiply(Game.§_-x2P§);
         var _loc4_:b2Vec2 = new b2Vec2((_loc2_.x + _loc3_.x) * 0.5,(_loc2_.y + _loc3_.y) * 0.5);
         this.x = _loc4_.x;
         this.y = _loc4_.y;
         _loc2_.Subtract(_loc4_);
         _loc3_.Subtract(_loc4_);
         this.spring.start = new Point(_loc2_.x,_loc2_.y);
         this.spring.end = new Point(_loc3_.x,_loc3_.y);
         this.pin0.x = _loc2_.x;
         this.pin0.y = _loc2_.y;
         this.pin1.x = _loc3_.x;
         this.pin1.y = _loc3_.y;
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.anchor1);
      }
      
      private function findBody0(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-B10§ = [];
         param1.QueryPoint(this.queryBody0,param2);
         this.body0 = §_-X2Z§.§_-C16§(this.§_-B10§,this.anchor0.parentStarling.getChildStarlingIndex(this.anchor0)) as GameBody;
         this.§_-B10§ = null;
      }
      
      private function §_-e2n§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
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
         this.body1 = §_-X2Z§.§_-C16§(this.§_-B10§,this.anchor1.parentStarling.getChildStarlingIndex(this.anchor1)) as GameBody;
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


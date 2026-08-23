package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-82h§.§_-KS§;
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-L1d§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-H1o§;
   
   public class §_-43h§ extends §_-aS§ implements §_-U1I§, §_-hQ§, §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-L1d§
   {
      
      private var §_-up§:Array = null;
      
      private var §_-cJ§:b2DistanceJointDef = null;
      
      private var body0Id:int = -1;
      
      private var body1Id:int = -1;
      
      private var §_-g2G§:Point = new Point();
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      private var view:§_-aS§ = new §_-aS§(new RopeJointView());
      
      private var rope:§_-KS§ = new §_-KS§();
      
      public var damping:Number = 0;
      
      public var frequency:Number = 3;
      
      public var anchor0:§_-gy§ = null;
      
      public var anchor1:§_-gy§ = null;
      
      public var body0:GameBody = null;
      
      public var body1:GameBody = null;
      
      public var pin0:§_-aS§ = null;
      
      public var pin1:§_-aS§ = null;
      
      public function §_-43h§()
      {
         super();
         §_-J2J§(this.view);
         this.pin0 = new §_-aS§(new PinUnlimited());
         this.pin1 = new §_-aS§(new PinUnlimited());
         this.pin0.§_-i18§();
         this.pin1.§_-i18§();
         this.anchor0 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.anchor1 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.update();
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y);
         var _loc3_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y + param1.height);
         var _loc4_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y);
         var _loc5_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y + param1.height);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || this.anchor0.x > _loc2_.x && this.anchor0.x < _loc4_.x && this.anchor0.y > _loc2_.y && this.anchor0.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         §_-J2J§(this.rope);
         §_-J2J§(this.pin0);
         §_-J2J§(this.pin1);
         param1.add(this.anchor0);
         param1.add(this.anchor1);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-31.5 / Game.§_-12A§,0));
         this.anchor0.position = _loc2_;
         _loc2_.Add(new b2Vec2(63 / Game.§_-12A§,0));
         this.anchor1.position = _loc2_;
         this.update();
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         this.anchor0.dispose();
         param1.remove(this.anchor1);
         this.anchor1.dispose();
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
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         §_-J2J§(this.rope);
         this.update();
         this.world = param1;
         if(this.§_-cJ§ == null)
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
            this.anchor0.cacheAsBitmap = true;
            this.anchor1.cacheAsBitmap = true;
            this.cacheAsBitmap = true;
            return;
         }
         var _loc2_:b2Body = this.body0 ? this.body0.body : param1.GetGroundBody();
         var _loc3_:b2Body = this.body1 ? this.body1.body : param1.GetGroundBody();
         if(this.§_-cJ§ != null)
         {
            this.§_-cJ§.bodyA = _loc2_;
            this.§_-cJ§.bodyB = _loc3_;
            this.§_-cJ§.rope = true;
         }
         else
         {
            this.§_-cJ§ = new b2DistanceJointDef();
            this.§_-cJ§.Initialize(_loc2_,_loc3_,this.anchor0.position,this.anchor1.position);
            this.§_-cJ§.rope = true;
         }
         this.§_-cJ§.dampingRatio = this.damping;
         this.§_-cJ§.frequencyHz = this.frequency;
         this.§_-cJ§.collideConnected = true;
         this.joint = param1.CreateJoint(this.§_-cJ§);
         this.anchor0.position = this.§_-cJ§.localAnchorA;
         this.anchor1.position = this.§_-cJ§.localAnchorB;
         this.anchor0.visible = true;
         this.anchor1.visible = true;
         this.anchor0.visible = true;
         this.anchor1.visible = true;
         if(this.body0 != null)
         {
            if(this.body0.fixed)
            {
               this.anchor0.cacheAsBitmap = true;
            }
            this.body0.§_-J2J§(this.anchor0);
         }
         if(this.body1 != null)
         {
            if(this.body1.fixed)
            {
               this.anchor1.cacheAsBitmap = true;
            }
            this.body1.§_-J2J§(this.anchor1);
         }
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         _loc1_.push([this.frequency,this.damping]);
         if(this.§_-cJ§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,this.body1 ? this.body1.id : -1,[this.§_-cJ§.localAnchorA.x,this.§_-cJ§.localAnchorA.y],[this.§_-cJ§.localAnchorB.x,this.§_-cJ§.localAnchorB.y],this.§_-cJ§.length]);
         }
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
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
         this.§_-cJ§ = new b2DistanceJointDef();
         this.body0Id = param1[4][0];
         this.body1Id = param1[4][1];
         this.§_-cJ§.localAnchorA = new b2Vec2(param1[4][2][0],param1[4][2][1]);
         this.§_-cJ§.localAnchorB = new b2Vec2(param1[4][3][0],param1[4][3][1]);
         if(4 in param1[4])
         {
            this.§_-cJ§.length = param1[4][4];
         }
      }
      
      public function dispose() : void
      {
         this.graphics.clear();
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
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
         if(this.joint == null && this.anchor0 == null)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.joint ? this.joint.GetAnchorA() : this.anchor0.position;
         _loc2_.Multiply(Game.§_-12A§);
         if(this.joint == null && this.anchor1 == null)
         {
            return;
         }
         var _loc3_:b2Vec2 = this.joint ? this.joint.GetAnchorB() : this.anchor1.position;
         _loc3_.Multiply(Game.§_-12A§);
         var _loc4_:b2Vec2 = new b2Vec2((_loc2_.x + _loc3_.x) * 0.5,(_loc2_.y + _loc3_.y) * 0.5);
         this.x = _loc4_.x;
         this.y = _loc4_.y;
         _loc2_.Subtract(_loc4_);
         _loc3_.Subtract(_loc4_);
         if(!this.rope)
         {
            return;
         }
         this.§_-g2G§.setTo(_loc2_.x,_loc2_.y);
         this.rope.start = this.§_-g2G§;
         this.§_-g2G§.setTo(_loc3_.x,_loc3_.y);
         this.rope.end = this.§_-g2G§;
         this.pin0.x = this.rope.start.x;
         this.pin0.y = this.rope.start.y;
         this.pin1.x = this.rope.end.x;
         this.pin1.y = this.rope.end.y;
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.anchor1);
      }
      
      private function §_-hn§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
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
         this.body1 = §_-H1o§.§_-XF§(this.§_-up§,this.anchor1.parentStarling.getChildStarlingIndex(this.anchor1)) as GameBody;
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


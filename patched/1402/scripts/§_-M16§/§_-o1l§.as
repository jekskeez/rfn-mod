package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2WeldJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-82h§.§_-B3e§;
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-L1d§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-H1o§;
   
   public class §_-o1l§ extends §_-aS§ implements §_-U1I§, §_-hQ§, §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-L1d§
   {
      
      private var anchor0:§_-gy§ = null;
      
      private var anchor1:§_-gy§ = null;
      
      private var body0:GameBody = null;
      
      private var body1:GameBody = null;
      
      private var §_-up§:Array = null;
      
      private var joint:b2Joint = null;
      
      private var §_-cJ§:b2WeldJointDef = null;
      
      private var body0Id:int = -1;
      
      private var body1Id:int = -1;
      
      private var §_-K6§:b2Vec2;
      
      private var §_-P1R§:b2Vec2;
      
      private var world:b2World = null;
      
      private var view:§_-aS§ = new §_-aS§(new WeldJointView());
      
      private var §_-E1X§:§_-B3e§ = new §_-B3e§();
      
      public function §_-o1l§()
      {
         super();
         §_-J2J§(this.view);
         this.anchor0 = new §_-gy§(this,new §_-aS§(new SteelPoint()));
         this.anchor1 = new §_-gy§(this,new §_-aS§(new SteelPoint()));
      }
      
      override public function §_-p1A§(param1:*) : Boolean
      {
         var _loc2_:Point = new Point(param1.getRectStarling(this.parentStarling).x,param1.getRectStarling(this.parentStarling).y);
         var _loc3_:Point = new Point(param1.getRectStarling(this.parentStarling).x,param1.getRectStarling(this.parentStarling).y + param1.height);
         var _loc4_:Point = new Point(param1.getRectStarling(this.parentStarling).x + param1.width,param1.getRectStarling(this.parentStarling).y);
         var _loc5_:Point = new Point(param1.getRectStarling(this.parentStarling).x + param1.width,param1.getRectStarling(this.parentStarling).y + param1.height);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || this.anchor0.x > _loc2_.x && this.anchor0.x < _loc4_.x && this.anchor0.y > _loc2_.y && this.anchor0.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(this.anchor0.x,this.anchor0.y,this.anchor1.x,this.anchor1.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
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
      
      public function §_-x26§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         §_-J2J§(this.§_-E1X§);
         param1.add(this.anchor0);
         param1.add(this.anchor1);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-2,0));
         this.anchor0.position = _loc2_;
         _loc2_.Add(new b2Vec2(4,0));
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
      
      public function build(param1:b2World) : void
      {
         this.world = param1;
         if(this.§_-cJ§ == null)
         {
            if(this.body0 == null)
            {
               this.findBody0(this.world,this.anchor0.position);
            }
            if(this.body1 == null)
            {
               this.findBody1(this.world,this.anchor1.position);
            }
         }
         else
         {
            this.body0 = (this.world.userData as SquirrelGame).map.getObject(this.body0Id) as GameBody;
            this.body1 = (this.world.userData as SquirrelGame).map.getObject(this.body1Id) as GameBody;
         }
         if(this.body0 == null || this.body1 == null)
         {
            this.anchor0.cacheAsBitmap = true;
            this.anchor1.cacheAsBitmap = true;
            this.cacheAsBitmap = true;
            return;
         }
         this.anchor1.cacheAsBitmap = this.body1.fixed;
         this.anchor0.cacheAsBitmap = this.body0.fixed;
         this.cacheAsBitmap = this.body1.fixed || this.body0.fixed;
         var _loc2_:b2Body = this.body0.body;
         var _loc3_:b2Body = this.body1.body;
         if(this.§_-cJ§ != null)
         {
            this.§_-cJ§.bodyA = _loc2_;
            this.§_-cJ§.bodyB = _loc3_;
         }
         else
         {
            this.§_-cJ§ = new b2WeldJointDef();
            this.§_-cJ§.Initialize(_loc2_,_loc3_,this.anchor0.position);
         }
         this.joint = this.world.CreateJoint(this.§_-cJ§);
         this.§_-K6§ = this.§_-cJ§.bodyA.GetLocalPoint(this.anchor0.position);
         this.§_-P1R§ = this.§_-cJ§.bodyB.GetLocalPoint(this.anchor1.position);
         this.anchor0.§_-W2M§ = false;
         this.anchor1.§_-W2M§ = false;
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         if(this.§_-cJ§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,this.body1 ? this.body1.id : -1,[this.§_-cJ§.localAnchorA.x,this.§_-cJ§.localAnchorA.y],[this.§_-cJ§.localAnchorB.x,this.§_-cJ§.localAnchorB.y],this.§_-cJ§.referenceAngle]);
         }
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.anchor1.position = new b2Vec2(param1[2][0],param1[2][1]);
         if(!(3 in param1))
         {
            return;
         }
         this.§_-cJ§ = new b2WeldJointDef();
         this.body0Id = param1[3][0];
         this.body1Id = param1[3][1];
         this.§_-cJ§.localAnchorA = new b2Vec2(param1[3][2][0],param1[3][2][1]);
         this.§_-cJ§.localAnchorB = new b2Vec2(param1[3][3][0],param1[3][3][1]);
         this.§_-cJ§.referenceAngle = param1[3][4];
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
         var _loc5_:b2Vec2 = null;
         var _loc6_:b2Vec2 = null;
         this.rotation = 0;
         if(this.§_-cJ§ != null)
         {
            _loc5_ = this.§_-cJ§.bodyA.GetWorldPoint(this.§_-K6§);
            _loc6_ = this.§_-cJ§.bodyB.GetWorldPoint(this.§_-P1R§);
            this.anchor0.position = _loc5_;
            this.anchor1.position = _loc6_;
         }
         var _loc2_:b2Vec2 = Boolean(this.joint) && Boolean(this.§_-cJ§) ? _loc5_.Copy() : this.anchor0.position;
         _loc2_.Multiply(Game.§_-12A§);
         var _loc3_:b2Vec2 = Boolean(this.joint) && Boolean(this.§_-cJ§) ? _loc6_.Copy() : this.anchor1.position;
         _loc3_.Multiply(Game.§_-12A§);
         var _loc4_:b2Vec2 = new b2Vec2((_loc2_.x + _loc3_.x) * 0.5,(_loc2_.y + _loc3_.y) * 0.5);
         this.x = _loc4_.x;
         this.y = _loc4_.y;
         _loc2_.Subtract(_loc4_);
         _loc3_.Subtract(_loc4_);
         this.§_-E1X§.start = new Point(_loc2_.x,_loc2_.y);
         this.§_-E1X§.end = new Point(_loc3_.x,_loc3_.y);
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


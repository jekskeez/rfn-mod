package §_-Rn§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJoint;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import utils.§_-X2Z§;
   
   public class §_-as§ extends §_-h2I§ implements §_-63Q§, §_-I2G§, §_-03u§, §_-C2x§, §_-Tm§
   {
      
      private var view:§_-h2I§;
      
      private var world:b2World;
      
      private var §_-8c§:GameBody;
      
      private var §_-B10§:Array;
      
      private var §_-o5§:int = -1;
      
      private var §_-c1w§:Boolean;
      
      private var §_-Cm§:b2Vec2 = new b2Vec2();
      
      private var joint:b2DistanceJoint;
      
      private var §_-23U§:b2Body;
      
      private var §_-k2b§:Array = [];
      
      private var §_-5Q§:int;
      
      private var §_-B11§:int;
      
      private var §_-Q12§:Boolean;
      
      public function §_-as§()
      {
         super();
         this.view = new §_-h2I§(new JointDragView());
         this.view.§_-x2x§();
         §_-83v§(this.view);
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
      
      public function get body() : GameBody
      {
         return this.§_-8c§;
      }
      
      public function set body(param1:GameBody) : void
      {
         this.§_-8c§ = param1;
         if(this.parentStarling != null && Boolean(this.body))
         {
            this.parentStarling.removeChildStarling(this,false);
         }
         this.§_-8c§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.§_-83v§(this);
      }
      
      public function get active() : Boolean
      {
         return this.§_-c1w§;
      }
      
      public function §_-ds§() : void
      {
         this.active = false;
      }
      
      public function set active(param1:Boolean) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2DistanceJointDef = null;
         if(this.§_-c1w§ == param1)
         {
            return;
         }
         if(!param1)
         {
            this.§_-Q12§ = false;
            this.§_-k2b§ = [];
         }
         if(!this.body || !this.body.body)
         {
            if(!param1)
            {
               this.§_-c1w§ = false;
            }
            else
            {
               §_-TQ§.add("ERROR JointDrag: " + this.body);
            }
            return;
         }
         this.§_-c1w§ = param1;
         this.scaleX = this.scaleY = param1 ? 2 : 1;
         if(this.world == null)
         {
            return;
         }
         if(param1)
         {
            if(this.§_-23U§ == null)
            {
               this.§_-23U§ = this.world.CreateBody(new b2BodyDef(true,false,b2Body.b2_kinematicBody));
            }
            _loc2_ = this.body.body.GetWorldPoint(this.position);
            this.§_-23U§.SetPosition(_loc2_);
            if(this.joint == null)
            {
               _loc3_ = new b2DistanceJointDef();
               _loc3_.bodyA = this.body.body;
               _loc3_.bodyB = this.§_-23U§;
               _loc3_.localAnchorA = this.position;
               _loc3_.localAnchorB = new b2Vec2();
               _loc3_.length = 0;
               _loc3_.dampingRatio = 0.8;
               _loc3_.frequencyHz = 1;
               this.joint = this.world.CreateJoint(_loc3_) as b2DistanceJoint;
            }
         }
         else
         {
            if(this.joint != null)
            {
               this.world.DestroyJoint(this.joint);
            }
            this.joint = null;
            if(this.§_-23U§ != null)
            {
               this.world.DestroyBody(this.§_-23U§);
            }
            this.§_-23U§ = null;
         }
      }
      
      public function get §_-m1h§() : b2Vec2
      {
         return this.§_-Cm§;
      }
      
      public function set §_-m1h§(param1:b2Vec2) : void
      {
         this.§_-Cm§ = param1;
         if(this.§_-23U§ == null || this.body == null || this.body.body == null || !this.active)
         {
            return;
         }
         this.§_-23U§.SetPosition(param1);
         this.§_-23U§.SetAwake(true);
         this.body.body.SetAwake(true);
      }
      
      public function get §_-A1H§() : Array
      {
         return this.§_-k2b§;
      }
      
      public function set §_-A1H§(param1:Array) : void
      {
         if(param1.length == 0)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-k2b§.length == 0;
         this.§_-k2b§ = this.§_-k2b§.concat(param1);
         if(_loc2_)
         {
            this.§_-B11§ = getTimer();
            this.§_-5Q§ = param1[0][0];
         }
      }
      
      public function build(param1:b2World) : void
      {
         this.world = param1;
         this.body = this.body ? this.body : (this.world.userData as SquirrelGame).map.getObject(this.§_-o5§) as GameBody;
         if(this.body == null)
         {
            this.§_-wv§(param1,this.position);
            if(this.body == null)
            {
               this.visible = false;
               return;
            }
         }
         this.position = this.body.body.GetLocalPoint(this.position);
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:b2Vec2 = null;
         if(this.body != null && Boolean(this.body.body))
         {
            _loc1_ = this.body.body.GetWorldPoint(this.position);
         }
         else
         {
            _loc1_ = this.position;
         }
         var _loc2_:Array = [_loc1_.x,_loc1_.y,this.active,this.§_-m1h§.x,this.§_-m1h§.y];
         if(this.body)
         {
            _loc2_.push([this.body.id]);
            _loc2_.push(this.§_-A1H§);
         }
         return _loc2_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0],param1[1]);
         this.active = Boolean(param1[2]);
         this.§_-m1h§ = new b2Vec2(param1[3],param1[4]);
         if(!(5 in param1))
         {
            return;
         }
         this.§_-o5§ = param1[5];
         this.§_-k2b§ = param1[6];
      }
      
      public function dispose() : void
      {
         this.§_-ds§();
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc3_:Array = null;
         var _loc2_:int = getTimer() - this.§_-B11§;
         while(this.§_-A1H§.length != 0)
         {
            _loc3_ = this.§_-A1H§[0];
            if(_loc2_ < _loc3_[0] - this.§_-5Q§)
            {
               return;
            }
            this.§_-m1h§ = new b2Vec2(_loc3_[1][0],_loc3_[1][1]);
            this.§_-A1H§.shift();
         }
         this.§_-B11§ = 0;
         this.§_-5Q§ = 0;
         if(this.§_-Q12§)
         {
            this.active = false;
         }
         this.§_-Q12§ = false;
      }
      
      private function §_-wv§(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-B10§ = [];
         param1.QueryPoint(this.§_-W1h§,param2);
         this.body = §_-X2Z§.§_-C16§(this.§_-B10§,this.parentStarling.getChildStarlingIndex(this)) as GameBody;
         this.§_-B10§ = null;
      }
      
      private function §_-W1h§(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody)
         {
            this.§_-B10§.push(_loc2_.GetUserData());
         }
         return true;
      }
   }
}


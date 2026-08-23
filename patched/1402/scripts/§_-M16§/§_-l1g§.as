package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJoint;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-xn§;
   import utils.§_-H1o§;
   
   public class §_-l1g§ extends §_-aS§ implements §_-xn§, §_-U1I§, §_-3l§, §_-l2r§, §_-F1c§
   {
      
      private var view:§_-aS§;
      
      private var world:b2World;
      
      private var §_-U2I§:GameBody;
      
      private var §_-up§:Array;
      
      private var §_-j2K§:int = -1;
      
      private var §_-8x§:Boolean;
      
      private var §_-fF§:b2Vec2 = new b2Vec2();
      
      private var joint:b2DistanceJoint;
      
      private var §_-22h§:b2Body;
      
      private var §_-f1g§:Array = [];
      
      private var §_-1h§:int;
      
      private var §_-Rg§:int;
      
      private var §_-w2Y§:Boolean;
      
      public function §_-l1g§()
      {
         super();
         this.view = new §_-aS§(new JointDragView());
         this.view.§_-i18§();
         §_-J2J§(this.view);
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
      
      public function get body() : GameBody
      {
         return this.§_-U2I§;
      }
      
      public function set body(param1:GameBody) : void
      {
         this.§_-U2I§ = param1;
         if(this.parentStarling != null && Boolean(this.body))
         {
            this.parentStarling.removeChildStarling(this,false);
         }
         this.§_-U2I§ = param1;
         if(param1 == null)
         {
            return;
         }
         param1.§_-J2J§(this);
      }
      
      public function get active() : Boolean
      {
         return this.§_-8x§;
      }
      
      public function §_-B3U§() : void
      {
         this.active = false;
      }
      
      public function set active(param1:Boolean) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2DistanceJointDef = null;
         if(this.§_-8x§ == param1)
         {
            return;
         }
         if(!param1)
         {
            this.§_-w2Y§ = false;
            this.§_-f1g§ = [];
         }
         if(!this.body || !this.body.body)
         {
            if(!param1)
            {
               this.§_-8x§ = false;
            }
            else
            {
               §_-p2U§.add("ERROR JointDrag: " + this.body);
            }
            return;
         }
         this.§_-8x§ = param1;
         this.scaleX = this.scaleY = param1 ? 2 : 1;
         if(this.world == null)
         {
            return;
         }
         if(param1)
         {
            if(this.§_-22h§ == null)
            {
               this.§_-22h§ = this.world.CreateBody(new b2BodyDef(true,false,b2Body.b2_kinematicBody));
            }
            _loc2_ = this.body.body.GetWorldPoint(this.position);
            this.§_-22h§.SetPosition(_loc2_);
            if(this.joint == null)
            {
               _loc3_ = new b2DistanceJointDef();
               _loc3_.bodyA = this.body.body;
               _loc3_.bodyB = this.§_-22h§;
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
            if(this.§_-22h§ != null)
            {
               this.world.DestroyBody(this.§_-22h§);
            }
            this.§_-22h§ = null;
         }
      }
      
      public function get §_-y2P§() : b2Vec2
      {
         return this.§_-fF§;
      }
      
      public function set §_-y2P§(param1:b2Vec2) : void
      {
         this.§_-fF§ = param1;
         if(this.§_-22h§ == null || this.body == null || this.body.body == null || !this.active)
         {
            return;
         }
         this.§_-22h§.SetPosition(param1);
         this.§_-22h§.SetAwake(true);
         this.body.body.SetAwake(true);
      }
      
      public function get §_-y2X§() : Array
      {
         return this.§_-f1g§;
      }
      
      public function set §_-y2X§(param1:Array) : void
      {
         if(param1.length == 0)
         {
            return;
         }
         var _loc2_:Boolean = this.§_-f1g§.length == 0;
         this.§_-f1g§ = this.§_-f1g§.concat(param1);
         if(_loc2_)
         {
            this.§_-Rg§ = getTimer();
            this.§_-1h§ = param1[0][0];
         }
      }
      
      public function build(param1:b2World) : void
      {
         this.world = param1;
         this.body = this.body ? this.body : (this.world.userData as SquirrelGame).map.getObject(this.§_-j2K§) as GameBody;
         if(this.body == null)
         {
            this.§_-m20§(param1,this.position);
            if(this.body == null)
            {
               this.visible = false;
               return;
            }
         }
         this.position = this.body.body.GetLocalPoint(this.position);
      }
      
      public function §_-m1Y§() : *
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
         var _loc2_:Array = [_loc1_.x,_loc1_.y,this.active,this.§_-y2P§.x,this.§_-y2P§.y];
         if(this.body)
         {
            _loc2_.push([this.body.id]);
            _loc2_.push(this.§_-y2X§);
         }
         return _loc2_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0],param1[1]);
         this.active = Boolean(param1[2]);
         this.§_-y2P§ = new b2Vec2(param1[3],param1[4]);
         if(!(5 in param1))
         {
            return;
         }
         this.§_-j2K§ = param1[5];
         this.§_-f1g§ = param1[6];
      }
      
      public function dispose() : void
      {
         this.§_-B3U§();
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc3_:Array = null;
         var _loc2_:int = getTimer() - this.§_-Rg§;
         while(this.§_-y2X§.length != 0)
         {
            _loc3_ = this.§_-y2X§[0];
            if(_loc2_ < _loc3_[0] - this.§_-1h§)
            {
               return;
            }
            this.§_-y2P§ = new b2Vec2(_loc3_[1][0],_loc3_[1][1]);
            this.§_-y2X§.shift();
         }
         this.§_-Rg§ = 0;
         this.§_-1h§ = 0;
         if(this.§_-w2Y§)
         {
            this.active = false;
         }
         this.§_-w2Y§ = false;
      }
      
      private function §_-m20§(param1:b2World, param2:b2Vec2) : void
      {
         this.§_-up§ = [];
         param1.QueryPoint(this.§_-eP§,param2);
         this.body = §_-H1o§.§_-XF§(this.§_-up§,this.parentStarling.getChildStarlingIndex(this)) as GameBody;
         this.§_-up§ = null;
      }
      
      private function §_-eP§(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody)
         {
            this.§_-up§.push(_loc2_.GetUserData());
         }
         return true;
      }
   }
}


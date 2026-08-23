package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJoint;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-637§.§_-J14§;
   import §_-81N§.§_-6B§;
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import §_-f17§.§_-Gn§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-s2K§;
   import starling.display.§_-jH§;
   import utils.§_-41A§;
   
   public class BalloonBody extends GameBody implements §_-J14§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      public static const §_-N1H§:Array = [new GlowFilter(16777113,1,10,10,1,1,true,true)];
      
      private static const §_-f2z§:Array = [65484,2520009,15900416,55607,16711833,14674432,0,6697932,14221491,16711680,7395584,16743982];
      
      private var §_-T28§:§_-h2I§;
      
      private var rope:§_-Gn§ = new §_-Gn§(RopeSegmentBallonView);
      
      private var joint:b2DistanceJoint;
      
      private var §_-f1B§:b2DistanceJointDef;
      
      private var §_-aX§:§_-h2I§;
      
      private var §_-83K§:int;
      
      private var §_-23U§:GameBody;
      
      private var §_-K1o§:Hero;
      
      private var world:b2World;
      
      private var §_-j1O§:SquirrelGame;
      
      private var §_-pA§:§_-jH§;
      
      private var §_-Kp§:§_-h2I§;
      
      private var controller:Object;
      
      public var §_-d26§:int = -1;
      
      public var §_-v1h§:Boolean;
      
      public var §_-y2W§:Number = -10;
      
      public function BalloonBody()
      {
         super();
         §_-83v§(this.rope);
         this.§_-pA§ = §_-a2§.§_-i2y§(new BalloonColorImage()) as §_-jH§;
         this.§_-pA§.x = -15;
         this.§_-pA§.y = -20;
         §_-83v§(this.§_-pA§);
         this.§_-Kp§ = new §_-h2I§(new BalloonOver());
         this.§_-Kp§.x = -15;
         this.§_-Kp§.y = -20;
         §_-83v§(this.§_-Kp§);
         this.rope.start = new Point(0,20);
         this.rope.end = new Point(0,50 + 20);
         this.§_-T28§ = new §_-h2I§(new PinUnlimited());
         this.§_-T28§.§_-x2x§();
         this.§_-T28§.x = this.rope.end.x;
         this.§_-T28§.y = this.rope.end.y;
         var _loc1_:§_-h2I§ = new §_-h2I§(new JointDot());
         _loc1_.§_-x2x§();
         _loc1_.x = this.§_-T28§.width * 0.5;
         _loc1_.y = this.§_-T28§.height * 0.5;
         this.§_-T28§.§_-83v§(_loc1_);
         §_-83v§(this.§_-T28§);
         this.§_-Xy§ = false;
         this.§_-f1B§ = new b2DistanceJointDef();
         this.§_-f1B§.length = 5;
         this.§_-f1B§.frequencyHz = 3;
         this.§_-f1B§.localAnchorA = new b2Vec2(0 / Game.§_-x2P§,17 / Game.§_-x2P§);
         this.§_-f1B§.localAnchorB = null;
         this.color = §_-f2z§[int(Math.random() * §_-f2z§.length)];
      }
      
      override public function getRect(param1:DisplayObject) : Rectangle
      {
         if(this.rope.visible)
         {
            return super.getRect(param1);
         }
         return this.§_-Kp§.getRect(param1);
      }
      
      override public function set cacheAsBitmap(param1:Boolean) : void
      {
         this.§_-Kp§.cacheAsBitmap = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         this.controller = new §_-6B§();
         (this.controller as §_-6B§).balloon = this;
         param1.AddController(this.controller as §_-6B§);
         this.world = param1;
         this.§_-j1O§ = param1.userData as SquirrelGame;
         var _loc2_:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
         this.body = param1.CreateBody(_loc2_);
         var _loc3_:b2CircleShape = new b2CircleShape(20 / Game.§_-x2P§);
         var _loc4_:b2FixtureDef = new b2FixtureDef(_loc3_,null,0,0,1,§_-52X§,§_-FN§,-5);
         this.body.CreateFixture(_loc4_);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         super.build(param1);
         this.§_-XR§ = null;
         if(!this.§_-Xy§)
         {
            return;
         }
         this.§_-U2Q§();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         if(this.§_-f1B§ == null || this.§_-f1B§.localAnchorB == null || this.§_-f1B§.localAnchorA == null)
         {
            _loc1_.push([this.color]);
            return _loc1_;
         }
         _loc1_.push([this.color,this.§_-K1o§ ? this.§_-K1o§.id : this.§_-23U§.id,this.§_-K1o§ != null,[this.§_-f1B§.localAnchorA.x,this.§_-f1B§.localAnchorA.y],[this.§_-f1B§.localAnchorB.x,this.§_-f1B§.localAnchorB.y],this.§_-f1B§.length,this.color]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-Xy§ = false;
         var _loc2_:int = §_-u1P§(param1) ? 3 : 1;
         if(!(_loc2_ in param1))
         {
            return;
         }
         this.color = param1[_loc2_][0];
         if(!(1 in param1[_loc2_]))
         {
            return;
         }
         this.§_-f1B§ = new b2DistanceJointDef();
         this.§_-d26§ = param1[_loc2_][1];
         this.§_-v1h§ = Boolean(param1[_loc2_][2]);
         this.§_-f1B§.localAnchorA = new b2Vec2(param1[_loc2_][3][0],param1[_loc2_][3][1]);
         this.§_-f1B§.localAnchorB = new b2Vec2(param1[_loc2_][4][0],param1[_loc2_][4][1]);
         this.§_-f1B§.length = param1[_loc2_][5];
         this.§_-Xy§ = true;
      }
      
      override public function dispose() : void
      {
         this.breakJoint();
         super.dispose();
         this.§_-j1O§ = null;
         this.rope = null;
         this.§_-XR§ = null;
         if(this.controller)
         {
            this.controller.active = false;
            this.controller.balloon = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-a21§();
         if(body == null)
         {
            return;
         }
         if(this.controller)
         {
            this.controller.active = this.body.GetLinearVelocity().y > this.§_-y2W§ && (this.§_-23U§ && this.§_-23U§.body && this.§_-23U§.body.IsActive() || !this.§_-23U§ || !this.§_-23U§.body);
         }
         this.§_-T28§.visible = this.rope.visible = this.joint != null && this.joint.GetUserData() != "destroyed";
         if(!this.joint || this.joint.GetUserData() == "destroyed")
         {
            return;
         }
         var _loc2_:b2Vec2 = this.body.GetLocalPoint(this.§_-K1o§ ? b2Math.AddVV(this.§_-K1o§.position,new b2Vec2(0,-1)) : this.joint.GetAnchorB());
         _loc2_.Multiply(Game.§_-x2P§);
         this.rope.end = new Point(_loc2_.x,_loc2_.y);
         this.§_-T28§.x = this.rope.end.x;
         this.§_-T28§.y = this.rope.end.y;
      }
      
      public function get §_-Xy§() : Boolean
      {
         return this.rope.visible;
      }
      
      public function set §_-Xy§(param1:Boolean) : void
      {
         this.rope.visible = param1;
         this.§_-T28§.visible = param1;
         if(param1)
         {
            this.§_-a21§();
         }
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-j1O§ = param1;
      }
      
      public function get §_-XR§() : §_-h2I§
      {
         return this.§_-aX§;
      }
      
      public function set §_-XR§(param1:§_-h2I§) : void
      {
         if(this.§_-aX§ == param1)
         {
            return;
         }
         this.§_-rd§();
         this.§_-aX§ = param1;
         if(this.§_-aX§ == null)
         {
            return;
         }
         if(this.§_-aX§ is Hero)
         {
            return;
         }
         this.§_-aX§.filters = §_-N1H§;
      }
      
      public function get color() : uint
      {
         return this.§_-83K§;
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-83K§ = param1;
         this.§_-pA§.color = param1;
      }
      
      public function §_-qB§() : void
      {
         this.§_-a21§();
         if(this.§_-XR§ == null)
         {
            this.§_-PS§();
            return;
         }
         var _loc1_:b2Vec2 = new b2Vec2(0 / Game.§_-x2P§,(50 + 17) / Game.§_-x2P§);
         if(this.§_-XR§ is Hero)
         {
            (this.§_-XR§ as Hero).§_-N1W§(this.§_-f1B§,§_-41A§.GetWorldPoint(this,_loc1_),false);
         }
         else
         {
            this.§_-f1B§.localAnchorB = (this.§_-XR§ as GameBody).body.GetLocalPoint(§_-41A§.GetWorldPoint(this,_loc1_));
         }
         this.§_-d26§ = this.§_-XR§ is Hero ? (this.§_-XR§ as Hero).id : (this.§_-XR§ as GameBody).id;
         this.§_-v1h§ = this.§_-XR§ is Hero;
      }
      
      public function §_-PS§() : void
      {
         if(this.§_-f1B§)
         {
            this.§_-f1B§.localAnchorB = null;
         }
         this.§_-d26§ = -1;
         this.§_-v1h§ = false;
      }
      
      public function §_-23§() : void
      {
      }
      
      public function §_-i2G§() : void
      {
         if(!this.body)
         {
            return;
         }
         var _loc1_:BalloonBody = new BalloonBody();
         _loc1_.§_-41M§(this.§_-A1X§());
         _loc1_.playerId = this.playerId;
         _loc1_.§_-123§ = this.§_-123§;
         _loc1_.§_-y2W§ = this.§_-y2W§;
         _loc1_.build(this.world);
         this.§_-j1O§.map.add(_loc1_);
      }
      
      private function §_-31Q§(param1:b2World, param2:b2Vec2) : Object
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         param2 = §_-41A§.GetWorldPoint(this,param2);
         var _loc3_:Array = §_-41A§.§_-D4§(param1,param2,Hero);
         if(_loc3_.length != 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if((_loc3_[_loc5_].GetUserData() as Hero).isSelf)
               {
                  return _loc3_[_loc5_].GetUserData();
               }
               _loc5_++;
            }
            return _loc3_[0].GetUserData();
         }
         var _loc4_:Array = §_-41A§.§_-D4§(param1,param2,GameBody);
         if(_loc4_.length != 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(!(_loc4_[_loc6_].GetUserData() is §_-s2K§))
               {
                  return _loc4_[_loc6_].GetUserData();
               }
               _loc6_++;
            }
         }
         return null;
      }
      
      private function §_-j8§(param1:b2World, param2:b2Vec2) : void
      {
         var _loc3_:Object = this.§_-31Q§(param1,param2);
         this.§_-K1o§ = null;
         this.§_-23U§ = null;
         if(_loc3_ is Hero)
         {
            this.§_-K1o§ = _loc3_ as Hero;
         }
         else if(_loc3_ is GameBody)
         {
            this.§_-23U§ = _loc3_ as GameBody;
         }
      }
      
      private function §_-41K§(param1:Event) : void
      {
         this.breakJoint();
      }
      
      private function breakJoint() : void
      {
         if(this.joint)
         {
            this.body.GetWorld().DestroyJoint(this.joint);
         }
         this.§_-Xy§ = false;
         this.joint = null;
         this.§_-f1B§ = null;
         if(this.§_-K1o§)
         {
            this.§_-K1o§.removeEventListener(Hero.§_-g1O§,this.§_-41K§);
            this.§_-K1o§.§_-bC§ = false;
         }
      }
      
      private function §_-a21§() : void
      {
         if(this.body != null)
         {
            return;
         }
         if(this.§_-j1O§ == null)
         {
            return;
         }
         if(!this.§_-Xy§)
         {
            this.§_-XR§ = null;
            return;
         }
         var _loc1_:b2Vec2 = new b2Vec2(0 / Game.§_-x2P§,(50 + 17) / Game.§_-x2P§);
         this.§_-j8§(this.§_-j1O§.world,_loc1_);
         this.§_-XR§ = (this.§_-23U§ ? this.§_-23U§ : (this.§_-K1o§ ? this.§_-K1o§ : null)) as §_-h2I§;
      }
      
      private function §_-rd§() : void
      {
         var _loc1_:§_-h2I§ = this.§_-XR§ != null ? this.§_-XR§ : (this.§_-23U§ ? this.§_-23U§ : (this.§_-K1o§ ? this.§_-K1o§ : null));
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_ is Hero)
         {
            return;
         }
         _loc1_.filters = [];
      }
      
      private function §_-U2Q§() : void
      {
         if(this.§_-d26§ != -1)
         {
            if(this.§_-v1h§)
            {
               this.§_-K1o§ = (this.world.userData as SquirrelGame).squirrels.get(this.§_-d26§);
            }
            else
            {
               this.§_-23U§ = (this.world.userData as SquirrelGame).map.getObject(this.§_-d26§) as GameBody;
            }
         }
         if(this.§_-23U§ ? this.§_-23U§.body == null : (this.§_-K1o§ ? !this.§_-K1o§.§_-k2W§ : true))
         {
            this.§_-Xy§ = false;
            return;
         }
         this.§_-f1B§.bodyA = this.body;
         if(this.§_-23U§)
         {
            this.§_-f1B§.bodyB = this.§_-23U§.body;
         }
         else
         {
            this.§_-K1o§.§_-oQ§(this.§_-f1B§,false);
         }
         if(this.§_-K1o§)
         {
            this.§_-K1o§.addEventListener(Hero.§_-g1O§,this.§_-41K§);
            this.§_-K1o§.§_-bC§ = true;
         }
         this.§_-f1B§.rope = true;
         this.joint = this.world.CreateJoint(this.§_-f1B§) as b2DistanceJoint;
      }
   }
}


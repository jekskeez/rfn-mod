package §_-8Q§
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
   import §_-82h§.§_-KS§;
   import §_-F5§.§_-Q1r§;
   import §_-H1l§.§_-hE§;
   import §_-TK§.§_-aS§;
   import §_-hd§.§_-01M§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-NA§;
   import starling.display.§_-I2q§;
   import utils.§_-11I§;
   
   public class BalloonBody extends GameBody implements §_-Q1r§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      public static const §_-qh§:Array = [new GlowFilter(16777113,1,10,10,1,1,true,true)];
      
      private static const §_-g2l§:Array = [65484,2520009,15900416,55607,16711833,14674432,0,6697932,14221491,16711680,7395584,16743982];
      
      private var §_-72v§:§_-aS§;
      
      private var rope:§_-KS§ = new §_-KS§(RopeSegmentBallonView);
      
      private var joint:b2DistanceJoint;
      
      private var §_-cJ§:b2DistanceJointDef;
      
      private var §_-T1r§:§_-aS§;
      
      private var §_-T0§:int;
      
      private var §_-22h§:GameBody;
      
      private var §_-41P§:Hero;
      
      private var world:b2World;
      
      private var §_-Y2e§:SquirrelGame;
      
      private var §_-C3B§:§_-I2q§;
      
      private var §_-W1m§:§_-aS§;
      
      private var controller:Object;
      
      public var §_-e1m§:int = -1;
      
      public var §_-a2C§:Boolean;
      
      public var §_-x22§:Number = -10;
      
      public function BalloonBody()
      {
         super();
         §_-J2J§(this.rope);
         this.§_-C3B§ = §_-01M§.§_-Z1V§(new BalloonColorImage()) as §_-I2q§;
         this.§_-C3B§.x = -15;
         this.§_-C3B§.y = -20;
         §_-J2J§(this.§_-C3B§);
         this.§_-W1m§ = new §_-aS§(new BalloonOver());
         this.§_-W1m§.x = -15;
         this.§_-W1m§.y = -20;
         §_-J2J§(this.§_-W1m§);
         this.rope.start = new Point(0,20);
         this.rope.end = new Point(0,50 + 20);
         this.§_-72v§ = new §_-aS§(new PinUnlimited());
         this.§_-72v§.§_-i18§();
         this.§_-72v§.x = this.rope.end.x;
         this.§_-72v§.y = this.rope.end.y;
         var _loc1_:§_-aS§ = new §_-aS§(new JointDot());
         _loc1_.§_-i18§();
         _loc1_.x = this.§_-72v§.width * 0.5;
         _loc1_.y = this.§_-72v§.height * 0.5;
         this.§_-72v§.§_-J2J§(_loc1_);
         §_-J2J§(this.§_-72v§);
         this.§_-e2y§ = false;
         this.§_-cJ§ = new b2DistanceJointDef();
         this.§_-cJ§.length = 5;
         this.§_-cJ§.frequencyHz = 3;
         this.§_-cJ§.localAnchorA = new b2Vec2(0 / Game.§_-12A§,17 / Game.§_-12A§);
         this.§_-cJ§.localAnchorB = null;
         this.color = §_-g2l§[int(Math.random() * §_-g2l§.length)];
      }
      
      override public function getRect(param1:DisplayObject) : Rectangle
      {
         if(this.rope.visible)
         {
            return super.getRect(param1);
         }
         return this.§_-W1m§.getRect(param1);
      }
      
      override public function set cacheAsBitmap(param1:Boolean) : void
      {
         this.§_-W1m§.cacheAsBitmap = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         this.controller = new §_-hE§();
         (this.controller as §_-hE§).balloon = this;
         param1.AddController(this.controller as §_-hE§);
         this.world = param1;
         this.§_-Y2e§ = param1.userData as SquirrelGame;
         var _loc2_:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
         this.body = param1.CreateBody(_loc2_);
         var _loc3_:b2CircleShape = new b2CircleShape(20 / Game.§_-12A§);
         var _loc4_:b2FixtureDef = new b2FixtureDef(_loc3_,null,0,0,1,§_-53X§,§_-C3c§,-5);
         this.body.CreateFixture(_loc4_);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         super.build(param1);
         this.§_-f2y§ = null;
         if(!this.§_-e2y§)
         {
            return;
         }
         this.§_-k2a§();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         if(this.§_-cJ§ == null || this.§_-cJ§.localAnchorB == null || this.§_-cJ§.localAnchorA == null)
         {
            _loc1_.push([this.color]);
            return _loc1_;
         }
         _loc1_.push([this.color,this.§_-41P§ ? this.§_-41P§.id : this.§_-22h§.id,this.§_-41P§ != null,[this.§_-cJ§.localAnchorA.x,this.§_-cJ§.localAnchorA.y],[this.§_-cJ§.localAnchorB.x,this.§_-cJ§.localAnchorB.y],this.§_-cJ§.length,this.color]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-e2y§ = false;
         var _loc2_:int = §_-W1F§(param1) ? 3 : 1;
         if(!(_loc2_ in param1))
         {
            return;
         }
         this.color = param1[_loc2_][0];
         if(!(1 in param1[_loc2_]))
         {
            return;
         }
         this.§_-cJ§ = new b2DistanceJointDef();
         this.§_-e1m§ = param1[_loc2_][1];
         this.§_-a2C§ = Boolean(param1[_loc2_][2]);
         this.§_-cJ§.localAnchorA = new b2Vec2(param1[_loc2_][3][0],param1[_loc2_][3][1]);
         this.§_-cJ§.localAnchorB = new b2Vec2(param1[_loc2_][4][0],param1[_loc2_][4][1]);
         this.§_-cJ§.length = param1[_loc2_][5];
         this.§_-e2y§ = true;
      }
      
      override public function dispose() : void
      {
         this.breakJoint();
         super.dispose();
         this.§_-Y2e§ = null;
         this.rope = null;
         this.§_-f2y§ = null;
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
         this.§_-Fp§();
         if(body == null)
         {
            return;
         }
         if(this.controller)
         {
            this.controller.active = this.body.GetLinearVelocity().y > this.§_-x22§ && (this.§_-22h§ && this.§_-22h§.body && this.§_-22h§.body.IsActive() || !this.§_-22h§ || !this.§_-22h§.body);
         }
         this.§_-72v§.visible = this.rope.visible = this.joint != null && this.joint.GetUserData() != "destroyed";
         if(!this.joint || this.joint.GetUserData() == "destroyed")
         {
            return;
         }
         var _loc2_:b2Vec2 = this.body.GetLocalPoint(this.§_-41P§ ? b2Math.AddVV(this.§_-41P§.position,new b2Vec2(0,-1)) : this.joint.GetAnchorB());
         _loc2_.Multiply(Game.§_-12A§);
         this.rope.end = new Point(_loc2_.x,_loc2_.y);
         this.§_-72v§.x = this.rope.end.x;
         this.§_-72v§.y = this.rope.end.y;
      }
      
      public function get §_-e2y§() : Boolean
      {
         return this.rope.visible;
      }
      
      public function set §_-e2y§(param1:Boolean) : void
      {
         this.rope.visible = param1;
         this.§_-72v§.visible = param1;
         if(param1)
         {
            this.§_-Fp§();
         }
      }
      
      public function set game(param1:SquirrelGame) : void
      {
         this.§_-Y2e§ = param1;
      }
      
      public function get §_-f2y§() : §_-aS§
      {
         return this.§_-T1r§;
      }
      
      public function set §_-f2y§(param1:§_-aS§) : void
      {
         if(this.§_-T1r§ == param1)
         {
            return;
         }
         this.§_-z2W§();
         this.§_-T1r§ = param1;
         if(this.§_-T1r§ == null)
         {
            return;
         }
         if(this.§_-T1r§ is Hero)
         {
            return;
         }
         this.§_-T1r§.filters = §_-qh§;
      }
      
      public function get color() : uint
      {
         return this.§_-T0§;
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-T0§ = param1;
         this.§_-C3B§.color = param1;
      }
      
      public function §_-03o§() : void
      {
         this.§_-Fp§();
         if(this.§_-f2y§ == null)
         {
            this.§_-t2Q§();
            return;
         }
         var _loc1_:b2Vec2 = new b2Vec2(0 / Game.§_-12A§,(50 + 17) / Game.§_-12A§);
         if(this.§_-f2y§ is Hero)
         {
            (this.§_-f2y§ as Hero).§_-B1z§(this.§_-cJ§,§_-11I§.GetWorldPoint(this,_loc1_),false);
         }
         else
         {
            this.§_-cJ§.localAnchorB = (this.§_-f2y§ as GameBody).body.GetLocalPoint(§_-11I§.GetWorldPoint(this,_loc1_));
         }
         this.§_-e1m§ = this.§_-f2y§ is Hero ? (this.§_-f2y§ as Hero).id : (this.§_-f2y§ as GameBody).id;
         this.§_-a2C§ = this.§_-f2y§ is Hero;
      }
      
      public function §_-t2Q§() : void
      {
         if(this.§_-cJ§)
         {
            this.§_-cJ§.localAnchorB = null;
         }
         this.§_-e1m§ = -1;
         this.§_-a2C§ = false;
      }
      
      public function §_-Va§() : void
      {
      }
      
      public function §_-43i§() : void
      {
         if(!this.body)
         {
            return;
         }
         var _loc1_:BalloonBody = new BalloonBody();
         _loc1_.§_-o2I§(this.§_-m1Y§());
         _loc1_.playerId = this.playerId;
         _loc1_.§_-t2F§ = this.§_-t2F§;
         _loc1_.§_-x22§ = this.§_-x22§;
         _loc1_.build(this.world);
         this.§_-Y2e§.map.add(_loc1_);
      }
      
      private function §_-Y6§(param1:b2World, param2:b2Vec2) : Object
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         param2 = §_-11I§.GetWorldPoint(this,param2);
         var _loc3_:Array = §_-11I§.§_-016§(param1,param2,Hero);
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
         var _loc4_:Array = §_-11I§.§_-016§(param1,param2,GameBody);
         if(_loc4_.length != 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(!(_loc4_[_loc6_].GetUserData() is §_-NA§))
               {
                  return _loc4_[_loc6_].GetUserData();
               }
               _loc6_++;
            }
         }
         return null;
      }
      
      private function §_-vt§(param1:b2World, param2:b2Vec2) : void
      {
         var _loc3_:Object = this.§_-Y6§(param1,param2);
         this.§_-41P§ = null;
         this.§_-22h§ = null;
         if(_loc3_ is Hero)
         {
            this.§_-41P§ = _loc3_ as Hero;
         }
         else if(_loc3_ is GameBody)
         {
            this.§_-22h§ = _loc3_ as GameBody;
         }
      }
      
      private function §_-D1p§(param1:Event) : void
      {
         this.breakJoint();
      }
      
      private function breakJoint() : void
      {
         if(this.joint)
         {
            this.body.GetWorld().DestroyJoint(this.joint);
         }
         this.§_-e2y§ = false;
         this.joint = null;
         this.§_-cJ§ = null;
         if(this.§_-41P§)
         {
            this.§_-41P§.removeEventListener(Hero.§_-N2i§,this.§_-D1p§);
            this.§_-41P§.§_-L2u§ = false;
         }
      }
      
      private function §_-Fp§() : void
      {
         if(this.body != null)
         {
            return;
         }
         if(this.§_-Y2e§ == null)
         {
            return;
         }
         if(!this.§_-e2y§)
         {
            this.§_-f2y§ = null;
            return;
         }
         var _loc1_:b2Vec2 = new b2Vec2(0 / Game.§_-12A§,(50 + 17) / Game.§_-12A§);
         this.§_-vt§(this.§_-Y2e§.world,_loc1_);
         this.§_-f2y§ = (this.§_-22h§ ? this.§_-22h§ : (this.§_-41P§ ? this.§_-41P§ : null)) as §_-aS§;
      }
      
      private function §_-z2W§() : void
      {
         var _loc1_:§_-aS§ = this.§_-f2y§ != null ? this.§_-f2y§ : (this.§_-22h§ ? this.§_-22h§ : (this.§_-41P§ ? this.§_-41P§ : null));
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
      
      private function §_-k2a§() : void
      {
         if(this.§_-e1m§ != -1)
         {
            if(this.§_-a2C§)
            {
               this.§_-41P§ = (this.world.userData as SquirrelGame).squirrels.get(this.§_-e1m§);
            }
            else
            {
               this.§_-22h§ = (this.world.userData as SquirrelGame).map.getObject(this.§_-e1m§) as GameBody;
            }
         }
         if(this.§_-22h§ ? this.§_-22h§.body == null : (this.§_-41P§ ? !this.§_-41P§.§_-K13§ : true))
         {
            this.§_-e2y§ = false;
            return;
         }
         this.§_-cJ§.bodyA = this.body;
         if(this.§_-22h§)
         {
            this.§_-cJ§.bodyB = this.§_-22h§.body;
         }
         else
         {
            this.§_-41P§.§_-n2I§(this.§_-cJ§,false);
         }
         if(this.§_-41P§)
         {
            this.§_-41P§.addEventListener(Hero.§_-N2i§,this.§_-D1p§);
            this.§_-41P§.§_-L2u§ = true;
         }
         this.§_-cJ§.rope = true;
         this.joint = this.world.CreateJoint(this.§_-cJ§) as b2DistanceJoint;
      }
   }
}


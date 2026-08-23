package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-Rj§.§_-uq§;
   import §_-Rn§.§_-dv§;
   import §_-f17§.§_-Gn§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-72o§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-X2Z§;
   
   public class §_-v1r§ extends GameBody implements §_-72o§, §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(25 / Game.§_-x2P§,4 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,0.5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-B10§:Array = null;
      
      private var joint:b2Joint = null;
      
      private var §_-f1B§:b2DistanceJointDef = null;
      
      private var §_-Cp§:Point = new Point();
      
      private var body0Id:int = -1;
      
      private var view:§_-h2I§ = null;
      
      private var rope:§_-Gn§ = null;
      
      private var hero:Hero = null;
      
      private var §_-i2J§:b2Joint = null;
      
      private var §_-F1d§:Boolean = false;
      
      public var damping:Number = 0;
      
      public var frequency:Number = 5;
      
      public var anchor0:§_-dv§ = null;
      
      public var body0:GameBody = null;
      
      public var §_-y25§:§_-h2I§ = null;
      
      public function §_-v1r§()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§(new BungeeIcon());
         _loc1_.x = -25;
         _loc1_.y = -40;
         §_-83v§(_loc1_);
         this.§_-y25§ = new §_-h2I§(new PinUnlimited());
         this.view = new §_-h2I§(new BungeeBalkImg());
         this.rope = new §_-Gn§();
         this.view.§_-x2x§();
         this.anchor0 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
         this.fixedRotation = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
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
      
      override public function get angle() : Number
      {
         return 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         §_-83v§(this.rope);
         §_-83v§(this.view);
         §_-83v§(this.§_-y25§);
         this.§_-y25§.§_-x2x§();
         this.view.§_-x2x§();
         this.update();
         if(this.§_-f1B§ == null)
         {
            if(this.body0 == null)
            {
               this.findBody0(param1,this.anchor0.position);
            }
         }
         else
         {
            this.body0 = (param1.userData as SquirrelGame).map.getObject(this.body0Id) as GameBody;
         }
         var _loc2_:b2Body = this.body0 ? this.body0.body : param1.GetGroundBody();
         if(this.§_-f1B§ != null)
         {
            this.§_-f1B§.bodyA = _loc2_;
            this.§_-f1B§.bodyB = this.body;
            this.§_-f1B§.rope = true;
         }
         else
         {
            this.§_-f1B§ = new b2DistanceJointDef();
            this.§_-f1B§.Initialize(_loc2_,this.body,this.anchor0.position,this.position);
            this.§_-f1B§.rope = true;
         }
         this.§_-f1B§.dampingRatio = this.damping;
         this.§_-f1B§.frequencyHz = this.frequency;
         this.§_-f1B§.collideConnected = true;
         this.joint = param1.CreateJoint(this.§_-f1B§);
         this.visible = true;
         if(this.§_-F1d§)
         {
            this.position = this.anchor0.position.Copy();
         }
         this.anchor0.position = this.§_-f1B§.localAnchorA;
         if(this.body0 != null)
         {
            this.body0.§_-83v§(this.anchor0);
         }
      }
      
      override public function dispose() : void
      {
         if(this.anchor0 != null)
         {
            this.anchor0.dispose();
         }
         this.anchor0 = null;
         if(this.joint != null)
         {
            this.§_-H2D§.world.DestroyJoint(this.joint);
         }
         this.joint = null;
         this.§_-L1Z§();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.body ? false : this.§_-F1d§,this.frequency,this.damping]);
         if(this.§_-f1B§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,[this.§_-f1B§.localAnchorA.x,this.§_-f1B§.localAnchorA.y],this.§_-f1B§.length]);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.§_-F1d§ = Boolean(param1[2][0]);
         this.frequency = param1[2][1];
         this.damping = param1[2][2];
         if(!(3 in param1))
         {
            return;
         }
         this.§_-f1B§ = new b2DistanceJointDef();
         this.body0Id = param1[3][0];
         this.§_-f1B§.localAnchorA = new b2Vec2(param1[3][1][0],param1[3][1][1]);
         this.§_-f1B§.localAnchorB = new b2Vec2(0,0);
         this.§_-f1B§.length = param1[3][2];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.rotation = 0;
         var _loc2_:b2Vec2 = this.joint ? this.joint.GetAnchorA().Copy() : this.anchor0.position.Copy();
         _loc2_.Subtract(this.position);
         _loc2_.Multiply(Game.§_-x2P§);
         this.§_-Cp§.setTo(0,0);
         this.rope.start = this.§_-Cp§;
         this.§_-Cp§.setTo(_loc2_.x,_loc2_.y);
         this.rope.end = this.§_-Cp§;
         this.§_-y25§.x = this.§_-Cp§.x;
         this.§_-y25§.y = this.§_-Cp§.y;
      }
      
      public function set §_-g1K§(param1:Boolean) : void
      {
         this.§_-F1d§ = param1;
         this.visible = !param1;
      }
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         §_-83v§(this.rope);
         §_-83v§(this.view);
         param1.add(this.anchor0);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(0,-34 / Game.§_-x2P§));
         this.anchor0.position = _loc2_;
         this.update();
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         this.anchor0.dispose();
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
         param1.add(this.anchor0);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("bungee"))
         {
            return;
         }
         if(this.hero != null)
         {
            return;
         }
         this.§_-oJ§(_loc2_.id);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
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
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.body0)
         {
            this.§_-B10§.push(_loc2_.GetUserData());
         }
         return true;
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-L1Z§();
      }
      
      private function §_-oJ§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.pinSquirrel(param1);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"pinBungeeSquirrel":[this.id,param1]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§ || this.hero != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("bungee"))
         {
            return;
         }
         this.hero = _loc2_;
         this.hero.§_-bC§ = true;
         this.hero.addEventListener(Hero.§_-g1O§,this.§_-jf§);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.body;
         _loc2_.§_-K18§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-i2J§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-i2J§.SetUserData("bungee");
      }
      
      private function §_-L1Z§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.§_-bC§ = false;
         this.hero.removeEventListener(Hero.§_-g1O§,this.§_-jf§);
         setTimeout(this.§_-j10§,300);
         if(this.§_-i2J§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-i2J§);
            this.§_-i2J§ = null;
         }
      }
      
      private function §_-j10§() : void
      {
         this.hero = null;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("pinBungeeSquirrel" in _loc2_)
         {
            if(_loc2_["pinBungeeSquirrel"][0] != this.id)
            {
               return;
            }
            this.pinSquirrel(_loc2_["pinBungeeSquirrel"][1]);
         }
      }
   }
}


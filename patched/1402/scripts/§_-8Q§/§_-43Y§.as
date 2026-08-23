package §_-8Q§
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
   import §_-82h§.§_-KS§;
   import §_-M16§.§_-gy§;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import §_-l2u§.§_-t2k§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-hQ§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-H1o§;
   
   public class §_-43Y§ extends GameBody implements §_-hQ§, §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(25 / Game.§_-12A§,4 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-up§:Array = null;
      
      private var joint:b2Joint = null;
      
      private var §_-cJ§:b2DistanceJointDef = null;
      
      private var §_-g2G§:Point = new Point();
      
      private var body0Id:int = -1;
      
      private var view:§_-aS§ = null;
      
      private var rope:§_-KS§ = null;
      
      private var hero:Hero = null;
      
      private var §_-C1I§:b2Joint = null;
      
      private var §_-La§:Boolean = false;
      
      public var damping:Number = 0;
      
      public var frequency:Number = 5;
      
      public var anchor0:§_-gy§ = null;
      
      public var body0:GameBody = null;
      
      public var §_-w2F§:§_-aS§ = null;
      
      public function §_-43Y§()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§(new BungeeIcon());
         _loc1_.x = -25;
         _loc1_.y = -40;
         §_-J2J§(_loc1_);
         this.§_-w2F§ = new §_-aS§(new PinUnlimited());
         this.view = new §_-aS§(new BungeeBalkImg());
         this.rope = new §_-KS§();
         this.view.§_-i18§();
         this.anchor0 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.fixedRotation = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
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
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         §_-J2J§(this.rope);
         §_-J2J§(this.view);
         §_-J2J§(this.§_-w2F§);
         this.§_-w2F§.§_-i18§();
         this.view.§_-i18§();
         this.update();
         if(this.§_-cJ§ == null)
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
         if(this.§_-cJ§ != null)
         {
            this.§_-cJ§.bodyA = _loc2_;
            this.§_-cJ§.bodyB = this.body;
            this.§_-cJ§.rope = true;
         }
         else
         {
            this.§_-cJ§ = new b2DistanceJointDef();
            this.§_-cJ§.Initialize(_loc2_,this.body,this.anchor0.position,this.position);
            this.§_-cJ§.rope = true;
         }
         this.§_-cJ§.dampingRatio = this.damping;
         this.§_-cJ§.frequencyHz = this.frequency;
         this.§_-cJ§.collideConnected = true;
         this.joint = param1.CreateJoint(this.§_-cJ§);
         this.visible = true;
         if(this.§_-La§)
         {
            this.position = this.anchor0.position.Copy();
         }
         this.anchor0.position = this.§_-cJ§.localAnchorA;
         if(this.body0 != null)
         {
            this.body0.§_-J2J§(this.anchor0);
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
            this.§_-21H§.world.DestroyJoint(this.joint);
         }
         this.joint = null;
         this.§_-V14§();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.body ? false : this.§_-La§,this.frequency,this.damping]);
         if(this.§_-cJ§ != null)
         {
            _loc1_.push([this.body0 ? this.body0.id : -1,[this.§_-cJ§.localAnchorA.x,this.§_-cJ§.localAnchorA.y],this.§_-cJ§.length]);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.§_-La§ = Boolean(param1[2][0]);
         this.frequency = param1[2][1];
         this.damping = param1[2][2];
         if(!(3 in param1))
         {
            return;
         }
         this.§_-cJ§ = new b2DistanceJointDef();
         this.body0Id = param1[3][0];
         this.§_-cJ§.localAnchorA = new b2Vec2(param1[3][1][0],param1[3][1][1]);
         this.§_-cJ§.localAnchorB = new b2Vec2(0,0);
         this.§_-cJ§.length = param1[3][2];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.rotation = 0;
         var _loc2_:b2Vec2 = this.joint ? this.joint.GetAnchorA().Copy() : this.anchor0.position.Copy();
         _loc2_.Subtract(this.position);
         _loc2_.Multiply(Game.§_-12A§);
         this.§_-g2G§.setTo(0,0);
         this.rope.start = this.§_-g2G§;
         this.§_-g2G§.setTo(_loc2_.x,_loc2_.y);
         this.rope.end = this.§_-g2G§;
         this.§_-w2F§.x = this.§_-g2G§.x;
         this.§_-w2F§.y = this.§_-g2G§.y;
      }
      
      public function set §_-wN§(param1:Boolean) : void
      {
         this.§_-La§ = param1;
         this.visible = !param1;
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         §_-J2J§(this.rope);
         §_-J2J§(this.view);
         param1.add(this.anchor0);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(0,-34 / Game.§_-12A§));
         this.anchor0.position = _loc2_;
         this.update();
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         this.anchor0.dispose();
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
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
         this.§_-Z2m§(_loc2_.id);
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
         this.§_-up§ = [];
         param1.QueryPoint(this.queryBody0,param2);
         this.body0 = §_-H1o§.§_-XF§(this.§_-up§,this.anchor0.parentStarling.getChildStarlingIndex(this.anchor0)) as GameBody;
         this.§_-up§ = null;
      }
      
      private function queryBody0(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is GameBody && _loc2_.GetUserData() != this.body0)
         {
            this.§_-up§.push(_loc2_.GetUserData());
         }
         return true;
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-V14§();
      }
      
      private function §_-Z2m§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.pinSquirrel(param1);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"pinBungeeSquirrel":[this.id,param1]}));
         }
      }
      
      private function pinSquirrel(param1:int) : void
      {
         if(!this.§_-21H§ || this.hero != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("bungee"))
         {
            return;
         }
         this.hero = _loc2_;
         this.hero.§_-L2u§ = true;
         this.hero.addEventListener(Hero.§_-N2i§,this.§_-A1R§);
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.body;
         _loc2_.§_-ZW§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2();
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-C1I§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-C1I§.SetUserData("bungee");
      }
      
      private function §_-V14§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.§_-L2u§ = false;
         this.hero.removeEventListener(Hero.§_-N2i§,this.§_-A1R§);
         setTimeout(this.§_-LU§,300);
         if(this.§_-C1I§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-C1I§);
            this.§_-C1I§ = null;
         }
      }
      
      private function §_-LU§() : void
      {
         this.hero = null;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
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


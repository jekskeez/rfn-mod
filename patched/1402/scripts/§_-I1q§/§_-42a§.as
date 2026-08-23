package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.Joints.b2DistanceJoint;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-82h§.§_-KS§;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-Rp§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-sn§;
   
   public class §_-42a§ extends GameBody implements §_-sn§, §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 1;
      
      public static const §_-qU§:int = 120;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(3 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var §_-62I§:Number = 10;
      
      protected var view:§_-f1u§;
      
      protected var controller:b2ConstantAccelController;
      
      protected var world:b2World;
      
      protected var joint:b2DistanceJoint;
      
      protected var §_-cJ§:b2DistanceJointDef;
      
      protected var rope:§_-KS§;
      
      protected var hero:Hero;
      
      protected var lifeTime:Number = 1000;
      
      protected var §_-22Y§:Number = 120;
      
      protected var §_-32K§:§_-aS§ = null;
      
      public function §_-42a§()
      {
         super();
         this.view = this.§_-U25§();
         this.view.visible = false;
         §_-J2J§(this.view);
         this.rope = this.§_-m2S§();
         this.rope.start = new Point(0,0);
         this.rope.visible = false;
         §_-J2J§(this.rope);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetBullet(true);
         this.world = param1;
         super.build(param1);
         if(!this.§_-32u§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(200,0)));
         }
         if(this.§_-21H§.squirrels is §_-Rp§)
         {
            this.hero = (this.§_-21H§.squirrels as §_-Rp§).self;
         }
         else
         {
            this.hero = this.§_-21H§.squirrels.get(this.playerId);
         }
         this.view.rotation = 90;
         this.view.visible = true;
         this.view.loop = true;
         this.view.play();
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.body) && !this.fixed)
         {
            this.lifeTime -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.breakJoint();
               return;
            }
         }
         if(!this.hero || this.hero.isDead)
         {
            this.breakJoint();
            return;
         }
         if(!this.joint)
         {
            return;
         }
         if(this.joint.GetLength() <= 1)
         {
            this.breakJoint();
            return;
         }
         if(this.joint.GetLength() > this.minLength)
         {
            this.joint.SetLength(this.joint.GetLength() - param1 * this.§_-62I§);
         }
         var _loc2_:b2Vec2 = this.body.GetLocalPoint(b2Math.AddVV(this.hero.position,new b2Vec2(-1,0)));
         _loc2_.Multiply(Game.§_-12A§);
         this.rope.end = new Point(_loc2_.x,_loc2_.y);
      }
      
      override public function dispose() : void
      {
         this.breakJoint();
         this.§_-32K§ = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push(this.§_-62I§);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-62I§ = param1[1];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.fixed = true;
         this.view.stop();
         setTimeout(this.§_-d2x§,100);
      }
      
      public function get minLength() : Number
      {
         return 0;
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
      
      public function get maxVelocity() : Number
      {
         return this.§_-22Y§;
      }
      
      public function set maxVelocity(param1:Number) : void
      {
         this.§_-22Y§ = param1;
      }
      
      public function get aimCursor() : §_-aS§
      {
         if(this.§_-32K§ == null)
         {
            this.§_-32K§ = new §_-aS§(new AimCursor());
         }
         return this.§_-32K§;
      }
      
      public function §_-a2l§(param1:Point) : void
      {
         this.§_-32K§.x = param1.x;
         this.§_-32K§.y = param1.y;
      }
      
      public function breakJoint(param1:Event = null) : void
      {
         if(this.joint)
         {
            this.body.GetWorld().DestroyJoint(this.joint);
         }
         this.rope.visible = false;
         this.joint = null;
         this.§_-cJ§ = null;
         if(this.hero)
         {
            this.hero.removeEventListener(Hero.§_-N2i§,this.breakJoint);
            this.hero.§_-L2u§ = false;
         }
         if(this.body != null)
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
      
      protected function §_-U25§() : §_-f1u§
      {
         return null;
      }
      
      protected function §_-m2S§() : §_-KS§
      {
         return new §_-KS§();
      }
      
      protected function §_-d2x§() : void
      {
         if(!this.hero || !this.body)
         {
            return;
         }
         var _loc1_:b2Vec2 = this.position.Copy();
         _loc1_.Subtract(this.hero.position);
         this.§_-cJ§ = new b2DistanceJointDef();
         this.§_-cJ§.length = _loc1_.Length();
         this.§_-cJ§.frequencyHz = 10;
         this.§_-cJ§.localAnchorA = new b2Vec2();
         this.§_-cJ§.rope = true;
         this.§_-cJ§.bodyA = this.body;
         this.hero.§_-n2I§(this.§_-cJ§,false);
         this.rope.end = new Point(0,0);
         this.rope.visible = true;
         this.joint = this.world.CreateJoint(this.§_-cJ§) as b2DistanceJoint;
         this.hero.addEventListener(Hero.§_-N2i§,this.breakJoint);
         this.hero.§_-L2u§ = true;
      }
   }
}


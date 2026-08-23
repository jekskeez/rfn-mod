package §_-u2r§
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
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-W28§;
   import §_-f17§.§_-Gn§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-314§;
   
   public class §_-41Q§ extends GameBody implements §_-314§, §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      public static const §_-m2H§:int = 120;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(3 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,0.5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var §_-Hu§:Number = 10;
      
      protected var view:§_-d2d§;
      
      protected var controller:b2ConstantAccelController;
      
      protected var world:b2World;
      
      protected var joint:b2DistanceJoint;
      
      protected var §_-f1B§:b2DistanceJointDef;
      
      protected var rope:§_-Gn§;
      
      protected var hero:Hero;
      
      protected var lifeTime:Number = 1000;
      
      protected var §_-s2h§:Number = 120;
      
      protected var §_-52w§:§_-h2I§ = null;
      
      public function §_-41Q§()
      {
         super();
         this.view = this.§_-61E§();
         this.view.visible = false;
         §_-83v§(this.view);
         this.rope = this.§_-Xw§();
         this.rope.start = new Point(0,0);
         this.rope.visible = false;
         §_-83v§(this.rope);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetBullet(true);
         this.world = param1;
         super.build(param1);
         if(!this.§_-m1I§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(200,0)));
         }
         if(this.§_-H2D§.squirrels is §_-W28§)
         {
            this.hero = (this.§_-H2D§.squirrels as §_-W28§).self;
         }
         else
         {
            this.hero = this.§_-H2D§.squirrels.get(this.playerId);
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
            this.joint.SetLength(this.joint.GetLength() - param1 * this.§_-Hu§);
         }
         var _loc2_:b2Vec2 = this.body.GetLocalPoint(b2Math.AddVV(this.hero.position,new b2Vec2(-1,0)));
         _loc2_.Multiply(Game.§_-x2P§);
         this.rope.end = new Point(_loc2_.x,_loc2_.y);
      }
      
      override public function dispose() : void
      {
         this.breakJoint();
         this.§_-52w§ = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push(this.§_-Hu§);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-Hu§ = param1[1];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.fixed = true;
         this.view.stop();
         setTimeout(this.§_-w6§,100);
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
         return this.§_-s2h§;
      }
      
      public function set maxVelocity(param1:Number) : void
      {
         this.§_-s2h§ = param1;
      }
      
      public function get aimCursor() : §_-h2I§
      {
         if(this.§_-52w§ == null)
         {
            this.§_-52w§ = new §_-h2I§(new AimCursor());
         }
         return this.§_-52w§;
      }
      
      public function §_-l1o§(param1:Point) : void
      {
         this.§_-52w§.x = param1.x;
         this.§_-52w§.y = param1.y;
      }
      
      public function breakJoint(param1:Event = null) : void
      {
         if(this.joint)
         {
            this.body.GetWorld().DestroyJoint(this.joint);
         }
         this.rope.visible = false;
         this.joint = null;
         this.§_-f1B§ = null;
         if(this.hero)
         {
            this.hero.removeEventListener(Hero.§_-g1O§,this.breakJoint);
            this.hero.§_-bC§ = false;
         }
         if(this.body != null)
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
      
      protected function §_-61E§() : §_-d2d§
      {
         return null;
      }
      
      protected function §_-Xw§() : §_-Gn§
      {
         return new §_-Gn§();
      }
      
      protected function §_-w6§() : void
      {
         if(!this.hero || !this.body)
         {
            return;
         }
         var _loc1_:b2Vec2 = this.position.Copy();
         _loc1_.Subtract(this.hero.position);
         this.§_-f1B§ = new b2DistanceJointDef();
         this.§_-f1B§.length = _loc1_.Length();
         this.§_-f1B§.frequencyHz = 10;
         this.§_-f1B§.localAnchorA = new b2Vec2();
         this.§_-f1B§.rope = true;
         this.§_-f1B§.bodyA = this.body;
         this.hero.§_-oQ§(this.§_-f1B§,false);
         this.rope.end = new Point(0,0);
         this.rope.visible = true;
         this.joint = this.world.CreateJoint(this.§_-f1B§) as b2DistanceJoint;
         this.hero.addEventListener(Hero.§_-g1O§,this.breakJoint);
         this.hero.§_-bC§ = true;
      }
   }
}


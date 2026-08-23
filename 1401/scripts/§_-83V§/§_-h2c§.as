package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-d2d§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-s2K§;
   
   public class §_-h2c§ extends GameBody implements §_-s2K§, §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-61g§:Number = 0;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsVector(§_-b2Y§,0);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-v1d§:Number = -Math.PI;
      
      public var delayTime:Number = 2000;
      
      public var workTime:Number = 5000;
      
      private var view:§_-d2d§ = null;
      
      private var §_-91m§:Number = 0;
      
      private var §_-e2U§:Boolean = false;
      
      private var §_-O2v§:Array = [];
      
      private var §_-02k§:Number = -5;
      
      public function §_-h2c§()
      {
         super();
         this.view = new §_-d2d§(new ConveyorView());
         this.view.loop = true;
         this.view.stop();
         this.view.x = 0;
         this.view.y = 0;
         §_-83v§(this.view);
         this.fixed = true;
      }
      
      private static function get §_-b2Y§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-7,-1.25));
         _loc1_.push(new b2Vec2(7,-1.25));
         _loc1_.push(new b2Vec2(7.9,0));
         _loc1_.push(new b2Vec2(7,1.25));
         _loc1_.push(new b2Vec2(-7,1.25));
         _loc1_.push(new b2Vec2(-7.9,0));
         return _loc1_;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         this.§_-O2v§ = null;
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-91m§ <= 0)
         {
            this.§_-vn§ = !this.§_-vn§;
            this.§_-91m§ = this.§_-vn§ ? this.workTime : this.delayTime;
         }
         else
         {
            this.§_-91m§ -= param1 * 1000;
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.velocity,this.workTime,this.delayTime,this.§_-vn§,this.§_-91m§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.velocity = param1[1][0];
         this.workTime = param1[1][1];
         this.delayTime = param1[1][2];
         this.§_-vn§ = Boolean(param1[1][3]);
         this.§_-91m§ = param1[1][4];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2Body = null;
         if(param1.GetFixtureA().GetUserData() == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody();
         }
         else
         {
            _loc2_ = param1.GetFixtureA().GetBody();
         }
         this.§_-O2v§.push(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         var _loc2_:b2Body = null;
         if(param1.GetFixtureA().GetUserData() == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody();
         }
         else
         {
            _loc2_ = param1.GetFixtureA().GetBody();
         }
         var _loc3_:int = this.§_-O2v§.indexOf(_loc2_);
         if(_loc3_ == -1)
         {
            return;
         }
         this.§_-O2v§.push(_loc2_);
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(!this.§_-vn§)
         {
            return;
         }
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:b2Vec2 = this.body.GetLocalPoint(_loc3_.m_points[0]);
         var _loc5_:Number = Math.atan2(_loc4_.y,_loc4_.x);
         if(§_-v1d§ > _loc5_ || §_-61g§ < _loc5_)
         {
            return;
         }
         param1.SetTangentSpeed(this.velocity);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      private function set §_-vn§(param1:Boolean) : void
      {
         if(this.§_-e2U§ == param1)
         {
            return;
         }
         if(!param1 && this.delayTime == 0)
         {
            return;
         }
         this.§_-e2U§ = param1;
         if(param1)
         {
            this.view.play();
         }
         else
         {
            this.view.stop();
         }
         if(!param1)
         {
            return;
         }
         var _loc2_:* = int(this.§_-O2v§.length - 1);
         while(_loc2_ >= 0)
         {
            (this.§_-O2v§[_loc2_] as b2Body).ApplyImpulse(this.body.GetWorldVector(new b2Vec2(0,0.1)),(this.§_-O2v§[_loc2_] as b2Body).GetWorldCenter());
            _loc2_--;
         }
      }
      
      private function get §_-vn§() : Boolean
      {
         return this.§_-e2U§;
      }
   }
}


package §_-u2r§
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
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-12U§ extends GameBody implements §_-Q2k§, §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-S13§:Number = 0.8;
      
      private static const §_-l2H§:Number = 0.8;
      
      private static const §_-7z§:Number = 3;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-qO§:b2PolygonShape = b2PolygonShape.AsVector(§_-DI§,0);
      
      private static const §_-f1I§:b2PolygonShape = b2PolygonShape.AsVector(§_-4k§,0);
      
      private static const §_-s26§:b2PolygonShape = b2PolygonShape.AsOrientedBox(1.6,0.1,new b2Vec2(0.1,-1.9));
      
      private static const §_-oo§:b2FixtureDef = new b2FixtureDef(§_-qO§,null,0.5,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-33H§:b2FixtureDef = new b2FixtureDef(§_-f1I§,null,0.5,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-ky§:b2FixtureDef = new b2FixtureDef(§_-s26§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var bouncingFactor:Number = 50;
      
      private var view:§_-h2I§ = null;
      
      private var §_-52A§:Number = 1;
      
      private var §_-N2X§:Number = 0;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 18000;
      
      private var §_-01O§:Boolean = false;
      
      public function §_-12U§()
      {
         super();
         this.view = new §_-h2I§(new HippieFlowerView());
         this.view.x = -(this.view.width * 0.5);
         this.view.y = -this.view.height + 12;
         §_-83v§(this.view);
         this.fixed = true;
      }
      
      private static function get §_-DI§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-0.15,0.8));
         _loc1_.push(new b2Vec2(-1.8,-1.7));
         _loc1_.push(new b2Vec2(1.8,-1.7));
         _loc1_.push(new b2Vec2(0.15,0.8));
         return _loc1_;
      }
      
      private static function get §_-4k§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-0.15,1.7));
         _loc1_.push(new b2Vec2(-0.15,0.8));
         _loc1_.push(new b2Vec2(0.15,0.8));
         _loc1_.push(new b2Vec2(0.15,1.8));
         return _loc1_;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-oo§);
         this.body.CreateFixture(§_-33H§);
         this.body.CreateFixture(§_-ky§).SetUserData(this);
         super.build(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.§_-O1u§ || this.§_-01O§)
         {
            return;
         }
         this.§_-m1P§(param1);
         this.§_-C2o§ -= param1 * 1000;
         if(this.§_-C2o§ <= 0)
         {
            this.§_-b16§();
         }
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(this.body.GetTransform().R.col2.y * _loc3_.m_normal.y >= 0);
         }
         else
         {
            param1.SetEnabled(this.body.GetTransform().R.col2.y * _loc3_.m_normal.y < 0);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         var _loc3_:Hero = null;
         if(param1.GetFixtureA().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureA().GetUserData() as Hero;
         }
         if(param1.GetFixtureB().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureB().GetUserData() as Hero;
         }
         if(!_loc3_)
         {
            return;
         }
         this.§_-pv§(_loc3_);
      }
      
      private function §_-m1P§(param1:Number) : void
      {
         if(this.§_-52A§ <= 1)
         {
            return;
         }
         this.§_-N2X§ -= param1;
         if(this.§_-N2X§ <= 0)
         {
            this.§_-52A§ = 1;
         }
      }
      
      private function §_-pv§(param1:Hero) : void
      {
         this.§_-N2X§ = §_-S13§;
         if(this.§_-52A§ < §_-7z§)
         {
            this.§_-52A§ += §_-l2H§;
         }
         param1.velocity = new b2Vec2();
         var _loc2_:b2Vec2 = this.body.GetTransform().R.col2.Copy();
         _loc2_.Multiply(-this.bouncingFactor * this.§_-52A§);
         param1.§_-53N§(_loc2_);
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2MassData;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-f2A§;
   import sounds.GameSounds;
   
   public class WeightBody extends GameBody implements §_-22J§, §_-21e§, §_-Q2k§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-02r§:Number = 15 / Game.§_-x2P§;
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(§_-02r§);
      
      private static const SHAPE2:b2CircleShape = new b2CircleShape(§_-02r§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,15,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[0,-(20 / Game.§_-x2P§)],[0,0]];
      
      private var §_-r1C§:Boolean = false;
      
      private var §_-O1u§:Boolean = false;
      
      private var §_-C2o§:Number = 0;
      
      private var §_-01O§:Boolean = false;
      
      public function WeightBody()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§(new Weight());
         _loc1_.§_-x2x§();
         _loc1_.y = -10;
         §_-83v§(_loc1_);
         _loc1_ = null;
      }
      
      override public function build(param1:b2World) : void
      {
         §_-03A§.shape = SHAPE1;
         SHAPE1.SetLocalPosition(new b2Vec2(0,0));
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         §_-03A§.shape = SHAPE2;
         SHAPE2.SetLocalPosition(new b2Vec2(0,-18 / Game.§_-x2P§));
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.§_-r1C§ = false;
         super.build(param1);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.aging,this.lifeTime,this.mass]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(!("1" in param1))
         {
            return;
         }
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.mass = param1[1][2];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            if(!this.aging || this.§_-01O§)
            {
               return;
            }
            this.§_-C2o§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-b16§();
            }
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
         if(param1.GetFixtureA().GetUserData() is Hero || param1.GetFixtureB().GetUserData() is Hero)
         {
            return;
         }
         this.§_-r1C§ = true;
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(!this.§_-r1C§)
         {
            return;
         }
         this.§_-r1C§ = false;
         var _loc3_:Number = param1.GetManifold().m_points[0].m_normalImpulse + param1.GetManifold().m_points[1].m_normalImpulse;
         if(_loc3_ > 1000)
         {
            GameSounds.playUnrepeatable("girya");
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
      
      public function set mass(param1:Number) : void
      {
         if(!this.body)
         {
            return;
         }
         var _loc2_:b2MassData = new b2MassData();
         this.body.GetMassData(_loc2_);
         _loc2_.mass = param1;
         this.body.SetMassData(_loc2_);
      }
      
      public function get mass() : Number
      {
         if(!this.body)
         {
            return 0;
         }
         var _loc1_:b2MassData = new b2MassData();
         this.body.GetMassData(_loc1_);
         return _loc1_.mass;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         this.removeFromParent();
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


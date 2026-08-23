package §_-8Q§
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
   import §_-22D§.TweenMax;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import sounds.GameSounds;
   
   public class WeightBody extends GameBody implements §_-Pn§, §_-e2t§, §_-71b§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-jX§:Number = 15 / Game.§_-12A§;
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(§_-jX§);
      
      private static const SHAPE2:b2CircleShape = new b2CircleShape(§_-jX§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,15,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[0,-(20 / Game.§_-12A§)],[0,0]];
      
      private var §_-F2N§:Boolean = false;
      
      private var §_-837§:Boolean = false;
      
      private var §_-Q26§:Number = 0;
      
      private var §_-C1L§:Boolean = false;
      
      public function WeightBody()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§(new Weight());
         _loc1_.§_-i18§();
         _loc1_.y = -10;
         §_-J2J§(_loc1_);
         _loc1_ = null;
      }
      
      override public function build(param1:b2World) : void
      {
         §_-ql§.shape = SHAPE1;
         SHAPE1.SetLocalPosition(new b2Vec2(0,0));
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         §_-ql§.shape = SHAPE2;
         SHAPE2.SetLocalPosition(new b2Vec2(0,-18 / Game.§_-12A§));
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.§_-F2N§ = false;
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime,this.mass]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
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
            if(!this.aging || this.§_-C1L§)
            {
               return;
            }
            this.§_-Q26§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-th§();
            }
         }
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(param1.GetFixtureA().GetUserData() is Hero || param1.GetFixtureB().GetUserData() is Hero)
         {
            return;
         }
         this.§_-F2N§ = true;
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(!this.§_-F2N§)
         {
            return;
         }
         this.§_-F2N§ = false;
         var _loc3_:Number = param1.GetManifold().m_points[0].m_normalImpulse + param1.GetManifold().m_points[1].m_normalImpulse;
         if(_loc3_ > 1000)
         {
            GameSounds.playUnrepeatable("girya");
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
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
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
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
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


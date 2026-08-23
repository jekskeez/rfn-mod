package §_-Q2§
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
   import §_-22D§.TweenMax;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-NA§;
   
   public class §_-l2K§ extends GameBody implements §_-Pn§, §_-NA§, §_-71b§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-w1X§:Number = 4;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(2,0.05);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_kinematicBody);
      
      public var §_-32l§:int = 0;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 0;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-E2z§:§_-aS§ = null;
      
      public function §_-l2K§()
      {
         super();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.§_-32l§,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-32l§ = param1[1][0];
         this.aging = Boolean(param1[1][1]);
         this.lifeTime = param1[1][2];
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-E2z§ = new §_-aS§(this.§_-32l§ != 0 ? new DeathCloudImg() : new DeathCloudGhostImg());
         §_-J2J§(this.§_-E2z§);
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(new b2FixtureDef(§_-G2l§,null,0.8,0.1,10000,this.categoriesBits,§_-C3c§,0)).SetUserData(this);
         super.build(param1);
         this.linearVelocity = this.body.GetWorldVector(new b2Vec2(0,-§_-w1X§ * (this.§_-32l§ >= 2 ? 0.5 : 1)));
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
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc4_ = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         }
         else if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc4_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(_loc4_.§_-A1w§(_loc3_.m_normal).y >= 0 && this.§_-32l§ != 0);
         }
         else
         {
            param1.SetEnabled(_loc4_.§_-A1w§(_loc3_.m_normal).y < 0 && this.§_-32l§ != 0);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function get categoriesBits() : uint
      {
         return this.§_-32l§ != 0 ? §_-53X§ : uint(§_-q2c§.§_-o2l§);
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
         if(this.body == null)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


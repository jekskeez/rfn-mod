package §_-b1B§
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
   import §_-42B§.TweenMax;
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-s2K§;
   
   public class §_-q2n§ extends GameBody implements §_-22J§, §_-s2K§, §_-Q2k§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-zL§:Number = 4;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(2,0.05);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_kinematicBody);
      
      public var §_-j2Y§:int = 0;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 0;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-W1r§:§_-h2I§ = null;
      
      public function §_-q2n§()
      {
         super();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.§_-j2Y§,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-j2Y§ = param1[1][0];
         this.aging = Boolean(param1[1][1]);
         this.lifeTime = param1[1][2];
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-W1r§ = new §_-h2I§(this.§_-j2Y§ != 0 ? new DeathCloudImg() : new DeathCloudGhostImg());
         §_-83v§(this.§_-W1r§);
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(new b2FixtureDef(§_-L1E§,null,0.8,0.1,10000,this.categoriesBits,§_-FN§,0)).SetUserData(this);
         super.build(param1);
         this.linearVelocity = this.body.GetWorldVector(new b2Vec2(0,-§_-zL§ * (this.§_-j2Y§ >= 2 ? 0.5 : 1)));
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
            param1.SetEnabled(_loc4_.§_-n2Y§(_loc3_.m_normal).y >= 0 && this.§_-j2Y§ != 0);
         }
         else
         {
            param1.SetEnabled(_loc4_.§_-n2Y§(_loc3_.m_normal).y < 0 && this.§_-j2Y§ != 0);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function get categoriesBits() : uint
      {
         return this.§_-j2Y§ != 0 ? §_-52X§ : uint(§_-V§.§_-eh§);
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
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


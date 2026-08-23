package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
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
   import §_-637§.§_-Ft§;
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-B2Q§;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-St§ extends GameBody implements §_-Q2k§, §_-Ft§, §_-314§, §_-22J§, §_-B2Q§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-92I§:int = 200;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(11 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 5000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-Mf§:Cast = null;
      
      private var §_-52w§:§_-h2I§ = null;
      
      private var §_-02k§:Number;
      
      public function §_-St§()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§(new GunPoiseImg());
         _loc1_.§_-x2x§();
         §_-83v§(_loc1_);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.velocity,0)));
      }
      
      override public function dispose() : void
      {
         this.§_-Mf§ = null;
         if(this.§_-52w§)
         {
            this.§_-52w§ = null;
         }
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         this.body.SetBullet(this.body.GetLinearVelocity().Length() > 100);
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.lifeTime,this.velocity,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.lifeTime = param1[1][0];
         this.velocity = param1[1][1];
         this.playerId = param1[1][2];
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
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Mf§.§_-k1K§ = 0;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-k1K§ = NaN;
      }
      
      public function get maxVelocity() : Number
      {
         return this.velocity;
      }
      
      public function get aimCursor() : §_-h2I§
      {
         if(this.§_-52w§ == null)
         {
            this.§_-52w§ = new §_-h2I§(new PoiseArrow());
         }
         return this.§_-52w§;
      }
      
      public function §_-l1o§(param1:Point) : void
      {
         var _loc2_:b2Vec2 = new b2Vec2(param1.x / Game.§_-x2P§,param1.y / Game.§_-x2P§);
         var _loc3_:Number = Math.atan2(_loc2_.y - this.position.y,_loc2_.x - this.position.x);
         param1 = param1.subtract(new Point(this.x,this.y));
         this.§_-52w§.x = this.x;
         this.§_-52w§.y = this.y;
         this.§_-52w§.rotation = 0;
         this.§_-52w§.scaleX = 1;
         this.velocity = Math.min(int(param1.length),§_-92I§);
         this.§_-52w§.scaleX = this.velocity / this.§_-52w§.width;
         this.§_-52w§.rotation = _loc3_ * Game.R2D;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:Hero = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         if(_loc3_ == null)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc3_ == null || _loc3_.id != this.playerId)
         {
            return;
         }
         if(this.lifeTime <= 4500)
         {
            return;
         }
         param1.SetEnabled(false);
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


package §_-u2r§
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
   import §_-51g§.§_-22J§;
   import §_-637§.§_-Ft§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rn§.§_-A2Z§;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-314§;
   import game.mainGame.entity.§_-B2Q§;
   import game.mainGame.entity.§_-Q2k§;
   import sounds.GameSounds;
   
   public class §_-rE§ extends GameBody implements §_-Q2k§, §_-Ft§, §_-314§, §_-22J§, §_-B2Q§
   {
      
      private static const §_-52X§:uint = 2;
      
      private static const §_-FN§:uint = 1;
      
      private static const §_-92I§:int = 100;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(9 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private static const §_-c1F§:Number = 80 / Game.§_-x2P§;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 15000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-Mf§:Cast = null;
      
      private var radius:Number = §_-c1F§;
      
      private var §_-52w§:§_-h2I§ = null;
      
      private var view:§_-h2I§;
      
      private var §_-h2V§:§_-d2d§;
      
      private var §_-p1H§:§_-h2I§;
      
      private var §_-02k§:Number;
      
      public function §_-rE§()
      {
         super();
         this.view = new §_-h2I§(new StickyBombImg());
         this.view.§_-x2x§();
         §_-83v§(this.view);
         this.§_-h2V§ = new §_-d2d§(new StickyBombExplode());
         this.§_-h2V§.loop = false;
         this.§_-h2V§.gotoAndStop(1);
         this.§_-h2V§.visible = false;
         §_-83v§(this.§_-h2V§);
         this.§_-p1H§ = new §_-h2I§(new StickyStart());
         this.§_-p1H§.§_-x2x§();
         this.§_-p1H§.visible = false;
         §_-83v§(this.§_-p1H§);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
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
         this.view.removeFromParent();
         this.§_-h2V§.stop();
         this.§_-h2V§.removeFromParent(true);
         this.§_-p1H§.removeFromParent(true);
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
         this.§_-C2o§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.lifeTime,this.velocity]);
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.lifeTime = param1[1][0];
         this.velocity = param1[1][1];
         this.playerId = param1[2][0];
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
         if(this.fixed || this.§_-01O§)
         {
            return;
         }
         this.fixed = true;
         GameSounds.play("adhesion");
         this.view.visible = false;
         this.§_-h2V§.visible = true;
         this.§_-h2V§.addEventListener(Event.COMPLETE,this.§_-a1U§);
         this.§_-h2V§.play();
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      private function §_-a1U§(param1:Event) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:§_-A2Z§ = null;
         this.§_-h2V§.removeEventListener(Event.COMPLETE,this.§_-a1U§);
         this.§_-h2V§.visible = false;
         this.§_-p1H§.visible = true;
         if(this.playerId != Game.selfId)
         {
            return;
         }
         var _loc2_:b2Body = this.§_-H2D§.world.GetBodyList();
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.GetPosition().Copy();
            _loc3_.Subtract(this.position);
            if(!(!(_loc2_.GetUserData() is Hero) || _loc3_.Length() > this.radius || _loc3_.Length() == 0))
            {
               _loc2_.SetAwake(true);
               _loc4_ = new §_-A2Z§();
               _loc4_.body = this;
               _loc4_.hero = _loc2_.GetUserData() as Hero;
               this.§_-H2D§.map.§_-nA§(_loc4_,true);
            }
            _loc2_ = _loc2_.GetNext();
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


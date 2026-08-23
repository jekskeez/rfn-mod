package §_-I1q§
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
   import §_-8Q§.GameBody;
   import §_-F5§.§_-Y1d§;
   import §_-M16§.§_-Z2Z§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-p0§;
   import game.mainGame.entity.§_-sn§;
   import sounds.GameSounds;
   
   public class §_-K8§ extends GameBody implements §_-71b§, §_-Y1d§, §_-sn§, §_-Pn§, §_-p0§
   {
      
      private static const §_-53X§:uint = 2;
      
      private static const §_-C3c§:uint = 1;
      
      private static const §_-j1s§:int = 100;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(9 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private static const §_-A2L§:Number = 80 / Game.§_-12A§;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 15000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-42p§:Cast = null;
      
      private var radius:Number = §_-A2L§;
      
      private var §_-32K§:§_-aS§ = null;
      
      private var view:§_-aS§;
      
      private var §_-e20§:§_-f1u§;
      
      private var §_-oE§:§_-aS§;
      
      private var §_-J1H§:Number;
      
      public function §_-K8§()
      {
         super();
         this.view = new §_-aS§(new StickyBombImg());
         this.view.§_-i18§();
         §_-J2J§(this.view);
         this.§_-e20§ = new §_-f1u§(new StickyBombExplode());
         this.§_-e20§.loop = false;
         this.§_-e20§.gotoAndStop(1);
         this.§_-e20§.visible = false;
         §_-J2J§(this.§_-e20§);
         this.§_-oE§ = new §_-aS§(new StickyStart());
         this.§_-oE§.§_-i18§();
         this.§_-oE§.visible = false;
         §_-J2J§(this.§_-oE§);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.velocity,0)));
      }
      
      override public function dispose() : void
      {
         this.§_-42p§ = null;
         if(this.§_-32K§)
         {
            this.§_-32K§ = null;
         }
         this.view.removeFromParent();
         this.§_-e20§.stop();
         this.§_-e20§.removeFromParent(true);
         this.§_-oE§.removeFromParent(true);
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
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.lifeTime,this.velocity]);
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.lifeTime = param1[1][0];
         this.velocity = param1[1][1];
         this.playerId = param1[2][0];
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
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-42p§.§_-g1h§ = 0;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-g1h§ = NaN;
      }
      
      public function get maxVelocity() : Number
      {
         return this.velocity;
      }
      
      public function get aimCursor() : §_-aS§
      {
         if(this.§_-32K§ == null)
         {
            this.§_-32K§ = new §_-aS§(new PoiseArrow());
         }
         return this.§_-32K§;
      }
      
      public function §_-a2l§(param1:Point) : void
      {
         var _loc2_:b2Vec2 = new b2Vec2(param1.x / Game.§_-12A§,param1.y / Game.§_-12A§);
         var _loc3_:Number = Math.atan2(_loc2_.y - this.position.y,_loc2_.x - this.position.x);
         param1 = param1.subtract(new Point(this.x,this.y));
         this.§_-32K§.x = this.x;
         this.§_-32K§.y = this.y;
         this.§_-32K§.rotation = 0;
         this.§_-32K§.scaleX = 1;
         this.velocity = Math.min(int(param1.length),§_-j1s§);
         this.§_-32K§.scaleX = this.velocity / this.§_-32K§.width;
         this.§_-32K§.rotation = _loc3_ * Game.R2D;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.fixed || this.§_-C1L§)
         {
            return;
         }
         this.fixed = true;
         GameSounds.play("adhesion");
         this.view.visible = false;
         this.§_-e20§.visible = true;
         this.§_-e20§.addEventListener(Event.COMPLETE,this.§_-i2Q§);
         this.§_-e20§.play();
      }
      
      public function get velocity() : Number
      {
         return this.§_-J1H§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-J1H§ = param1;
      }
      
      private function §_-i2Q§(param1:Event) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:§_-Z2Z§ = null;
         this.§_-e20§.removeEventListener(Event.COMPLETE,this.§_-i2Q§);
         this.§_-e20§.visible = false;
         this.§_-oE§.visible = true;
         if(this.playerId != Game.selfId)
         {
            return;
         }
         var _loc2_:b2Body = this.§_-21H§.world.GetBodyList();
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.GetPosition().Copy();
            _loc3_.Subtract(this.position);
            if(!(!(_loc2_.GetUserData() is Hero) || _loc3_.Length() > this.radius || _loc3_.Length() == 0))
            {
               _loc2_.SetAwake(true);
               _loc4_ = new §_-Z2Z§();
               _loc4_.body = this;
               _loc4_.hero = _loc2_.GetUserData() as Hero;
               this.§_-21H§.map.§_-TP§(_loc4_,true);
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
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


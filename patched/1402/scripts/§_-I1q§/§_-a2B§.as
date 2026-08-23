package §_-I1q§
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
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-a2B§ extends GameBody implements §_-71b§, §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-w2s§:Number = 0.8;
      
      private static const §_-O2i§:Number = 0.8;
      
      private static const §_-19§:Number = 3;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-l1y§:b2PolygonShape = b2PolygonShape.AsVector(§_-H1u§,0);
      
      private static const §_-83H§:b2PolygonShape = b2PolygonShape.AsVector(§_-k1T§,0);
      
      private static const §_-r1§:b2PolygonShape = b2PolygonShape.AsOrientedBox(1.6,0.1,new b2Vec2(0.1,-1.9));
      
      private static const §_-i2B§:b2FixtureDef = new b2FixtureDef(§_-l1y§,null,0.5,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-lW§:b2FixtureDef = new b2FixtureDef(§_-83H§,null,0.5,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-SD§:b2FixtureDef = new b2FixtureDef(§_-r1§,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var bouncingFactor:Number = 50;
      
      private var view:§_-aS§ = null;
      
      private var §_-h1V§:Number = 1;
      
      private var §_-zU§:Number = 0;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 18000;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-a2B§()
      {
         super();
         this.view = new §_-aS§(new HippieFlowerView());
         this.view.x = -(this.view.width * 0.5);
         this.view.y = -this.view.height + 12;
         §_-J2J§(this.view);
         this.fixed = true;
      }
      
      private static function get §_-H1u§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-0.15,0.8));
         _loc1_.push(new b2Vec2(-1.8,-1.7));
         _loc1_.push(new b2Vec2(1.8,-1.7));
         _loc1_.push(new b2Vec2(0.15,0.8));
         return _loc1_;
      }
      
      private static function get §_-k1T§() : Vector.<b2Vec2>
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
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-i2B§);
         this.body.CreateFixture(§_-lW§);
         this.body.CreateFixture(§_-SD§).SetUserData(this);
         super.build(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.§_-837§ || this.§_-C1L§)
         {
            return;
         }
         this.§_-9m§(param1);
         this.§_-Q26§ -= param1 * 1000;
         if(this.§_-Q26§ <= 0)
         {
            this.§_-th§();
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
         this.§_-33b§(_loc3_);
      }
      
      private function §_-9m§(param1:Number) : void
      {
         if(this.§_-h1V§ <= 1)
         {
            return;
         }
         this.§_-zU§ -= param1;
         if(this.§_-zU§ <= 0)
         {
            this.§_-h1V§ = 1;
         }
      }
      
      private function §_-33b§(param1:Hero) : void
      {
         this.§_-zU§ = §_-w2s§;
         if(this.§_-h1V§ < §_-19§)
         {
            this.§_-h1V§ += §_-O2i§;
         }
         param1.velocity = new b2Vec2();
         var _loc2_:b2Vec2 = this.body.GetTransform().R.col2.Copy();
         _loc2_.Multiply(-this.bouncingFactor * this.§_-h1V§);
         param1.§_-PT§(_loc2_);
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         if(this.body == null)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


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
   import §_-j2E§.§_-A11§;
   import §_-j4§.§_-Pn§;
   import flash.display.MovieClip;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-l26§;
   
   public class §_-63J§ extends GameBody implements §_-Pn§, §_-71b§, §_-l26§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(80 * 0.5 / Game.§_-12A§,75 * 0.5 / Game.§_-12A§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 5000;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-63J§()
      {
         super();
         var _loc1_:MovieClip = new BlizzardView();
         _loc1_.x = 5;
         _loc1_.y = 10;
         addChild(_loc1_);
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:Hero = param1.GetFixtureA().GetUserData() as Hero;
         if(!_loc4_)
         {
            _loc4_ = param1.GetFixtureB().GetUserData() as Hero;
         }
         if(!_loc4_ || _loc4_.id == this.playerId || _loc4_.shaman)
         {
            return;
         }
         if(_loc4_.perkController.§_-S1Q§(§_-A11§.§_-R2D§) != -1 && _loc4_.isSquirrel)
         {
            return;
         }
         if(param1.GetFixtureA().GetUserData() == this)
         {
            this.§_-j1M§(param1.GetFixtureB().GetBody(),_loc3_.m_points[0]);
         }
         else
         {
            this.§_-j1M§(param1.GetFixtureA().GetBody(),_loc3_.m_points[1]);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         param1.SetEnabled(false);
      }
      
      private function §_-j1M§(param1:b2Body, param2:b2Vec2) : void
      {
         if(param1 == this.body || param2.x == 0 && param2.y == 0)
         {
            return;
         }
         var _loc3_:b2Vec2 = param1.GetLinearVelocity();
         _loc3_.x *= 0.5;
         param1.SetLinearVelocity(_loc3_);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
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


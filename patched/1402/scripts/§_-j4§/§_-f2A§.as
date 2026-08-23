package §_-j4§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import §_-8Q§.GameBody;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import game.mainGame.entity.§_-L1q§;
   import game.mainGame.entity.§_-j9§;
   import game.mainGame.entity.§_-l26§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-f2A§ extends EventDispatcher implements §_-Pn§
   {
      
      private var fixture:b2Fixture = null;
      
      private var §_-v9§:int = 0;
      
      private var hero:Hero;
      
      private var §_-w2T§:Dictionary = new Dictionary(false);
      
      private var §_-77§:int = 0;
      
      public var §_-YJ§:§_-xn§ = null;
      
      private var §_-27§:b2WorldManifold;
      
      private var §_-ip§:Dictionary = new Dictionary(false);
      
      public function §_-f2A§(param1:b2Fixture, param2:Hero)
      {
         super();
         this.§_-27§ = new b2WorldManifold();
         this.§_-ip§ = new Dictionary(false);
         this.contactsCount = 0;
         this.fixture = param1;
         this.hero = param2;
         this.fixture.SetUserData(this);
      }
      
      public function reset() : void
      {
         this.§_-77§ = 0;
         this.§_-ip§ = new Dictionary(false);
         this.contactsCount = 0;
         this.§_-w2T§ = new Dictionary(false);
      }
      
      public function get onFloor() : Boolean
      {
         return this.contactsCount != 0 && !this.hero.ghost;
      }
      
      public function get contactsCount() : int
      {
         return Math.max(this.§_-v9§,0);
      }
      
      public function set contactsCount(param1:int) : void
      {
         this.§_-v9§ = Math.max(param1,0);
      }
      
      public function get §_-B7§() : Boolean
      {
         if(this.§_-77§ > 0)
         {
            return true;
         }
         return this.§_-r2P§;
      }
      
      private function get §_-r2P§() : Boolean
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = this.§_-ip§;
         for(_loc1_ in _loc3_)
         {
            return true;
         }
         return false;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc2_ == this.hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc2_ is GameBody && ((_loc2_ as GameBody).ghost || _loc2_ is §_-l26§))
         {
            return;
         }
         if(_loc2_ is §_-L1q§ && (_loc2_ as §_-L1q§).§_-sP§(this.hero.id))
         {
            return;
         }
         if(this.hero.ghost)
         {
            return;
         }
         if(_loc2_ is §_-xn§)
         {
            this.§_-YJ§ = _loc2_;
         }
         if(_loc2_ is §_-j9§)
         {
            ++this.§_-77§;
         }
         this.§_-w2T§[param1] = _loc2_;
         ++this.contactsCount;
         var _loc3_:b2Vec2 = param1.GetManifold().m_localPlaneNormal;
         var _loc4_:Number = Math.abs(Math.atan2(_loc3_.y,_loc3_.x));
         var _loc5_:b2Vec2 = param1.GetManifold().m_localPoint;
         var _loc6_:Number = Math.abs(Math.atan2(_loc5_.y,_loc5_.x));
         if(_loc4_ == 0 && _loc6_ >= 1.5 || _loc4_ == 0 && _loc6_ == 0 || _loc6_ >= 1.5 && _loc4_ >= 3 && this.hero.rotation != 0 || this.hero.rotation != 0)
         {
            this.§_-ip§[param1] = _loc2_;
         }
         param1.GetWorldManifold(this.§_-27§);
         _loc3_ = this.§_-27§.m_normal;
         _loc4_ = Math.abs(Math.atan2(_loc3_.y,_loc3_.x));
         if(_loc4_ >= Math.PI * 0.1 && _loc4_ <= Math.PI * 0.9)
         {
            this.§_-ip§[param1] = _loc2_;
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
         if(this.contactsCount > 0 && param1 in this.§_-w2T§)
         {
            if(this.§_-w2T§[param1] is §_-j9§)
            {
               --this.§_-77§;
            }
            delete this.§_-w2T§[param1];
            --this.contactsCount;
         }
         if(param1 in this.§_-ip§)
         {
            delete this.§_-ip§[param1];
         }
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         param1.SetEnabled(false);
      }
      
      public function dispose() : void
      {
         this.fixture.SetUserData(null);
         this.fixture = null;
         this.§_-YJ§ = null;
      }
   }
}


package §_-51g§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import §_-83V§.GameBody;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-8U§;
   import game.mainGame.entity.§_-FD§;
   import game.mainGame.entity.§_-b2X§;
   
   public class §_-h12§ extends EventDispatcher implements §_-22J§
   {
      
      private var fixture:b2Fixture = null;
      
      private var §_-Sn§:int = 0;
      
      private var hero:Hero;
      
      private var §_-Qf§:Dictionary = new Dictionary(false);
      
      private var §_-63Y§:int = 0;
      
      public var §_-v2x§:§_-63Q§ = null;
      
      private var §_-qs§:b2WorldManifold;
      
      private var §_-01g§:Dictionary = new Dictionary(false);
      
      public function §_-h12§(param1:b2Fixture, param2:Hero)
      {
         super();
         this.§_-qs§ = new b2WorldManifold();
         this.§_-01g§ = new Dictionary(false);
         this.contactsCount = 0;
         this.fixture = param1;
         this.hero = param2;
         this.fixture.SetUserData(this);
      }
      
      public function reset() : void
      {
         this.§_-63Y§ = 0;
         this.§_-01g§ = new Dictionary(false);
         this.contactsCount = 0;
         this.§_-Qf§ = new Dictionary(false);
      }
      
      public function get onFloor() : Boolean
      {
         return this.contactsCount != 0 && !this.hero.ghost;
      }
      
      public function get contactsCount() : int
      {
         return Math.max(this.§_-Sn§,0);
      }
      
      public function set contactsCount(param1:int) : void
      {
         this.§_-Sn§ = Math.max(param1,0);
      }
      
      public function get §_-ZG§() : Boolean
      {
         if(this.§_-63Y§ > 0)
         {
            return true;
         }
         return this.§_-82S§;
      }
      
      private function get §_-82S§() : Boolean
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = this.§_-01g§;
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
         if(_loc2_ is GameBody && ((_loc2_ as GameBody).ghost || _loc2_ is §_-8U§))
         {
            return;
         }
         if(_loc2_ is §_-FD§ && (_loc2_ as §_-FD§).§_-d2E§(this.hero.id))
         {
            return;
         }
         if(this.hero.ghost)
         {
            return;
         }
         if(_loc2_ is §_-63Q§)
         {
            this.§_-v2x§ = _loc2_;
         }
         if(_loc2_ is §_-b2X§)
         {
            ++this.§_-63Y§;
         }
         this.§_-Qf§[param1] = _loc2_;
         ++this.contactsCount;
         var _loc3_:b2Vec2 = param1.GetManifold().m_localPlaneNormal;
         var _loc4_:Number = Math.abs(Math.atan2(_loc3_.y,_loc3_.x));
         var _loc5_:b2Vec2 = param1.GetManifold().m_localPoint;
         var _loc6_:Number = Math.abs(Math.atan2(_loc5_.y,_loc5_.x));
         if(_loc4_ == 0 && _loc6_ >= 1.5 || _loc4_ == 0 && _loc6_ == 0 || _loc6_ >= 1.5 && _loc4_ >= 3 && this.hero.rotation != 0 || this.hero.rotation != 0)
         {
            this.§_-01g§[param1] = _loc2_;
         }
         param1.GetWorldManifold(this.§_-qs§);
         _loc3_ = this.§_-qs§.m_normal;
         _loc4_ = Math.abs(Math.atan2(_loc3_.y,_loc3_.x));
         if(_loc4_ >= Math.PI * 0.1 && _loc4_ <= Math.PI * 0.9)
         {
            this.§_-01g§[param1] = _loc2_;
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
         if(this.contactsCount > 0 && param1 in this.§_-Qf§)
         {
            if(this.§_-Qf§[param1] is §_-b2X§)
            {
               --this.§_-63Y§;
            }
            delete this.§_-Qf§[param1];
            --this.contactsCount;
         }
         if(param1 in this.§_-01g§)
         {
            delete this.§_-01g§[param1];
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
         this.§_-v2x§ = null;
      }
   }
}


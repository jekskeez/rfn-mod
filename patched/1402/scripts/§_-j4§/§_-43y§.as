package §_-j4§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import §_-WJ§.DetectHeroEvent;
   import flash.events.EventDispatcher;
   
   public class §_-43y§ extends EventDispatcher implements §_-Pn§
   {
      
      private var fixture:b2Fixture = null;
      
      public var §_-5O§:Array = [];
      
      public function §_-43y§(param1:b2Fixture)
      {
         super();
         this.§_-41S§(param1);
      }
      
      private static function §_-A17§(param1:b2Contact) : Hero
      {
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            return param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            return param1.GetFixtureB().GetBody().GetUserData();
         }
         return null;
      }
      
      public function §_-41S§(param1:b2Fixture) : void
      {
         this.fixture = param1;
         this.fixture.SetUserData(this);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.§_-q8§(param1,DetectHeroEvent.BEGIN_CONTACT);
         var _loc2_:Hero = §_-A17§(param1);
         if(!_loc2_)
         {
            return;
         }
         this.§_-5O§.push(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         this.§_-q8§(param1,DetectHeroEvent.END_CONTACT);
         var _loc2_:Hero = §_-A17§(param1);
         if(!_loc2_)
         {
            return;
         }
         this.§_-5O§.splice(this.§_-5O§.indexOf(_loc2_),1);
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function §_-q8§(param1:b2Contact, param2:String) : void
      {
         var _loc3_:Hero = §_-A17§(param1);
         if(_loc3_ == null)
         {
            return;
         }
         dispatchEvent(new DetectHeroEvent(_loc3_,true,param2));
      }
   }
}


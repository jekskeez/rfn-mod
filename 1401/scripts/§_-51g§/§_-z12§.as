package §_-51g§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import §_-R1w§.DetectHeroEvent;
   import flash.events.EventDispatcher;
   
   public class §_-z12§ extends EventDispatcher implements §_-22J§
   {
      
      private var fixture:b2Fixture = null;
      
      public var §_-61I§:Array = [];
      
      public function §_-z12§(param1:b2Fixture)
      {
         super();
         this.§_-z2e§(param1);
      }
      
      private static function §_-3A§(param1:b2Contact) : Hero
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
      
      public function §_-z2e§(param1:b2Fixture) : void
      {
         this.fixture = param1;
         this.fixture.SetUserData(this);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.§_-01F§(param1,DetectHeroEvent.BEGIN_CONTACT);
         var _loc2_:Hero = §_-3A§(param1);
         if(!_loc2_)
         {
            return;
         }
         this.§_-61I§.push(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         this.§_-01F§(param1,DetectHeroEvent.END_CONTACT);
         var _loc2_:Hero = §_-3A§(param1);
         if(!_loc2_)
         {
            return;
         }
         this.§_-61I§.splice(this.§_-61I§.indexOf(_loc2_),1);
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function §_-01F§(param1:b2Contact, param2:String) : void
      {
         var _loc3_:Hero = §_-3A§(param1);
         if(_loc3_ == null)
         {
            return;
         }
         dispatchEvent(new DetectHeroEvent(_loc3_,true,param2));
      }
   }
}


package §_-51g§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import §_-RI§.§_-v2j§;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import sounds.GameSounds;
   
   public class §_-41b§ extends EventDispatcher implements §_-22J§
   {
      
      private static const §_-132§:int = 200;
      
      private static const §_-m2H§:Number = 1000;
      
      private var fixture:b2Fixture = null;
      
      private var §_-U2E§:Object = {};
      
      private var §_-q20§:Object = {};
      
      public var useDirection:Boolean;
      
      public var direction:Number;
      
      public function §_-41b§(param1:b2Fixture)
      {
         super();
         this.fixture = param1;
         this.fixture.SetUserData(this);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = this.§_-3A§(param1);
         if(_loc2_.id != Game.selfId && _loc2_.id > 0)
         {
            return;
         }
         if(!(_loc2_.id in this.§_-q20§))
         {
            this.§_-q20§[_loc2_.id] = 0;
         }
         var _loc3_:Number = getTimer();
         if(_loc3_ - this.§_-q20§[_loc2_.id] < §_-132§)
         {
            return;
         }
         this.§_-q20§[_loc2_.id] = _loc3_;
         GameSounds.play("portal");
         dispatchEvent(new PortalSensorEvent(PortalSensorEvent.CONTACT,_loc2_));
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function teleport(param1:Hero) : void
      {
         if(!(param1.id in this.§_-q20§))
         {
            this.§_-q20§[param1.id] = 0;
         }
         var _loc2_:Number = getTimer();
         if(_loc2_ - this.§_-q20§[param1.id] < §_-132§)
         {
            return;
         }
         this.§_-q20§[param1.id] = _loc2_;
         this.§_-U2E§[param1.id] = param1;
      }
      
      public function §_-3s§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Number = NaN;
         var _loc1_:b2Vec2 = this.position.Copy();
         _loc1_.Add(new b2Vec2(22.5 / Game.§_-x2P§,22.5 / Game.§_-x2P§));
         for each(_loc2_ in this.§_-U2E§)
         {
            if(this.useDirection)
            {
               _loc3_ = Math.min(_loc2_.velocity.Length(),§_-m2H§);
               _loc2_.velocity = new b2Vec2(Math.cos(this.direction) * _loc3_,Math.sin(this.direction) * _loc3_);
            }
            _loc2_.position = _loc1_;
            _loc2_.sendLocation(Keyboard.UP);
            _loc2_.dispatchEvent(new Event(Hero.§_-g1O§));
            _loc2_.dispatchEvent(new Event(Hero.§_-n2S§));
            _loc2_.dispatchEvent(new Event(Hero.§_-Y1J§));
            delete this.§_-U2E§[_loc2_.id];
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = undefined;
         if(this.fixture.GetBody().GetUserData() is §_-v2j§)
         {
            _loc1_ = this.fixture.GetBody().GetUserData();
            if(Boolean(_loc1_) && _loc1_.parentStarling != null)
            {
               _loc1_.parentStarling.removeChildStarling(_loc1_);
            }
         }
         else
         {
            _loc1_ = this.fixture.GetBody().GetUserData();
            if(Boolean(_loc1_) && _loc1_.parent != null)
            {
               _loc1_.parent.removeChild(_loc1_);
            }
         }
         this.§_-41c§();
      }
      
      public function §_-41c§() : void
      {
         this.fixture.GetBody().GetWorld().DestroyBody(this.fixture.GetBody());
      }
      
      private function §_-3A§(param1:b2Contact) : Hero
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
      
      private function get position() : b2Vec2
      {
         return this.fixture.GetBody().GetPosition();
      }
   }
}


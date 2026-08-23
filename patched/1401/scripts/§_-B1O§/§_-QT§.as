package §_-B1O§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-33r§.§_-V2Z§;
   import §_-33r§.§_-hu§;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   
   public class §_-QT§ extends §_-A1f§ implements §_-22J§
   {
      
      public function §_-QT§()
      {
         super();
      }
      
      override protected function get §_-h4§() : uint
      {
         return this.categoriesBits;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.ghost)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc2_:Hero = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         if(!_loc2_)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc2_ != null && !(_loc2_.heroView.§_-Wk§ && (_loc2_.heroView.§_-Wk§ as §_-31F§).§_-62l§ || _loc2_.armadillo || _loc2_.immortal || _loc2_.inHollow || _loc2_.behaviourController.getState(§_-V2Z§) != null || _loc2_.behaviourController.getState(§_-hu§) != null))
         {
            _loc2_.dispatchEvent(new Event(Hero.§_-aj§));
            _loc2_.§_-L1A§ = Hero.§_-22I§;
            _loc2_.§_-h2r§();
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
         if(this.ghost)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(this.ghost)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         this.beginContact(param1);
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new Acid());
      }
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new Acid();
      }
   }
}


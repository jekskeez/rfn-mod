package §_-j2H§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-Cc§.§_-73t§;
   import §_-Cc§.§_-x1W§;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   
   public class §_-bc§ extends §_-01b§ implements §_-Pn§
   {
      
      public function §_-bc§()
      {
         super();
      }
      
      override protected function get §_-B1n§() : uint
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
         if(_loc2_ != null && !(_loc2_.heroView.§_-t2V§ && (_loc2_.heroView.§_-t2V§ as §_-23o§).§_-b2J§ || _loc2_.armadillo || _loc2_.immortal || _loc2_.inHollow || _loc2_.behaviourController.getState(§_-x1W§) != null || _loc2_.behaviourController.getState(§_-73t§) != null))
         {
            _loc2_.dispatchEvent(new Event(Hero.§_-G0§));
            _loc2_.§_-b2d§ = Hero.§_-v2u§;
            _loc2_.§_-kl§();
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
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new Acid());
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new Acid();
      }
   }
}


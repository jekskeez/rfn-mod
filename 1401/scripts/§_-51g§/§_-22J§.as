package §_-51g§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   
   public interface §_-22J§
   {
      
      function beginContact(param1:b2Contact) : void;
      
      function endContact(param1:b2Contact) : void;
      
      function preSolve(param1:b2Contact, param2:b2Manifold) : void;
      
      function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void;
   }
}


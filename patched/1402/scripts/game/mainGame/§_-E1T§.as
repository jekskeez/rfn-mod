package game.mainGame
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2ContactListener;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-j4§.§_-Pn§;
   
   public class §_-E1T§ extends b2ContactListener
   {
      
      private var world:b2World;
      
      public function §_-E1T§(param1:b2World)
      {
         super();
         this.world = param1;
      }
      
      override public function BeginContact(param1:b2Contact) : void
      {
         var _loc2_:* = param1.GetFixtureA().GetUserData();
         var _loc3_:* = param1.GetFixtureB().GetUserData();
         if(_loc2_ is §_-Pn§)
         {
            _loc2_.beginContact(param1);
         }
         if(_loc3_ is §_-Pn§)
         {
            _loc3_.beginContact(param1);
         }
      }
      
      override public function EndContact(param1:b2Contact) : void
      {
         var _loc2_:* = param1.GetFixtureA().GetUserData();
         var _loc3_:* = param1.GetFixtureB().GetUserData();
         if(_loc2_ is §_-Pn§)
         {
            _loc2_.endContact(param1);
         }
         if(_loc3_ is §_-Pn§)
         {
            param1.GetFixtureB().GetUserData().endContact(param1);
         }
      }
      
      override public function PostSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         var _loc3_:* = param1.GetFixtureA().GetUserData();
         var _loc4_:* = param1.GetFixtureB().GetUserData();
         if(_loc3_ is §_-Pn§)
         {
            _loc3_.postSolve(param1,param2);
         }
         if(_loc4_ is §_-Pn§)
         {
            _loc4_.postSolve(param1,param2);
         }
      }
      
      override public function PreSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:* = param1.GetFixtureA().GetUserData();
         var _loc4_:* = param1.GetFixtureB().GetUserData();
         var _loc5_:* = param1.GetFixtureA().GetBody().GetUserData();
         var _loc6_:* = param1.GetFixtureB().GetBody().GetUserData();
         if(Boolean(_loc5_ is GameBody && _loc6_ is GameBody) && Boolean(_loc5_.fixed) && Boolean(_loc6_.fixed))
         {
            param1.SetEnabled(false);
            return;
         }
         if(_loc3_ is §_-Pn§)
         {
            _loc3_.preSolve(param1,param2);
         }
         if(_loc4_ is §_-Pn§)
         {
            _loc4_.preSolve(param1,param2);
         }
      }
   }
}


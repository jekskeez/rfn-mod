package game.mainGame
{
   import Box2D.Dynamics.b2ContactFilter;
   import Box2D.Dynamics.b2Fixture;
   import §_-83V§.GameBody;
   
   public class §_-d2h§ extends b2ContactFilter
   {
      
      public function §_-d2h§()
      {
         super();
      }
      
      override public function ShouldCollide(param1:b2Fixture, param2:b2Fixture) : Boolean
      {
         var _loc3_:* = param1.GetBody().GetUserData();
         var _loc4_:* = param2.GetBody().GetUserData();
         if(_loc3_ is GameBody && _loc4_ is GameBody && (_loc3_ as GameBody).fixed && (_loc4_ as GameBody).fixed)
         {
            return false;
         }
         return super.ShouldCollide(param1,param2);
      }
   }
}


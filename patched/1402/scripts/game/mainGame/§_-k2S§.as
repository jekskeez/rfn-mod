package game.mainGame
{
   import Box2D.Dynamics.b2ContactFilter;
   import Box2D.Dynamics.b2Fixture;
   import §_-8Q§.GameBody;
   
   public class §_-k2S§ extends b2ContactFilter
   {
      
      public function §_-k2S§()
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


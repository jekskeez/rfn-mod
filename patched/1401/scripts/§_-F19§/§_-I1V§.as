package §_-F19§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-B1O§.§_-f24§;
   import §_-Rj§.§_-K15§;
   import §_-Rj§.§_-y1z§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-I1V§ extends §_-K15§
   {
      
      public function §_-I1V§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-d1E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-F2d§;
      }
      
      override public function §_-Z2S§(param1:int, param2:int = -1) : Boolean
      {
         var _loc5_:§_-63Q§ = null;
         if(param1 == §_-q1p§.§_-G1z§ || param1 == §_-q1p§.§_-u2f§ || param1 == §_-q1p§.§_-l2I§)
         {
            return false;
         }
         if(get(§_-f24§).length > 2)
         {
            return true;
         }
         if(get(§_-f24§).length < 2)
         {
            return super.§_-Z2S§(param1,param2);
         }
         var _loc3_:Array = get(§_-f24§);
         var _loc4_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc5_ in _loc3_)
         {
            _loc4_.push(_loc5_.position);
         }
         if(Math.sqrt(Math.pow(_loc4_[0].x - _loc4_[1].x,2) + Math.pow(_loc4_[0].y - _loc4_[1].y,2)) >= 10)
         {
            return true;
         }
         return super.§_-Z2S§(param1,param2);
      }
   }
}


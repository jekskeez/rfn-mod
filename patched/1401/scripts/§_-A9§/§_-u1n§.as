package §_-A9§
{
   import §_-83V§.§_-M2K§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-B1O§.§_-f24§;
   import §_-Rj§.§_-K15§;
   import §_-Rj§.§_-y1z§;
   import game.mainGame.SquirrelGame;
   
   public class §_-u1n§ extends §_-K15§
   {
      
      public function §_-u1n§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-u2E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-I1d§;
      }
      
      override public function §_-d1E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-F2s§;
      }
      
      override public function §_-WH§(param1:int, param2:int = -1) : Boolean
      {
         return §_-2S§(§_-f24§) && §_-2S§(§_-P2o§) && §_-2S§(§_-Q1J§) && §_-2S§(§_-M2K§);
      }
      
      override public function §_-Z2S§(param1:int, param2:int = -1) : Boolean
      {
         var _loc3_:§_-M2K§ = null;
         if(param1 == §_-q1p§.§_-G1z§)
         {
            return false;
         }
         for each(_loc3_ in get(§_-M2K§))
         {
            if(_loc3_.§_-6y§.length == 0)
            {
               return true;
            }
         }
         return super.§_-Z2S§(param1,param2);
      }
   }
}


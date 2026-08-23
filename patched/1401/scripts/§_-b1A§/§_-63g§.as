package §_-b1A§
{
   import §_-83V§.§_-532§;
   import §_-83V§.§_-I11§;
   import §_-83V§.§_-P2o§;
   import §_-83V§.§_-Q1J§;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-B1O§.§_-W2J§;
   import §_-B1O§.§_-f24§;
   import §_-B1O§.§_-i26§;
   import §_-B1O§.§_-rJ§;
   import §_-Rj§.§_-K15§;
   import §_-Rj§.§_-y1z§;
   import §_-d11§.§_-k1J§;
   import game.mainGame.SquirrelGame;
   
   public class §_-63g§ extends §_-K15§
   {
      
      public function §_-63g§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-u2E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-x1B§;
      }
      
      override public function §_-d1E§(param1:int, param2:int) : String
      {
         return §_-y1z§.§_-5S§;
      }
      
      override public function §_-WH§(param1:int, param2:int = -1) : Boolean
      {
         return §_-2S§(§_-f24§) && §_-2S§(§_-P2o§) && §_-2S§(§_-Q1J§);
      }
      
      override public function §_-Z2S§(param1:int, param2:int = -1) : Boolean
      {
         if(param1 == §_-q1p§.§_-G1z§)
         {
            return false;
         }
         return §_-2S§(§_-S18§) || §_-2S§(§_-T24§) || §_-2S§(§_-W2J§) || §_-2S§(§_-k1J§) || §_-2S§(§_-rJ§) || §_-2S§(§_-I11§) || §_-2S§(§_-532§) || §_-2S§(§_-i26§);
      }
   }
}


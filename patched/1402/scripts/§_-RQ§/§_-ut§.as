package §_-RQ§
{
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-g2b§;
   import §_-8Q§.§_-t20§;
   import §_-j2H§.§_-x2h§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-CD§;
   import game.mainGame.SquirrelGame;
   
   public class §_-ut§ extends §_-53A§
   {
      
      public function §_-ut§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-h2S§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-62m§;
      }
      
      override public function §_-42C§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-D6§;
      }
      
      override public function §_-538§(param1:int, param2:int = -1) : Boolean
      {
         return §_-FS§(§_-x2h§) && §_-FS§(§_-O2k§) && §_-FS§(§_-t20§) && §_-FS§(§_-g2b§);
      }
      
      override public function §_-vd§(param1:int, param2:int = -1) : Boolean
      {
         var _loc3_:§_-g2b§ = null;
         if(param1 == §_-at§.§_-Uf§)
         {
            return false;
         }
         for each(_loc3_ in get(§_-g2b§))
         {
            if(_loc3_.§_-v1G§.length == 0)
            {
               return true;
            }
         }
         return super.§_-vd§(param1,param2);
      }
   }
}


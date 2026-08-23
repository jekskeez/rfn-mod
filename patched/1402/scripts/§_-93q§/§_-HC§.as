package §_-93q§
{
   import §_-8Q§.§_-I1j§;
   import §_-8Q§.§_-O1Y§;
   import §_-8Q§.§_-O2k§;
   import §_-8Q§.§_-t20§;
   import §_-g16§.§_-I2§;
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-H18§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import §_-j2H§.§_-r29§;
   import §_-j2H§.§_-x2h§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-CD§;
   import game.mainGame.SquirrelGame;
   
   public class §_-HC§ extends §_-53A§
   {
      
      public function §_-HC§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-h2S§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-12G§;
      }
      
      override public function §_-42C§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-Ou§;
      }
      
      override public function §_-538§(param1:int, param2:int = -1) : Boolean
      {
         return §_-FS§(§_-x2h§) && §_-FS§(§_-O2k§) && §_-FS§(§_-t20§);
      }
      
      override public function §_-vd§(param1:int, param2:int = -1) : Boolean
      {
         if(param1 == §_-at§.§_-Uf§)
         {
            return false;
         }
         return §_-FS§(§_-Y2n§) || §_-FS§(§_-Jb§) || §_-FS§(§_-r29§) || §_-FS§(§_-I2§) || §_-FS§(§_-62Y§) || §_-FS§(§_-I1j§) || §_-FS§(§_-O1Y§) || §_-FS§(§_-H18§);
      }
   }
}


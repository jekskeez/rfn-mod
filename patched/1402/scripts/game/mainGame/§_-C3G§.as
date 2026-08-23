package game.mainGame
{
   public class §_-C3G§
   {
      
      private static const §_-31K§:Array = [[BackgroundFly0Layer0,BackgroundFly0Layer1],[BackgroundFly1Layer0,BackgroundFly1Layer1]];
      
      private static const §_-V1x§:Array = [[BackgroundSnowMounts0Layer0,BackgroundSnowMounts0Layer1],[BackgroundSnowMounts1Layer0,BackgroundSnowMounts1Layer1]];
      
      private static const §_-R2z§:Array = [[BackgroundSwamp0Layer0,BackgroundSwamp0Layer1],[BackgroundSwamp1Layer0,BackgroundSwamp1Layer1]];
      
      private static const §_-Ie§:Array = [[BackgroundHard0Layer0,BackgroundHard0Layer1],[BackgroundHard1Layer0,BackgroundHard1Layer1]];
      
      private static const §_-b1Q§:Array = [[BackgroundDesert0Layer0,BackgroundDesert0Layer1],[BackgroundDesert1Layer0,BackgroundDesert1Layer1]];
      
      private static const §_-31l§:Array = [[BackgroundAnomalyZone0Layer0,BackgroundAnomalyZone0Layer1],[BackgroundAnomalyZone1Layer0,BackgroundAnomalyZone1Layer1],[BackgroundAnomalyZone2Layer0,BackgroundAnomalyZone2Layer1]];
      
      private static const §_-92L§:Array = [[BackgroundWild0Layer0,BackgroundWild0Layer1],[BackgroundWild1Layer0,BackgroundWild1Layer1],[BackgroundWild2Layer0,BackgroundWild2Layer1],[BackgroundWild3Layer0,BackgroundWild3Layer1]];
      
      private static const §_-I2H§:Array = [[BackgroundOlympic0Layer0,BackgroundOlympic0Layer1],[BackgroundOlympic1Layer0,BackgroundOlympic1Layer1],[BackgroundHard1Layer0,BackgroundHard1Layer1],[BackgroundHard0Layer0,BackgroundHard0Layer1]];
      
      private static const §_-b26§:Array = [[BackgroundFly1Layer0,BackgroundFly1Layer1],[BackgroundHard0Layer0,BackgroundHard0Layer1],[BackgroundHard1Layer0,BackgroundHard1Layer1],[BackgroundOlympic0Layer0,BackgroundOlympic0Layer1],[BackgroundOlympic1Layer0,BackgroundOlympic1Layer1],[BackgroundAnomalyZone0Layer0,BackgroundAnomalyZone0Layer1],[BackgroundAnomalyZone1Layer0,BackgroundAnomalyZone1Layer1],[BackgroundSnowMounts1Layer0,BackgroundSnowMounts1Layer1],[BackgroundSwamp1Layer0,BackgroundSwamp1Layer1],[BackgroundBattle0Layer0,BackgroundBattle0Layer1],[BackgroundBattle1Layer0,BackgroundBattle1Layer1]];
      
      public function §_-C3G§()
      {
         super();
      }
      
      public static function §_-Gp§(param1:int, param2:int = 0) : Array
      {
         switch(param1)
         {
            case §_-at§.§_-I6§:
            case §_-at§.§_-B2t§:
               return §_-31K§[int(§_-31K§.length * Math.random())];
            case §_-at§.§_-vr§:
               return §_-V1x§[int(§_-V1x§.length * Math.random())];
            case §_-at§.§_-D18§:
               return §_-R2z§[int(§_-R2z§.length * Math.random())];
            case §_-at§.§_-e2a§:
               return §_-Ie§[int(§_-Ie§.length * Math.random())];
            case §_-at§.§_-j1i§:
               return §_-31l§[int(§_-31l§.length * Math.random())];
            case §_-at§.§_-92b§:
               return §_-b1Q§[int(§_-b1Q§.length * Math.random())];
            case §_-at§.§_-G1K§:
               return §_-92L§[int(§_-92L§.length * Math.random())];
            case §_-at§.§_-N2g§:
               return §_-I2H§[int(§_-I2H§.length * Math.random())];
            case §_-at§.§_-U1s§:
         }
         return §_-b26§[int(§_-b26§.length * Math.random())];
      }
   }
}


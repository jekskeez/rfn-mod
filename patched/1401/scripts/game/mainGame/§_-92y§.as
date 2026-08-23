package game.mainGame
{
   public class §_-92y§
   {
      
      private static const §_-W1f§:Array = [[BackgroundFly0Layer0,BackgroundFly0Layer1],[BackgroundFly1Layer0,BackgroundFly1Layer1]];
      
      private static const §_-K1a§:Array = [[BackgroundSnowMounts0Layer0,BackgroundSnowMounts0Layer1],[BackgroundSnowMounts1Layer0,BackgroundSnowMounts1Layer1]];
      
      private static const §_-7w§:Array = [[BackgroundSwamp0Layer0,BackgroundSwamp0Layer1],[BackgroundSwamp1Layer0,BackgroundSwamp1Layer1]];
      
      private static const §_-i6§:Array = [[BackgroundHard0Layer0,BackgroundHard0Layer1],[BackgroundHard1Layer0,BackgroundHard1Layer1]];
      
      private static const §_-e1M§:Array = [[BackgroundDesert0Layer0,BackgroundDesert0Layer1],[BackgroundDesert1Layer0,BackgroundDesert1Layer1]];
      
      private static const §_-42I§:Array = [[BackgroundAnomalyZone0Layer0,BackgroundAnomalyZone0Layer1],[BackgroundAnomalyZone1Layer0,BackgroundAnomalyZone1Layer1],[BackgroundAnomalyZone2Layer0,BackgroundAnomalyZone2Layer1]];
      
      private static const §_-816§:Array = [[BackgroundWild0Layer0,BackgroundWild0Layer1],[BackgroundWild1Layer0,BackgroundWild1Layer1],[BackgroundWild2Layer0,BackgroundWild2Layer1],[BackgroundWild3Layer0,BackgroundWild3Layer1]];
      
      private static const §_-JK§:Array = [[BackgroundOlympic0Layer0,BackgroundOlympic0Layer1],[BackgroundOlympic1Layer0,BackgroundOlympic1Layer1],[BackgroundHard1Layer0,BackgroundHard1Layer1],[BackgroundHard0Layer0,BackgroundHard0Layer1]];
      
      private static const §_-H1i§:Array = [[BackgroundFly1Layer0,BackgroundFly1Layer1],[BackgroundHard0Layer0,BackgroundHard0Layer1],[BackgroundHard1Layer0,BackgroundHard1Layer1],[BackgroundOlympic0Layer0,BackgroundOlympic0Layer1],[BackgroundOlympic1Layer0,BackgroundOlympic1Layer1],[BackgroundAnomalyZone0Layer0,BackgroundAnomalyZone0Layer1],[BackgroundAnomalyZone1Layer0,BackgroundAnomalyZone1Layer1],[BackgroundSnowMounts1Layer0,BackgroundSnowMounts1Layer1],[BackgroundSwamp1Layer0,BackgroundSwamp1Layer1],[BackgroundBattle0Layer0,BackgroundBattle0Layer1],[BackgroundBattle1Layer0,BackgroundBattle1Layer1]];
      
      public function §_-92y§()
      {
         super();
      }
      
      public static function §_-q1w§(param1:int, param2:int = 0) : Array
      {
         switch(param1)
         {
            case §_-q1p§.§_-C25§:
            case §_-q1p§.§_-X1n§:
               return §_-W1f§[int(§_-W1f§.length * Math.random())];
            case §_-q1p§.§_-w2u§:
               return §_-K1a§[int(§_-K1a§.length * Math.random())];
            case §_-q1p§.§_-sL§:
               return §_-7w§[int(§_-7w§.length * Math.random())];
            case §_-q1p§.§_-A3z§:
               return §_-i6§[int(§_-i6§.length * Math.random())];
            case §_-q1p§.§_-u2u§:
               return §_-42I§[int(§_-42I§.length * Math.random())];
            case §_-q1p§.§_-P4§:
               return §_-e1M§[int(§_-e1M§.length * Math.random())];
            case §_-q1p§.§_-k2B§:
               return §_-816§[int(§_-816§.length * Math.random())];
            case §_-q1p§.§_-M1m§:
               return §_-JK§[int(§_-JK§.length * Math.random())];
            case §_-q1p§.§_-Q1s§:
         }
         return §_-H1i§[int(§_-H1i§.length * Math.random())];
      }
   }
}


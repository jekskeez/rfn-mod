package §_-Rj§
{
   import §_-43w§.§_-rZ§;
   import §_-43w§.§_-w1y§;
   import §_-A9§.§_-u1n§;
   import §_-F19§.§_-I1V§;
   import §_-F19§.§_-u12§;
   import §_-T1r§.§_-b2M§;
   import §_-T1r§.§_-p13§;
   import §_-TX§.§_-I24§;
   import §_-TX§.§_-d§;
   import §_-b1A§.§_-63g§;
   import §_-b1A§.§_-q1T§;
   import §_-p1g§.§_-Db§;
   import §_-p1g§.§_-PK§;
   import §_-qJ§.§_-T1q§;
   import §_-qJ§.§_-kU§;
   import §_-u1f§.§_-83z§;
   import §_-u1f§.§_-zf§;
   
   public class §_-Nk§
   {
      
      public static const §_-S2d§:Array = ["heroObjects","heroObjectsBattle","heroObjectsTwoShamans","heroObjectsSurvival","heroObjectsZombie","heroObjectsVolcano","heroObjectsAll"];
      
      public static const §_-i2n§:Array = ["shaman","shamanTwoShamans"];
      
      public static const §_-F6§:Array = ["joints","jointsAnomal","jointsStorm"];
      
      public function §_-Nk§()
      {
         super();
      }
      
      public static function mapClass(param1:int, param2:int) : Class
      {
         return §_-W1U§(param1,param2).mapClass;
      }
      
      public static function collectionClass(param1:int, param2:int) : Class
      {
         return §_-W1U§(param1,param2).collectionClass;
      }
      
      public static function heroPanel(param1:int, param2:int) : String
      {
         return §_-W1U§(param1,param2).heroPanel;
      }
      
      public static function shamanPanel(param1:int, param2:int) : String
      {
         return §_-W1U§(param1,param2).shamanPanel;
      }
      
      public static function §_-D2N§(param1:int) : Boolean
      {
         return param1 == §_-q1p§.§_-w1Y§;
      }
      
      public static function jointsPanel(param1:int, param2:int) : String
      {
         return §_-W1U§(param1,param2).jointsPanel;
      }
      
      private static function §_-W1U§(param1:int, param2:int) : Object
      {
         var _loc3_:Class = §_-K15§;
         var _loc4_:Class = §_-W28§;
         var _loc5_:String = null;
         var _loc6_:String = "shaman";
         var _loc7_:String = null;
         switch(param2)
         {
            case §_-q1p§.§_-SF§:
               _loc3_ = §_-63g§;
               _loc4_ = §_-q1T§;
               break;
            case §_-q1p§.§_-l1M§:
               _loc3_ = §_-Db§;
               _loc4_ = §_-PK§;
               _loc5_ = "heroObjectsTwoShamans";
               break;
            case §_-q1p§.§_-w1Y§:
               _loc3_ = §_-w1y§;
               _loc4_ = §_-rZ§;
               _loc5_ = "heroObjectsSurvival";
               _loc6_ = "shamanTwoShamans";
               break;
            case §_-q1p§.§_-h2d§:
            case §_-q1p§.§_-3F§:
               _loc3_ = §_-I1V§;
               _loc4_ = §_-u12§;
               break;
            case §_-q1p§.§_-G21§:
               _loc3_ = §_-u1n§;
               _loc7_ = "jointsStorm";
               break;
            case §_-q1p§.§_-lZ§:
               _loc3_ = §_-d§;
               _loc4_ = §_-I24§;
               _loc5_ = "heroObjectsZombie";
               break;
            case §_-q1p§.§_-ri§:
               _loc3_ = §_-83z§;
               _loc4_ = §_-zf§;
               _loc5_ = "heroObjectsVolcano";
         }
         if(_loc3_ == §_-K15§)
         {
            switch(param1)
            {
               case §_-q1p§.§_-M1m§:
               case §_-q1p§.§_-k2m§:
                  _loc3_ = §_-p13§;
                  _loc4_ = §_-b2M§;
                  break;
               case §_-q1p§.§_-P4§:
                  _loc3_ = §_-kU§;
                  _loc4_ = §_-T1q§;
            }
         }
         if(_loc5_ == null)
         {
            switch(param1)
            {
               case §_-q1p§.§_-M1m§:
               case §_-q1p§.§_-k2m§:
                  _loc5_ = "heroObjectsBattle";
                  break;
               case §_-q1p§.§_-u2f§:
               case §_-q1p§.§_-l2I§:
                  _loc5_ = "heroObjectsAll";
                  break;
               default:
                  _loc5_ = "heroObjects";
            }
         }
         if(_loc7_ == null)
         {
            if(param1 == §_-q1p§.§_-P4§)
            {
               _loc7_ = "jointsStorm";
            }
            else
            {
               switch(param1)
               {
                  case §_-q1p§.§_-u2u§:
                  case §_-q1p§.§_-u2f§:
                  case §_-q1p§.§_-l2I§:
                  case §_-q1p§.§_-A3z§:
                  case §_-q1p§.§_-k2m§:
                     _loc7_ = "jointsAnomal";
                     break;
                  default:
                     _loc7_ = "joints";
               }
            }
         }
         return {
            "mapClass":_loc3_,
            "collectionClass":_loc4_,
            "heroPanel":_loc5_,
            "shamanPanel":_loc6_,
            "jointsPanel":_loc7_
         };
      }
   }
}


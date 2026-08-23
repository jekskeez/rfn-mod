package §_-l2u§
{
   import §_-53r§.§_-33N§;
   import §_-53r§.§_-d2C§;
   import §_-921§.§_-P8§;
   import §_-921§.§_-j1Q§;
   import §_-93q§.§_-A1T§;
   import §_-93q§.§_-HC§;
   import §_-O1O§.§_-eQ§;
   import §_-O1O§.§_-wv§;
   import §_-RQ§.§_-ut§;
   import §_-cm§.§_-Q22§;
   import §_-cm§.§_-R2C§;
   import §_-o1W§.§_-82g§;
   import §_-o1W§.§_-I21§;
   import §_-q1N§.§_-51E§;
   import §_-q1N§.§_-cX§;
   import §_-r1M§.§_-IL§;
   import §_-r1M§.§_-TY§;
   
   public class §_-hF§
   {
      
      public static const §_-qy§:Array = ["heroObjects","heroObjectsBattle","heroObjectsTwoShamans","heroObjectsSurvival","heroObjectsZombie","heroObjectsVolcano","heroObjectsAll"];
      
      public static const §_-Zu§:Array = ["shaman","shamanTwoShamans"];
      
      public static const §_-ph§:Array = ["joints","jointsAnomal","jointsStorm"];
      
      public function §_-hF§()
      {
         super();
      }
      
      public static function mapClass(param1:int, param2:int) : Class
      {
         return §_-q1G§(param1,param2).mapClass;
      }
      
      public static function collectionClass(param1:int, param2:int) : Class
      {
         return §_-q1G§(param1,param2).collectionClass;
      }
      
      public static function heroPanel(param1:int, param2:int) : String
      {
         return §_-q1G§(param1,param2).heroPanel;
      }
      
      public static function shamanPanel(param1:int, param2:int) : String
      {
         return §_-q1G§(param1,param2).shamanPanel;
      }
      
      public static function §_-nz§(param1:int) : Boolean
      {
         return param1 == §_-at§.§_-F15§;
      }
      
      public static function jointsPanel(param1:int, param2:int) : String
      {
         return §_-q1G§(param1,param2).jointsPanel;
      }
      
      private static function §_-q1G§(param1:int, param2:int) : Object
      {
         var _loc3_:Class = §_-53A§;
         var _loc4_:Class = §_-Rp§;
         var _loc5_:String = null;
         var _loc6_:String = "shaman";
         var _loc7_:String = null;
         switch(param2)
         {
            case §_-at§.§_-R2V§:
               _loc3_ = §_-HC§;
               _loc4_ = §_-A1T§;
               break;
            case §_-at§.§_-83q§:
               _loc3_ = §_-IL§;
               _loc4_ = §_-TY§;
               _loc5_ = "heroObjectsTwoShamans";
               break;
            case §_-at§.§_-F15§:
               _loc3_ = §_-51E§;
               _loc4_ = §_-cX§;
               _loc5_ = "heroObjectsSurvival";
               _loc6_ = "shamanTwoShamans";
               break;
            case §_-at§.§_-n1O§:
            case §_-at§.§_-dH§:
               _loc3_ = §_-wv§;
               _loc4_ = §_-eQ§;
               break;
            case §_-at§.§_-x19§:
               _loc3_ = §_-ut§;
               _loc7_ = "jointsStorm";
               break;
            case §_-at§.§_-O2n§:
               _loc3_ = §_-82g§;
               _loc4_ = §_-I21§;
               _loc5_ = "heroObjectsZombie";
               break;
            case §_-at§.§_-r1j§:
               _loc3_ = §_-33N§;
               _loc4_ = §_-d2C§;
               _loc5_ = "heroObjectsVolcano";
         }
         if(_loc3_ == §_-53A§)
         {
            switch(param1)
            {
               case §_-at§.§_-N2g§:
               case §_-at§.§_-31L§:
                  _loc3_ = §_-Q22§;
                  _loc4_ = §_-R2C§;
                  break;
               case §_-at§.§_-92b§:
                  _loc3_ = §_-j1Q§;
                  _loc4_ = §_-P8§;
            }
         }
         if(_loc5_ == null)
         {
            switch(param1)
            {
               case §_-at§.§_-N2g§:
               case §_-at§.§_-31L§:
                  _loc5_ = "heroObjectsBattle";
                  break;
               case §_-at§.§_-22E§:
               case §_-at§.§_-lg§:
                  _loc5_ = "heroObjectsAll";
                  break;
               default:
                  _loc5_ = "heroObjects";
            }
         }
         if(_loc7_ == null)
         {
            if(param1 == §_-at§.§_-92b§)
            {
               _loc7_ = "jointsStorm";
            }
            else
            {
               switch(param1)
               {
                  case §_-at§.§_-j1i§:
                  case §_-at§.§_-22E§:
                  case §_-at§.§_-lg§:
                  case §_-at§.§_-e2a§:
                  case §_-at§.§_-31L§:
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


package utils
{
   import §_-I10§.§_-428§;
   import §_-T2y§.§_-71o§;
   import §_-Y22§.§_-E1J§;
   import flash.geom.Point;
   
   public final class §_-je§
   {
      
      private static const §_-r1d§:int = 4;
      
      private static const §_-t1r§:int = 22;
      
      public function §_-je§()
      {
         super();
      }
      
      public static function §_-4§(param1:int, param2:int) : Point
      {
         var _loc3_:Point = §_-71o§.active is §_-E1J§ ? §_-wf§(param1) : §_-Q18§(param1);
         return §_-Wq§(_loc3_.x + param2 * §_-r1d§,_loc3_.y + param2 * §_-t1r§);
      }
      
      private static function §_-Wq§(param1:Number, param2:Number) : Point
      {
         if(Game.§_-d2t§)
         {
            return Game.§_-d2t§.localToGlobal(new Point(param1,param2));
         }
         return new Point(param1,param2);
      }
      
      private static function §_-Q18§(param1:int) : Point
      {
         var _loc2_:int = §_-a9§.§_-9o§ - 217;
         switch(param1)
         {
            case §_-428§.§_-wG§:
               return new Point(234,18);
            case §_-428§.§_-113§:
               return new Point(333,18);
            case §_-428§.§_-61Q§:
               return new Point(125,10);
            case §_-428§.§_-a1H§:
               return new Point(131,22);
            case §_-428§.§_-P13§:
               return new Point(125,35);
            case §_-428§.§_-8r§:
               return new Point(155,62);
            case §_-428§.§_-O2P§:
               return new Point(130,60);
            case §_-428§.§_-m2z§:
            case §_-428§.§_-Z2n§:
            case §_-428§.§_-N1P§:
            case §_-428§.§_-dU§:
            case §_-428§.§_-Q1C§:
            case §_-428§.§_-cb§:
               return new Point(_loc2_,37);
            case §_-428§.§_-q1H§:
               return new Point(_loc2_,156);
            default:
               return new Point(Game.stage.stageWidth + 50,-50);
         }
      }
      
      private static function §_-wf§(param1:int) : Point
      {
         switch(param1)
         {
            case §_-428§.§_-wG§:
               return new Point(125,16);
            case §_-428§.§_-113§:
               return new Point(217,16);
            case §_-428§.§_-61Q§:
               return new Point(7,6);
            case §_-428§.§_-a1H§:
               return new Point(15,15);
            case §_-428§.§_-P13§:
               return new Point(7,25);
            case §_-428§.§_-8r§:
               return new Point(70,57);
            case §_-428§.§_-O2P§:
               return new Point(11,60);
            case §_-428§.§_-m2z§:
            case §_-428§.§_-Z2n§:
            case §_-428§.§_-N1P§:
            case §_-428§.§_-dU§:
            case §_-428§.§_-Q1C§:
            case §_-428§.§_-cb§:
            case §_-428§.§_-q1H§:
         }
         return new Point(Game.stage.stageWidth + 50,-50);
      }
   }
}


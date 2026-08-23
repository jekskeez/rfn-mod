package utils
{
   import §_-I2Y§.§_-91K§;
   import §_-X1k§.§_-A3y§;
   import §_-c2C§.§_-t2c§;
   import flash.geom.Point;
   
   public final class §_-PL§
   {
      
      private static const §_-4K§:int = 4;
      
      private static const §_-41A§:int = 22;
      
      public function §_-PL§()
      {
         super();
      }
      
      public static function §_-Q2C§(param1:int, param2:int) : Point
      {
         var _loc3_:Point = §_-t2c§.active is §_-91K§ ? §_-X23§(param1) : §_-M1§(param1);
         return §_-gV§(_loc3_.x + param2 * §_-4K§,_loc3_.y + param2 * §_-41A§);
      }
      
      private static function §_-gV§(param1:Number, param2:Number) : Point
      {
         if(Game.§_-q1L§)
         {
            return Game.§_-q1L§.localToGlobal(new Point(param1,param2));
         }
         return new Point(param1,param2);
      }
      
      private static function §_-M1§(param1:int) : Point
      {
         var _loc2_:int = §_-Zy§.§_-21V§ - 217;
         switch(param1)
         {
            case §_-A3y§.§_-l2X§:
               return new Point(234,18);
            case §_-A3y§.§_-M1U§:
               return new Point(333,18);
            case §_-A3y§.§_-W27§:
               return new Point(125,10);
            case §_-A3y§.§_-fz§:
               return new Point(131,22);
            case §_-A3y§.§_-V2n§:
               return new Point(125,35);
            case §_-A3y§.§_-j1G§:
               return new Point(155,62);
            case §_-A3y§.§_-y2q§:
               return new Point(130,60);
            case §_-A3y§.§_-33h§:
            case §_-A3y§.§_-Z2h§:
            case §_-A3y§.§_-o2t§:
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-736§:
            case §_-A3y§.§_-QS§:
               return new Point(_loc2_,37);
            case §_-A3y§.§_-A2§:
               return new Point(_loc2_,156);
            default:
               return new Point(Game.stage.stageWidth + 50,-50);
         }
      }
      
      private static function §_-X23§(param1:int) : Point
      {
         switch(param1)
         {
            case §_-A3y§.§_-l2X§:
               return new Point(125,16);
            case §_-A3y§.§_-M1U§:
               return new Point(217,16);
            case §_-A3y§.§_-W27§:
               return new Point(7,6);
            case §_-A3y§.§_-fz§:
               return new Point(15,15);
            case §_-A3y§.§_-V2n§:
               return new Point(7,25);
            case §_-A3y§.§_-j1G§:
               return new Point(70,57);
            case §_-A3y§.§_-y2q§:
               return new Point(11,60);
            case §_-A3y§.§_-33h§:
            case §_-A3y§.§_-Z2h§:
            case §_-A3y§.§_-o2t§:
            case §_-A3y§.§_-t1F§:
            case §_-A3y§.§_-736§:
            case §_-A3y§.§_-QS§:
            case §_-A3y§.§_-A2§:
         }
         return new Point(Game.stage.stageWidth + 50,-50);
      }
   }
}


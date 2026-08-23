package §_-l2u§
{
   import §_-B1G§.§_-32t§;
   import game.mainGame.SquirrelGame;
   
   public class §_-V2i§
   {
      
      public function §_-V2i§()
      {
         super();
      }
      
      public static function §_-r2d§(param1:§_-32t§, param2:int) : int
      {
         var _loc3_:Object = param1.§_-E2v§;
         if(_loc3_ == null && param1.§_-JZ§ >= 0)
         {
            _loc3_ = param1.getItemAt(param1.§_-JZ§);
         }
         return _loc3_ != null ? int(_loc3_["value"]) : param2;
      }
      
      public static function §_-x2t§(param1:§_-32t§) : int
      {
         return param1.visible ? §_-r2d§(param1,0) : 0;
      }
      
      public static function open(param1:int, param2:int, param3:int, param4:int) : void
      {
         (SquirrelGame.instance as §_-62b§).§_-S1Y§(param1,param2,param3,param4);
      }
      
      public static function §_-22W§(param1:int, param2:int, param3:int) : void
      {
         (SquirrelGame.instance as §_-62b§).§_-O1A§(param1,param2,param3);
      }
   }
}


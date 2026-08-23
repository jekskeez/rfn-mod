package §_-Rj§
{
   import §_-Kr§.§_-h1x§;
   import game.mainGame.SquirrelGame;
   
   public class §_-x1I§
   {
      
      public function §_-x1I§()
      {
         super();
      }
      
      public static function §_-S1n§(param1:§_-h1x§, param2:int) : int
      {
         var _loc3_:Object = param1.§_-l1§;
         if(_loc3_ == null && param1.§_-Uf§ >= 0)
         {
            _loc3_ = param1.getItemAt(param1.§_-Uf§);
         }
         return _loc3_ != null ? int(_loc3_["value"]) : param2;
      }
      
      public static function §_-43B§(param1:§_-h1x§) : int
      {
         return param1.visible ? §_-S1n§(param1,0) : 0;
      }
      
      public static function open(param1:int, param2:int, param3:int, param4:int) : void
      {
         (SquirrelGame.instance as §_-A32§).§_-Ao§(param1,param2,param3,param4);
      }
      
      public static function §_-s1E§(param1:int, param2:int, param3:int) : void
      {
         (SquirrelGame.instance as §_-A32§).§_-m1Q§(param1,param2,param3);
      }
   }
}


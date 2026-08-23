package utils
{
   import §_-X1k§.§_-n1C§;
   import game.mainGame.§_-v1N§;
   import game.mainGame.entity.§_-f1b§;
   
   public class §_-Zc§
   {
      
      public function §_-Zc§()
      {
         super();
      }
      
      public static function §_-aq§(param1:Object) : Vector.<§_-v1N§>
      {
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc2_:Vector.<§_-v1N§> = new Vector.<§_-v1N§>();
         for(_loc3_ in param1)
         {
            if(param1[_loc3_] > 0)
            {
               _loc4_ = §_-n1C§.§_-71N§(int(_loc3_));
               if(_loc4_)
               {
                  _loc2_.push(new §_-v1N§(_loc4_,§_-v1N§.§_-T2l§,param1[_loc3_]));
               }
            }
         }
         return _loc2_;
      }
      
      public static function §_-B4§(param1:Array) : Vector.<§_-v1N§>
      {
         var _loc2_:Vector.<§_-v1N§> = new Vector.<§_-v1N§>();
         var _loc3_:Array = §_-cx§.§_-y1Z§(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.push(new §_-v1N§(§_-f1b§.§_-N1m§(_loc3_[_loc4_]),§_-v1N§.§_-T1s§));
            _loc4_++;
         }
         return _loc2_;
      }
   }
}


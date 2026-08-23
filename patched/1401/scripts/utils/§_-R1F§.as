package utils
{
   import §_-I10§.§_-X2T§;
   import game.mainGame.§_-bM§;
   import game.mainGame.entity.§_-03s§;
   
   public class §_-R1F§
   {
      
      public function §_-R1F§()
      {
         super();
      }
      
      public static function §_-8g§(param1:Object) : Vector.<§_-bM§>
      {
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc2_:Vector.<§_-bM§> = new Vector.<§_-bM§>();
         for(_loc3_ in param1)
         {
            if(param1[_loc3_] > 0)
            {
               _loc4_ = §_-X2T§.§_-s1f§(int(_loc3_));
               if(_loc4_)
               {
                  _loc2_.push(new §_-bM§(_loc4_,§_-bM§.§_-S2D§,param1[_loc3_]));
               }
            }
         }
         return _loc2_;
      }
      
      public static function §_-V2A§(param1:Array) : Vector.<§_-bM§>
      {
         var _loc2_:Vector.<§_-bM§> = new Vector.<§_-bM§>();
         var _loc3_:Array = §_-qF§.§_-yi§(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.push(new §_-bM§(§_-03s§.§_-F1T§(_loc3_[_loc4_]),§_-bM§.§_-Qg§));
            _loc4_++;
         }
         return _loc2_;
      }
   }
}


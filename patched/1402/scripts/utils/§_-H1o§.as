package utils
{
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   
   public class §_-H1o§
   {
      
      public function §_-H1o§()
      {
         super();
      }
      
      public static function §_-w2I§(param1:Array, param2:int = -2147483648) : §_-aS§
      {
         var _loc4_:§_-aS§ = null;
         var _loc5_:§_-aS§ = null;
         var _loc6_:int = 0;
         var _loc3_:int = int.MAX_VALUE;
         for each(_loc5_ in param1)
         {
            if(_loc5_.parentStarling != null)
            {
               _loc6_ = int(_loc5_.parentStarling.getChildStarlingIndex(_loc5_));
               if(!(_loc3_ < _loc6_ || _loc6_ < param2))
               {
                  _loc4_ = _loc5_;
                  _loc3_ = _loc6_;
               }
            }
         }
         return _loc4_;
      }
      
      public static function §_-XF§(param1:Array, param2:int = 2147483647) : §_-aS§
      {
         var _loc5_:§_-aS§ = null;
         var _loc6_:int = 0;
         var _loc3_:int = int.MIN_VALUE;
         var _loc4_:§_-aS§ = null;
         for each(_loc5_ in param1)
         {
            if(_loc5_.parentStarling != null)
            {
               _loc6_ = int(_loc5_.parentStarling.getChildStarlingIndex(_loc5_));
               if(!(_loc3_ > _loc6_ || _loc6_ > param2))
               {
                  _loc4_ = _loc5_;
                  _loc3_ = _loc6_;
               }
            }
         }
         return _loc4_;
      }
      
      public static function §_-92N§(param1:Array, param2:int) : void
      {
         var _loc3_:§_-aS§ = null;
         if(param2 == 0)
         {
            return;
         }
         param1 = §_-f2h§(param1,param2 < 0 ? int(Array.DESCENDING) : 0);
         for each(_loc3_ in param1)
         {
            if(!shift(_loc3_,param2))
            {
               return;
            }
         }
      }
      
      public static function §_-f2h§(param1:Array, param2:int = 0) : Array
      {
         var _loc4_:* = undefined;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc3_:Array = [];
         for each(_loc4_ in param1)
         {
            if(_loc4_ != null)
            {
               if(_loc4_ is §_-51g§)
               {
                  _loc3_.push({
                     "object":_loc4_,
                     "index":(_loc4_.parentStarling == null ? int.MAX_VALUE : _loc4_.parentStarling.getChildStarlingIndex(_loc4_))
                  });
               }
            }
         }
         _loc3_.sortOn("index",Array.NUMERIC | param2);
         _loc5_ = [];
         for each(_loc6_ in _loc3_)
         {
            _loc5_.unshift(_loc6_["object"]);
         }
         return _loc5_;
      }
      
      public static function shift(param1:§_-aS§, param2:int) : Boolean
      {
         if(param2 == 0)
         {
            return false;
         }
         if(param1.parentStarling == null)
         {
            return false;
         }
         var _loc3_:int = param1.parentStarling.numChildren - 1;
         var _loc4_:int = int(param1.parentStarling.getChildStarlingIndex(param1));
         if(_loc4_ + param2 > _loc3_ || _loc4_ + param2 < 0)
         {
            return false;
         }
         param1.parentStarling.setChildStarlingIndex(param1,_loc4_ + param2);
         return true;
      }
   }
}


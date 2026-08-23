package hscript
{
   import §_-Jf§.§_-y1y§;
   
   public class §_-02Y§
   {
      
      public function §_-02Y§()
      {
      }
      
      public static function §_-S1m§(param1:String, param2:* = undefined) : *
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as String;
         var _loc3_:§_-e2L§ = new §_-e2L§();
         var _loc4_:§_-eu§ = _loc3_.§_-B2G§(param1);
         var _loc5_:§_-Jf§.§_-y1y§ = hscript.§_-y1y§.encode(_loc4_);
         _loc4_ = hscript.§_-y1y§.§_-G2m§(_loc5_);
         var _loc6_:§_-91W§ = new §_-91W§();
         if(param2 != null)
         {
            _loc7_ = 0;
            _loc8_ = §_-h1J§.§_-53o§(param2);
            while(_loc7_ < int(_loc8_.length))
            {
               _loc9_ = _loc8_[_loc7_];
               _loc7_++;
               _loc6_.variables.set(_loc9_,§_-h1J§.field(param2,_loc9_));
            }
         }
         var _loc10_:* = _loc6_.execute(_loc4_);
         if(param2 != null)
         {
            _loc7_ = 0;
            _loc8_ = §_-h1J§.§_-53o§(param2);
            while(_loc7_ < int(_loc8_.length))
            {
               _loc9_ = _loc8_[_loc7_];
               _loc7_++;
               _loc6_.variables.remove(_loc9_);
            }
         }
         return _loc10_;
      }
   }
}


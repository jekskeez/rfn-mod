package hscript
{
   import §_-x2C§.§_-U2O§;
   
   public class §_-w2M§
   {
      
      public function §_-w2M§()
      {
      }
      
      public static function §_-71e§(param1:String, param2:* = undefined) : *
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as String;
         var _loc3_:§_-Q2N§ = new §_-Q2N§();
         var _loc4_:§_-52O§ = _loc3_.§_-wD§(param1);
         var _loc5_:§_-x2C§.§_-U2O§ = hscript.§_-U2O§.encode(_loc4_);
         _loc4_ = hscript.§_-U2O§.§_-Y2a§(_loc5_);
         var _loc6_:§_-y2D§ = new §_-y2D§();
         if(param2 != null)
         {
            _loc7_ = 0;
            _loc8_ = §_-53k§.§_-23Z§(param2);
            while(_loc7_ < int(_loc8_.length))
            {
               _loc9_ = _loc8_[_loc7_];
               _loc7_++;
               _loc6_.variables.set(_loc9_,§_-53k§.field(param2,_loc9_));
            }
         }
         var _loc10_:* = _loc6_.execute(_loc4_);
         if(param2 != null)
         {
            _loc7_ = 0;
            _loc8_ = §_-53k§.§_-23Z§(param2);
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


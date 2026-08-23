package §_-81P§
{
   import §_-625§.§_-F1v§;
   import flash.utils.Dictionary;
   
   public class §_-61P§
   {
      
      public static const LINEAR:String = "linear";
      
      public static const §_-fq§:String = "easeIn";
      
      public static const §_-s4§:String = "easeOut";
      
      public static const §_-63S§:String = "easeInOut";
      
      public static const §_-pk§:String = "easeOutIn";
      
      public static const §_-v1z§:String = "easeInBack";
      
      public static const §_-K2n§:String = "easeOutBack";
      
      public static const §_-R1a§:String = "easeInOutBack";
      
      public static const §_-41D§:String = "easeOutInBack";
      
      public static const §_-cu§:String = "easeInElastic";
      
      public static const §_-d13§:String = "easeOutElastic";
      
      public static const §_-B3J§:String = "easeInOutElastic";
      
      public static const §_-H9§:String = "easeOutInElastic";
      
      public static const §_-514§:String = "easeInBounce";
      
      public static const §_-f11§:String = "easeOutBounce";
      
      public static const §_-rN§:String = "easeInOutBounce";
      
      public static const §_-13q§:String = "easeOutInBounce";
      
      private static var §_-N17§:Dictionary;
      
      public function §_-61P§()
      {
         super();
         throw new §_-F1v§();
      }
      
      public static function §_-b§(param1:String) : Function
      {
         if(§_-N17§ == null)
         {
            §_-N1D§();
         }
         return §_-N17§[param1];
      }
      
      public static function §_-a1K§(param1:String, param2:Function) : void
      {
         if(§_-N17§ == null)
         {
            §_-N1D§();
         }
         §_-N17§[param1] = param2;
      }
      
      private static function §_-N1D§() : void
      {
         §_-N17§ = new Dictionary();
         §_-a1K§(LINEAR,linear);
         §_-a1K§(§_-fq§,easeIn);
         §_-a1K§(§_-s4§,easeOut);
         §_-a1K§(§_-63S§,easeInOut);
         §_-a1K§(§_-pk§,easeOutIn);
         §_-a1K§(§_-v1z§,easeInBack);
         §_-a1K§(§_-K2n§,easeOutBack);
         §_-a1K§(§_-R1a§,easeInOutBack);
         §_-a1K§(§_-41D§,easeOutInBack);
         §_-a1K§(§_-cu§,easeInElastic);
         §_-a1K§(§_-d13§,easeOutElastic);
         §_-a1K§(§_-B3J§,easeInOutElastic);
         §_-a1K§(§_-H9§,easeOutInElastic);
         §_-a1K§(§_-514§,easeInBounce);
         §_-a1K§(§_-f11§,easeOutBounce);
         §_-a1K§(§_-rN§,easeInOutBounce);
         §_-a1K§(§_-13q§,easeOutInBounce);
      }
      
      protected static function linear(param1:Number) : Number
      {
         return param1;
      }
      
      protected static function easeIn(param1:Number) : Number
      {
         return param1 * param1 * param1;
      }
      
      protected static function easeOut(param1:Number) : Number
      {
         var _loc2_:Number = param1 - 1;
         return _loc2_ * _loc2_ * _loc2_ + 1;
      }
      
      protected static function easeInOut(param1:Number) : Number
      {
         return §_-g0§(easeIn,easeOut,param1);
      }
      
      protected static function easeOutIn(param1:Number) : Number
      {
         return §_-g0§(easeOut,easeIn,param1);
      }
      
      protected static function easeInBack(param1:Number) : Number
      {
         var _loc2_:Number = 1.70158;
         return Math.pow(param1,2) * ((_loc2_ + 1) * param1 - _loc2_);
      }
      
      protected static function easeOutBack(param1:Number) : Number
      {
         var _loc2_:Number = param1 - 1;
         var _loc3_:Number = 1.70158;
         return Math.pow(_loc2_,2) * ((_loc3_ + 1) * _loc2_ + _loc3_) + 1;
      }
      
      protected static function easeInOutBack(param1:Number) : Number
      {
         return §_-g0§(easeInBack,easeOutBack,param1);
      }
      
      protected static function easeOutInBack(param1:Number) : Number
      {
         return §_-g0§(easeOutBack,easeInBack,param1);
      }
      
      protected static function easeInElastic(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 == 0 || param1 == 1)
         {
            return param1;
         }
         _loc2_ = 0.3;
         _loc3_ = _loc2_ / 4;
         _loc4_ = param1 - 1;
         return -1 * Math.pow(2,10 * _loc4_) * Math.sin((_loc4_ - _loc3_) * (2 * Math.PI) / _loc2_);
      }
      
      protected static function easeOutElastic(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 == 0 || param1 == 1)
         {
            return param1;
         }
         _loc2_ = 0.3;
         _loc3_ = _loc2_ / 4;
         return Math.pow(2,-10 * param1) * Math.sin((param1 - _loc3_) * (2 * Math.PI) / _loc2_) + 1;
      }
      
      protected static function easeInOutElastic(param1:Number) : Number
      {
         return §_-g0§(easeInElastic,easeOutElastic,param1);
      }
      
      protected static function easeOutInElastic(param1:Number) : Number
      {
         return §_-g0§(easeOutElastic,easeInElastic,param1);
      }
      
      protected static function easeInBounce(param1:Number) : Number
      {
         return 1 - easeOutBounce(1 - param1);
      }
      
      protected static function easeOutBounce(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         var _loc2_:Number = 7.5625;
         var _loc3_:Number = 2.75;
         if(param1 < 1 / _loc3_)
         {
            _loc4_ = _loc2_ * Math.pow(param1,2);
         }
         else if(param1 < 2 / _loc3_)
         {
            param1 -= 1.5 / _loc3_;
            _loc4_ = _loc2_ * Math.pow(param1,2) + 0.75;
         }
         else if(param1 < 2.5 / _loc3_)
         {
            param1 -= 2.25 / _loc3_;
            _loc4_ = _loc2_ * Math.pow(param1,2) + 0.9375;
         }
         else
         {
            param1 -= 2.625 / _loc3_;
            _loc4_ = _loc2_ * Math.pow(param1,2) + 0.984375;
         }
         return _loc4_;
      }
      
      protected static function easeInOutBounce(param1:Number) : Number
      {
         return §_-g0§(easeInBounce,easeOutBounce,param1);
      }
      
      protected static function easeOutInBounce(param1:Number) : Number
      {
         return §_-g0§(easeOutBounce,easeInBounce,param1);
      }
      
      protected static function §_-g0§(param1:Function, param2:Function, param3:Number) : Number
      {
         if(param3 < 0.5)
         {
            return 0.5 * param1(param3 * 2);
         }
         return 0.5 * param2((param3 - 0.5) * 2) + 0.5;
      }
   }
}


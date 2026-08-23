package §_-m1z§
{
   import §_-kW§.§_-J1k§;
   import flash.utils.Dictionary;
   
   public class §_-Mk§
   {
      
      public static const LINEAR:String = "linear";
      
      public static const §_-Y16§:String = "easeIn";
      
      public static const §_-y22§:String = "easeOut";
      
      public static const §_-aG§:String = "easeInOut";
      
      public static const §_-27§:String = "easeOutIn";
      
      public static const §_-m1s§:String = "easeInBack";
      
      public static const §_-jn§:String = "easeOutBack";
      
      public static const §_-i2O§:String = "easeInOutBack";
      
      public static const §_-Y27§:String = "easeOutInBack";
      
      public static const §_-91z§:String = "easeInElastic";
      
      public static const §_-52f§:String = "easeOutElastic";
      
      public static const §_-v1E§:String = "easeInOutElastic";
      
      public static const §_-9t§:String = "easeOutInElastic";
      
      public static const §_-C3D§:String = "easeInBounce";
      
      public static const §_-b1N§:String = "easeOutBounce";
      
      public static const §_-RR§:String = "easeInOutBounce";
      
      public static const §_-mA§:String = "easeOutInBounce";
      
      private static var §_-J1b§:Dictionary;
      
      public function §_-Mk§()
      {
         super();
         throw new §_-J1k§();
      }
      
      public static function §_-11j§(param1:String) : Function
      {
         if(§_-J1b§ == null)
         {
            §_-2§();
         }
         return §_-J1b§[param1];
      }
      
      public static function §_-P2Y§(param1:String, param2:Function) : void
      {
         if(§_-J1b§ == null)
         {
            §_-2§();
         }
         §_-J1b§[param1] = param2;
      }
      
      private static function §_-2§() : void
      {
         §_-J1b§ = new Dictionary();
         §_-P2Y§(LINEAR,linear);
         §_-P2Y§(§_-Y16§,easeIn);
         §_-P2Y§(§_-y22§,easeOut);
         §_-P2Y§(§_-aG§,easeInOut);
         §_-P2Y§(§_-27§,easeOutIn);
         §_-P2Y§(§_-m1s§,easeInBack);
         §_-P2Y§(§_-jn§,easeOutBack);
         §_-P2Y§(§_-i2O§,easeInOutBack);
         §_-P2Y§(§_-Y27§,easeOutInBack);
         §_-P2Y§(§_-91z§,easeInElastic);
         §_-P2Y§(§_-52f§,easeOutElastic);
         §_-P2Y§(§_-v1E§,easeInOutElastic);
         §_-P2Y§(§_-9t§,easeOutInElastic);
         §_-P2Y§(§_-C3D§,easeInBounce);
         §_-P2Y§(§_-b1N§,easeOutBounce);
         §_-P2Y§(§_-RR§,easeInOutBounce);
         §_-P2Y§(§_-mA§,easeOutInBounce);
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
         return §_-s3§(easeIn,easeOut,param1);
      }
      
      protected static function easeOutIn(param1:Number) : Number
      {
         return §_-s3§(easeOut,easeIn,param1);
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
         return §_-s3§(easeInBack,easeOutBack,param1);
      }
      
      protected static function easeOutInBack(param1:Number) : Number
      {
         return §_-s3§(easeOutBack,easeInBack,param1);
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
         return §_-s3§(easeInElastic,easeOutElastic,param1);
      }
      
      protected static function easeOutInElastic(param1:Number) : Number
      {
         return §_-s3§(easeOutElastic,easeInElastic,param1);
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
         return §_-s3§(easeInBounce,easeOutBounce,param1);
      }
      
      protected static function easeOutInBounce(param1:Number) : Number
      {
         return §_-s3§(easeOutBounce,easeInBounce,param1);
      }
      
      protected static function §_-s3§(param1:Function, param2:Function, param3:Number) : Number
      {
         if(param3 < 0.5)
         {
            return 0.5 * param1(param3 * 2);
         }
         return 0.5 * param2((param3 - 0.5) * 2) + 0.5;
      }
   }
}


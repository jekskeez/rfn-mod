package
{
   public class §_-y6§
   {
      
      public function §_-y6§()
      {
      }
      
      public static function §_-6F§(param1:String) : String
      {
         return encodeURIComponent(param1);
      }
      
      public static function §_-QZ§(param1:String) : String
      {
         return decodeURIComponent(param1.split("+").join(" "));
      }
      
      public static function §_-B2N§(param1:String) : String
      {
         return param1.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;");
      }
      
      public static function §_-P18§(param1:String) : String
      {
         return param1.split("&gt;").join(">").split("&lt;").join("<").split("&amp;").join("&");
      }
      
      public static function §_-E1w§(param1:String, param2:String) : Boolean
      {
         return param1.length >= param2.length && param1.substr(0,param2.length) == param2;
      }
      
      public static function §_-k15§(param1:String, param2:String) : Boolean
      {
         var _loc3_:int = param2.length;
         var _loc4_:int = param1.length;
         return _loc4_ >= _loc3_ && param1.substr(_loc4_ - _loc3_,_loc3_) == param2;
      }
      
      public static function §_-H28§(param1:String, param2:int) : Boolean
      {
         var _loc3_:* = param1.charCodeAt(param2);
         return _loc3_ >= 9 && _loc3_ <= 13 || _loc3_ == 32;
      }
      
      public static function §_-g1P§(param1:String) : String
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_ && §_-y6§.§_-H28§(param1,_loc3_))
         {
            _loc3_++;
         }
         if(_loc3_ > 0)
         {
            return param1.substr(_loc3_,_loc2_ - _loc3_);
         }
         return param1;
      }
      
      public static function §_-21S§(param1:String) : String
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_ && §_-y6§.§_-H28§(param1,_loc2_ - _loc3_ - 1))
         {
            _loc3_++;
         }
         if(_loc3_ > 0)
         {
            return param1.substr(0,_loc2_ - _loc3_);
         }
         return param1;
      }
      
      public static function §_-22O§(param1:String) : String
      {
         return §_-y6§.§_-g1P§(§_-y6§.§_-21S§(param1));
      }
      
      public static function §_-8z§(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:* = param1.length;
         var _loc5_:int = param2.length;
         while(_loc4_ < param3)
         {
            if(param3 - _loc4_ < _loc5_)
            {
               param1 += param2.substr(0,param3 - _loc4_);
               _loc4_ = param3;
            }
            else
            {
               param1 += param2;
               _loc4_ += _loc5_;
            }
         }
         return param1;
      }
      
      public static function §_-J1Y§(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:String = "";
         var _loc5_:* = param1.length;
         if(_loc5_ >= param3)
         {
            return param1;
         }
         var _loc6_:int = param2.length;
         while(_loc5_ < param3)
         {
            if(param3 - _loc5_ < _loc6_)
            {
               _loc4_ += param2.substr(0,param3 - _loc5_);
               _loc5_ = param3;
            }
            else
            {
               _loc4_ += param2;
               _loc5_ += _loc6_;
            }
         }
         return _loc4_ + param1;
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function §_-Sb§(param1:int, param2:Object = undefined) : String
      {
         var _loc3_:uint = uint(param1);
         var _loc4_:String = _loc3_.toString(16);
         _loc4_ = _loc4_.toUpperCase();
         if(param2 != null)
         {
            while(_loc4_.length < param2)
            {
               _loc4_ = "0" + _loc4_;
            }
         }
         return _loc4_;
      }
      
      public static function §_-I1§(param1:String, param2:int) : int
      {
         return int(param1.charCodeAt(param2));
      }
      
      public static function §_-Z2p§(param1:int) : Boolean
      {
         return param1 == 0;
      }
   }
}


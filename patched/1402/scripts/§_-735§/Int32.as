package §_-735§
{
   import flash.Boot;
   
   public class Int32
   {
      
      public function Int32()
      {
      }
      
      public static function make(param1:int, param2:int) : int
      {
         return param1 << 16 | param2;
      }
      
      public static function §_-mc§(param1:int) : int
      {
         return param1;
      }
      
      public static function clamp(param1:int) : int
      {
         return param1;
      }
      
      public static function §_-f§(param1:int) : int
      {
         if((param1 >> 30 & 1) != param1 >>> 31)
         {
            Boot.§_-B2g§ = new Error();
            throw "Overflow " + param1;
         }
         return param1;
      }
      
      public static function §_-T7§(param1:int) : int
      {
         return param1;
      }
      
      public static function add(param1:int, param2:int) : int
      {
         return param1 + param2;
      }
      
      public static function sub(param1:int, param2:int) : int
      {
         return param1 - param2;
      }
      
      public static function mul(param1:int, param2:int) : int
      {
         return param1 * param2;
      }
      
      public static function div(param1:int, param2:int) : int
      {
         return int(param1 / param2);
      }
      
      public static function §_-iF§(param1:int, param2:int) : int
      {
         return int(param1 % param2);
      }
      
      public static function §_-91O§(param1:int, param2:int) : int
      {
         return param1 << param2;
      }
      
      public static function §_-C3X§(param1:int, param2:int) : int
      {
         return param1 >> param2;
      }
      
      public static function §_-s1h§(param1:int, param2:int) : int
      {
         return param1 >>> param2;
      }
      
      public static function §_-V1j§(param1:int, param2:int) : int
      {
         return param1 & param2;
      }
      
      public static function §_-t2q§(param1:int, param2:int) : int
      {
         return param1 | param2;
      }
      
      public static function §_-lK§(param1:int, param2:int) : int
      {
         return param1 ^ param2;
      }
      
      public static function neg(param1:int) : int
      {
         return -param1;
      }
      
      public static function §_-f1x§(param1:int) : Boolean
      {
         return param1 < 0;
      }
      
      public static function §_-yU§(param1:int) : Boolean
      {
         return param1 == 0;
      }
      
      public static function §_-t2m§(param1:int) : int
      {
         return ~param1;
      }
      
      public static function §_-t2T§(param1:int, param2:int) : int
      {
         return param1 - param2;
      }
      
      public static function §_-l1X§(param1:int, param2:int) : int
      {
         if(param1 < 0)
         {
            return param2 < 0 ? ~param2 - ~param1 : 1;
         }
         return param2 < 0 ? -1 : param1 - param2;
      }
   }
}


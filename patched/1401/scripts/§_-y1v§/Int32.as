package §_-y1v§
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
      
      public static function §_-O2q§(param1:int) : int
      {
         return param1;
      }
      
      public static function clamp(param1:int) : int
      {
         return param1;
      }
      
      public static function §_-Z1Z§(param1:int) : int
      {
         if((param1 >> 30 & 1) != param1 >>> 31)
         {
            Boot.§_-tp§ = new Error();
            throw "Overflow " + param1;
         }
         return param1;
      }
      
      public static function §_-5e§(param1:int) : int
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
      
      public static function §_-M16§(param1:int, param2:int) : int
      {
         return int(param1 % param2);
      }
      
      public static function §_-q2P§(param1:int, param2:int) : int
      {
         return param1 << param2;
      }
      
      public static function §_-m1J§(param1:int, param2:int) : int
      {
         return param1 >> param2;
      }
      
      public static function §_-S2v§(param1:int, param2:int) : int
      {
         return param1 >>> param2;
      }
      
      public static function §_-a2q§(param1:int, param2:int) : int
      {
         return param1 & param2;
      }
      
      public static function §_-33g§(param1:int, param2:int) : int
      {
         return param1 | param2;
      }
      
      public static function §_-w1p§(param1:int, param2:int) : int
      {
         return param1 ^ param2;
      }
      
      public static function neg(param1:int) : int
      {
         return -param1;
      }
      
      public static function §_-g29§(param1:int) : Boolean
      {
         return param1 < 0;
      }
      
      public static function §_-83B§(param1:int) : Boolean
      {
         return param1 == 0;
      }
      
      public static function §_-Dr§(param1:int) : int
      {
         return ~param1;
      }
      
      public static function §_-H§(param1:int, param2:int) : int
      {
         return param1 - param2;
      }
      
      public static function §_-zy§(param1:int, param2:int) : int
      {
         if(param1 < 0)
         {
            return param2 < 0 ? ~param2 - ~param1 : 1;
         }
         return param2 < 0 ? -1 : param1 - param2;
      }
   }
}


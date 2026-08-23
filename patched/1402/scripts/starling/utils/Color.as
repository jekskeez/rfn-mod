package starling.utils
{
   import §_-625§.§_-F1v§;
   
   public class Color
   {
      
      public static const §_-12y§:uint = 16777215;
      
      public static const §_-03m§:uint = 12632256;
      
      public static const §_-D2u§:uint = 8421504;
      
      public static const §_-f1P§:uint = 0;
      
      public static const §_-32L§:uint = 16711680;
      
      public static const §_-h28§:uint = 8388608;
      
      public static const §_-O1Q§:uint = 16776960;
      
      public static const §_-Y1b§:uint = 8421376;
      
      public static const §_-r1o§:uint = 65280;
      
      public static const §_-61b§:uint = 32768;
      
      public static const §_-630§:uint = 65535;
      
      public static const §_-81u§:uint = 32896;
      
      public static const §_-O2l§:uint = 255;
      
      public static const §_-vk§:uint = 128;
      
      public static const §_-I1K§:uint = 16711935;
      
      public static const §_-12s§:uint = 8388736;
      
      public function Color()
      {
         super();
         throw new §_-F1v§();
      }
      
      public static function §_-E2h§(param1:uint) : int
      {
         return param1 >> 24 & 0xFF;
      }
      
      public static function §_-u1j§(param1:uint) : int
      {
         return param1 >> 16 & 0xFF;
      }
      
      public static function §_-r1r§(param1:uint) : int
      {
         return param1 >> 8 & 0xFF;
      }
      
      public static function §_-H1H§(param1:uint) : int
      {
         return param1 & 0xFF;
      }
      
      public static function rgb(param1:int, param2:int, param3:int) : uint
      {
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function §_-MK§(param1:int, param2:int, param3:int, param4:int) : uint
      {
         return param1 << 24 | param2 << 16 | param3 << 8 | param4;
      }
   }
}


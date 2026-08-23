package starling.utils
{
   import §_-kW§.§_-J1k§;
   
   public class Color
   {
      
      public static const §_-32Y§:uint = 16777215;
      
      public static const §_-Y1c§:uint = 12632256;
      
      public static const §_-vp§:uint = 8421504;
      
      public static const §_-V1E§:uint = 0;
      
      public static const §_-B1F§:uint = 16711680;
      
      public static const §_-z2N§:uint = 8388608;
      
      public static const §_-L0§:uint = 16776960;
      
      public static const §_-U2l§:uint = 8421376;
      
      public static const §_-B3b§:uint = 65280;
      
      public static const §_-U2b§:uint = 32768;
      
      public static const §_-ZM§:uint = 65535;
      
      public static const §_-a1B§:uint = 32896;
      
      public static const §_-W1j§:uint = 255;
      
      public static const §_-r2H§:uint = 128;
      
      public static const §_-D3§:uint = 16711935;
      
      public static const §_-K1w§:uint = 8388736;
      
      public function Color()
      {
         super();
         throw new §_-J1k§();
      }
      
      public static function §_-s2w§(param1:uint) : int
      {
         return param1 >> 24 & 0xFF;
      }
      
      public static function §_-C3b§(param1:uint) : int
      {
         return param1 >> 16 & 0xFF;
      }
      
      public static function §_-F1q§(param1:uint) : int
      {
         return param1 >> 8 & 0xFF;
      }
      
      public static function §_-N1y§(param1:uint) : int
      {
         return param1 & 0xFF;
      }
      
      public static function rgb(param1:int, param2:int, param3:int) : uint
      {
         return param1 << 16 | param2 << 8 | param3;
      }
      
      public static function §_-2d§(param1:int, param2:int, param3:int, param4:int) : uint
      {
         return param1 << 24 | param2 << 16 | param3 << 8 | param4;
      }
   }
}


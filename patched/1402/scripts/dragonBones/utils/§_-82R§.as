package dragonBones.utils
{
   import flash.utils.ByteArray;
   
   public class §_-82R§
   {
      
      public static const §_-p2d§:String = "swf";
      
      public static const §_-D1Y§:String = "png";
      
      public static const §_-k1t§:String = "jpg";
      
      public static const ATF:String = "atf";
      
      public static const §_-x1o§:String = "zip";
      
      public function §_-82R§()
      {
         super();
      }
      
      public static function §_-iM§(param1:ByteArray) : String
      {
         var _loc2_:String = null;
         var _loc3_:uint = uint(param1[0]);
         var _loc4_:uint = uint(param1[1]);
         var _loc5_:uint = uint(param1[2]);
         var _loc6_:uint = uint(param1[3]);
         if((_loc3_ == 70 || _loc3_ == 67 || _loc3_ == 90) && _loc4_ == 87 && _loc5_ == 83)
         {
            _loc2_ = §_-p2d§;
         }
         else if(_loc3_ == 137 && _loc4_ == 80 && _loc5_ == 78 && _loc6_ == 71)
         {
            _loc2_ = §_-D1Y§;
         }
         else if(_loc3_ == 255)
         {
            _loc2_ = §_-k1t§;
         }
         else if(_loc3_ == 65 && _loc4_ == 84 && _loc5_ == 70)
         {
            _loc2_ = ATF;
         }
         else if(_loc3_ == 80 && _loc4_ == 75)
         {
            _loc2_ = §_-x1o§;
         }
         return _loc2_;
      }
   }
}


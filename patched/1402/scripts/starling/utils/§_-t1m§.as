package starling.utils
{
   import §_-625§.§_-F1v§;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   public class §_-t1m§
   {
      
      private static const §_-62H§:Number = 6.283185307179586;
      
      public function §_-t1m§()
      {
         super();
         throw new §_-F1v§();
      }
      
      public static function §_-Y1O§(param1:Vector3D, param2:Vector3D, param3:Point = null) : Point
      {
         if(param3 == null)
         {
            param3 = new Point();
         }
         var _loc4_:Number = param2.x - param1.x;
         var _loc5_:Number = param2.y - param1.y;
         var _loc6_:Number = param2.z - param1.z;
         var _loc7_:Number = -param1.z / _loc6_;
         param3.x = param1.x + _loc7_ * _loc4_;
         param3.y = param1.y + _loc7_ * _loc5_;
         return param3;
      }
      
      public static function §_-o1S§(param1:Number) : Number
      {
         param1 %= §_-62H§;
         if(param1 < -Math.PI)
         {
            param1 += §_-62H§;
         }
         if(param1 > Math.PI)
         {
            param1 -= §_-62H§;
         }
         return param1;
      }
      
      public static function clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 < param2 ? param2 : (param1 > param3 ? param3 : param1);
      }
   }
}


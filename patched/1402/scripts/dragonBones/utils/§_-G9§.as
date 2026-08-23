package dragonBones.utils
{
   import dragonBones.objects.DBTransform;
   import flash.geom.Matrix;
   
   public final class §_-G9§
   {
      
      private static const §_-W17§:Number = 1.5707963267948966;
      
      private static const §_-X26§:Number = 6.283185307179586;
      
      private static const §_-P1§:Matrix = new Matrix();
      
      public function §_-G9§()
      {
         super();
      }
      
      public static function §_-U2b§(param1:DBTransform, param2:DBTransform) : void
      {
         §_-03K§(param2,§_-P1§);
         §_-P1§.invert();
         var _loc3_:Number = param1.x;
         var _loc4_:Number = param1.y;
         param1.x = §_-P1§.a * _loc3_ + §_-P1§.c * _loc4_ + §_-P1§.tx;
         param1.y = §_-P1§.d * _loc4_ + §_-P1§.b * _loc3_ + §_-P1§.ty;
         param1.skewX = §_-n1w§(param1.skewX - param2.skewX);
         param1.skewY = §_-n1w§(param1.skewY - param2.skewY);
      }
      
      public static function §_-03K§(param1:DBTransform, param2:Matrix) : void
      {
         param2.a = param1.scaleX * Math.cos(param1.skewY);
         param2.b = param1.scaleX * Math.sin(param1.skewY);
         param2.c = -param1.scaleY * Math.sin(param1.skewX);
         param2.d = param1.scaleY * Math.cos(param1.skewX);
         param2.tx = param1.x;
         param2.ty = param1.y;
      }
      
      public static function §_-n1w§(param1:Number) : Number
      {
         param1 %= §_-X26§;
         if(param1 > Math.PI)
         {
            param1 -= §_-X26§;
         }
         if(param1 < -Math.PI)
         {
            param1 += §_-X26§;
         }
         return param1;
      }
   }
}


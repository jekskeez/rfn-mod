package dragonBones.utils
{
   import dragonBones.objects.DBTransform;
   import flash.geom.Matrix;
   
   public final class §_-mP§
   {
      
      private static const §_-C1D§:Number = 1.5707963267948966;
      
      private static const §_-P1t§:Number = 6.283185307179586;
      
      private static const §_-HT§:Matrix = new Matrix();
      
      public function §_-mP§()
      {
         super();
      }
      
      public static function §_-zR§(param1:DBTransform, param2:DBTransform) : void
      {
         §_-G2T§(param2,§_-HT§);
         §_-HT§.invert();
         var _loc3_:Number = param1.x;
         var _loc4_:Number = param1.y;
         param1.x = §_-HT§.a * _loc3_ + §_-HT§.c * _loc4_ + §_-HT§.tx;
         param1.y = §_-HT§.d * _loc4_ + §_-HT§.b * _loc3_ + §_-HT§.ty;
         param1.skewX = §_-63l§(param1.skewX - param2.skewX);
         param1.skewY = §_-63l§(param1.skewY - param2.skewY);
      }
      
      public static function §_-G2T§(param1:DBTransform, param2:Matrix) : void
      {
         param2.a = param1.scaleX * Math.cos(param1.skewY);
         param2.b = param1.scaleX * Math.sin(param1.skewY);
         param2.c = -param1.scaleY * Math.sin(param1.skewX);
         param2.d = param1.scaleY * Math.cos(param1.skewX);
         param2.tx = param1.x;
         param2.ty = param1.y;
      }
      
      public static function §_-63l§(param1:Number) : Number
      {
         param1 %= §_-P1t§;
         if(param1 > Math.PI)
         {
            param1 -= §_-P1t§;
         }
         if(param1 < -Math.PI)
         {
            param1 += §_-P1t§;
         }
         return param1;
      }
   }
}


package starling.utils
{
   import §_-625§.§_-F1v§;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   public class §_-r1p§
   {
      
      private static var §_-K25§:Vector.<Number> = new <Number>[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
      
      private static var sRawData2:Vector.<Number> = new Vector.<Number>(16,true);
      
      public function §_-r1p§()
      {
         super();
         throw new §_-F1v§();
      }
      
      public static function convertTo3D(param1:Matrix, param2:Matrix3D = null) : Matrix3D
      {
         if(param2 == null)
         {
            param2 = new Matrix3D();
         }
         §_-K25§[0] = param1.a;
         §_-K25§[1] = param1.b;
         §_-K25§[4] = param1.c;
         §_-K25§[5] = param1.d;
         §_-K25§[12] = param1.tx;
         §_-K25§[13] = param1.ty;
         param2.copyRawDataFrom(§_-K25§);
         return param2;
      }
      
      public static function convertTo2D(param1:Matrix3D, param2:Matrix = null) : Matrix
      {
         if(param2 == null)
         {
            param2 = new Matrix();
         }
         param1.copyRawDataTo(sRawData2);
         param2.a = sRawData2[0];
         param2.b = sRawData2[1];
         param2.c = sRawData2[4];
         param2.d = sRawData2[5];
         param2.tx = sRawData2[12];
         param2.ty = sRawData2[13];
         return param2;
      }
      
      public static function §_-M7§(param1:Matrix, param2:Point, param3:Point = null) : Point
      {
         return §_-317§(param1,param2.x,param2.y,param3);
      }
      
      public static function transformPoint3D(param1:Matrix3D, param2:Vector3D, param3:Vector3D = null) : Vector3D
      {
         return transformCoords3D(param1,param2.x,param2.y,param2.z,param3);
      }
      
      public static function §_-317§(param1:Matrix, param2:Number, param3:Number, param4:Point = null) : Point
      {
         if(param4 == null)
         {
            param4 = new Point();
         }
         param4.x = param1.a * param2 + param1.c * param3 + param1.tx;
         param4.y = param1.d * param3 + param1.b * param2 + param1.ty;
         return param4;
      }
      
      public static function transformCoords3D(param1:Matrix3D, param2:Number, param3:Number, param4:Number, param5:Vector3D = null) : Vector3D
      {
         if(param5 == null)
         {
            param5 = new Vector3D();
         }
         param1.copyRawDataTo(sRawData2);
         param5.x = param2 * sRawData2[0] + param3 * sRawData2[4] + param4 * sRawData2[8] + sRawData2[12];
         param5.y = param2 * sRawData2[1] + param3 * sRawData2[5] + param4 * sRawData2[9] + sRawData2[13];
         param5.z = param2 * sRawData2[2] + param3 * sRawData2[6] + param4 * sRawData2[10] + sRawData2[14];
         param5.w = param2 * sRawData2[3] + param3 * sRawData2[7] + param4 * sRawData2[11] + sRawData2[15];
         return param5;
      }
      
      public static function §_-S1b§(param1:Matrix, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = Math.sin(param2);
         var _loc5_:Number = Math.cos(param2);
         var _loc6_:Number = Math.sin(param3);
         var _loc7_:Number = Math.cos(param3);
         param1.setTo(param1.a * _loc7_ - param1.b * _loc4_,param1.a * _loc6_ + param1.b * _loc5_,param1.c * _loc7_ - param1.d * _loc4_,param1.c * _loc6_ + param1.d * _loc5_,param1.tx * _loc7_ - param1.ty * _loc4_,param1.tx * _loc6_ + param1.ty * _loc5_);
      }
      
      public static function §_-d2I§(param1:Matrix, param2:Matrix) : void
      {
         param1.setTo(param1.a * param2.a + param1.c * param2.b,param1.b * param2.a + param1.d * param2.b,param1.a * param2.c + param1.c * param2.d,param1.b * param2.c + param1.d * param2.d,param1.tx + param1.a * param2.tx + param1.c * param2.ty,param1.ty + param1.b * param2.tx + param1.d * param2.ty);
      }
      
      public static function prependTranslation(param1:Matrix, param2:Number, param3:Number) : void
      {
         param1.tx += param1.a * param2 + param1.c * param3;
         param1.ty += param1.b * param2 + param1.d * param3;
      }
      
      public static function §_-z2s§(param1:Matrix, param2:Number, param3:Number) : void
      {
         param1.setTo(param1.a * param2,param1.b * param2,param1.c * param3,param1.d * param3,param1.tx,param1.ty);
      }
      
      public static function §_-Wz§(param1:Matrix, param2:Number) : void
      {
         var _loc3_:Number = Math.sin(param2);
         var _loc4_:Number = Math.cos(param2);
         param1.setTo(param1.a * _loc4_ + param1.c * _loc3_,param1.b * _loc4_ + param1.d * _loc3_,param1.c * _loc4_ - param1.a * _loc3_,param1.d * _loc4_ - param1.b * _loc3_,param1.tx,param1.ty);
      }
      
      public static function §_-m2E§(param1:Matrix, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = Math.sin(param2);
         var _loc5_:Number = Math.cos(param2);
         var _loc6_:Number = Math.sin(param3);
         var _loc7_:Number = Math.cos(param3);
         param1.setTo(param1.a * _loc7_ + param1.c * _loc6_,param1.b * _loc7_ + param1.d * _loc6_,param1.c * _loc5_ - param1.a * _loc4_,param1.d * _loc5_ - param1.b * _loc4_,param1.tx,param1.ty);
      }
   }
}


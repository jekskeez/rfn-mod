package utils
{
   import flash.geom.Point;
   
   public class §_-Z1S§
   {
      
      public function §_-Z1S§()
      {
         super();
      }
      
      public static function getAngle(param1:Point, param2:Point) : Number
      {
         var _loc3_:Point = new Point(param2.x - param1.x,param2.y - param1.y);
         var _loc4_:Number = Math.atan(_loc3_.y / _loc3_.x);
         _loc4_ *= Game.R2D;
         return _loc4_ + (_loc3_.x < 0 ? -1 : 1) * 90;
      }
   }
}


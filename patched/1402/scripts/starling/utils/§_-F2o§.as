package starling.utils
{
   import §_-625§.§_-F1v§;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-F2o§
   {
      
      private static const §_-O§:Point = new Point();
      
      private static const §_-c2L§:Vector.<Point> = new <Point>[new Point(0,0),new Point(1,0),new Point(0,1),new Point(1,1)];
      
      public function §_-F2o§()
      {
         super();
         throw new §_-F1v§();
      }
      
      public static function §_-42v§(param1:Rectangle, param2:Rectangle, param3:Rectangle = null) : Rectangle
      {
         if(param3 == null)
         {
            param3 = new Rectangle();
         }
         var _loc4_:Number = param1.x > param2.x ? param1.x : param2.x;
         var _loc5_:Number = param1.right < param2.right ? param1.right : param2.right;
         var _loc6_:Number = param1.y > param2.y ? param1.y : param2.y;
         var _loc7_:Number = param1.bottom < param2.bottom ? param1.bottom : param2.bottom;
         if(_loc4_ > _loc5_ || _loc6_ > _loc7_)
         {
            param3.setEmpty();
         }
         else
         {
            param3.setTo(_loc4_,_loc6_,_loc5_ - _loc4_,_loc7_ - _loc6_);
         }
         return param3;
      }
      
      public static function §_-11K§(param1:Rectangle, param2:Rectangle, param3:String = "showAll", param4:Boolean = false, param5:Rectangle = null) : Rectangle
      {
         if(!§_-q1f§.§_-B2D§(param3))
         {
            throw new ArgumentError("Invalid scaleMode: " + param3);
         }
         if(param5 == null)
         {
            param5 = new Rectangle();
         }
         var _loc6_:Number = param1.width;
         var _loc7_:Number = param1.height;
         var _loc8_:Number = param2.width / _loc6_;
         var _loc9_:Number = param2.height / _loc7_;
         var _loc10_:Number = 1;
         if(param3 == §_-q1f§.§_-rj§)
         {
            _loc10_ = _loc8_ < _loc9_ ? _loc8_ : _loc9_;
            if(param4)
            {
               _loc10_ = §_-t4§(_loc10_,false);
            }
         }
         else if(param3 == §_-q1f§.§_-Hm§)
         {
            _loc10_ = _loc8_ > _loc9_ ? _loc8_ : _loc9_;
            if(param4)
            {
               _loc10_ = §_-t4§(_loc10_,true);
            }
         }
         _loc6_ *= _loc10_;
         _loc7_ *= _loc10_;
         param5.setTo(param2.x + (param2.width - _loc6_) / 2,param2.y + (param2.height - _loc7_) / 2,_loc6_,_loc7_);
         return param5;
      }
      
      private static function §_-t4§(param1:Number, param2:Boolean) : Number
      {
         var _loc3_:Number = 1;
         if(param2)
         {
            if(param1 >= 0.5)
            {
               return Math.ceil(param1);
            }
            while(1 / (_loc3_ + 1) > param1)
            {
               _loc3_++;
            }
         }
         else
         {
            if(param1 >= 1)
            {
               return Math.floor(param1);
            }
            while(1 / _loc3_ > param1)
            {
               _loc3_++;
            }
         }
         return 1 / _loc3_;
      }
      
      public static function normalize(param1:Rectangle) : void
      {
         if(param1.width < 0)
         {
            param1.width = -param1.width;
            param1.x -= param1.width;
         }
         if(param1.height < 0)
         {
            param1.height = -param1.height;
            param1.y -= param1.height;
         }
      }
      
      public static function getBounds(param1:Rectangle, param2:Matrix, param3:Rectangle = null) : Rectangle
      {
         if(param3 == null)
         {
            param3 = new Rectangle();
         }
         var _loc4_:Number = Number.MAX_VALUE;
         var _loc5_:Number = -Number.MAX_VALUE;
         var _loc6_:Number = Number.MAX_VALUE;
         var _loc7_:Number = -Number.MAX_VALUE;
         var _loc8_:int = 0;
         while(_loc8_ < 4)
         {
            §_-r1p§.§_-317§(param2,§_-c2L§[_loc8_].x * param1.width,§_-c2L§[_loc8_].y * param1.height,§_-O§);
            if(_loc4_ > §_-O§.x)
            {
               _loc4_ = §_-O§.x;
            }
            if(_loc5_ < §_-O§.x)
            {
               _loc5_ = §_-O§.x;
            }
            if(_loc6_ > §_-O§.y)
            {
               _loc6_ = §_-O§.y;
            }
            if(_loc7_ < §_-O§.y)
            {
               _loc7_ = §_-O§.y;
            }
            _loc8_++;
         }
         param3.setTo(_loc4_,_loc6_,_loc5_ - _loc4_,_loc7_ - _loc6_);
         return param3;
      }
   }
}


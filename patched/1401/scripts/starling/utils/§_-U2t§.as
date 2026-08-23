package starling.utils
{
   import §_-kW§.§_-J1k§;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §_-U2t§
   {
      
      private static const §_-G2g§:Point = new Point();
      
      private static const §_-S2Y§:Vector.<Point> = new <Point>[new Point(0,0),new Point(1,0),new Point(0,1),new Point(1,1)];
      
      public function §_-U2t§()
      {
         super();
         throw new §_-J1k§();
      }
      
      public static function §_-F1s§(param1:Rectangle, param2:Rectangle, param3:Rectangle = null) : Rectangle
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
      
      public static function §_-K4§(param1:Rectangle, param2:Rectangle, param3:String = "showAll", param4:Boolean = false, param5:Rectangle = null) : Rectangle
      {
         if(!§_-w2s§.§_-CQ§(param3))
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
         if(param3 == §_-w2s§.§_-fj§)
         {
            _loc10_ = _loc8_ < _loc9_ ? _loc8_ : _loc9_;
            if(param4)
            {
               _loc10_ = §_-op§(_loc10_,false);
            }
         }
         else if(param3 == §_-w2s§.§_-LJ§)
         {
            _loc10_ = _loc8_ > _loc9_ ? _loc8_ : _loc9_;
            if(param4)
            {
               _loc10_ = §_-op§(_loc10_,true);
            }
         }
         _loc6_ *= _loc10_;
         _loc7_ *= _loc10_;
         param5.setTo(param2.x + (param2.width - _loc6_) / 2,param2.y + (param2.height - _loc7_) / 2,_loc6_,_loc7_);
         return param5;
      }
      
      private static function §_-op§(param1:Number, param2:Boolean) : Number
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
            §_-rI§.§_-Sy§(param2,§_-S2Y§[_loc8_].x * param1.width,§_-S2Y§[_loc8_].y * param1.height,§_-G2g§);
            if(_loc4_ > §_-G2g§.x)
            {
               _loc4_ = §_-G2g§.x;
            }
            if(_loc5_ < §_-G2g§.x)
            {
               _loc5_ = §_-G2g§.x;
            }
            if(_loc6_ > §_-G2g§.y)
            {
               _loc6_ = §_-G2g§.y;
            }
            if(_loc7_ < §_-G2g§.y)
            {
               _loc7_ = §_-G2g§.y;
            }
            _loc8_++;
         }
         param3.setTo(_loc4_,_loc6_,_loc5_ - _loc4_,_loc7_ - _loc6_);
         return param3;
      }
   }
}


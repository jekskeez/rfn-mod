package particles
{
   import Box2D.Common.Math.b2Vec2;
   import §_-OV§.§_-D2b§;
   import §_-OV§.§_-UG§;
   import §_-OV§.§_-h2s§;
   import §_-OV§.§_-vZ§;
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   
   public class Explode
   {
      
      public static var §_-rq§:§_-Sx§;
      
      public static var §_-N1E§:Boolean = false;
      
      private static var §_-O23§:Point = new Point();
      
      public function Explode()
      {
         super();
      }
      
      public static function §_-v2F§(param1:§_-h2I§, param2:b2Vec2, param3:b2Vec2, param4:Number) : void
      {
         var _loc5_:Array = §_-830§(param1);
         §_-Q2q§(§_-rq§,_loc5_,new Point(param2.x * Game.§_-x2P§,param2.y * Game.§_-x2P§),new Point(param3.x * Game.§_-x2P§,param3.y * Game.§_-x2P§),param4 / Math.log(param4));
      }
      
      private static function §_-830§(param1:§_-h2I§) : Array
      {
         var _loc3_:§_-h2I§ = null;
         var _loc4_:Point = null;
         var _loc2_:Array = [];
         if(param1.numChildren > 0)
         {
            while(param1.numChildren > 0)
            {
               _loc2_ = _loc2_.concat(§_-830§(param1.§_-ek§(0)));
               param1.§_-n2T§(0,false);
            }
         }
         else
         {
            _loc3_ = param1;
            _loc4_ = _loc3_.localToGlobal(§_-O23§);
            _loc3_.x = _loc4_.x;
            _loc3_.y = _loc4_.y;
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      private static function §_-Q2q§(param1:§_-Sx§, param2:Array, param3:Point, param4:Point, param5:Number, param6:Number = 7) : void
      {
         var _loc10_:§_-h2I§ = null;
         var _loc11_:Number = NaN;
         var _loc12_:§_-vZ§ = null;
         var _loc13_:§_-13p§ = null;
         var _loc14_:Point = null;
         var _loc15_:Number = NaN;
         var _loc7_:§_-h2s§ = new §_-h2s§();
         var _loc8_:§_-UG§ = new §_-UG§(param4);
         var _loc9_:§_-D2b§ = new §_-D2b§();
         for each(_loc10_ in param2)
         {
            _loc11_ = param5 * (Math.random() + 0.1);
            _loc12_ = §_-N1E§ ? new §_-vZ§(650,true,Math.random()) : new §_-vZ§(650,true,0,1);
            _loc13_ = new §_-13p§();
            _loc13_.x = _loc10_.x;
            _loc13_.y = _loc10_.y;
            _loc13_.rotation = _loc10_.rotation;
            _loc13_.§_-83v§(_loc10_);
            _loc10_.x = 0;
            _loc10_.y = 0;
            _loc10_.rotation = 0;
            _loc13_.§_-s2M§(_loc7_,_loc8_);
            if(§_-N1E§)
            {
               _loc13_.§_-s2M§(_loc9_,_loc12_);
            }
            _loc14_ = new Point(_loc13_.x - param3.x,_loc13_.y - param3.y + 5);
            _loc14_.x *= Math.random();
            _loc14_.y *= Math.random();
            _loc15_ = 1 / Math.sqrt(_loc14_.x * _loc14_.x + _loc14_.y * _loc14_.y);
            _loc13_.velocity = new Point(_loc14_.x * _loc15_ * _loc11_,_loc14_.y * _loc15_ * _loc11_);
            _loc13_.§_-o2F§ = Math.random() * _loc11_ * _loc15_ * 30 - _loc11_ * _loc15_ * 15;
            _loc13_.§_-h2G§ = §_-N1E§ ? param6 : 2;
            param1.§_-o2X§(_loc13_);
         }
      }
   }
}


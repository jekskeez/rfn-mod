package particles
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Pt§.§_-23O§;
   import §_-Pt§.§_-9Z§;
   import §_-Pt§.§_-P17§;
   import §_-Pt§.§_-l1O§;
   import §_-TK§.§_-aS§;
   import flash.geom.Point;
   
   public class Explode
   {
      
      public static var §_-CG§:§_-22L§;
      
      public static var §_-GR§:Boolean = false;
      
      private static var §_-1X§:Point = new Point();
      
      public function Explode()
      {
         super();
      }
      
      public static function §_-t1j§(param1:§_-aS§, param2:b2Vec2, param3:b2Vec2, param4:Number) : void
      {
         var _loc5_:Array = §_-S18§(param1);
         §_-O10§(§_-CG§,_loc5_,new Point(param2.x * Game.§_-12A§,param2.y * Game.§_-12A§),new Point(param3.x * Game.§_-12A§,param3.y * Game.§_-12A§),param4 / Math.log(param4));
      }
      
      private static function §_-S18§(param1:§_-aS§) : Array
      {
         var _loc3_:§_-aS§ = null;
         var _loc4_:Point = null;
         var _loc2_:Array = [];
         if(param1.numChildren > 0)
         {
            while(param1.numChildren > 0)
            {
               _loc2_ = _loc2_.concat(§_-S18§(param1.§_-kD§(0)));
               param1.§_-av§(0,false);
            }
         }
         else
         {
            _loc3_ = param1;
            _loc4_ = _loc3_.localToGlobal(§_-1X§);
            _loc3_.x = _loc4_.x;
            _loc3_.y = _loc4_.y;
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      private static function §_-O10§(param1:§_-22L§, param2:Array, param3:Point, param4:Point, param5:Number, param6:Number = 7) : void
      {
         var _loc10_:§_-aS§ = null;
         var _loc11_:Number = NaN;
         var _loc12_:§_-P17§ = null;
         var _loc13_:§_-t1S§ = null;
         var _loc14_:Point = null;
         var _loc15_:Number = NaN;
         var _loc7_:§_-23O§ = new §_-23O§();
         var _loc8_:§_-l1O§ = new §_-l1O§(param4);
         var _loc9_:§_-9Z§ = new §_-9Z§();
         for each(_loc10_ in param2)
         {
            _loc11_ = param5 * (Math.random() + 0.1);
            _loc12_ = §_-GR§ ? new §_-P17§(650,true,Math.random()) : new §_-P17§(650,true,0,1);
            _loc13_ = new §_-t1S§();
            _loc13_.x = _loc10_.x;
            _loc13_.y = _loc10_.y;
            _loc13_.rotation = _loc10_.rotation;
            _loc13_.§_-J2J§(_loc10_);
            _loc10_.x = 0;
            _loc10_.y = 0;
            _loc10_.rotation = 0;
            _loc13_.§_-r2n§(_loc7_,_loc8_);
            if(§_-GR§)
            {
               _loc13_.§_-r2n§(_loc9_,_loc12_);
            }
            _loc14_ = new Point(_loc13_.x - param3.x,_loc13_.y - param3.y + 5);
            _loc14_.x *= Math.random();
            _loc14_.y *= Math.random();
            _loc15_ = 1 / Math.sqrt(_loc14_.x * _loc14_.x + _loc14_.y * _loc14_.y);
            _loc13_.velocity = new Point(_loc14_.x * _loc15_ * _loc11_,_loc14_.y * _loc15_ * _loc11_);
            _loc13_.§_-W2X§ = Math.random() * _loc11_ * _loc15_ * 30 - _loc11_ * _loc15_ * 15;
            _loc13_.§_-eq§ = §_-GR§ ? param6 : 2;
            param1.§_-r2I§(_loc13_);
         }
      }
   }
}


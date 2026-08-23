package game.mainGame.entity
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-f2A§
   {
      
      public function §_-f2A§()
      {
         super();
      }
      
      public static function §_-61A§(param1:Array) : Vector.<b2Vec2>
      {
         var _loc3_:Array = null;
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in param1)
         {
            _loc2_.push(new b2Vec2(_loc3_[0],_loc3_[1]));
         }
         return _loc2_;
      }
   }
}


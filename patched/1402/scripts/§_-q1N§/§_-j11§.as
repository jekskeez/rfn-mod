package §_-q1N§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-j2H§.§_-H18§;
   import §_-td§.GameMapNet;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-j11§ extends GameMapNet
   {
      
      public function §_-j11§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      public function get §_-yd§() : Vector.<b2Vec2>
      {
         var _loc3_:§_-xn§ = null;
         var _loc1_:Array = get(§_-H18§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
   }
}


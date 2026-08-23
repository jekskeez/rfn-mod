package §_-O1O§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-j2H§.§_-x2h§;
   import §_-l2u§.§_-53A§;
   import §_-l2u§.§_-CD§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-wv§ extends §_-53A§
   {
      
      public function §_-wv§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      override public function §_-42C§(param1:int, param2:int) : String
      {
         return §_-CD§.§_-k1m§;
      }
      
      override public function §_-vd§(param1:int, param2:int = -1) : Boolean
      {
         var _loc5_:§_-xn§ = null;
         if(param1 == §_-at§.§_-Uf§ || param1 == §_-at§.§_-22E§ || param1 == §_-at§.§_-lg§)
         {
            return false;
         }
         if(get(§_-x2h§).length > 2)
         {
            return true;
         }
         if(get(§_-x2h§).length < 2)
         {
            return super.§_-vd§(param1,param2);
         }
         var _loc3_:Array = get(§_-x2h§);
         var _loc4_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc5_ in _loc3_)
         {
            _loc4_.push(_loc5_.position);
         }
         if(Math.sqrt(Math.pow(_loc4_[0].x - _loc4_[1].x,2) + Math.pow(_loc4_[0].y - _loc4_[1].y,2)) >= 10)
         {
            return true;
         }
         return super.§_-vd§(param1,param2);
      }
   }
}


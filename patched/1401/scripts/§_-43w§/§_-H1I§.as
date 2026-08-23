package §_-43w§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.GameMapNet;
   import §_-B1O§.§_-i26§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-H1I§ extends GameMapNet
   {
      
      public function §_-H1I§(param1:SquirrelGame)
      {
         super(param1);
      }
      
      public function get §_-gc§() : Vector.<b2Vec2>
      {
         var _loc3_:§_-63Q§ = null;
         var _loc1_:Array = get(§_-i26§);
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
   }
}


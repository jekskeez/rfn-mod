package §_-q1N§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-td§.§_-N2w§;
   import game.mainGame.GameMap;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-xN§ extends §_-N2w§
   {
      
      public function §_-xN§()
      {
         super();
         this.§_-71Y§ = §_-e2I§;
      }
      
      override public function place() : void
      {
         var _loc3_:Hero = null;
         if(!GameMap.instance)
         {
            return;
         }
         var _loc1_:Vector.<b2Vec2> = GameMap.instance.§_-q2L§;
         var _loc2_:* = 0;
         if(_loc1_.length != 0)
         {
            for each(_loc3_ in this.players)
            {
               if(!_loc3_.shaman)
               {
                  _loc3_.position = _loc1_[_loc2_++];
                  if(_loc2_ == _loc1_.length)
                  {
                     _loc2_ = 0;
                  }
               }
            }
         }
         _loc1_ = (GameMap.instance as §_-j11§).§_-yd§;
         if(this.§_-M2K§.length > 0 && this.players[this.§_-M2K§[0]] is Hero && _loc1_.length > 0)
         {
            this.players[this.§_-M2K§[0]].position = _loc1_[0];
         }
      }
      
      override public function §_-I26§(param1:Boolean = true) : void
      {
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-v1r§:
               if(Boolean(Hero.self && param1[0] != Game.selfId) && Boolean(Hero.self.shaman) && get(param1[0]).§_-z20§)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-K1N§,1);
               }
         }
         super.§_-x2f§(param1);
      }
   }
}


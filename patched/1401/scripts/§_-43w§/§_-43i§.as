package §_-43w§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-A2x§.§_-33A§;
   import game.mainGame.GameMap;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-43i§ extends §_-33A§
   {
      
      public function §_-43i§()
      {
         super();
         this.§_-Y1k§ = §_-j2z§;
      }
      
      override public function place() : void
      {
         var _loc3_:Hero = null;
         if(!GameMap.instance)
         {
            return;
         }
         var _loc1_:Vector.<b2Vec2> = GameMap.instance.§_-c2O§;
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
         _loc1_ = (GameMap.instance as §_-H1I§).§_-gc§;
         if(this.§_-Ex§.length > 0 && this.players[this.§_-Ex§[0]] is Hero && _loc1_.length > 0)
         {
            this.players[this.§_-Ex§[0]].position = _loc1_[0];
         }
      }
      
      override public function §_-U1m§(param1:Boolean = true) : void
      {
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-F2m§:
               if(Boolean(Hero.self && param1[0] != Game.selfId) && Boolean(Hero.self.shaman) && get(param1[0]).§_-DP§)
               {
                  Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-h1i§,1);
               }
         }
         super.§_-o2C§(param1);
      }
   }
}


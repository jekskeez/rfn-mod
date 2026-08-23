package §_-u1f§
{
   import §_-8I§.SquirrelEvent;
   import §_-A2x§.§_-33A§;
   import §_-s2l§.ControllerHeroLocal;
   import game.mainGame.GameMap;
   import game.mainGame.§_-v0§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-63b§ extends §_-33A§
   {
      
      private var §_-11z§:Object = {};
      
      public function §_-63b§()
      {
         super();
         this.§_-Y1k§ = §_-L1H§;
      }
      
      public function get §_-pa§() : Object
      {
         var _loc2_:Hero = null;
         var _loc1_:Object = {};
         for each(_loc2_ in this.players)
         {
            _loc1_[_loc2_.id] = (_loc2_ as §_-v0§).health;
         }
         return {
            "time":this.§_-11z§,
            "health":_loc1_
         };
      }
      
      public function set §_-pa§(param1:Object) : void
      {
         var _loc3_:Hero = null;
         this.§_-11z§ = param1["time"];
         var _loc2_:Object = param1["health"];
         for each(_loc3_ in this.players)
         {
            (_loc3_ as §_-v0§).health = _loc3_.id in _loc2_ ? int(_loc2_[_loc3_.id]) : 0;
         }
      }
      
      override public function §_-U1m§(param1:Boolean = true) : void
      {
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         if(param1[0] == §_-S2I§.ROUND_START)
         {
            ControllerHeroLocal.§_-jL§ = true;
         }
      }
      
      override protected function §_-h14§() : void
      {
      }
      
      override public function reset() : void
      {
         var _loc1_:Hero = null;
         super.reset();
         this.§_-11z§ = {};
         for each(_loc1_ in this.players)
         {
            this.§_-11z§[_loc1_.id] = 0;
         }
         this.§_-U1m§();
      }
      
      override protected function §_-y2G§(param1:SquirrelEvent = null) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-F2m§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-L1A§);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:§_-u15§ = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-03G§:
               break;
            case §_-S2I§.§_-F2m§:
               super.§_-o2C§(param1);
               _loc2_ = GameMap.instance as §_-u15§;
               if(!_loc2_)
               {
                  return;
               }
               this.§_-11z§[param1[0]] = _loc2_.§_-42v§ + _loc2_.§_-G1o§;
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
   }
}


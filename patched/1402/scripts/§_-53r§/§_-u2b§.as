package §_-53r§
{
   import §_-G2y§.ControllerHeroLocal;
   import §_-X2V§.SquirrelEvent;
   import §_-td§.§_-N2w§;
   import game.mainGame.GameMap;
   import game.mainGame.§_-R2k§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-u2b§ extends §_-N2w§
   {
      
      private var §_-f22§:Object = {};
      
      public function §_-u2b§()
      {
         super();
         this.§_-71Y§ = §_-d10§;
      }
      
      public function get §_-F2B§() : Object
      {
         var _loc2_:Hero = null;
         var _loc1_:Object = {};
         for each(_loc2_ in this.players)
         {
            _loc1_[_loc2_.id] = (_loc2_ as §_-R2k§).health;
         }
         return {
            "time":this.§_-f22§,
            "health":_loc1_
         };
      }
      
      public function set §_-F2B§(param1:Object) : void
      {
         var _loc3_:Hero = null;
         this.§_-f22§ = param1["time"];
         var _loc2_:Object = param1["health"];
         for each(_loc3_ in this.players)
         {
            (_loc3_ as §_-R2k§).health = _loc3_.id in _loc2_ ? int(_loc2_[_loc3_.id]) : 0;
         }
      }
      
      override public function §_-I26§(param1:Boolean = true) : void
      {
      }
      
      override public function round(param1:Array) : void
      {
         super.round(param1);
         if(param1[0] == §_-s2l§.ROUND_START)
         {
            ControllerHeroLocal.§_-T16§ = true;
         }
      }
      
      override protected function §_-g5§() : void
      {
      }
      
      override public function reset() : void
      {
         var _loc1_:Hero = null;
         super.reset();
         this.§_-f22§ = {};
         for each(_loc1_ in this.players)
         {
            this.§_-f22§[_loc1_.id] = 0;
         }
         this.§_-I26§();
      }
      
      override protected function §_-43r§(param1:SquirrelEvent = null) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-v1r§,Hero.self.position.x,Hero.self.position.y,Hero.self.§_-b2d§);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:§_-c2J§ = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-N1Y§:
               break;
            case §_-s2l§.§_-v1r§:
               super.§_-x2f§(param1);
               _loc2_ = GameMap.instance as §_-c2J§;
               if(!_loc2_)
               {
                  return;
               }
               this.§_-f22§[param1[0]] = _loc2_.§_-a1m§ + _loc2_.§_-03q§;
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
   }
}


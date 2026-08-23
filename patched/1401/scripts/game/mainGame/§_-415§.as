package game.mainGame
{
   import §_-I10§.§_-Bm§;
   import §_-Rj§.§_-W28§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-w17§;
   import §_-Y22§.§_-C2x§;
   import flash.geom.Point;
   import protocol.§_-T2o§;
   
   public class §_-415§ implements §_-Tm§, §_-C2x§
   {
      
      private static const §_-V2j§:int = 40;
      
      private static const §_-MI§:int = 60;
      
      private static const §_-V2k§:int = 0;
      
      private static const §_-x2Z§:int = 1;
      
      private static const §_-w1h§:int = 2;
      
      private static const §_-82A§:int = 3;
      
      private static const §_-j1c§:int = 4;
      
      public static var §_-K1v§:int = -1;
      
      public var enabled:Boolean = true;
      
      private var game:SquirrelGame;
      
      public function §_-415§(param1:SquirrelGame)
      {
         super();
         this.game = param1;
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(!this.enabled)
         {
            return;
         }
         var _loc2_:int = this.state;
         var _loc3_:int = -1;
         switch(_loc2_)
         {
            case §_-V2k§:
               _loc3_ = Game.selfId;
               break;
            case §_-x2Z§:
               if(SquirrelCollection.instance.§_-K14§().length == 0)
               {
                  return;
               }
               _loc3_ = (this.game.squirrels.§_-K14§()[0] as Hero).id;
               break;
            case §_-w1h§:
               _loc3_ = §_-92z§.§_-32S§;
               break;
            case §_-j1c§:
               _loc3_ = Hero.self.followId;
         }
         var _loc4_:Hero = SquirrelCollection.instance.get(_loc2_ == §_-82A§ ? (SquirrelCollection.instance as §_-W28§).selfHeroId : _loc3_);
         if(!_loc4_)
         {
            return;
         }
         §_-K1v§ = _loc3_;
         var _loc5_:Number = GameMap.§_-q1n§ - §_-a9§.§_-9o§;
         var _loc6_:Point = new Point(-_loc4_.x + (§_-a9§.§_-9o§ + _loc5_) * 0.5,-_loc4_.y + §_-a9§.§_-31m§ * 0.5);
         if(§_-Bm§.§_-2S§(§_-T2o§.§_-w2N§) || §_-92z§.mode == §_-q1p§.§_-ri§ || §_-71o§.active is §_-w17§ || §_-71o§.active is §_-F29§)
         {
            _loc9_ = §_-a9§.§_-9o§ + _loc5_ - this.game.map.size.x;
            _loc10_ = _loc9_ * 0.5;
            _loc6_.x = _loc6_.x > _loc9_ ? _loc6_.x : _loc9_;
            _loc6_.y = _loc6_.y > 0 ? _loc6_.y : 0;
            _loc6_.x = _loc6_.x < 0 ? _loc6_.x : 0;
            _loc11_ = -(§_-a9§.§_-31m§ - §_-V2j§ - this.game.map.size.y);
            _loc12_ = _loc6_.y - §_-MI§;
            _loc6_.y = _loc12_ < _loc11_ ? _loc12_ : _loc11_;
            _loc6_.x += _loc10_ > 0 ? _loc10_ : 0;
         }
         var _loc7_:Point = _loc6_.subtract(this.game.shift);
         var _loc8_:Number = _loc7_.length;
         _loc7_.normalize(_loc8_ / 6);
         this.game.shift = this.game.shift.add(_loc7_);
      }
      
      public function dispose() : void
      {
         this.enabled = false;
         this.game = null;
      }
      
      private function get state() : int
      {
         var _loc1_:Hero = null;
         if(SquirrelCollection.instance is §_-W28§)
         {
            return §_-82A§;
         }
         if(§_-92z§.§_-32S§ > 0)
         {
            _loc1_ = SquirrelCollection.instance.get(§_-92z§.§_-32S§);
            return Boolean(_loc1_) && Boolean(!_loc1_.inHollow) && !_loc1_.isDead ? §_-w1h§ : §_-x2Z§;
         }
         if(Hero.§_-6g§)
         {
            return Hero.self.followId > 0 ? §_-j1c§ : §_-V2k§;
         }
         return §_-x2Z§;
      }
   }
}


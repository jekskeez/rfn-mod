package game.mainGame
{
   import §_-I2Y§.§_-l2r§;
   import §_-X1k§.§_-r12§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-l2u§.§_-Rp§;
   import flash.geom.Point;
   import protocol.§_-n2E§;
   
   public class §_-e1Q§ implements §_-F1c§, §_-l2r§
   {
      
      private static const §_-Bz§:int = 40;
      
      private static const §_-U1h§:int = 60;
      
      private static const §_-R2K§:int = 0;
      
      private static const §_-S7§:int = 1;
      
      private static const §_-aB§:int = 2;
      
      private static const §_-4a§:int = 3;
      
      private static const §_-a1b§:int = 4;
      
      public static var §_-F2U§:int = -1;
      
      public var enabled:Boolean = true;
      
      private var game:SquirrelGame;
      
      public function §_-e1Q§(param1:SquirrelGame)
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
            case §_-R2K§:
               _loc3_ = Game.selfId;
               break;
            case §_-S7§:
               if(SquirrelCollection.instance.§_-wt§().length == 0)
               {
                  return;
               }
               _loc3_ = (this.game.squirrels.§_-wt§()[0] as Hero).id;
               break;
            case §_-aB§:
               _loc3_ = §_-u24§.§_-j2T§;
               break;
            case §_-a1b§:
               _loc3_ = Hero.self.followId;
         }
         var _loc4_:Hero = SquirrelCollection.instance.get(_loc2_ == §_-4a§ ? (SquirrelCollection.instance as §_-Rp§).selfHeroId : _loc3_);
         if(!_loc4_)
         {
            return;
         }
         §_-F2U§ = _loc3_;
         var _loc5_:Number = GameMap.§_-O19§ - §_-Zy§.§_-21V§;
         var _loc6_:Point = new Point(-_loc4_.x + (§_-Zy§.§_-21V§ + _loc5_) * 0.5,-_loc4_.y + §_-Zy§.§_-02T§ * 0.5);
         if(§_-r12§.§_-FS§(§_-n2E§.§_-X2z§) || §_-u24§.mode == §_-at§.§_-r1j§ || §_-t2c§.active is §_-fx§ || §_-t2c§.active is §_-S2E§)
         {
            _loc9_ = §_-Zy§.§_-21V§ + _loc5_ - this.game.map.size.x;
            _loc10_ = _loc9_ * 0.5;
            _loc6_.x = _loc6_.x > _loc9_ ? _loc6_.x : _loc9_;
            _loc6_.y = _loc6_.y > 0 ? _loc6_.y : 0;
            _loc6_.x = _loc6_.x < 0 ? _loc6_.x : 0;
            _loc11_ = -(§_-Zy§.§_-02T§ - §_-Bz§ - this.game.map.size.y);
            _loc12_ = _loc6_.y - §_-U1h§;
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
         if(SquirrelCollection.instance is §_-Rp§)
         {
            return §_-4a§;
         }
         if(§_-u24§.§_-j2T§ > 0)
         {
            _loc1_ = SquirrelCollection.instance.get(§_-u24§.§_-j2T§);
            return Boolean(_loc1_) && Boolean(!_loc1_.inHollow) && !_loc1_.isDead ? §_-aB§ : §_-S7§;
         }
         if(Hero.§_-Cg§)
         {
            return Hero.self.followId > 0 ? §_-a1b§ : §_-R2K§;
         }
         return §_-S7§;
      }
   }
}


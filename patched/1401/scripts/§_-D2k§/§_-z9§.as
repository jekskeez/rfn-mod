package §_-D2k§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-T1r§.§_-i1L§;
   import §_-d11§.§_-4P§;
   import §_-d11§.§_-Cj§;
   import §_-d11§.§_-UT§;
   import §_-d11§.§_-p1i§;
   import §_-d11§.§_-sS§;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.§_-bM§;
   
   public class §_-z9§ extends SquirrelCollection
   {
      
      private static const §_-F27§:int = 9;
      
      private static const §_-JC§:int = 2;
      
      public function §_-z9§()
      {
         super();
         this.§_-Y1k§ = §_-i1L§;
      }
      
      override public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:Vector.<b2Vec2> = null;
         var _loc1_:Vector.<b2Vec2> = this.§_-f2B§(§_-S18§);
         var _loc2_:Vector.<b2Vec2> = this.§_-f2B§(§_-T24§);
         if(_loc1_.length == 0 && _loc2_.length == 0)
         {
            super.place();
            return;
         }
         var _loc3_:int = 0;
         for each(_loc4_ in this.players)
         {
            if(!_loc4_.shaman)
            {
               _loc5_ = GameMap.instance.§_-c2O§;
               if(_loc4_.team == Hero.§_-17§ && _loc1_.length > 0)
               {
                  _loc5_ = _loc1_;
               }
               else if(_loc4_.team == Hero.§_-114§ && _loc2_.length > 0)
               {
                  _loc5_ = _loc2_;
               }
               if(_loc5_.length != 0)
               {
                  _loc4_.position = _loc5_[_loc3_ % _loc5_.length];
                  _loc3_++;
               }
            }
         }
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         setTimeout(this.§_-E2j§,0);
      }
      
      override public function reset() : void
      {
         super.reset();
         this.§_-E2j§();
         this.§_-m2v§();
      }
      
      private function §_-E2j§() : void
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.players)
         {
            this.§_-r2d§(_loc1_);
         }
      }
      
      private function §_-r2d§(param1:Hero) : void
      {
         if(!(param1 is §_-i1L§))
         {
            return;
         }
         (param1 as §_-i1L§).health = param1.id == Hero.§_-74§ ? §_-F27§ : §_-JC§;
      }
      
      private function §_-m2v§() : void
      {
         if(!(Hero.self is §_-i1L§))
         {
            return;
         }
         var _loc1_:§_-i1L§ = Hero.self as §_-i1L§;
         _loc1_.§_-l2U§.add(new §_-bM§(§_-4P§,§_-bM§.§_-t2G§,0));
         _loc1_.§_-l2U§.add(new §_-bM§(§_-Cj§,§_-bM§.§_-t2G§,0));
         _loc1_.§_-l2U§.add(new §_-bM§(§_-p1i§,§_-bM§.§_-t2G§,0));
         _loc1_.§_-l2U§.add(new §_-bM§(§_-sS§,§_-bM§.§_-t2G§,0));
         _loc1_.§_-l2U§.add(new §_-bM§(§_-UT§,§_-bM§.§_-t2G§,0));
         _loc1_.§_-71x§();
      }
      
      private function §_-f2B§(param1:Class) : Vector.<b2Vec2>
      {
         var _loc3_:* = undefined;
         var _loc2_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         for each(_loc3_ in GameMap.instance.get(param1))
         {
            _loc2_.push(_loc3_.position);
         }
         return _loc2_;
      }
   }
}


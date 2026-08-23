package §_-M1h§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-cm§.§_-V1t§;
   import §_-g16§.§_-713§;
   import §_-g16§.§_-CM§;
   import §_-g16§.§_-L1n§;
   import §_-g16§.§_-j1C§;
   import §_-g16§.§_-w3§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.§_-v1N§;
   
   public class §_-ld§ extends SquirrelCollection
   {
      
      private static const §_-3G§:int = 9;
      
      private static const §_-s1E§:int = 2;
      
      public function §_-ld§()
      {
         super();
         this.§_-71Y§ = §_-V1t§;
      }
      
      override public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:Vector.<b2Vec2> = null;
         var _loc1_:Vector.<b2Vec2> = this.§_-C2l§(§_-Y2n§);
         var _loc2_:Vector.<b2Vec2> = this.§_-C2l§(§_-Jb§);
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
               _loc5_ = GameMap.instance.§_-q2L§;
               if(_loc4_.team == Hero.§_-l1B§ && _loc1_.length > 0)
               {
                  _loc5_ = _loc1_;
               }
               else if(_loc4_.team == Hero.§_-i1Y§ && _loc2_.length > 0)
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
         setTimeout(this.§_-z2h§,0);
      }
      
      override public function reset() : void
      {
         super.reset();
         this.§_-z2h§();
         this.§_-a16§();
      }
      
      private function §_-z2h§() : void
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.players)
         {
            this.§_-63e§(_loc1_);
         }
      }
      
      private function §_-63e§(param1:Hero) : void
      {
         if(!(param1 is §_-V1t§))
         {
            return;
         }
         (param1 as §_-V1t§).health = param1.id == Hero.§_-M1O§ ? §_-3G§ : §_-s1E§;
      }
      
      private function §_-a16§() : void
      {
         if(!(Hero.self is §_-V1t§))
         {
            return;
         }
         var _loc1_:§_-V1t§ = Hero.self as §_-V1t§;
         _loc1_.§_-h1z§.add(new §_-v1N§(§_-w3§,§_-v1N§.§_-W29§,0));
         _loc1_.§_-h1z§.add(new §_-v1N§(§_-713§,§_-v1N§.§_-W29§,0));
         _loc1_.§_-h1z§.add(new §_-v1N§(§_-CM§,§_-v1N§.§_-W29§,0));
         _loc1_.§_-h1z§.add(new §_-v1N§(§_-L1n§,§_-v1N§.§_-W29§,0));
         _loc1_.§_-h1z§.add(new §_-v1N§(§_-j1C§,§_-v1N§.§_-W29§,0));
         _loc1_.§_-NI§();
      }
      
      private function §_-C2l§(param1:Class) : Vector.<b2Vec2>
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


package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-X2V§.SquirrelEvent;
   
   public class §_-mG§ extends §_-S2w§
   {
      
      private static const §_-A2L§:Number = 11;
      
      public function §_-mG§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-e11§;
      }
      
      override public function get totalCooldown() : Number
      {
         return §_-53U§ ? 0 : 30;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.hero.addEventListener(SquirrelEvent.§_-P2y§,this.§_-l1S§);
         if(!this.buff)
         {
            this.buff = §_-K5§(0);
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-P2y§,this.§_-l1S§);
         this.hero.removeBuff(this.buff);
      }
      
      private function §_-l1S§(param1:SquirrelEvent) : void
      {
         var _loc4_:Hero = null;
         var _loc5_:b2Vec2 = null;
         if(!this.hero.game)
         {
            return;
         }
         var _loc2_:int = param1.player.heroView.§_-n1e§;
         var _loc3_:* = int(§_-bx§());
         for each(_loc4_ in this.hero.game.squirrels.players)
         {
            _loc5_ = this.hero.position.Copy();
            _loc5_.Subtract(_loc4_.position);
            if(!(!this.§_-3M§(_loc4_) || _loc5_.Length() > §_-A2L§ && !this.§_-53U§))
            {
               if(_loc3_-- == 0)
               {
                  break;
               }
               _loc4_.§_-f2g§(_loc2_);
            }
         }
         if(_loc3_ == §_-bx§())
         {
            return;
         }
         this.active = false;
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-K13§ || param1.isDead || param1.inHollow || param1.isHare || param1.shaman);
      }
   }
}


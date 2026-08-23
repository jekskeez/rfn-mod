package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-e1x§ extends §_-Vd§
   {
      
      public static const §_-F7§:Number = 10;
      
      public static const §_-o18§:Number = 5;
      
      private static const §_-A2L§:Number = 20;
      
      private var §_-wd§:Object = {};
      
      private var radius:Number;
      
      public function §_-e1x§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-Tx§;
         this.radius = §_-A2L§ * (1 + §_-bx§() / 100);
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-p1V§.§_-A3z§(this.§_-n1t§);
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         super.deactivate();
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         §_-p1V§.§_-DO§(this.§_-n1t§);
         for(_loc1_ in this.§_-wd§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.jumpVelocity -= this.§_-wd§[_loc1_];
               if(_loc2_.id != this.hero.id)
               {
                  _loc2_.heroView.§_-d2§();
                  _loc2_.removeBuff(this.buff);
               }
               delete this.§_-wd§[_loc2_.id];
            }
         }
         this.§_-wd§ = {};
      }
      
      private function §_-n1t§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         var _loc3_:int = 0;
         if(!this.active)
         {
            return;
         }
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            _loc2_ = this.hero.position.Copy();
            _loc2_.Subtract(_loc1_.position);
            if(!this.§_-3M§(_loc1_) || _loc2_.Length() > this.radius)
            {
               if(_loc1_.id in this.§_-wd§)
               {
                  _loc1_.jumpVelocity -= this.§_-wd§[_loc1_.id];
                  if(_loc1_.id != this.hero.id)
                  {
                     _loc1_.heroView.§_-d2§();
                     _loc1_.removeBuff(this.buff);
                  }
                  delete this.§_-wd§[_loc1_.id];
               }
            }
            else if(!(_loc1_.id in this.§_-wd§))
            {
               _loc3_ = (§_-F7§ + (this.§_-53U§ ? §_-o18§ : 0)) / 100 * _loc1_.jumpVelocity;
               this.§_-wd§[_loc1_.id] = _loc3_;
               _loc1_.jumpVelocity += _loc3_;
               if(_loc1_.id != this.hero.id)
               {
                  _loc1_.heroView.§_-e1z§();
                  _loc1_.§_-W1T§(this.buff);
               }
            }
         }
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-K13§ || param1.isDead || param1.inHollow || param1.isHare || param1.isDragon) && (param1.shaman && param1.id == this.hero.id || !param1.shaman);
      }
   }
}


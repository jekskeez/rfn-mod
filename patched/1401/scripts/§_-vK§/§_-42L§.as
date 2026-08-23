package §_-vK§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-42L§ extends §_-q4§
   {
      
      public static const §_-SD§:Number = 10;
      
      private static const §_-c1F§:Number = 20;
      
      private var §_-r10§:Object = {};
      
      private var radius:Number;
      
      public function §_-42L§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-419§;
         this.radius = §_-c1F§ * (1 + §_-Nu§() / 100);
      }
      
      override protected function activate() : void
      {
         super.activate();
         §_-01Y§.§_-h1R§(this.§_-nw§);
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
         §_-01Y§.§_-t1s§(this.§_-nw§);
         for(_loc1_ in this.§_-r10§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.swimFactor -= this.§_-r10§[_loc1_];
               if(_loc2_.id != this.hero.id)
               {
                  _loc2_.heroView.§_-W2h§();
                  _loc2_.removeBuff(this.buff);
               }
               delete this.§_-r10§[_loc2_.id];
            }
         }
         this.§_-r10§ = {};
      }
      
      private function §_-nw§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         var _loc3_:Number = NaN;
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
            if(!this.§_-qu§(_loc1_) || _loc2_.Length() > this.radius && !this.§_-41W§)
            {
               if(_loc1_.id in this.§_-r10§)
               {
                  _loc1_.swimFactor -= this.§_-r10§[_loc1_.id];
                  if(_loc1_.id != this.hero.id)
                  {
                     _loc1_.heroView.§_-W2h§();
                     _loc1_.removeBuff(this.buff);
                  }
                  delete this.§_-r10§[_loc1_.id];
               }
            }
            else if(!(_loc1_.id in this.§_-r10§))
            {
               _loc3_ = §_-SD§ / 100 * _loc1_.swimFactor;
               this.§_-r10§[_loc1_.id] = _loc3_;
               _loc1_.swimFactor += _loc3_;
               if(_loc1_.id != this.hero.id)
               {
                  _loc1_.heroView.§_-E2p§();
                  _loc1_.§_-Aj§(this.buff);
               }
            }
         }
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-k2W§ || param1.isDead || param1.inHollow || param1.isHare || param1.isDragon) && (param1.shaman && param1.id == this.hero.id || !param1.shaman);
      }
   }
}


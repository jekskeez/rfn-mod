package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-i28§ extends §_-S2w§
   {
      
      private static const §_-A2L§:Number = 10;
      
      private var §_-D2x§:Object = {};
      
      public function §_-i28§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-e2l§;
      }
      
      override protected function activate() : void
      {
         var _loc2_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         var _loc1_:Number = this.hero.runSpeed * §_-bx§() / 100;
         this.§_-D2x§[this.hero.id] = _loc1_;
         this.hero.runSpeed += _loc1_;
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         this.hero.§_-W1T§(this.buff);
         this.hero.heroView.§_-k1I§();
         if(!this.§_-53U§)
         {
            return;
         }
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(!this.§_-3M§(_loc2_) || !this.§_-s1b§(_loc2_)))
            {
               _loc1_ = _loc2_.runSpeed * §_-bx§() / 100;
               this.§_-D2x§[_loc2_.id] = _loc1_;
               _loc2_.runSpeed += _loc1_;
               _loc2_.§_-W1T§(this.buff);
               _loc2_.heroView.§_-k1I§();
            }
         }
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         super.deactivate();
         if(!this.hero)
         {
            return;
         }
         this.hero.removeBuff(this.buff);
         this.hero.runSpeed -= this.§_-D2x§[this.hero.id];
         delete this.§_-D2x§[this.hero.id];
         if(!this.§_-53U§)
         {
            return;
         }
         if(!this.hero.game)
         {
            return;
         }
         for(_loc1_ in this.§_-D2x§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.runSpeed -= this.§_-D2x§[_loc1_];
               _loc2_.removeBuff(this.buff);
               delete this.§_-D2x§[_loc2_.id];
            }
         }
         this.§_-D2x§ = {};
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-K13§ && !param1.isDead && !param1.inHollow && !param1.isHare && !param1.isDragon && param1.id != this.hero.id;
      }
      
      private function §_-s1b§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1.position);
         return _loc2_.Length() <= §_-A2L§;
      }
      
      override public function get activeTime() : Number
      {
         return 10;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
   }
}


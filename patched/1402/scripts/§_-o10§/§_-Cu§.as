package §_-o10§
{
   import game.mainGame.entity.§_-Cn§;
   
   public class §_-Cu§ extends §_-S2w§
   {
      
      private var §_-F2U§:int;
      
      private var §_-Y2C§:Array = null;
      
      private var §_-i2K§:Object = {};
      
      public function §_-Cu§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-E1y§;
         this.§_-F2U§ = this.hero.id;
      }
      
      override public function dispose() : void
      {
         this.§_-Y2C§ = null;
         super.dispose();
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         this.§_-Y2C§ = null;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.§_-t1D§();
         this.§_-Y2l§();
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         this.hero.§_-W1T§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.§_-Y2C§)
         {
            return;
         }
         this.§_-bb§();
         this.hero.removeBuff(this.buff);
      }
      
      private function §_-Y2l§() : void
      {
         var _loc1_:§_-Cn§ = null;
         var _loc2_:Number = NaN;
         if(§_-s2t§() == 0)
         {
            return;
         }
         this.§_-Y2C§ = this.hero.game.map.get(§_-Cn§,true);
         for each(_loc1_ in this.§_-Y2C§)
         {
            if(_loc1_)
            {
               _loc2_ = _loc1_.motorSpeed * §_-s2t§() / 100;
               this.§_-i2K§[_loc1_] = _loc2_;
               _loc1_.motorSpeed -= _loc2_;
            }
         }
      }
      
      private function §_-bb§() : void
      {
         var _loc1_:§_-Cn§ = null;
         for each(_loc1_ in this.§_-Y2C§)
         {
            if(!(!_loc1_ || !(_loc1_ in this.§_-i2K§)))
            {
               _loc1_.motorSpeed += this.§_-i2K§[_loc1_];
            }
         }
         this.§_-i2K§ = {};
         this.§_-Y2C§ = null;
      }
      
      private function §_-t1D§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:int = 0;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc1_:Object = this.hero.game.squirrels.players;
         for each(_loc2_ in _loc1_)
         {
            if(!(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || !_loc2_.shaman))
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.§_-ov§.length)
               {
                  if(_loc2_.§_-ov§[_loc3_] is §_-Cu§ && _loc2_.§_-ov§[_loc3_] != this && _loc2_.§_-ov§[_loc3_].active)
                  {
                     _loc2_.§_-ov§[_loc3_].active = false;
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get activeTime() : Number
      {
         return §_-bx§();
      }
   }
}


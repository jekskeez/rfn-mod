package §_-vK§
{
   import game.mainGame.entity.§_-43§;
   
   public class §_-320§ extends §_-21O§
   {
      
      private var §_-K1v§:int;
      
      private var §_-KQ§:Array = null;
      
      private var §_-y1f§:Object = {};
      
      public function §_-320§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-k1B§;
         this.§_-K1v§ = this.hero.id;
      }
      
      override public function dispose() : void
      {
         this.§_-KQ§ = null;
         super.dispose();
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.§_-KQ§ = null;
      }
      
      override protected function activate() : void
      {
         if(!this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.§_-Fv§();
         this.§_-t1z§();
         if(!this.buff)
         {
            this.buff = §_-T1G§(0.5);
         }
         this.hero.§_-Aj§(this.buff);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.§_-KQ§)
         {
            return;
         }
         this.§_-w8§();
         this.hero.removeBuff(this.buff);
      }
      
      private function §_-t1z§() : void
      {
         var _loc1_:§_-43§ = null;
         var _loc2_:Number = NaN;
         if(§_-OD§() == 0)
         {
            return;
         }
         this.§_-KQ§ = this.hero.game.map.get(§_-43§,true);
         for each(_loc1_ in this.§_-KQ§)
         {
            if(_loc1_)
            {
               _loc2_ = _loc1_.motorSpeed * §_-OD§() / 100;
               this.§_-y1f§[_loc1_] = _loc2_;
               _loc1_.motorSpeed -= _loc2_;
            }
         }
      }
      
      private function §_-w8§() : void
      {
         var _loc1_:§_-43§ = null;
         for each(_loc1_ in this.§_-KQ§)
         {
            if(!(!_loc1_ || !(_loc1_ in this.§_-y1f§)))
            {
               _loc1_.motorSpeed += this.§_-y1f§[_loc1_];
            }
         }
         this.§_-y1f§ = {};
         this.§_-KQ§ = null;
      }
      
      private function §_-Fv§() : void
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
               while(_loc3_ < _loc2_.§_-515§.length)
               {
                  if(_loc2_.§_-515§[_loc3_] is §_-320§ && _loc2_.§_-515§[_loc3_] != this && _loc2_.§_-515§[_loc3_].active)
                  {
                     _loc2_.§_-515§[_loc3_].active = false;
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
         return §_-Nu§();
      }
   }
}


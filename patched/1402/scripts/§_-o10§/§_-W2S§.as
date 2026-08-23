package §_-o10§
{
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import protocol.§_-s2l§;
   
   public class §_-W2S§ extends §_-Vd§
   {
      
      private static var bonuses:Object = {};
      
      private static var squirrels:Object = {};
      
      private static var §_-22F§:§_-Q2h§ = null;
      
      private var §_-F2U§:int;
      
      public function §_-W2S§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-r2D§;
         this.§_-F2U§ = this.hero.id;
      }
      
      private static function §_-311§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         for each(_loc2_ in bonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-N2O§() : int
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc1_:Number = 0;
         for(_loc3_ in bonuses)
         {
            if(bonuses[_loc3_] > _loc1_)
            {
               _loc1_ = Number(bonuses[_loc3_]);
               _loc2_ = int(_loc3_);
            }
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         if(this.§_-F2U§ in bonuses)
         {
            this.§_-A1a§();
            delete bonuses[this.§_-F2U§];
            this.§_-p15§();
         }
         super.dispose();
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-V2o§];
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.§_-A1a§();
         bonuses[this.§_-F2U§] = §_-bx§();
         this.§_-p15§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.§_-F2U§ in bonuses))
         {
            return;
         }
         this.§_-A1a§();
         delete bonuses[this.§_-F2U§];
         this.§_-p15§();
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.hero == null || !this.active)
         {
            return;
         }
         if(param1[1] == §_-s2l§.§_-r1v§)
         {
            return;
         }
         if(§_-N2O§() != this.hero.id)
         {
            return;
         }
         var _loc2_:Hero = this.hero.game.squirrels.get(param1[0]);
         if(Boolean(_loc2_) && Boolean(squirrels) && Boolean(this.buff))
         {
            if(_loc2_.id in squirrels)
            {
               _loc2_.friction -= squirrels[_loc2_.id];
            }
            _loc2_.friction += §_-311§();
            _loc2_.§_-W1T§(this.buff);
            squirrels[_loc2_.id] = §_-311§();
         }
      }
      
      private function §_-p15§() : void
      {
         var _loc4_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc1_:Number = §_-311§();
         if(_loc1_ == 0)
         {
            return;
         }
         if(§_-N2O§() == this.hero.id)
         {
            §_-22F§ = this.buff;
         }
         var _loc2_:Object = this.hero.game.squirrels.players;
         var _loc3_:int = 0;
         for each(_loc4_ in _loc2_)
         {
            if(this.§_-3M§(_loc4_))
            {
               _loc3_ = _loc4_.id == this.hero.id ? int(§_-bx§()) : int(_loc1_);
               if(_loc4_.id in squirrels)
               {
                  _loc4_.friction -= squirrels[_loc4_.id];
               }
               squirrels[_loc4_.id] = _loc3_;
               _loc4_.friction += _loc3_;
               if(!_loc4_.isDead)
               {
                  _loc4_.heroView.§_-k1I§();
               }
               if(!(_loc4_.id in bonuses))
               {
                  _loc4_.§_-W1T§(§_-22F§);
                  _loc4_.addEventListener(SquirrelEvent.§_-Z2N§,this.§_-Eb§);
               }
            }
         }
      }
      
      private function §_-A1a§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         for(_loc1_ in squirrels)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_ && _loc2_.§_-K13§)
            {
               _loc2_.friction -= squirrels[_loc1_];
               if(!(_loc2_.id in bonuses))
               {
                  _loc2_.removeBuff(§_-22F§);
               }
               _loc2_.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-Eb§);
            }
         }
         squirrels = {};
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-K13§ && !param1.isHare && !param1.isDragon && !param1.inHollow && (param1.shaman && (param1.id == this.hero.id || param1.id in bonuses) || !param1.shaman);
      }
      
      private function §_-Eb§(param1:SquirrelEvent) : void
      {
         var _loc2_:Hero = param1.player;
         if(!(_loc2_ && _loc2_.§_-K13§) || !(_loc2_.id in squirrels) || !_loc2_.shaman)
         {
            return;
         }
         _loc2_.friction -= §_-311§();
         _loc2_.removeBuff(§_-22F§);
         _loc2_.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-Eb§);
         delete squirrels[_loc2_.id];
      }
   }
}


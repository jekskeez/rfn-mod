package §_-vK§
{
   import §_-8I§.SquirrelEvent;
   import §_-T1r§.§_-03i§;
   import protocol.§_-S2I§;
   
   public class §_-P1H§ extends §_-q4§
   {
      
      private static var bonuses:Object = {};
      
      private static var squirrels:Object = {};
      
      private static var §_-h9§:§_-03i§ = null;
      
      private var §_-K1v§:int;
      
      public function §_-P1H§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-uK§;
         this.§_-K1v§ = this.hero.id;
      }
      
      private static function §_-zk§() : Number
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = 0;
         for each(_loc2_ in bonuses)
         {
            _loc1_ = _loc1_ < _loc2_ ? _loc2_ : _loc1_;
         }
         return _loc1_;
      }
      
      private static function §_-xz§() : int
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
         if(this.§_-K1v§ in bonuses)
         {
            this.§_-w1O§();
            delete bonuses[this.§_-K1v§];
            this.§_-92B§();
         }
         super.dispose();
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-e1h§];
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.§_-w1O§();
         bonuses[this.§_-K1v§] = §_-Nu§();
         this.§_-92B§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.§_-K1v§ in bonuses))
         {
            return;
         }
         this.§_-w1O§();
         delete bonuses[this.§_-K1v§];
         this.§_-92B§();
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.hero == null || !this.active)
         {
            return;
         }
         if(param1[1] == §_-S2I§.§_-C1g§)
         {
            return;
         }
         if(§_-xz§() != this.hero.id)
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
            _loc2_.friction += §_-zk§();
            _loc2_.§_-Aj§(this.buff);
            squirrels[_loc2_.id] = §_-zk§();
         }
      }
      
      private function §_-92B§() : void
      {
         var _loc4_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc1_:Number = §_-zk§();
         if(_loc1_ == 0)
         {
            return;
         }
         if(§_-xz§() == this.hero.id)
         {
            §_-h9§ = this.buff;
         }
         var _loc2_:Object = this.hero.game.squirrels.players;
         var _loc3_:int = 0;
         for each(_loc4_ in _loc2_)
         {
            if(this.§_-qu§(_loc4_))
            {
               _loc3_ = _loc4_.id == this.hero.id ? int(§_-Nu§()) : int(_loc1_);
               if(_loc4_.id in squirrels)
               {
                  _loc4_.friction -= squirrels[_loc4_.id];
               }
               squirrels[_loc4_.id] = _loc3_;
               _loc4_.friction += _loc3_;
               if(!_loc4_.isDead)
               {
                  _loc4_.heroView.§_-S2O§();
               }
               if(!(_loc4_.id in bonuses))
               {
                  _loc4_.§_-Aj§(§_-h9§);
                  _loc4_.addEventListener(SquirrelEvent.§_-S2i§,this.§_-l2O§);
               }
            }
         }
      }
      
      private function §_-w1O§() : void
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
            if(_loc2_ && _loc2_.§_-k2W§)
            {
               _loc2_.friction -= squirrels[_loc1_];
               if(!(_loc2_.id in bonuses))
               {
                  _loc2_.removeBuff(§_-h9§);
               }
               _loc2_.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-l2O§);
            }
         }
         squirrels = {};
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-k2W§ && !param1.isHare && !param1.isDragon && !param1.inHollow && (param1.shaman && (param1.id == this.hero.id || param1.id in bonuses) || !param1.shaman);
      }
      
      private function §_-l2O§(param1:SquirrelEvent) : void
      {
         var _loc2_:Hero = param1.player;
         if(!(_loc2_ && _loc2_.§_-k2W§) || !(_loc2_.id in squirrels) || !_loc2_.shaman)
         {
            return;
         }
         _loc2_.friction -= §_-zk§();
         _loc2_.removeBuff(§_-h9§);
         _loc2_.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-l2O§);
         delete squirrels[_loc2_.id];
      }
   }
}


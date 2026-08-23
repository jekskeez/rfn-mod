package §_-vK§
{
   import §_-P2b§.§_-6L§;
   import flash.utils.setTimeout;
   import protocol.§_-S2I§;
   
   public class §_-BX§ extends §_-q4§
   {
      
      private static const §_-t1q§:int = 1;
      
      private static var §_-m25§:Object = {};
      
      private static var bonuses:Object = {};
      
      private var §_-K1v§:int;
      
      private var §_-2F§:Boolean = false;
      
      public function §_-BX§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-E1d§;
         this.§_-K1v§ = param1.id;
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
         var _loc2_:String = null;
         var _loc1_:int = int.MAX_VALUE;
         for(_loc2_ in bonuses)
         {
            if(int(_loc2_) < _loc1_)
            {
               _loc1_ = int(_loc2_);
            }
         }
         return _loc1_;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.§_-2F§ = false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-bj§();
         bonuses[this.§_-K1v§] = §_-Nu§();
         this.§_-j1r§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.§_-K1v§ in bonuses))
         {
            return;
         }
         this.§_-bj§();
         delete bonuses[this.§_-K1v§];
         this.§_-j1r§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-S2I§.§_-Vs§,§_-S2I§.§_-F2m§,§_-S2I§.§_-R28§,§_-S2I§.§_-03G§,§_-S2I§.§_-w1R§];
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1 || param1[1] == this.hero.id)
               {
                  return;
               }
               this.§_-2F§ = true;
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-R28§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-F2m§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               this.§_-U1m§();
               break;
            case §_-S2I§.§_-w1R§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               if(param1[2] != §_-S2I§.§_-EY§)
               {
                  return;
               }
               if(param1[1] != §_-6L§.§_-Z2T§ && param1[1] != §_-6L§.§_-V2N§)
               {
                  return;
               }
               setTimeout(this.§_-U1m§,1000);
               break;
            case §_-S2I§.§_-03G§:
               if(param1[0] != §_-S2I§.§_-A2o§)
               {
                  return;
               }
               if(param1[1] == this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-S2I§.§_-h5§)
               {
                  return;
               }
               setTimeout(this.§_-U1m§,1000);
         }
      }
      
      private function §_-U1m§() : void
      {
         if(!this.§_-2F§ || !this.active || !this.hero)
         {
            return;
         }
         if(§_-xz§() != this.hero.id)
         {
            return;
         }
         this.§_-bj§();
         this.§_-j1r§();
      }
      
      private function §_-j1r§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(!this.hero || !this.hero.game || !this.§_-2F§ || §_-zk§() == 0)
         {
            return;
         }
         var _loc1_:Array = this.hero.game.squirrels.§_-k8§();
         if(_loc1_.length > §_-t1q§ || _loc1_.length == 0)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            if(this.§_-qu§(_loc2_))
            {
               _loc3_ = _loc2_.jumpVelocity * §_-zk§() / 100;
               _loc4_ = _loc2_.runSpeed * §_-zk§() / 100;
               §_-m25§[_loc2_.id] = {
                  "jump":_loc3_,
                  "speed":_loc4_
               };
               _loc2_.jumpVelocity += §_-m25§[_loc2_.id]["jump"];
               _loc2_.runSpeed += §_-m25§[_loc2_.id]["speed"];
               _loc2_.heroView.§_-S2O§();
               _loc2_.§_-Aj§(this.buff);
            }
         }
      }
      
      private function §_-bj§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         for(_loc1_ in §_-m25§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.jumpVelocity -= §_-m25§[_loc1_]["jump"];
               _loc2_.runSpeed -= §_-m25§[_loc1_]["speed"];
               _loc2_.removeBuff(buff);
               delete §_-m25§[_loc1_];
            }
         }
         §_-m25§ = {};
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-k2W§ || param1.shaman || param1.isDead || param1.inHollow || param1.isHare || param1.isDragon);
      }
   }
}


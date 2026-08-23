package §_-o10§
{
   import §_-j2E§.§_-A11§;
   import flash.utils.setTimeout;
   import protocol.§_-s2l§;
   
   public class §_-W2L§ extends §_-Vd§
   {
      
      private static const §_-92k§:int = 1;
      
      private static var §_-e1p§:Object = {};
      
      private static var bonuses:Object = {};
      
      private var §_-F2U§:int;
      
      private var §_-335§:Boolean = false;
      
      public function §_-W2L§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-32J§;
         this.§_-F2U§ = param1.id;
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
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         this.§_-335§ = false;
      }
      
      override protected function activate() : void
      {
         super.activate();
         this.§_-db§();
         bonuses[this.§_-F2U§] = §_-bx§();
         this.§_-P1C§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!(this.§_-F2U§ in bonuses))
         {
            return;
         }
         this.§_-db§();
         delete bonuses[this.§_-F2U§];
         this.§_-P1C§();
      }
      
      override protected function get packets() : Array
      {
         return [§_-s2l§.§_-n1f§,§_-s2l§.§_-v1r§,§_-s2l§.§_-V1b§,§_-s2l§.§_-N1Y§,§_-s2l§.§_-C1i§];
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1 || param1[1] == this.hero.id)
               {
                  return;
               }
               this.§_-335§ = true;
               this.§_-I26§();
               break;
            case §_-s2l§.§_-V1b§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-v1r§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               this.§_-I26§();
               break;
            case §_-s2l§.§_-C1i§:
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               if(param1[2] != §_-s2l§.§_-x2Y§)
               {
                  return;
               }
               if(param1[1] != §_-A11§.§_-61q§ && param1[1] != §_-A11§.§_-A2S§)
               {
                  return;
               }
               setTimeout(this.§_-I26§,1000);
               break;
            case §_-s2l§.§_-N1Y§:
               if(param1[0] != §_-s2l§.§_-b2§)
               {
                  return;
               }
               if(param1[1] == this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-s2l§.§_-C2D§)
               {
                  return;
               }
               setTimeout(this.§_-I26§,1000);
         }
      }
      
      private function §_-I26§() : void
      {
         if(!this.§_-335§ || !this.active || !this.hero)
         {
            return;
         }
         if(§_-N2O§() != this.hero.id)
         {
            return;
         }
         this.§_-db§();
         this.§_-P1C§();
      }
      
      private function §_-P1C§() : void
      {
         var _loc2_:Hero = null;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(!this.hero || !this.hero.game || !this.§_-335§ || §_-311§() == 0)
         {
            return;
         }
         var _loc1_:Array = this.hero.game.squirrels.§_-qb§();
         if(_loc1_.length > §_-92k§ || _loc1_.length == 0)
         {
            return;
         }
         for each(_loc2_ in _loc1_)
         {
            if(this.§_-3M§(_loc2_))
            {
               _loc3_ = _loc2_.jumpVelocity * §_-311§() / 100;
               _loc4_ = _loc2_.runSpeed * §_-311§() / 100;
               §_-e1p§[_loc2_.id] = {
                  "jump":_loc3_,
                  "speed":_loc4_
               };
               _loc2_.jumpVelocity += §_-e1p§[_loc2_.id]["jump"];
               _loc2_.runSpeed += §_-e1p§[_loc2_.id]["speed"];
               _loc2_.heroView.§_-k1I§();
               _loc2_.§_-W1T§(this.buff);
            }
         }
      }
      
      private function §_-db§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         for(_loc1_ in §_-e1p§)
         {
            _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
            if(_loc2_)
            {
               _loc2_.jumpVelocity -= §_-e1p§[_loc1_]["jump"];
               _loc2_.runSpeed -= §_-e1p§[_loc1_]["speed"];
               _loc2_.removeBuff(buff);
               delete §_-e1p§[_loc1_];
            }
         }
         §_-e1p§ = {};
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-K13§ || param1.shaman || param1.isDead || param1.inHollow || param1.isHare || param1.isDragon);
      }
   }
}


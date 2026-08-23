package §_-o10§
{
   import protocol.§_-s2l§;
   
   public class §_-VG§ extends §_-S2w§
   {
      
      public function §_-VG§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-O2x§;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-V2o§]);
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
         this.§_-ZO§(true);
      }
      
      override protected function deactivate() : void
      {
         this.§_-ZO§(false);
         super.deactivate();
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-V2o§:
               if(this.hero == null || !this.active)
               {
                  return;
               }
               if(param1[1] == §_-s2l§.§_-r1v§)
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.get(param1[0]);
               if(this.§_-53U§)
               {
                  _loc2_.§_-M2i§ = true;
               }
               else
               {
                  _loc2_.§_-42S§ = true;
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-ZO§(param1:Boolean) : void
      {
         var _loc3_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc2_:Object = this.hero.game.squirrels.players;
         for each(_loc3_ in _loc2_)
         {
            if(!(param1 && !this.§_-3M§(_loc3_) || !_loc3_ || !_loc3_.§_-K13§))
            {
               if(this.§_-53U§)
               {
                  _loc3_.§_-M2i§ = param1;
               }
               else
               {
                  _loc3_.§_-42S§ = param1;
               }
               if(param1 && !this.buff)
               {
                  this.buff = §_-K5§(0.5);
               }
               if(param1)
               {
                  _loc3_.§_-W1T§(this.buff);
               }
               else
               {
                  _loc3_.removeBuff(this.buff);
               }
               if(param1)
               {
                  _loc3_.heroView.§_-k1I§();
               }
            }
         }
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
                  if(_loc2_.§_-ov§[_loc3_] is §_-VG§ && _loc2_.§_-ov§[_loc3_] != this && _loc2_.§_-ov§[_loc3_].active)
                  {
                     _loc2_.§_-ov§[_loc3_].active = false;
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return !param1.isHare && !param1.isDragon && !param1.inHollow && (param1.shaman && param1.id == this.hero.id || !param1.shaman);
      }
      
      override public function get activeTime() : Number
      {
         return §_-bx§();
      }
   }
}


package §_-vK§
{
   import protocol.§_-S2I§;
   
   public class §_-r1b§ extends §_-21O§
   {
      
      public function §_-r1b§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-A2J§;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-e1h§]);
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
         this.§_-u1k§(true);
      }
      
      override protected function deactivate() : void
      {
         this.§_-u1k§(false);
         super.deactivate();
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-e1h§:
               if(this.hero == null || !this.active)
               {
                  return;
               }
               if(param1[1] == §_-S2I§.§_-C1g§)
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.get(param1[0]);
               if(this.§_-41W§)
               {
                  _loc2_.§_-S1I§ = true;
               }
               else
               {
                  _loc2_.§_-i12§ = true;
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-u1k§(param1:Boolean) : void
      {
         var _loc3_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            return;
         }
         var _loc2_:Object = this.hero.game.squirrels.players;
         for each(_loc3_ in _loc2_)
         {
            if(!(param1 && !this.§_-qu§(_loc3_) || !_loc3_ || !_loc3_.§_-k2W§))
            {
               if(this.§_-41W§)
               {
                  _loc3_.§_-S1I§ = param1;
               }
               else
               {
                  _loc3_.§_-i12§ = param1;
               }
               if(param1 && !this.buff)
               {
                  this.buff = §_-T1G§(0.5);
               }
               if(param1)
               {
                  _loc3_.§_-Aj§(this.buff);
               }
               else
               {
                  _loc3_.removeBuff(this.buff);
               }
               if(param1)
               {
                  _loc3_.heroView.§_-S2O§();
               }
            }
         }
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
                  if(_loc2_.§_-515§[_loc3_] is §_-r1b§ && _loc2_.§_-515§[_loc3_] != this && _loc2_.§_-515§[_loc3_].active)
                  {
                     _loc2_.§_-515§[_loc3_].active = false;
                  }
                  _loc3_++;
               }
            }
         }
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return !param1.isHare && !param1.isDragon && !param1.inHollow && (param1.shaman && param1.id == this.hero.id || !param1.shaman);
      }
      
      override public function get activeTime() : Number
      {
         return §_-Nu§();
      }
   }
}


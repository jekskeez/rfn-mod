package §_-o10§
{
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-HO§ extends §_-S2w§
   {
      
      private static const §_-wy§:int = 2;
      
      private var §_-x1j§:Boolean = false;
      
      private var §_-c1G§:Number = 0;
      
      public function §_-HO§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-J1x§;
      }
      
      override public function get maxCountUse() : int
      {
         if(!Game.toggle)
         {
            return 2147483647;
         }
         return 1;
      }
      
      override public function get activeTime() : Number
      {
         if(!Game.toggle)
         {
            return 180;
         }
         return §_-bx§();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.hero.game)
         {
            return;
         }
         if(this.§_-c1G§ > 0)
         {
            this.§_-c1G§ -= param1;
         }
         else
         {
            this.§_-x1j§ = false;
         }
      }
      
      override protected function activate() : void
      {
         var _loc1_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            this.§_-8x§ = false;
            return;
         }
         super.activate();
         this.§_-t1D§();
         if(!this.buff)
         {
            this.buff = §_-K5§(0.5);
         }
         this.hero.§_-W1T§(this.buff);
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(this.§_-3M§(_loc1_))
            {
               _loc1_.immortal = true;
               _loc1_.heroView.§_-k1I§();
               _loc1_.§_-W1T§(this.buff);
            }
         }
         this.§_-x1j§ = false;
         this.§_-c1G§ = 0;
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:Hero = null;
         super.deactivate();
         if(this.§_-x2b§)
         {
            return;
         }
         this.hero.removeBuff(this.buff);
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(!_loc1_ || _loc1_.id == this.hero.id))
            {
               _loc1_.immortal = false;
               _loc1_.removeBuff(this.buff);
            }
         }
         if(!this.§_-53U§)
         {
            return;
         }
         this.§_-x1j§ = true;
         this.§_-c1G§ = §_-wy§;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-V2o§,§_-s2l§.§_-v1r§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         if(!this.hero)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-V2o§:
               if(!this.active)
               {
                  return;
               }
               if(param1[1] == §_-s2l§.§_-r1v§)
               {
                  return;
               }
               this.hero.game.squirrels.get(param1[0]).immortal = true;
               break;
            case §_-s2l§.§_-v1r§:
               if(!this.§_-x1j§)
               {
                  return;
               }
               if(param1[0] == this.hero.id)
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.get(param1[0]);
               if(!_loc2_ || !_loc2_.isSelf)
               {
                  return;
               }
               setTimeout(Connection.§_-e2T§,1000,§_-u1O§.§_-N1Y§,§_-s2l§.§_-K1d§);
               break;
            default:
               super.§_-x2f§(param1);
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
                  if((_loc2_.§_-ov§[_loc3_] is §_-HO§ || _loc2_.§_-ov§[_loc3_] is §_-s2O§) && _loc2_.§_-ov§[_loc3_] != this && _loc2_.§_-ov§[_loc3_].active)
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
         return param1 && param1.§_-K13§ && !param1.inHollow && !param1.isHare && !param1.shaman;
      }
   }
}


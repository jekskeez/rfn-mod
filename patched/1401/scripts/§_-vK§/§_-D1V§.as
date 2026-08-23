package §_-vK§
{
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-D1V§ extends §_-21O§
   {
      
      private static const §_-43g§:int = 2;
      
      private var §_-s2F§:Boolean = false;
      
      private var §_-jF§:Number = 0;
      
      public function §_-D1V§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-i2D§ = §_-QC§.§_-11H§;
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
         return §_-Nu§();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.hero.game)
         {
            return;
         }
         if(this.§_-jF§ > 0)
         {
            this.§_-jF§ -= param1;
         }
         else
         {
            this.§_-s2F§ = false;
         }
      }
      
      override protected function activate() : void
      {
         var _loc1_:Hero = null;
         if(!this.hero || !this.hero.game)
         {
            this.§_-c1w§ = false;
            return;
         }
         super.activate();
         this.§_-Fv§();
         if(!this.buff)
         {
            this.buff = §_-T1G§(0.5);
         }
         this.hero.§_-Aj§(this.buff);
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(this.§_-qu§(_loc1_))
            {
               _loc1_.immortal = true;
               _loc1_.heroView.§_-S2O§();
               _loc1_.§_-Aj§(this.buff);
            }
         }
         this.§_-s2F§ = false;
         this.§_-jF§ = 0;
      }
      
      override protected function deactivate() : void
      {
         var _loc1_:Hero = null;
         super.deactivate();
         if(this.§_-g1M§)
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
         if(!this.§_-41W§)
         {
            return;
         }
         this.§_-s2F§ = true;
         this.§_-jF§ = §_-43g§;
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-e1h§,§_-S2I§.§_-F2m§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         if(!this.hero)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-e1h§:
               if(!this.active)
               {
                  return;
               }
               if(param1[1] == §_-S2I§.§_-C1g§)
               {
                  return;
               }
               this.hero.game.squirrels.get(param1[0]).immortal = true;
               break;
            case §_-S2I§.§_-F2m§:
               if(!this.§_-s2F§)
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
               setTimeout(Connection.§_-Li§,1000,§_-h2B§.§_-03G§,§_-S2I§.§_-zu§);
               break;
            default:
               super.§_-o2C§(param1);
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
                  if((_loc2_.§_-515§[_loc3_] is §_-D1V§ || _loc2_.§_-515§[_loc3_] is §_-o1d§) && _loc2_.§_-515§[_loc3_] != this && _loc2_.§_-515§[_loc3_].active)
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
         return param1 && param1.§_-k2W§ && !param1.inHollow && !param1.isHare && !param1.shaman;
      }
   }
}


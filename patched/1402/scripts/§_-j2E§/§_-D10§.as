package §_-j2E§
{
   import §_-Cc§.§_-kj§;
   import §_-X1k§.§_-P2x§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   
   public class §_-D10§ extends §_-l2A§
   {
      
      public function §_-D10§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
         this.§_-i1J§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Array = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  return;
               }
               if(param1[1] != this.§_-T2a§ || param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-s2l§.§_-x2Y§)
               {
                  _loc2_ = this.hero.game.squirrels.get(param1[4]);
                  if(!_loc2_)
                  {
                     return;
                  }
                  switch(Game.selfId)
                  {
                     case param1[0]:
                        GameSounds.play("blockDress");
                        §_-u24§.sendMessage(Game.selfId,gls("Ты отнял костюм и магию у игрока {0}.",_loc2_.playerName),§_-g1j§.§_-j1p§);
                        break;
                     case param1[4]:
                        GameSounds.play("blockedDress");
                        §_-u24§.sendMessage(Game.selfId,gls("Игрок {0} отнял у тебя костюм и магию.",this.hero.playerName),§_-g1j§.§_-j1p§);
                        break;
                     default:
                        GameSounds.play("blockDress_others");
                        §_-u24§.sendMessage(Game.selfId,gls("Игрок {0} отнял костюм и магию у игрока {1}.",this.hero.playerName,_loc2_.playerName),§_-g1j§.§_-j1p§);
                  }
                  _loc3_ = this.§_-p1l§(_loc2_) ? [§_-P2x§.§_-rR§] : (this.§_-U7§(_loc2_) ? [§_-P2x§.§_-b2N§] : []);
                  _loc2_.behaviourController.§_-W10§(new §_-kj§(15,_loc3_,true));
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-p1l§(param1:Hero) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [§_-P2x§.SCRAT_DRAGON,§_-P2x§.SCRAT_HATTER,§_-P2x§.SCRAT_JUGGLER,§_-P2x§.SCRAT_METAL,§_-P2x§.SCRAT_PERSIA,§_-P2x§.SCRAT_ROBOCOP,§_-P2x§.SCRAT_SKELETON,§_-P2x§.SCRAT_VAMPYRE];
         for each(_loc3_ in _loc2_)
         {
            if(param1.player["worn_packages"].indexOf(_loc3_) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-U7§(param1:Hero) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [§_-P2x§.SCRATTY_DRAGON,§_-P2x§.SCRATTY_HATTER,§_-P2x§.SCRATTY_JUGGLER,§_-P2x§.SCRATTY_METAL,§_-P2x§.SCRATTY_PERSIA,§_-P2x§.§_-pM§,§_-P2x§.SCRATTY_SKELETON,§_-P2x§.SCRATTY_VAMPYRE];
         for each(_loc3_ in _loc2_)
         {
            if(param1.player["worn_packages"].indexOf(_loc3_) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.isDead && !param1.inHollow && !param1.shaman && !param1.isDragon && !param1.isHare && (param1.player["worn_packages"] as Array).indexOf(§_-P2x§.§_-rR§) == -1 && (param1.player["worn_packages"] as Array).indexOf(§_-P2x§.§_-b2N§) == -1 && (param1.player["worn_packages"] as Array).length != 0;
      }
   }
}


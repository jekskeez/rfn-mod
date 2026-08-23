package §_-P2b§
{
   import §_-33r§.§_-L2a§;
   import §_-I10§.§_-g2W§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   
   public class §_-oj§ extends §_-71e§
   {
      
      public function §_-oj§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = §_-VU§;
         this.§_-mw§ = true;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Array = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  return;
               }
               if(param1[1] != this.§_-i2D§ || param1[0] != this.hero.id)
               {
                  return;
               }
               if(param1[2] == §_-S2I§.§_-EY§)
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
                        §_-92z§.sendMessage(Game.selfId,gls("Ты отнял костюм и магию у игрока {0}.",_loc2_.playerName),§_-A1n§.§_-N1c§);
                        break;
                     case param1[4]:
                        GameSounds.play("blockedDress");
                        §_-92z§.sendMessage(Game.selfId,gls("Игрок {0} отнял у тебя костюм и магию.",this.hero.playerName),§_-A1n§.§_-N1c§);
                        break;
                     default:
                        GameSounds.play("blockDress_others");
                        §_-92z§.sendMessage(Game.selfId,gls("Игрок {0} отнял костюм и магию у игрока {1}.",this.hero.playerName,_loc2_.playerName),§_-A1n§.§_-N1c§);
                  }
                  _loc3_ = this.§_-C23§(_loc2_) ? [§_-g2W§.§_-q1G§] : (this.§_-pP§(_loc2_) ? [§_-g2W§.§_-qT§] : []);
                  _loc2_.behaviourController.§_-gz§(new §_-L2a§(15,_loc3_,true));
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-C23§(param1:Hero) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [§_-g2W§.SCRAT_DRAGON,§_-g2W§.SCRAT_HATTER,§_-g2W§.SCRAT_JUGGLER,§_-g2W§.SCRAT_METAL,§_-g2W§.SCRAT_PERSIA,§_-g2W§.SCRAT_ROBOCOP,§_-g2W§.SCRAT_SKELETON,§_-g2W§.SCRAT_VAMPYRE];
         for each(_loc3_ in _loc2_)
         {
            if(param1.player["worn_packages"].indexOf(_loc3_) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-pP§(param1:Hero) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [§_-g2W§.SCRATTY_DRAGON,§_-g2W§.SCRATTY_HATTER,§_-g2W§.SCRATTY_JUGGLER,§_-g2W§.SCRATTY_METAL,§_-g2W§.SCRATTY_PERSIA,§_-g2W§.§_-92x§,§_-g2W§.SCRATTY_SKELETON,§_-g2W§.SCRATTY_VAMPYRE];
         for each(_loc3_ in _loc2_)
         {
            if(param1.player["worn_packages"].indexOf(_loc3_) != -1)
            {
               return true;
            }
         }
         return false;
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.isDead && !param1.inHollow && !param1.shaman && !param1.isDragon && !param1.isHare && (param1.player["worn_packages"] as Array).indexOf(§_-g2W§.§_-q1G§) == -1 && (param1.player["worn_packages"] as Array).indexOf(§_-g2W§.§_-qT§) == -1 && (param1.player["worn_packages"] as Array).length != 0;
      }
   }
}


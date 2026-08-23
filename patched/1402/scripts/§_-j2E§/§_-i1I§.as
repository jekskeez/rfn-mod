package §_-j2E§
{
   import §_-Cc§.§_-vY§;
   import §_-X1k§.§_-WS§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-i1I§ extends §_-l2A§
   {
      
      protected var state:§_-vY§ = null;
      
      protected var §_-32O§:Hero = null;
      
      public function §_-i1I§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.§_-32O§ == null && §_-WS§.§_-y23§ == -1;
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         if(this.§_-32O§)
         {
            this.§_-H2d§();
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-V1b§:
               if(Boolean(this.§_-32O§) && this.§_-32O§.id == param1[0])
               {
                  this.§_-H2d§();
               }
               super.§_-x2f§(param1);
               break;
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
                  this.§_-32O§ = this.hero.game.squirrels.get(param1[4]);
                  if(this.§_-32O§)
                  {
                     GameSounds.play("Death_curse");
                     this.state = new §_-vY§(0);
                     this.§_-32O§.behaviourController.§_-W10§(this.state);
                     §_-u24§.sendMessage(this.hero.id,gls("Душа «{0}» принадлежит Смерти {1}",this.§_-32O§.player.nameOrig.toString(),this.hero.player.nameOrig.toString()),§_-g1j§.§_-j1p§);
                  }
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               break;
            case §_-s2l§.§_-v1r§:
               if(Boolean(this.§_-32O§) && param1[0] == this.§_-32O§.id)
               {
                  GameSounds.play("SweetDeath_haha");
                  if(this.isSelf && §_-WS§.§_-y23§ == -1)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,this.§_-32O§.id);
                  }
                  this.§_-H2d§();
                  return;
               }
               super.§_-x2f§(param1);
               break;
            case §_-s2l§.§_-u22§:
               _loc2_ = this.hero.game.squirrels.get(param1[2]);
               if(param1[0] != this.§_-T2a§)
               {
                  return;
               }
               if(!_loc2_)
               {
                  return;
               }
               if(param1[2] == Game.selfId)
               {
                  §_-WS§.§_-y23§ = -1;
                  this.hero.game.squirrels.§_-o1w§ = false;
                  Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-13M§);
                  if(_loc2_.§_-62F§)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-D7§);
                     _loc2_.§_-I1u§(Hero.§_-z2T§);
                  }
               }
               _loc2_.heroView.§_-G14§();
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.shaman && !param1.isDead && !param1.inHollow && param1.behaviourController.getState(§_-vY§) == null;
      }
      
      private function §_-H2d§() : void
      {
         this.§_-32O§.behaviourController.removeState(this.state);
         this.§_-32O§ = null;
         this.state = null;
      }
   }
}


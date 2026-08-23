package §_-j2E§
{
   import §_-Cc§.§_-O2w§;
   import §_-c2C§.§_-u24§;
   import chat.§_-g1j§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-h2d§ extends §_-l2A§
   {
      
      protected var state:§_-O2w§ = null;
      
      protected var §_-32O§:Hero = null;
      
      protected var §_-6a§:Boolean = false;
      
      public function §_-h2d§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.§_-32O§ == null && !this.§_-6a§;
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         if(this.§_-32O§)
         {
            this.§_-H2d§();
         }
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
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
                     this.state = new §_-O2w§(0);
                     this.§_-32O§.behaviourController.§_-W10§(this.state);
                     §_-u24§.sendMessage(this.hero.id,gls("Душа «{0}» принадлежит Смерти {1}",this.§_-32O§.player.nameOrig.toString(),this.hero.player.nameOrig.toString()),§_-g1j§.§_-j1p§);
                  }
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               break;
            case §_-s2l§.§_-v1r§:
               if(Boolean(this.§_-32O§) && param1[0] == this.§_-32O§.id)
               {
                  this.§_-6a§ = true;
                  this.§_-H2d§();
                  GameSounds.play(§_-Zy§.§_-BI§ ? "Death_kill" : "kiss");
                  if(this.isSelf && this.hero.isDead)
                  {
                     this.§_-6a§ = false;
                     Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-13M§);
                  }
                  return;
               }
               if(param1[0] == this.hero.id && this.isSelf && this.§_-6a§)
               {
                  this.§_-6a§ = false;
                  Connection.§_-e2T§(§_-u1O§.§_-N1Y§,§_-s2l§.§_-13M§);
                  return;
               }
               super.§_-x2f§(param1);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function §_-3M§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.shaman && !param1.isDead && !param1.inHollow && param1.behaviourController.getState(§_-O2w§) == null;
      }
      
      private function §_-H2d§() : void
      {
         this.§_-32O§.behaviourController.removeState(this.state);
         this.§_-32O§ = null;
         this.state = null;
      }
   }
}


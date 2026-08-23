package §_-P2b§
{
   import §_-33r§.§_-A35§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-k2p§ extends §_-71e§
   {
      
      protected var state:§_-A35§ = null;
      
      protected var §_-U2x§:Hero = null;
      
      protected var §_-q1I§:Boolean = false;
      
      public function §_-k2p§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get totalCooldown() : Number
      {
         return 5;
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.§_-U2x§ == null && !this.§_-q1I§;
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         if(this.§_-U2x§)
         {
            this.§_-N0§();
         }
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-R28§:
               if(Boolean(this.§_-U2x§) && this.§_-U2x§.id == param1[0])
               {
                  this.§_-N0§();
               }
               super.§_-o2C§(param1);
               break;
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
                  this.§_-U2x§ = this.hero.game.squirrels.get(param1[4]);
                  if(this.§_-U2x§)
                  {
                     GameSounds.play("Death_curse");
                     this.state = new §_-A35§(0);
                     this.§_-U2x§.behaviourController.§_-gz§(this.state);
                     §_-92z§.sendMessage(this.hero.id,gls("Душа «{0}» принадлежит Смерти {1}",this.§_-U2x§.player.nameOrig.toString(),this.hero.player.nameOrig.toString()),§_-A1n§.§_-N1c§);
                  }
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               break;
            case §_-S2I§.§_-F2m§:
               if(Boolean(this.§_-U2x§) && param1[0] == this.§_-U2x§.id)
               {
                  this.§_-q1I§ = true;
                  this.§_-N0§();
                  GameSounds.play(§_-a9§.§_-sc§ ? "Death_kill" : "kiss");
                  if(this.isSelf && this.hero.isDead)
                  {
                     this.§_-q1I§ = false;
                     Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-Y19§);
                  }
                  return;
               }
               if(param1[0] == this.hero.id && this.isSelf && this.§_-q1I§)
               {
                  this.§_-q1I§ = false;
                  Connection.§_-Li§(§_-h2B§.§_-03G§,§_-S2I§.§_-Y19§);
                  return;
               }
               super.§_-o2C§(param1);
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function §_-qu§(param1:Hero) : Boolean
      {
         return this.hero.id != param1.id && !param1.shaman && !param1.isDead && !param1.inHollow && param1.behaviourController.getState(§_-A35§) == null;
      }
      
      private function §_-N0§() : void
      {
         this.§_-U2x§.behaviourController.removeState(this.state);
         this.§_-U2x§ = null;
         this.state = null;
      }
   }
}


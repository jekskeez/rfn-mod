package §_-P2b§
{
   import §_-A2x§.GameMapNet;
   import §_-I10§.§_-g2W§;
   import §_-S2§.Perk;
   import §_-u2r§.§_-q22§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.§_-S2I§;
   
   public class §_-O7§ extends §_-H2N§
   {
      
      private var §_-92b§:MovieClip = null;
      
      private var §_-2F§:Boolean = true;
      
      public function §_-O7§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "focus";
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.§_-2F§ && !this.hero.heroView.§_-k2P§ && !this.hero.heroView.running;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-92b§)
         {
            this.§_-92b§.removeEventListener(Event.CHANGE,this.§_-lB§);
         }
      }
      
      override public function §_-S2A§() : void
      {
         super.§_-S2A§();
         this.§_-2F§ = true;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-c1w§ = false;
            return;
         }
         §_-Zp§();
         super.activate();
         this.§_-92b§ = new MagicianHatAnimation();
         this.§_-92b§.addEventListener(Event.CHANGE,this.§_-lB§);
         this.§_-92b§.x = -20 * this.§_-92b§.scaleX;
         this.§_-92b§.y = -Hero.§_-YH§ - 110;
         this.hero.heroView.addChild(this.§_-92b§);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§ || param1[1] != this.§_-i2D§ || this.hero == null || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               this.§_-2F§ = false;
               break;
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-i2D§)
               {
                  return;
               }
               if(!("2" in param1) || param1[2] != this.hero.id)
               {
                  return;
               }
               this.active = false;
               this.§_-2F§ = true;
               dispatchEvent(new Event(Perk.§_-RK§));
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-Q1g§]);
      }
      
      private function §_-lB§(param1:Event) : void
      {
         this.active = false;
         this.§_-92b§.removeEventListener(Event.CHANGE,this.§_-lB§);
         if(Boolean(this.§_-92b§) && Boolean(this.§_-92b§.parent))
         {
            this.§_-92b§.parent.removeChild(this.§_-92b§);
         }
         var _loc2_:§_-q22§ = new §_-q22§();
         _loc2_.§_-I1z§ = (this.hero.player["worn_packages"] as Array).indexOf(§_-g2W§.SCRATTY_JUGGLER) == -1 || Boolean((this.hero.player["worn_accessories"] as Array).indexOf(§_-g2W§.§_-G2V§ == -1)) && !hero.isScrat;
         _loc2_.§_-WN§ = this.§_-i2D§;
         (this.hero.game.map as GameMapNet).§_-x25§(this.hero.id,_loc2_);
      }
   }
}


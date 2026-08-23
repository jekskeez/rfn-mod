package §_-j2E§
{
   import §_-I1q§.§_-430§;
   import §_-X1k§.§_-P2x§;
   import §_-n1h§.Perk;
   import §_-td§.GameMapNet;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.§_-s2l§;
   
   public class §_-ag§ extends §_-92f§
   {
      
      private var §_-d2H§:MovieClip = null;
      
      private var §_-335§:Boolean = true;
      
      public function §_-ag§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "focus";
      }
      
      override public function get available() : Boolean
      {
         return super.available && this.§_-335§ && !this.hero.heroView.§_-52A§ && !this.hero.heroView.running;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.§_-d2H§)
         {
            this.§_-d2H§.removeEventListener(Event.CHANGE,this.§_-YB§);
         }
      }
      
      override public function §_-xm§() : void
      {
         super.§_-xm§();
         this.§_-335§ = true;
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused)
         {
            this.§_-8x§ = false;
            return;
         }
         §_-m2i§();
         super.activate();
         this.§_-d2H§ = new MagicianHatAnimation();
         this.§_-d2H§.addEventListener(Event.CHANGE,this.§_-YB§);
         this.§_-d2H§.x = -20 * this.§_-d2H§.scaleX;
         this.§_-d2H§.y = -Hero.§_-a1A§ - 110;
         this.hero.heroView.addChild(this.§_-d2H§);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§ || param1[1] != this.§_-T2a§ || this.hero == null || param1[0] != this.hero.id)
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               this.§_-335§ = false;
               break;
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-T2a§)
               {
                  return;
               }
               if(!("2" in param1) || param1[2] != this.hero.id)
               {
                  return;
               }
               this.active = false;
               this.§_-335§ = true;
               dispatchEvent(new Event(Perk.§_-E1b§));
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§]);
      }
      
      private function §_-YB§(param1:Event) : void
      {
         this.active = false;
         this.§_-d2H§.removeEventListener(Event.CHANGE,this.§_-YB§);
         if(Boolean(this.§_-d2H§) && Boolean(this.§_-d2H§.parent))
         {
            this.§_-d2H§.parent.removeChild(this.§_-d2H§);
         }
         var _loc2_:§_-430§ = new §_-430§();
         _loc2_.§_-2S§ = (this.hero.player["worn_packages"] as Array).indexOf(§_-P2x§.SCRATTY_JUGGLER) == -1 || Boolean((this.hero.player["worn_accessories"] as Array).indexOf(§_-P2x§.§_-81g§ == -1)) && !hero.isScrat;
         _loc2_.§_-o1r§ = this.§_-T2a§;
         (this.hero.game.map as GameMapNet).§_-o1j§(this.hero.id,_loc2_);
      }
   }
}


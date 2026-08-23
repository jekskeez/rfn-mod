package §_-A2x§
{
   import §_-63u§.§_-42k§;
   import §_-63u§.§_-72w§;
   import §_-63u§.§_-V20§;
   import §_-63u§.§_-d1V§;
   import §_-63u§.§_-iy§;
   import §_-8I§.SquirrelEvent;
   import §_-8I§.SquirrelGameEvent;
   import §_-C3e§.§_-03e§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-92z§;
   import §_-k1c§.Dialog;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import views.§_-BR§;
   import views.§_-mQ§;
   
   public class §_-Ar§ extends SquirrelGame
   {
      
      private static var §_-F1j§:§_-d1V§ = null;
      
      private static var §_-I2B§:§_-42k§ = null;
      
      private static var §_-r13§:§_-iy§ = null;
      
      private static var §_-Ml§:§_-V20§ = null;
      
      private static var §_-o1i§:§_-72w§ = null;
      
      private var §_-jO§:Boolean = false;
      
      public function §_-Ar§()
      {
         this.init();
         super();
         Hero.§_-xd§([SquirrelEvent.§_-z1B§],this.§_-G1a§);
         Hero.§_-xd§([SquirrelEvent.§_-f13§],this.§_-a1t§);
         Connection.listen(this.onHollow,[§_-S2I§.§_-Vs§]);
      }
      
      override public function §_-vw§() : void
      {
         if(this.§_-U27§)
         {
            this.§_-U27§.hide();
         }
         if(Boolean(Hero.self) && Boolean(!Hero.§_-6g§) && !this.§_-jO§)
         {
            if(Hero.self.shaman)
            {
               §_-93L§ = this.§_-R2x§;
            }
            else if(Hero.self.inHollow)
            {
               §_-93L§ = this.§_-91t§;
            }
            else
            {
               §_-93L§ = this.§_-i1P§;
            }
         }
         else
         {
            §_-93L§ = this.§_-E2w§;
         }
         this.§_-U27§.show();
      }
      
      override public function round(param1:Array) : void
      {
         §_-TQ§.add("SquirrelGameNet:Round",param1[0]);
         this.cast.round(param1);
         this.map.round(param1);
         this.squirrels.round(param1);
         §_-si§();
         §_-TQ§.add("dialogChoiceCharacter");
         if(param1[0] == §_-S2I§.ROUND_STARTING)
         {
            this.§_-e1D§();
         }
         else
         {
            this.dialogChoiceCharacter.hide();
         }
         §_-BR§.update(param1);
         switch(param1[0])
         {
            case §_-S2I§.ROUND_WAITING:
               §_-TQ§.add("GameState: ROUND_WAITING");
               if(this.§_-1q§ && Boolean(this.§_-i2k§))
               {
                  this.§_-i2k§.update();
               }
               this.§_-E2w§.§_-62k§(this.squirrels.§_-f12§());
               this.§_-jO§ = true;
               if(this.§_-U27§)
               {
                  this.§_-U27§.hide();
               }
               this.§_-j1L§ = false;
               break;
            case §_-S2I§.ROUND_STARTING:
               if(this.§_-U27§)
               {
                  this.§_-U27§.hide();
               }
               this.§_-j1L§ = false;
               break;
            case §_-S2I§.§_-RO§:
               §_-TQ§.add("GameState: ROUND_STARTING");
               this.§_-j1L§ = false;
               if(§_-S16§.§_-j1Q§)
               {
                  this.§_-U27§.show();
               }
               break;
            case §_-S2I§.ROUND_PLAYING:
               §_-TQ§.add("GameState: ROUND_PLAYING");
               this.§_-j1L§ = true;
               this.§_-E2w§.§_-62k§(this.squirrels.§_-f12§());
               this.§_-jO§ = true;
               break;
            case §_-S2I§.ROUND_START:
               §_-TQ§.add("GameState: ROUND_START");
               this.§_-j1L§ = true;
               (this.map as GameMapNet).§_-O27§();
               this.§_-i1P§.§_-62k§(this.squirrels.§_-f12§());
               this.§_-R2x§.§_-62k§(this.squirrels.§_-f12§());
               this.§_-91t§.§_-62k§(this.squirrels.§_-f12§());
               this.§_-E2w§.§_-62k§(this.squirrels.§_-f12§());
               this.§_-jO§ = false;
               break;
            case §_-S2I§.§_-JF§:
               §_-TQ§.add("GameState: ROUND_CUT");
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-i1P§.hide();
         this.§_-R2x§.hide();
         this.§_-91t§.hide();
         this.dialogChoiceCharacter.hide();
         this.§_-E2w§.hide();
         Hero.forget(this.§_-G1a§);
         Hero.forget(this.§_-a1t§);
         Connection.forget(this.onHollow,[§_-S2I§.§_-Vs§]);
      }
      
      override public function onError() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-n1x§);
      }
      
      protected function init() : void
      {
         this.cast = new §_-01J§(this);
         this.map = new GameMapNet(this);
         this.squirrels = new §_-33A§();
         this.squirrels.addEventListener(SquirrelGameEvent.UPDATE_BONUS,this.§_-VX§);
         §_-93L§ = this.§_-91t§;
      }
      
      protected function §_-e1D§() : void
      {
         if(this.dialogChoiceCharacter.available)
         {
            this.dialogChoiceCharacter.show();
         }
         else
         {
            this.dialogChoiceCharacter.hide();
         }
      }
      
      protected function §_-VX§(param1:SquirrelGameEvent) : void
      {
         this.§_-91t§.§_-p1B§();
         this.§_-R2x§.§_-p1B§();
      }
      
      protected function onHollow(param1:§_-S2I§) : void
      {
         if(param1.type != §_-S2I§.§_-Vs§)
         {
            return;
         }
         if(param1[0] == 1)
         {
            return;
         }
         this.§_-i1P§.§_-13t§(param1[1],param1[3]);
         this.§_-R2x§.§_-13t§(param1[1],param1[3]);
         this.§_-91t§.§_-13t§(param1[1],param1[3]);
         this.§_-E2w§.§_-13t§(param1[1],param1[3]);
         if(§_-92z§.location == §_-q1p§.§_-sL§ && §_-Q2v§.§_-S2y§(§_-Q2v§.§_-fh§))
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            §_-92z§.§_-H2p§();
         }
         if(Boolean(this.squirrels) && param1[1] == Game.selfId)
         {
            §_-t1V§.§_-13f§();
            §_-03e§.instance.hide(null);
            if(this.§_-U27§)
            {
               this.§_-U27§.hide();
            }
            if(Hero.self.shaman)
            {
               §_-93L§ = this.§_-R2x§;
            }
            else
            {
               §_-93L§ = this.§_-91t§;
            }
            this.§_-U27§.show();
            §_-mQ§.show();
         }
      }
      
      protected function §_-G1a§() : void
      {
         var _loc1_:§_-33A§ = this.squirrels as §_-33A§;
         if(§_-d2x§.§_-z2o§ <= Game.§_-LO§)
         {
            this.§_-i1P§.update(§_-d1V§.§_-O2p§);
         }
         else if(§_-Br§.§_-f2k§ && _loc1_.§_-o2a§ < 1)
         {
            this.§_-i1P§.update(§_-d1V§.§_-U1C§);
         }
         else if(_loc1_.locationId == §_-q1p§.§_-A3z§ && _loc1_.§_-W2M§ < 1)
         {
            this.§_-i1P§.update(§_-d1V§.§_-h25§);
         }
         else if(!§_-Br§.§_-f2k§)
         {
            this.§_-i1P§.update(§_-d1V§.§_-aU§);
         }
         else
         {
            this.§_-i1P§.update(§_-d1V§.§_-Me§);
         }
         this.§_-i1P§.§_-hU§ = _loc1_.§_-I2R§ == 0;
         if(this.§_-U27§)
         {
            this.§_-U27§.hide();
         }
         §_-93L§ = this.§_-i1P§;
         this.§_-U27§.show();
      }
      
      protected function get §_-U27§() : Dialog
      {
         return §_-93L§;
      }
      
      protected function get §_-i1P§() : §_-d1V§
      {
         return §_-F1j§ = §_-F1j§ || new §_-d1V§();
      }
      
      private function get §_-91t§() : §_-42k§
      {
         return §_-I2B§ = §_-I2B§ || new §_-42k§();
      }
      
      private function get §_-R2x§() : §_-iy§
      {
         return §_-r13§ = §_-r13§ || new §_-iy§();
      }
      
      private function get dialogChoiceCharacter() : §_-72w§
      {
         return §_-o1i§ = §_-o1i§ || new §_-72w§();
      }
      
      private function get §_-E2w§() : §_-V20§
      {
         return §_-Ml§ = §_-Ml§ || new §_-V20§();
      }
      
      private function §_-a1t§() : void
      {
         this.§_-i1P§.hide();
      }
   }
}


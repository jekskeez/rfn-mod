package §_-td§
{
   import §_-92r§.§_-B3Y§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-Wd§;
   import §_-X2V§.SquirrelEvent;
   import §_-X2V§.SquirrelGameEvent;
   import §_-a1J§.§_-N1L§;
   import §_-a1J§.§_-P1p§;
   import §_-a1J§.§_-S2r§;
   import §_-a1J§.§_-fD§;
   import §_-a1J§.§_-m2e§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-u24§;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import views.§_-91L§;
   import views.§_-h10§;
   
   public class §_-vO§ extends SquirrelGame
   {
      
      private static var §_-n2Y§:§_-S2r§ = null;
      
      private static var §_-x2x§:§_-N1L§ = null;
      
      private static var §_-B33§:§_-fD§ = null;
      
      private static var §_-d2y§:§_-P1p§ = null;
      
      private static var §_-CQ§:§_-m2e§ = null;
      
      private var §_-b1Z§:Boolean = false;
      
      public function §_-vO§()
      {
         this.init();
         super();
         Hero.§_-K2a§([SquirrelEvent.§_-E25§],this.§_-Q2Q§);
         Hero.§_-K2a§([SquirrelEvent.§_-R1y§],this.§_-B35§);
         Connection.listen(this.onHollow,[§_-s2l§.§_-n1f§]);
      }
      
      override public function §_-s2p§() : void
      {
         if(this.§_-524§)
         {
            this.§_-524§.hide();
         }
         if(Boolean(Hero.self) && Boolean(!Hero.§_-Cg§) && !this.§_-b1Z§)
         {
            if(Hero.self.shaman)
            {
               §_-12U§ = this.§_-33Y§;
            }
            else if(Hero.self.inHollow)
            {
               §_-12U§ = this.§_-w1o§;
            }
            else
            {
               §_-12U§ = this.§_-y11§;
            }
         }
         else
         {
            §_-12U§ = this.§_-B3g§;
         }
         this.§_-524§.show();
      }
      
      override public function round(param1:Array) : void
      {
         §_-p2U§.add("SquirrelGameNet:Round",param1[0]);
         this.cast.round(param1);
         this.map.round(param1);
         this.squirrels.round(param1);
         §_-733§();
         §_-p2U§.add("dialogChoiceCharacter");
         if(param1[0] == §_-s2l§.ROUND_STARTING)
         {
            this.§_-23R§();
         }
         else
         {
            this.dialogChoiceCharacter.hide();
         }
         §_-91L§.update(param1);
         switch(param1[0])
         {
            case §_-s2l§.ROUND_WAITING:
               §_-p2U§.add("GameState: ROUND_WAITING");
               if(this.§_-T1y§ && Boolean(this.§_-O1C§))
               {
                  this.§_-O1C§.update();
               }
               this.§_-B3g§.§_-yA§(this.squirrels.§_-n2K§());
               this.§_-b1Z§ = true;
               if(this.§_-524§)
               {
                  this.§_-524§.hide();
               }
               this.§_-d§ = false;
               break;
            case §_-s2l§.ROUND_STARTING:
               if(this.§_-524§)
               {
                  this.§_-524§.hide();
               }
               this.§_-d§ = false;
               break;
            case §_-s2l§.§_-02x§:
               §_-p2U§.add("GameState: ROUND_STARTING");
               this.§_-d§ = false;
               if(§_-Wd§.§_-xR§)
               {
                  this.§_-524§.show();
               }
               break;
            case §_-s2l§.ROUND_PLAYING:
               §_-p2U§.add("GameState: ROUND_PLAYING");
               this.§_-d§ = true;
               this.§_-B3g§.§_-yA§(this.squirrels.§_-n2K§());
               this.§_-b1Z§ = true;
               break;
            case §_-s2l§.ROUND_START:
               §_-p2U§.add("GameState: ROUND_START");
               this.§_-d§ = true;
               (this.map as GameMapNet).§_-32A§();
               this.§_-y11§.§_-yA§(this.squirrels.§_-n2K§());
               this.§_-33Y§.§_-yA§(this.squirrels.§_-n2K§());
               this.§_-w1o§.§_-yA§(this.squirrels.§_-n2K§());
               this.§_-B3g§.§_-yA§(this.squirrels.§_-n2K§());
               this.§_-b1Z§ = false;
               break;
            case §_-s2l§.§_-F2f§:
               §_-p2U§.add("GameState: ROUND_CUT");
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-y11§.hide();
         this.§_-33Y§.hide();
         this.§_-w1o§.hide();
         this.dialogChoiceCharacter.hide();
         this.§_-B3g§.hide();
         Hero.forget(this.§_-Q2Q§);
         Hero.forget(this.§_-B35§);
         Connection.forget(this.onHollow,[§_-s2l§.§_-n1f§]);
      }
      
      override public function onError() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-M15§);
      }
      
      protected function init() : void
      {
         this.cast = new §_-z2w§(this);
         this.map = new GameMapNet(this);
         this.squirrels = new §_-N2w§();
         this.squirrels.addEventListener(SquirrelGameEvent.UPDATE_BONUS,this.§_-kK§);
         §_-12U§ = this.§_-w1o§;
      }
      
      protected function §_-23R§() : void
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
      
      protected function §_-kK§(param1:SquirrelGameEvent) : void
      {
         this.§_-w1o§.§_-n2M§();
         this.§_-33Y§.§_-n2M§();
      }
      
      protected function onHollow(param1:§_-s2l§) : void
      {
         if(param1.type != §_-s2l§.§_-n1f§)
         {
            return;
         }
         if(param1[0] == 1)
         {
            return;
         }
         this.§_-y11§.§_-41n§(param1[1],param1[3]);
         this.§_-33Y§.§_-41n§(param1[1],param1[3]);
         this.§_-w1o§.§_-41n§(param1[1],param1[3]);
         this.§_-B3g§.§_-41n§(param1[1],param1[3]);
         if(§_-u24§.location == §_-at§.§_-D18§ && §_-Ac§.§_-91§(§_-Ac§.§_-w1H§))
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            §_-u24§.§_-b1g§();
         }
         if(Boolean(this.squirrels) && param1[1] == Game.selfId)
         {
            §_-Mf§.§_-1O§();
            §_-B3Y§.instance.hide(null);
            if(this.§_-524§)
            {
               this.§_-524§.hide();
            }
            if(Hero.self.shaman)
            {
               §_-12U§ = this.§_-33Y§;
            }
            else
            {
               §_-12U§ = this.§_-w1o§;
            }
            this.§_-524§.show();
            §_-h10§.show();
         }
      }
      
      protected function §_-Q2Q§() : void
      {
         var _loc1_:§_-N2w§ = this.squirrels as §_-N2w§;
         if(§_-LZ§.§_-mA§ <= Game.§_-z1U§)
         {
            this.§_-y11§.update(§_-S2r§.§_-Mn§);
         }
         else if(§_-F1Z§.§_-O1u§ && _loc1_.§_-n2G§ < 1)
         {
            this.§_-y11§.update(§_-S2r§.§_-r1T§);
         }
         else if(_loc1_.locationId == §_-at§.§_-e2a§ && _loc1_.§_-W2y§ < 1)
         {
            this.§_-y11§.update(§_-S2r§.§_-do§);
         }
         else if(!§_-F1Z§.§_-O1u§)
         {
            this.§_-y11§.update(§_-S2r§.§_-v2F§);
         }
         else
         {
            this.§_-y11§.update(§_-S2r§.§_-rH§);
         }
         this.§_-y11§.§_-I2C§ = _loc1_.§_-q2q§ == 0;
         if(this.§_-524§)
         {
            this.§_-524§.hide();
         }
         §_-12U§ = this.§_-y11§;
         this.§_-524§.show();
      }
      
      protected function get §_-524§() : Dialog
      {
         return §_-12U§;
      }
      
      protected function get §_-y11§() : §_-S2r§
      {
         return §_-n2Y§ = §_-n2Y§ || new §_-S2r§();
      }
      
      private function get §_-w1o§() : §_-N1L§
      {
         return §_-x2x§ = §_-x2x§ || new §_-N1L§();
      }
      
      private function get §_-33Y§() : §_-fD§
      {
         return §_-B33§ = §_-B33§ || new §_-fD§();
      }
      
      private function get dialogChoiceCharacter() : §_-m2e§
      {
         return §_-CQ§ = §_-CQ§ || new §_-m2e§();
      }
      
      private function get §_-B3g§() : §_-P1p§
      {
         return §_-d2y§ = §_-d2y§ || new §_-P1p§();
      }
      
      private function §_-B35§() : void
      {
         this.§_-y11§.hide();
      }
   }
}


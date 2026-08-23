package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-I10§.§_-k1C§;
   import §_-S2§.Perk;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-l24§ extends §_-H2N§
   {
      
      private var §_-J13§:MovieClip = null;
      
      private var §_-Lg§:MovieClip = null;
      
      private var §_-iW§:MovieClip = null;
      
      private var §_-XV§:Boolean = false;
      
      private var §_-131§:Hero;
      
      private var §_-t22§:§_-b2V§;
      
      public function §_-l24§(param1:Hero)
      {
         super(param1);
         this.§_-Lg§ = new VendigoTransformIn();
         this.§_-iW§ = new VendigoTransformOut();
         this.§_-it§ = "vendigo";
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
      
      override public function get available() : Boolean
      {
         return super.available && §_-k1C§.§_-dC§ == -1;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.active && this.isSelf)
         {
            this.onUpdate();
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-63o§,§_-S2I§.§_-Q1g§]);
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-XV§ || !this.hero)
         {
            return;
         }
         this.§_-XV§ = true;
         this.hero.changeView(this.§_-Lg§,true);
         this.§_-Lg§.addEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndPlay(0);
         this.hero.jumpVelocity += 9;
         this.hero.runSpeed *= 1.5;
         this.§_-t22§ = new §_-b2V§(["VendigoTransformRun","VendigoTransformStand"]);
         this.§_-t22§.name = "Vendigo";
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-Lg§)
         {
            this.§_-Lg§.removeEventListener(Event.CHANGE,this.§_-A2V§);
            this.§_-Lg§.gotoAndStop(0);
         }
         if(this.hero)
         {
            this.hero.§_-Y2t§ = false;
         }
         if(this.§_-131§)
         {
            this.§_-131§.§_-S1W§ = false;
         }
         if(Boolean(this.hero) && this.hero.id == Game.selfId)
         {
            Connection.§_-Li§(§_-h2B§.§_-w1R§,this.§_-i2D§,false,0,"");
         }
         if(Boolean(this.§_-131§) && this.§_-131§.heroView.contains(this.§_-J13§))
         {
            this.§_-131§.heroView.removeChild(this.§_-J13§);
         }
         this.§_-131§ = null;
         this.§_-J13§ = null;
         if(!this.hero)
         {
            return;
         }
         this.§_-XV§ = false;
         this.hero.changeView(this.§_-iW§,true);
         this.§_-iW§.addEventListener(Event.CHANGE,this.§_-c2F§);
         this.§_-iW§.gotoAndPlay(0);
         this.hero.jumpVelocity -= 9;
         this.hero.runSpeed /= 1.5;
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!this.hero)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-63o§:
               if(Game.selfId != this.hero.id)
               {
                  return;
               }
               if(this.hero.id != param1[0])
               {
                  return;
               }
               this.active = false;
               break;
            case §_-S2I§.§_-F2m§:
               if(this.§_-131§ != null && this.§_-131§.id == param1[0])
               {
                  if(Game.selfId == this.hero.id)
                  {
                     this.§_-z2x§();
                  }
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,this.§_-131§.id);
               }
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-S2I§.§_-R28§:
               if(this.§_-131§ != null && this.§_-131§.id == param1[0])
               {
                  if(Game.selfId == this.hero.id)
                  {
                     this.§_-z2x§();
                  }
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,this.§_-131§.id);
               }
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-S2I§.§_-w1R§:
               if(param1[2] == §_-S2I§.§_-L2G§)
               {
                  if(Game.selfId == param1[0])
                  {
                     §_-92z§.sendMessage(this.hero.id,gls("Магия недоступна. Для тебя ещё нет подходящей цели."),§_-A1n§.§_-b2a§);
                  }
                  return;
               }
               if(this.hero.id != param1[0] || this.§_-i2D§ != param1[1])
               {
                  return;
               }
               this.active = param1[2] == §_-S2I§.§_-EY§;
               dispatchEvent(new Event(Perk.§_-RK§));
               if(param1[2] != §_-S2I§.§_-EY§)
               {
                  return;
               }
               this.§_-131§ = this.hero.game.squirrels.get(param1[4]);
               if(this.§_-131§ == null)
               {
                  this.active = false;
               }
               else
               {
                  if(Game.selfId == param1[4])
                  {
                     §_-92z§.sendMessage(this.hero.id,gls("Игрок {0} охотится за тобой!",this.hero.playerName),§_-A1n§.§_-b2a§);
                     this.hero.§_-Y2t§ = true;
                  }
                  else if(Game.selfId == param1[0])
                  {
                     §_-92z§.sendMessage(this.hero.id,gls("Ты начал охоту за игроком {0}",this.§_-131§.playerName),§_-A1n§.§_-b2a§);
                     this.§_-131§.§_-S1W§ = true;
                  }
                  this.§_-J13§ = new VendigoVictimView();
                  this.§_-J13§.visible = Game.selfId == param1[0] || Game.selfId == param1[4];
                  this.§_-J13§.y = -Hero.§_-YH§ - 55;
                  this.§_-131§.heroView.addChild(this.§_-J13§);
               }
               break;
            case §_-S2I§.§_-Q1g§:
               if(this.hero.id != param1[1] || this.§_-i2D§ != param1[0] || this.§_-131§ == null || this.§_-131§.id != param1[2])
               {
                  return;
               }
               this.§_-z2x§();
               this.active = false;
         }
      }
      
      private function §_-z2x§() : void
      {
         if(this.§_-131§.id == Game.selfId)
         {
            §_-k1C§.§_-dC§ = -1;
            this.hero.game.squirrels.§_-g14§ = false;
         }
         this.§_-131§.heroView.§_-ZX§();
      }
      
      protected function §_-A2V§(param1:Event) : void
      {
         this.§_-Lg§.removeEventListener(Event.CHANGE,this.§_-A2V§);
         this.§_-Lg§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView(this.§_-t22§);
      }
      
      protected function §_-c2F§(param1:Event) : void
      {
         this.§_-iW§.removeEventListener(Event.CHANGE,this.§_-c2F§);
         this.§_-iW§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
      }
      
      private function onUpdate() : void
      {
         var _loc1_:b2Vec2 = null;
         if(Boolean(this.hero) && Boolean(this.§_-131§) && this.active)
         {
            _loc1_ = this.§_-131§.position.Copy();
            _loc1_.Subtract(this.hero.position);
            if(_loc1_.Length() < 4)
            {
               this.§_-z2x§();
               Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,this.§_-131§.id);
               this.active = false;
            }
         }
      }
   }
}


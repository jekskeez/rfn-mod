package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-X1k§.§_-WS§;
   import §_-c2C§.§_-u24§;
   import §_-n1h§.Perk;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-Ne§ extends §_-92f§
   {
      
      private var §_-Cp§:MovieClip = null;
      
      private var §_-N1l§:MovieClip = null;
      
      private var §_-F19§:MovieClip = null;
      
      private var §_-Z§:Boolean = false;
      
      private var §_-B1W§:Hero;
      
      private var §_-AA§:§_-I22§;
      
      public function §_-Ne§(param1:Hero)
      {
         super(param1);
         this.§_-N1l§ = new VendigoTransformIn();
         this.§_-F19§ = new VendigoTransformOut();
         this.§_-S2A§ = "vendigo";
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
         return super.available && §_-WS§.§_-y23§ == -1;
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
         return super.packets.concat([§_-s2l§.§_-kF§,§_-s2l§.§_-u22§]);
      }
      
      override protected function activate() : void
      {
         super.activate();
         if(this.§_-Z§ || !this.hero)
         {
            return;
         }
         this.§_-Z§ = true;
         this.hero.changeView(this.§_-N1l§,true);
         this.§_-N1l§.addEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndPlay(0);
         this.hero.jumpVelocity += 9;
         this.hero.runSpeed *= 1.5;
         this.§_-AA§ = new §_-I22§(["VendigoTransformRun","VendigoTransformStand"]);
         this.§_-AA§.name = "Vendigo";
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(this.§_-N1l§)
         {
            this.§_-N1l§.removeEventListener(Event.CHANGE,this.§_-xw§);
            this.§_-N1l§.gotoAndStop(0);
         }
         if(this.hero)
         {
            this.hero.§_-Rb§ = false;
         }
         if(this.§_-B1W§)
         {
            this.§_-B1W§.§_-N1U§ = false;
         }
         if(Boolean(this.hero) && this.hero.id == Game.selfId)
         {
            Connection.§_-e2T§(§_-u1O§.§_-C1i§,this.§_-T2a§,false,0,"");
         }
         if(Boolean(this.§_-B1W§) && this.§_-B1W§.heroView.contains(this.§_-Cp§))
         {
            this.§_-B1W§.heroView.removeChild(this.§_-Cp§);
         }
         this.§_-B1W§ = null;
         this.§_-Cp§ = null;
         if(!this.hero)
         {
            return;
         }
         this.§_-Z§ = false;
         this.hero.changeView(this.§_-F19§,true);
         this.§_-F19§.addEventListener(Event.CHANGE,this.§_-Z2V§);
         this.§_-F19§.gotoAndPlay(0);
         this.hero.jumpVelocity -= 9;
         this.hero.runSpeed /= 1.5;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!this.hero)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-kF§:
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
            case §_-s2l§.§_-v1r§:
               if(this.§_-B1W§ != null && this.§_-B1W§.id == param1[0])
               {
                  if(Game.selfId == this.hero.id)
                  {
                     this.§_-B1c§();
                  }
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,this.§_-B1W§.id);
               }
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-s2l§.§_-V1b§:
               if(this.§_-B1W§ != null && this.§_-B1W§.id == param1[0])
               {
                  if(Game.selfId == this.hero.id)
                  {
                     this.§_-B1c§();
                  }
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,this.§_-B1W§.id);
               }
               if(this.hero.id == param1[0])
               {
                  this.active = false;
               }
               break;
            case §_-s2l§.§_-C1i§:
               if(param1[2] == §_-s2l§.§_-j2o§)
               {
                  if(Game.selfId == param1[0])
                  {
                     §_-u24§.sendMessage(this.hero.id,gls("Магия недоступна. Для тебя ещё нет подходящей цели."),§_-g1j§.§_-123§);
                  }
                  return;
               }
               if(this.hero.id != param1[0] || this.§_-T2a§ != param1[1])
               {
                  return;
               }
               this.active = param1[2] == §_-s2l§.§_-x2Y§;
               dispatchEvent(new Event(Perk.§_-E1b§));
               if(param1[2] != §_-s2l§.§_-x2Y§)
               {
                  return;
               }
               this.§_-B1W§ = this.hero.game.squirrels.get(param1[4]);
               if(this.§_-B1W§ == null)
               {
                  this.active = false;
               }
               else
               {
                  if(Game.selfId == param1[4])
                  {
                     §_-u24§.sendMessage(this.hero.id,gls("Игрок {0} охотится за тобой!",this.hero.playerName),§_-g1j§.§_-123§);
                     this.hero.§_-Rb§ = true;
                  }
                  else if(Game.selfId == param1[0])
                  {
                     §_-u24§.sendMessage(this.hero.id,gls("Ты начал охоту за игроком {0}",this.§_-B1W§.playerName),§_-g1j§.§_-123§);
                     this.§_-B1W§.§_-N1U§ = true;
                  }
                  this.§_-Cp§ = new VendigoVictimView();
                  this.§_-Cp§.visible = Game.selfId == param1[0] || Game.selfId == param1[4];
                  this.§_-Cp§.y = -Hero.§_-a1A§ - 55;
                  this.§_-B1W§.heroView.addChild(this.§_-Cp§);
               }
               break;
            case §_-s2l§.§_-u22§:
               if(this.hero.id != param1[1] || this.§_-T2a§ != param1[0] || this.§_-B1W§ == null || this.§_-B1W§.id != param1[2])
               {
                  return;
               }
               this.§_-B1c§();
               this.active = false;
         }
      }
      
      private function §_-B1c§() : void
      {
         if(this.§_-B1W§.id == Game.selfId)
         {
            §_-WS§.§_-y23§ = -1;
            this.hero.game.squirrels.§_-o1w§ = false;
         }
         this.§_-B1W§.heroView.§_-G14§();
      }
      
      protected function §_-xw§(param1:Event) : void
      {
         this.§_-N1l§.removeEventListener(Event.CHANGE,this.§_-xw§);
         this.§_-N1l§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView(this.§_-AA§);
      }
      
      protected function §_-Z2V§(param1:Event) : void
      {
         this.§_-F19§.removeEventListener(Event.CHANGE,this.§_-Z2V§);
         this.§_-F19§.gotoAndStop(0);
         if(!this.hero)
         {
            return;
         }
         this.hero.changeView();
      }
      
      private function onUpdate() : void
      {
         var _loc1_:b2Vec2 = null;
         if(Boolean(this.hero) && Boolean(this.§_-B1W§) && this.active)
         {
            _loc1_ = this.§_-B1W§.position.Copy();
            _loc1_.Subtract(this.hero.position);
            if(_loc1_.Length() < 4)
            {
               this.§_-B1c§();
               Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,this.§_-B1W§.id);
               this.active = false;
            }
         }
      }
   }
}


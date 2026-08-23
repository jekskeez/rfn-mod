package §_-I1q§
{
   import §_-Cc§.§_-F1B§;
   import §_-Cc§.§_-f1M§;
   import §_-Cc§.§_-rK§;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-u24§;
   import §_-cm§.§_-Q2h§;
   import §_-j2E§.§_-A11§;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   
   public class §_-T1b§ extends §_-Z2G§ implements §_-jC§
   {
      
      private static const §_-MS§:int = 0;
      
      private static const §_-v2t§:int = 1;
      
      private static const §_-PR§:int = 2;
      
      private static const §_-rE§:int = 3;
      
      private static const §_-62o§:int = 4;
      
      private static const §_-Bm§:Array = [{"text":gls("получил ускорение")},{"text":gls("получил орех")},{"text":gls("стал медленее бегать")},{"text":gls("стал ниже прыгать")},{"text":gls("отравился веселящим газом")}];
      
      private var §_-w1L§:MovieClip = null;
      
      private var §_-Y19§:int = -1;
      
      private var hero:Hero;
      
      private var §_-P1X§:Hero;
      
      private var §_-ju§:MovieClip = null;
      
      private var §_-13d§:MovieClip = null;
      
      private var buff:§_-Q2h§ = null;
      
      private var activated:Boolean = false;
      
      private var §_-Z2g§:Boolean = false;
      
      public function §_-T1b§()
      {
         this.§_-o1r§ = §_-A11§.§_-x1d§;
         this.§_-i1D§ = §_-g1j§.§_-O11§;
         super();
      }
      
      override protected function get animation() : MovieClip
      {
         var _loc1_:JokerMagicView = new JokerMagicView();
         _loc1_.y = 15;
         return _loc1_;
      }
      
      override protected function get beginAnimation() : MovieClip
      {
         var _loc1_:JokerMagicBegin = new JokerMagicBegin();
         _loc1_.y = 15;
         return _loc1_;
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-o1r§)
               {
                  return;
               }
               if(!this.§_-21H§ || this.activated)
               {
                  return;
               }
               if(param1[2] == Game.self.id || param1[1] == Game.self.id)
               {
                  if(param1[3] == §_-62o§)
                  {
                     GameSounds.play("joker_nothing");
                  }
                  else
                  {
                     GameSounds.play("joker_open");
                  }
               }
               if(param1[2] != this.playerId)
               {
                  return;
               }
               this.§_-D27§ = true;
               this.activated = true;
               this.hero = this.§_-21H§.squirrels.get(param1[1]);
               this.§_-P1X§ = this.§_-21H§.squirrels.get(param1[2]);
               this.view.alpha = 0;
               this.§_-63m§.alpha = 0;
               this.§_-w1L§ = new JokerMagicOpen();
               this.§_-w1L§.y = 15;
               this.§_-w1L§.addEventListener(Event.CHANGE,this.§_-S1Y§);
               addChild(this.§_-w1L§);
               if("3" in param1)
               {
                  this.§_-Y19§ = param1[3];
               }
               switch(this.§_-Y19§)
               {
                  case §_-MS§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-W10§(new §_-rK§(5,0.2));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-P1X§))
                     {
                        this.§_-P1X§.behaviourController.§_-W10§(new §_-rK§(5,0.2));
                     }
                     this.§_-ju§ = new JokerSpeedUp();
                     break;
                  case §_-v2t§:
                     if(this.hero)
                     {
                        this.hero.§_-I1u§(Hero.§_-43e§);
                     }
                     if(this.§_-P1X§)
                     {
                        this.§_-P1X§.§_-I1u§(Hero.§_-43e§);
                     }
                     if(Boolean(this.hero) && Boolean(this.hero.id == Game.selfId) || Boolean(this.§_-P1X§) && Boolean(this.§_-P1X§.id == Game.selfId))
                     {
                        Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
                     }
                     this.§_-ju§ = new JokerGetNut();
                     break;
                  case §_-PR§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-W10§(new §_-rK§(5,-0.25));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-P1X§))
                     {
                        this.§_-P1X§.behaviourController.§_-W10§(new §_-rK§(5,0.2));
                     }
                     this.§_-ju§ = new JokerSpeedDown();
                     break;
                  case §_-rE§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-W10§(new §_-f1M§(5,-0.5));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-P1X§))
                     {
                        this.§_-P1X§.behaviourController.§_-W10§(new §_-rK§(5,0.2));
                     }
                     this.§_-ju§ = new JokerJumpDown();
                     break;
                  case §_-62o§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-W10§(new §_-F1B§(3));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-P1X§))
                     {
                        this.§_-P1X§.behaviourController.§_-W10§(new §_-rK§(5,0.2));
                     }
                     this.§_-ju§ = new JokerStun();
                     break;
                  default:
                     return;
               }
               §_-u24§.sendMessage(param1[1],§_-Bm§[param1[3]]["text"],this.§_-i1D§);
               if(this.hero)
               {
                  this.§_-ju§.addEventListener(Event.CHANGE,this.onComplete);
                  this.§_-ju§.y = -Hero.§_-a1A§;
                  this.hero.heroView.addChild(this.§_-ju§);
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.activated ? 1 : 0]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.activated = param1[2][0] != 0;
         this.view.alpha = this.activated ? 0 : 1;
         this.§_-63m§.alpha = this.activated ? 0 : 1;
      }
      
      private function §_-q23§(param1:Event) : void
      {
         this.§_-13d§.removeEventListener(Event.CHANGE,this.§_-q23§);
         if(Boolean(this.§_-13d§) && Boolean(this.§_-13d§.parent))
         {
            this.§_-13d§.parent.removeChild(this.§_-13d§);
         }
         this.§_-13d§ = null;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.§_-ju§.removeEventListener(Event.CHANGE,this.onComplete);
         if(Boolean(this.§_-ju§) && Boolean(this.§_-ju§.parent))
         {
            this.§_-ju§.parent.removeChild(this.§_-ju§);
         }
         this.§_-ju§ = null;
         if(!this.§_-21H§ || !this.§_-21H§.squirrels || !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      private function §_-S1Y§(param1:Event) : void
      {
         if(!this.§_-w1L§)
         {
            return;
         }
         removeChild(this.§_-w1L§);
         this.§_-w1L§.removeEventListener(Event.CHANGE,this.§_-S1Y§);
         this.§_-w1L§ = this.§_-Y19§ != §_-MS§ && this.§_-Y19§ != §_-v2t§ ? new JokerMagicDeathNegative() : new JokerMagicDeathPositive();
         this.§_-w1L§.y = 15;
         this.§_-w1L§.addEventListener(Event.CHANGE,this.§_-Q2Q§);
         addChild(this.§_-w1L§);
      }
      
      private function §_-Q2Q§(param1:Event) : void
      {
         if(!this.§_-w1L§)
         {
            return;
         }
         removeChild(this.§_-w1L§);
         this.§_-w1L§.removeEventListener(Event.CHANGE,this.§_-Q2Q§);
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-S27§,§_-D1m§.§_-h2z§);
      }
      
      public function get showIcon() : Boolean
      {
         return !this.activated;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
   }
}


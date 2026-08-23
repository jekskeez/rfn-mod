package §_-u2r§
{
   import §_-33r§.§_-R§;
   import §_-33r§.§_-d1c§;
   import §_-33r§.§_-m2U§;
   import §_-P2b§.§_-6L§;
   import §_-RI§.§_-h2I§;
   import §_-T1r§.§_-03i§;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   
   public class §_-bK§ extends §_-R1r§ implements §_-jP§
   {
      
      private static const §_-69§:int = 0;
      
      private static const §_-G2H§:int = 1;
      
      private static const §_-c1C§:int = 2;
      
      private static const §_-P2h§:int = 3;
      
      private static const §_-1Q§:int = 4;
      
      private static const §_-rG§:Array = [{"text":gls("получил ускорение")},{"text":gls("получил орех")},{"text":gls("стал медленее бегать")},{"text":gls("стал ниже прыгать")},{"text":gls("отравился веселящим газом")}];
      
      private var §_-J1I§:MovieClip = null;
      
      private var §_-43C§:int = -1;
      
      private var hero:Hero;
      
      private var §_-u1B§:Hero;
      
      private var §_-8§:MovieClip = null;
      
      private var §_-e2M§:MovieClip = null;
      
      private var buff:§_-03i§ = null;
      
      private var activated:Boolean = false;
      
      private var §_-Q2t§:Boolean = false;
      
      public function §_-bK§()
      {
         this.§_-WN§ = §_-6L§.§_-r15§;
         this.§_-pV§ = §_-A1n§.§_-M2u§;
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
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-WN§)
               {
                  return;
               }
               if(!this.§_-H2D§ || this.activated)
               {
                  return;
               }
               if(param1[2] == Game.self.id || param1[1] == Game.self.id)
               {
                  if(param1[3] == §_-1Q§)
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
               this.§_-42S§ = true;
               this.activated = true;
               this.hero = this.§_-H2D§.squirrels.get(param1[1]);
               this.§_-u1B§ = this.§_-H2D§.squirrels.get(param1[2]);
               this.view.alpha = 0;
               this.§_-xn§.alpha = 0;
               this.§_-J1I§ = new JokerMagicOpen();
               this.§_-J1I§.y = 15;
               this.§_-J1I§.addEventListener(Event.CHANGE,this.§_-Ao§);
               addChild(this.§_-J1I§);
               if("3" in param1)
               {
                  this.§_-43C§ = param1[3];
               }
               switch(this.§_-43C§)
               {
                  case §_-69§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-gz§(new §_-m2U§(5,0.2));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-u1B§))
                     {
                        this.§_-u1B§.behaviourController.§_-gz§(new §_-m2U§(5,0.2));
                     }
                     this.§_-8§ = new JokerSpeedUp();
                     break;
                  case §_-G2H§:
                     if(this.hero)
                     {
                        this.hero.§_-4j§(Hero.§_-517§);
                     }
                     if(this.§_-u1B§)
                     {
                        this.§_-u1B§.§_-4j§(Hero.§_-517§);
                     }
                     if(Boolean(this.hero) && Boolean(this.hero.id == Game.selfId) || Boolean(this.§_-u1B§) && Boolean(this.§_-u1B§.id == Game.selfId))
                     {
                        Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
                     }
                     this.§_-8§ = new JokerGetNut();
                     break;
                  case §_-c1C§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-gz§(new §_-m2U§(5,-0.25));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-u1B§))
                     {
                        this.§_-u1B§.behaviourController.§_-gz§(new §_-m2U§(5,0.2));
                     }
                     this.§_-8§ = new JokerSpeedDown();
                     break;
                  case §_-P2h§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-gz§(new §_-d1c§(5,-0.5));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-u1B§))
                     {
                        this.§_-u1B§.behaviourController.§_-gz§(new §_-m2U§(5,0.2));
                     }
                     this.§_-8§ = new JokerJumpDown();
                     break;
                  case §_-1Q§:
                     if(this.hero)
                     {
                        this.hero.behaviourController.§_-gz§(new §_-R§(3));
                     }
                     if(param1[1] != param1[2] && Boolean(this.§_-u1B§))
                     {
                        this.§_-u1B§.behaviourController.§_-gz§(new §_-m2U§(5,0.2));
                     }
                     this.§_-8§ = new JokerStun();
                     break;
                  default:
                     return;
               }
               §_-92z§.sendMessage(param1[1],§_-rG§[param1[3]]["text"],this.§_-pV§);
               if(this.hero)
               {
                  this.§_-8§.addEventListener(Event.CHANGE,this.onComplete);
                  this.§_-8§.y = -Hero.§_-YH§;
                  this.hero.heroView.addChild(this.§_-8§);
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.activated ? 1 : 0]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.activated = param1[2][0] != 0;
         this.view.alpha = this.activated ? 0 : 1;
         this.§_-xn§.alpha = this.activated ? 0 : 1;
      }
      
      private function §_-G2t§(param1:Event) : void
      {
         this.§_-e2M§.removeEventListener(Event.CHANGE,this.§_-G2t§);
         if(Boolean(this.§_-e2M§) && Boolean(this.§_-e2M§.parent))
         {
            this.§_-e2M§.parent.removeChild(this.§_-e2M§);
         }
         this.§_-e2M§ = null;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.§_-8§.removeEventListener(Event.CHANGE,this.onComplete);
         if(Boolean(this.§_-8§) && Boolean(this.§_-8§.parent))
         {
            this.§_-8§.parent.removeChild(this.§_-8§);
         }
         this.§_-8§ = null;
         if(!this.§_-H2D§ || !this.§_-H2D§.squirrels || !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      private function §_-Ao§(param1:Event) : void
      {
         if(!this.§_-J1I§)
         {
            return;
         }
         removeChild(this.§_-J1I§);
         this.§_-J1I§.removeEventListener(Event.CHANGE,this.§_-Ao§);
         this.§_-J1I§ = this.§_-43C§ != §_-69§ && this.§_-43C§ != §_-G2H§ ? new JokerMagicDeathNegative() : new JokerMagicDeathPositive();
         this.§_-J1I§.y = 15;
         this.§_-J1I§.addEventListener(Event.CHANGE,this.§_-G1a§);
         addChild(this.§_-J1I§);
      }
      
      private function §_-G1a§(param1:Event) : void
      {
         if(!this.§_-J1I§)
         {
            return;
         }
         removeChild(this.§_-J1I§);
         this.§_-J1I§.removeEventListener(Event.CHANGE,this.§_-G1a§);
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-F2F§,§_-1s§.§_-e11§);
      }
      
      public function get showIcon() : Boolean
      {
         return !this.activated;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
   }
}


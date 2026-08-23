package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-61C§.§_-a2p§;
   import §_-Cc§.§_-f6§;
   import §_-Cc§.§_-oL§;
   import §_-Cc§.§_-z1Y§;
   import §_-Sx§.§_-W1w§;
   import §_-TK§.§_-f1u§;
   import buttons.§_-11d§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-V2I§ extends §_-92f§
   {
      
      private static const §_-A2L§:Number = 4;
      
      private static const §_-nw§:String = "throw";
      
      public var §_-B1W§:Hero = null;
      
      private var §_-WZ§:Boolean = false;
      
      private var §_-62A§:§_-11d§;
      
      private var §_-52y§:§_-oL§;
      
      private var §_-IS§:§_-z1Y§;
      
      private var §_-N1l§:§_-f1u§;
      
      private var §_-F19§:§_-f1u§;
      
      public function §_-V2I§(param1:Hero)
      {
         super(param1);
         this.§_-N1l§ = new §_-f1u§(new IrbisTransformIn());
         this.§_-N1l§.loop = false;
         this.§_-N1l§.stop();
         this.§_-F19§ = new §_-f1u§(new IrbisTransformOut());
         this.§_-F19§.loop = false;
         this.§_-F19§.stop();
         this.§_-S2A§ = "leopard_roar";
         if(this.hero.isSelf)
         {
            this.§_-62A§ = new §_-11d§(new ButtonPerkIrbisThrow());
            this.§_-62A§.addEventListener(MouseEvent.CLICK,this.§_-w2p§);
         }
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get activeTime() : Number
      {
         return 25;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-62A§)
         {
            this.§_-62A§.mouseEnabled = this.§_-WZ§ && !this.hero.isStopped && !this.hero.isDead;
         }
         if(!this.active || this.hero.id != Game.selfId || this.§_-WZ§ || !this.hero.behaviourController.getState(§_-oL§))
         {
            return;
         }
         this.§_-n1n§();
      }
      
      override public function §_-xm§() : void
      {
         this.§_-VV§();
         super.§_-xm§();
      }
      
      override protected function activate() : void
      {
         if(§_-x2b§)
         {
            return;
         }
         super.activate();
         this.hero.changeView(this.§_-N1l§);
         this.§_-N1l§.addEventListener(Event.COMPLETE,this.§_-xw§);
         this.§_-N1l§.gotoAndPlay(1);
      }
      
      override protected function deactivate() : void
      {
         if(§_-x2b§)
         {
            return;
         }
         super.deactivate();
         var _loc1_:Boolean = this.§_-52y§ != null;
         this.§_-n2l§();
         if(_loc1_)
         {
            this.hero.changeView(this.§_-F19§);
            this.§_-F19§.addEventListener(Event.COMPLETE,this.§_-Z2V§);
            this.§_-F19§.gotoAndPlay(1);
         }
         else
         {
            this.hero.isStopped = false;
            this.hero.changeView();
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-u22§,§_-s2l§.§_-D2o§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(§_-x2b§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-u22§:
               if(param1[0] != this.§_-T2a§ || this.hero.id != param1[1] || !("2" in param1))
               {
                  return;
               }
               _loc2_ = this.hero.game.squirrels.get(param1[2]);
               if(!_loc2_)
               {
                  return;
               }
               if(param1[3] == 1)
               {
                  this.§_-42o§(_loc2_);
               }
               else
               {
                  this.§_-634§(_loc2_);
               }
               break;
            case §_-s2l§.§_-D2o§:
               if(Boolean(this.§_-B1W§) && Boolean(param1[0] == this.hero.id) && param1[1] == §_-u1O§.§_-A1F§)
               {
                  this.§_-B1W§.§_-I1u§(Hero.§_-43e§);
                  if(Game.selfId == this.§_-B1W§.id)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
                  }
               }
               break;
            case §_-s2l§.§_-Yi§:
               _loc3_ = param1[0];
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_ == this.hero.id)
                  {
                     this.§_-VV§();
                     this.active = false;
                     break;
                  }
                  if(Boolean(this.§_-B1W§) && _loc4_ == this.§_-B1W§.id)
                  {
                     if(this.§_-52y§)
                     {
                        this.§_-52y§.§_-KJ§();
                     }
                     this.§_-VX§();
                     break;
                  }
               }
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(this.hero.id != param1[1] || !this.§_-B1W§)
               {
                  return;
               }
               if(this.§_-B1W§.§_-62F§)
               {
                  if(Game.selfId == this.§_-B1W§.id)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-n1f§,0);
                  }
                  this.§_-B1W§.onHollow(param1[2]);
               }
               else
               {
                  this.§_-VX§();
               }
               break;
            case §_-s2l§.§_-v1r§:
            case §_-s2l§.§_-V1b§:
               if(param1[0] == this.hero.id)
               {
                  this.§_-VV§();
                  this.active = false;
                  break;
               }
               if(Boolean(this.§_-B1W§) && param1[0] == this.§_-B1W§.id)
               {
                  if(this.§_-52y§)
                  {
                     this.§_-52y§.§_-KJ§();
                  }
                  this.§_-VX§(param1.type != §_-s2l§.§_-V1b§);
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-w2p§(param1:MouseEvent) : void
      {
         if(!this.active || this.hero.id != Game.selfId || !this.§_-B1W§ || this.§_-B1W§.isDead || this.§_-B1W§.inHollow || this.hero.isDead)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,this.§_-B1W§.id,0);
      }
      
      private function §_-634§(param1:Hero) : void
      {
         if(!this.§_-B1W§ || this.§_-B1W§ != param1)
         {
            return;
         }
         if(this.hero.behaviourController.getState(§_-oL§) == null)
         {
            return;
         }
         this.hero.isStopped = true;
         (this.hero.behaviourController.getState(§_-oL§) as §_-oL§).§_-KJ§();
         (this.hero.heroView.viewAlternative as §_-W2i§).§_-A2m§ = true;
         (this.hero.heroView.viewAlternative as §_-W2i§).armature.addEventListener(§_-W1w§.COMPLETE,this.§_-S1a§);
         (this.hero.heroView.viewAlternative as §_-W2i§).armature.animation.gotoAndPlay(§_-nw§);
      }
      
      private function §_-S1a§(param1:§_-W1w§) : void
      {
         this.hero.isStopped = false;
         this.§_-WZ§ = false;
         (this.hero.heroView.viewAlternative as §_-W2i§).§_-A2m§ = false;
         (this.hero.heroView.viewAlternative as §_-W2i§).armature.removeEventListener(§_-W1w§.COMPLETE,this.§_-S1a§);
         (this.hero.heroView.viewAlternative as §_-W2i§).armature.animation.gotoAndPlay(Hero.§_-z1s§);
         if(!this.§_-B1W§)
         {
            return;
         }
         this.§_-B1W§.heroView.direction = this.hero.heroView.direction;
         this.§_-B1W§.teleportTo(new b2Vec2(this.hero.position.x + 10 * (this.hero.heroView.direction ? -1 : 1),this.hero.position.y - 2));
         this.§_-B1W§.rotation = this.hero.rotation;
         this.§_-VX§(false);
      }
      
      private function §_-42o§(param1:Hero) : void
      {
         if(!param1 || this.§_-B1W§ != null)
         {
            return;
         }
         if(param1.shaman || param1.isDead || param1.inHollow)
         {
            return;
         }
         this.§_-B1W§ = param1;
         this.§_-IS§ = new §_-z1Y§(0,this.hero);
         this.§_-B1W§.behaviourController.§_-W10§(this.§_-IS§);
         if(this.§_-52y§)
         {
            this.§_-52y§.§_-m2a§();
         }
      }
      
      private function §_-Z2V§(param1:Event) : void
      {
         this.§_-F19§.removeEventListener(Event.COMPLETE,this.§_-Z2V§);
         this.§_-F19§.stop();
         this.hero.isStopped = false;
         if(§_-x2b§)
         {
            return;
         }
         this.hero.changeView();
      }
      
      private function §_-xw§(param1:Event) : void
      {
         this.§_-N1l§.removeEventListener(Event.COMPLETE,this.§_-xw§);
         this.§_-N1l§.stop();
         if(§_-x2b§)
         {
            return;
         }
         this.§_-52y§ = new §_-oL§(0);
         this.hero.behaviourController.§_-W10§(this.§_-52y§);
         if(this.§_-62A§)
         {
            §_-a2p§.§_-Hi§(this.§_-62A§,gls("Бросок"),Keyboard.Y);
         }
         if(this.§_-B1W§)
         {
            this.§_-52y§.§_-m2a§();
         }
      }
      
      private function §_-n1n§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.isSelf || _loc1_.isStopped || _loc1_.isHare || _loc1_.isDragon || _loc1_.shaman || _loc1_.inHollow || _loc1_.isSquirrel && _loc1_.perkController.§_-S1Q§(this.§_-T2a§) != -1 || _loc1_.behaviourController.getState(§_-f6§) != null))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc1_.position);
               if(_loc2_.Length() <= §_-A2L§)
               {
                  this.§_-WZ§ = true;
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc1_.id,1);
                  break;
               }
            }
         }
      }
      
      private function §_-VX§(param1:Boolean = true) : void
      {
         this.§_-B1W§.behaviourController.removeState(this.§_-IS§);
         if(param1)
         {
            this.§_-B1W§.position = this.hero.position;
         }
         this.§_-B1W§ = null;
         this.§_-IS§ = null;
         if(this.§_-62A§)
         {
            this.§_-62A§.mouseEnabled = false;
         }
      }
      
      private function §_-VV§() : void
      {
         this.§_-n2l§();
         this.hero.isStopped = false;
         this.hero.changeView();
      }
      
      private function §_-n2l§() : void
      {
         var _loc1_:§_-W2i§ = null;
         this.§_-WZ§ = false;
         if(this.§_-62A§)
         {
            §_-a2p§.§_-M25§(this.§_-62A§);
         }
         if(this.§_-B1W§)
         {
            this.§_-VX§();
         }
         this.§_-N1l§.removeEventListener(Event.COMPLETE,this.§_-xw§);
         this.§_-N1l§.stop();
         this.§_-F19§.removeEventListener(Event.COMPLETE,this.§_-Z2V§);
         this.§_-F19§.stop();
         if(Boolean(this.hero.heroView.viewAlternative) && this.hero.heroView.viewAlternative is §_-W2i§)
         {
            _loc1_ = this.hero.heroView.viewAlternative as §_-W2i§;
            if(_loc1_.armature)
            {
               _loc1_.armature.removeEventListener(§_-W1w§.COMPLETE,this.§_-S1a§);
            }
            _loc1_.§_-A2m§ = false;
         }
         if(this.§_-52y§)
         {
            this.hero.behaviourController.removeState(this.§_-52y§);
         }
         this.§_-52y§ = null;
      }
   }
}


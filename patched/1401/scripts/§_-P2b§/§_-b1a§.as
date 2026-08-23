package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-03j§.§_-Q24§;
   import §_-33r§.§_-O2m§;
   import §_-33r§.§_-b2w§;
   import §_-33r§.§_-g9§;
   import §_-RI§.§_-d2d§;
   import §_-S1D§.§_-O1M§;
   import buttons.§_-Uo§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-b1a§ extends §_-H2N§
   {
      
      private static const §_-c1F§:Number = 4;
      
      private static const §_-n1n§:String = "throw";
      
      public var §_-131§:Hero = null;
      
      private var §_-M1q§:Boolean = false;
      
      private var §_-k1S§:§_-Uo§;
      
      private var §_-e2j§:§_-O2m§;
      
      private var §_-jc§:§_-g9§;
      
      private var §_-Lg§:§_-d2d§;
      
      private var §_-iW§:§_-d2d§;
      
      public function §_-b1a§(param1:Hero)
      {
         super(param1);
         this.§_-Lg§ = new §_-d2d§(new IrbisTransformIn());
         this.§_-Lg§.loop = false;
         this.§_-Lg§.stop();
         this.§_-iW§ = new §_-d2d§(new IrbisTransformOut());
         this.§_-iW§.loop = false;
         this.§_-iW§.stop();
         this.§_-it§ = "leopard_roar";
         if(this.hero.isSelf)
         {
            this.§_-k1S§ = new §_-Uo§(new ButtonPerkIrbisThrow());
            this.§_-k1S§.addEventListener(MouseEvent.CLICK,this.§_-a2G§);
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
         if(this.§_-k1S§)
         {
            this.§_-k1S§.mouseEnabled = this.§_-M1q§ && !this.hero.isStopped && !this.hero.isDead;
         }
         if(!this.active || this.hero.id != Game.selfId || this.§_-M1q§ || !this.hero.behaviourController.getState(§_-O2m§))
         {
            return;
         }
         this.§_-R8§();
      }
      
      override public function §_-S2A§() : void
      {
         this.§_-gt§();
         super.§_-S2A§();
      }
      
      override protected function activate() : void
      {
         if(§_-g1M§)
         {
            return;
         }
         super.activate();
         this.hero.changeView(this.§_-Lg§);
         this.§_-Lg§.addEventListener(Event.COMPLETE,this.§_-A2V§);
         this.§_-Lg§.gotoAndPlay(1);
      }
      
      override protected function deactivate() : void
      {
         if(§_-g1M§)
         {
            return;
         }
         super.deactivate();
         var _loc1_:Boolean = this.§_-e2j§ != null;
         this.§_-3t§();
         if(_loc1_)
         {
            this.hero.changeView(this.§_-iW§);
            this.§_-iW§.addEventListener(Event.COMPLETE,this.§_-c2F§);
            this.§_-iW§.gotoAndPlay(1);
         }
         else
         {
            this.hero.isStopped = false;
            this.hero.changeView();
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-S2I§.§_-Q1g§,§_-S2I§.§_-Aa§]);
      }
      
      override protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(§_-g1M§)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-S2I§.§_-Q1g§:
               if(param1[0] != this.§_-i2D§ || this.hero.id != param1[1] || !("2" in param1))
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
                  this.§_-33§(_loc2_);
               }
               else
               {
                  this.§_-WA§(_loc2_);
               }
               break;
            case §_-S2I§.§_-Aa§:
               if(Boolean(this.§_-131§) && Boolean(param1[0] == this.hero.id) && param1[1] == §_-h2B§.§_-BW§)
               {
                  this.§_-131§.§_-4j§(Hero.§_-517§);
                  if(Game.selfId == this.§_-131§.id)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
                  }
               }
               break;
            case §_-S2I§.§_-82J§:
               _loc3_ = param1[0];
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_ == this.hero.id)
                  {
                     this.§_-gt§();
                     this.active = false;
                     break;
                  }
                  if(Boolean(this.§_-131§) && _loc4_ == this.§_-131§.id)
                  {
                     if(this.§_-e2j§)
                     {
                        this.§_-e2j§.§_-W2g§();
                     }
                     this.§_-kl§();
                     break;
                  }
               }
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(this.hero.id != param1[1] || !this.§_-131§)
               {
                  return;
               }
               if(this.§_-131§.§_-426§)
               {
                  if(Game.selfId == this.§_-131§.id)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Vs§,0);
                  }
                  this.§_-131§.onHollow(param1[2]);
               }
               else
               {
                  this.§_-kl§();
               }
               break;
            case §_-S2I§.§_-F2m§:
            case §_-S2I§.§_-R28§:
               if(param1[0] == this.hero.id)
               {
                  this.§_-gt§();
                  this.active = false;
                  break;
               }
               if(Boolean(this.§_-131§) && param1[0] == this.§_-131§.id)
               {
                  if(this.§_-e2j§)
                  {
                     this.§_-e2j§.§_-W2g§();
                  }
                  this.§_-kl§(param1.type != §_-S2I§.§_-R28§);
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-a2G§(param1:MouseEvent) : void
      {
         if(!this.active || this.hero.id != Game.selfId || !this.§_-131§ || this.§_-131§.isDead || this.§_-131§.inHollow || this.hero.isDead)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,this.§_-131§.id,0);
      }
      
      private function §_-WA§(param1:Hero) : void
      {
         if(!this.§_-131§ || this.§_-131§ != param1)
         {
            return;
         }
         if(this.hero.behaviourController.getState(§_-O2m§) == null)
         {
            return;
         }
         this.hero.isStopped = true;
         (this.hero.behaviourController.getState(§_-O2m§) as §_-O2m§).§_-W2g§();
         (this.hero.heroView.viewAlternative as §_-73X§).§_-P2Z§ = true;
         (this.hero.heroView.viewAlternative as §_-73X§).armature.addEventListener(§_-Q24§.COMPLETE,this.§_-i1G§);
         (this.hero.heroView.viewAlternative as §_-73X§).armature.animation.gotoAndPlay(§_-n1n§);
      }
      
      private function §_-i1G§(param1:§_-Q24§) : void
      {
         this.hero.isStopped = false;
         this.§_-M1q§ = false;
         (this.hero.heroView.viewAlternative as §_-73X§).§_-P2Z§ = false;
         (this.hero.heroView.viewAlternative as §_-73X§).armature.removeEventListener(§_-Q24§.COMPLETE,this.§_-i1G§);
         (this.hero.heroView.viewAlternative as §_-73X§).armature.animation.gotoAndPlay(Hero.§_-01j§);
         if(!this.§_-131§)
         {
            return;
         }
         this.§_-131§.heroView.direction = this.hero.heroView.direction;
         this.§_-131§.teleportTo(new b2Vec2(this.hero.position.x + 10 * (this.hero.heroView.direction ? -1 : 1),this.hero.position.y - 2));
         this.§_-131§.rotation = this.hero.rotation;
         this.§_-kl§(false);
      }
      
      private function §_-33§(param1:Hero) : void
      {
         if(!param1 || this.§_-131§ != null)
         {
            return;
         }
         if(param1.shaman || param1.isDead || param1.inHollow)
         {
            return;
         }
         this.§_-131§ = param1;
         this.§_-jc§ = new §_-g9§(0,this.hero);
         this.§_-131§.behaviourController.§_-gz§(this.§_-jc§);
         if(this.§_-e2j§)
         {
            this.§_-e2j§.§_-12b§();
         }
      }
      
      private function §_-c2F§(param1:Event) : void
      {
         this.§_-iW§.removeEventListener(Event.COMPLETE,this.§_-c2F§);
         this.§_-iW§.stop();
         this.hero.isStopped = false;
         if(§_-g1M§)
         {
            return;
         }
         this.hero.changeView();
      }
      
      private function §_-A2V§(param1:Event) : void
      {
         this.§_-Lg§.removeEventListener(Event.COMPLETE,this.§_-A2V§);
         this.§_-Lg§.stop();
         if(§_-g1M§)
         {
            return;
         }
         this.§_-e2j§ = new §_-O2m§(0);
         this.hero.behaviourController.§_-gz§(this.§_-e2j§);
         if(this.§_-k1S§)
         {
            §_-O1M§.§_-82o§(this.§_-k1S§,gls("Бросок"),Keyboard.Y);
         }
         if(this.§_-131§)
         {
            this.§_-e2j§.§_-12b§();
         }
      }
      
      private function §_-R8§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(!(_loc1_.isSelf || _loc1_.isStopped || _loc1_.isHare || _loc1_.isDragon || _loc1_.shaman || _loc1_.inHollow || _loc1_.isSquirrel && _loc1_.perkController.§_-e4§(this.§_-i2D§) != -1 || _loc1_.behaviourController.getState(§_-b2w§) != null))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc1_.position);
               if(_loc2_.Length() <= §_-c1F§)
               {
                  this.§_-M1q§ = true;
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc1_.id,1);
                  break;
               }
            }
         }
      }
      
      private function §_-kl§(param1:Boolean = true) : void
      {
         this.§_-131§.behaviourController.removeState(this.§_-jc§);
         if(param1)
         {
            this.§_-131§.position = this.hero.position;
         }
         this.§_-131§ = null;
         this.§_-jc§ = null;
         if(this.§_-k1S§)
         {
            this.§_-k1S§.mouseEnabled = false;
         }
      }
      
      private function §_-gt§() : void
      {
         this.§_-3t§();
         this.hero.isStopped = false;
         this.hero.changeView();
      }
      
      private function §_-3t§() : void
      {
         var _loc1_:§_-73X§ = null;
         this.§_-M1q§ = false;
         if(this.§_-k1S§)
         {
            §_-O1M§.§_-q1z§(this.§_-k1S§);
         }
         if(this.§_-131§)
         {
            this.§_-kl§();
         }
         this.§_-Lg§.removeEventListener(Event.COMPLETE,this.§_-A2V§);
         this.§_-Lg§.stop();
         this.§_-iW§.removeEventListener(Event.COMPLETE,this.§_-c2F§);
         this.§_-iW§.stop();
         if(Boolean(this.hero.heroView.viewAlternative) && this.hero.heroView.viewAlternative is §_-73X§)
         {
            _loc1_ = this.hero.heroView.viewAlternative as §_-73X§;
            if(_loc1_.armature)
            {
               _loc1_.armature.removeEventListener(§_-Q24§.COMPLETE,this.§_-i1G§);
            }
            _loc1_.§_-P2Z§ = false;
         }
         if(this.§_-e2j§)
         {
            this.hero.behaviourController.removeState(this.§_-e2j§);
         }
         this.§_-e2j§ = null;
      }
   }
}


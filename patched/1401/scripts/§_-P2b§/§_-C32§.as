package §_-P2b§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-33r§.§_-C1Y§;
   import §_-33r§.§_-b0§;
   import §_-33r§.§_-b2w§;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-C32§ extends §_-H2N§
   {
      
      private static const §_-c1F§:Number = 4;
      
      private static const §_-Z1f§:int = 5;
      
      private var §_-v1H§:Object = {};
      
      private var §_-LE§:Object = {};
      
      private var §_-NH§:§_-C1Y§;
      
      private var §_-Lg§:§_-d2d§;
      
      private var §_-iW§:§_-d2d§;
      
      public function §_-C32§(param1:Hero)
      {
         super(param1);
         this.§_-Lg§ = new §_-d2d§(new BoarTransformIn());
         this.§_-Lg§.loop = false;
         this.§_-Lg§.stop();
         this.§_-iW§ = new §_-d2d§(new BoarTransformOut());
         this.§_-iW§.loop = false;
         this.§_-iW§.stop();
         this.§_-it§ = "boar_snort";
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
         if(!this.active || this.hero.id != Game.selfId || !this.hero.behaviourController.getState(§_-C1Y§))
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
         var _loc1_:Boolean = this.§_-NH§ != null;
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
         return super.packets.concat([§_-S2I§.§_-Q1g§]);
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
               if(param1[3] == 0)
               {
                  this.§_-k2j§(_loc2_);
               }
               else
               {
                  this.§_-33§(_loc2_,Math.max(0,int(param1[3]) - 1));
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
                  if(this.§_-v1H§[_loc4_])
                  {
                     this.§_-k2j§(this.hero.game.squirrels.get(_loc4_));
                     break;
                  }
               }
               break;
            case §_-S2I§.§_-Vs§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(param1[1] == this.hero.id)
               {
                  this.§_-gt§();
                  this.active = false;
                  break;
               }
               if(this.§_-v1H§[param1[1]])
               {
                  this.§_-k2j§(this.hero.game.squirrels.get(param1[1]));
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
               if(this.§_-v1H§[param1[0]])
               {
                  this.§_-k2j§(this.hero.game.squirrels.get(param1[0]));
               }
               break;
            default:
               super.§_-o2C§(param1);
         }
      }
      
      private function §_-33§(param1:Hero, param2:int) : void
      {
         delete this.§_-LE§[param1.id];
         if(!param1 || Boolean(this.§_-v1H§[param1.id]))
         {
            return;
         }
         if(param1.shaman || param1.isDead || param1.inHollow || param2 >= §_-Z1f§)
         {
            return;
         }
         var _loc3_:§_-b0§ = new §_-b0§(0,this.hero,param2);
         param1.behaviourController.§_-gz§(_loc3_);
         this.§_-v1H§[param1.id] = _loc3_;
      }
      
      private function §_-k2j§(param1:Hero) : void
      {
         if(!param1 || !this.§_-v1H§[param1.id])
         {
            return;
         }
         var _loc2_:§_-b0§ = this.§_-v1H§[param1.id] as §_-b0§;
         param1.behaviourController.removeState(_loc2_);
         delete this.§_-v1H§[param1.id];
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
         this.§_-NH§ = new §_-C1Y§(0);
         this.hero.behaviourController.§_-gz§(this.§_-NH§);
      }
      
      private function §_-R8§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         var _loc3_:int = 0;
         if(this.§_-D2u§() >= §_-Z1f§)
         {
            return;
         }
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(this.§_-D2u§() >= §_-Z1f§)
            {
               break;
            }
            if(!(Boolean(_loc1_.isSelf || _loc1_.isStopped || _loc1_.isHare || _loc1_.isDragon || _loc1_.shaman || _loc1_.inHollow || this.§_-v1H§[_loc1_.id] || this.§_-LE§[_loc1_.id] || _loc1_.isSquirrel && _loc1_.perkController.§_-e4§(this.§_-i2D§) != -1) || Boolean(_loc1_.behaviourController.getState(§_-b2w§) != null) || _loc1_.behaviourController.getState(§_-b0§) != null))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc1_.position);
               if(_loc2_.Length() <= §_-c1F§)
               {
                  _loc3_ = this.§_-D2u§();
                  this.§_-LE§[_loc1_.id] = true;
                  Connection.§_-Li§(§_-h2B§.§_-Q1g§,this.§_-i2D§,_loc1_.id,1 + _loc3_);
               }
            }
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
         var _loc1_:String = null;
         for(_loc1_ in this.§_-v1H§)
         {
            this.§_-k2j§(this.hero.game.squirrels.get(int(_loc1_)));
         }
         this.§_-LE§ = {};
         this.§_-Lg§.removeEventListener(Event.COMPLETE,this.§_-A2V§);
         this.§_-Lg§.stop();
         this.§_-iW§.removeEventListener(Event.COMPLETE,this.§_-c2F§);
         this.§_-iW§.stop();
         if(this.§_-NH§)
         {
            this.hero.behaviourController.removeState(this.§_-NH§);
         }
         this.§_-NH§ = null;
      }
      
      private function §_-D2u§() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in this.§_-v1H§)
         {
            _loc1_++;
         }
         for(_loc2_ in this.§_-LE§)
         {
            _loc1_++;
         }
         return _loc1_;
      }
   }
}


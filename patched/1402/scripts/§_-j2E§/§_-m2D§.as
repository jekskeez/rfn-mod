package §_-j2E§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-Cc§.§_-c1R§;
   import §_-Cc§.§_-f6§;
   import §_-Cc§.§_-r1n§;
   import §_-TK§.§_-f1u§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-m2D§ extends §_-92f§
   {
      
      private static const §_-A2L§:Number = 4;
      
      private static const §_-V1p§:int = 5;
      
      private var §_-fN§:Object = {};
      
      private var §_-i1r§:Object = {};
      
      private var §_-i9§:§_-r1n§;
      
      private var §_-N1l§:§_-f1u§;
      
      private var §_-F19§:§_-f1u§;
      
      public function §_-m2D§(param1:Hero)
      {
         super(param1);
         this.§_-N1l§ = new §_-f1u§(new BoarTransformIn());
         this.§_-N1l§.loop = false;
         this.§_-N1l§.stop();
         this.§_-F19§ = new §_-f1u§(new BoarTransformOut());
         this.§_-F19§.loop = false;
         this.§_-F19§.stop();
         this.§_-S2A§ = "boar_snort";
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
         if(!this.active || this.hero.id != Game.selfId || !this.hero.behaviourController.getState(§_-r1n§))
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
         var _loc1_:Boolean = this.§_-i9§ != null;
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
         return super.packets.concat([§_-s2l§.§_-u22§]);
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
               if(param1[3] == 0)
               {
                  this.§_-R12§(_loc2_);
               }
               else
               {
                  this.§_-42o§(_loc2_,Math.max(0,int(param1[3]) - 1));
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
                  if(this.§_-fN§[_loc4_])
                  {
                     this.§_-R12§(this.hero.game.squirrels.get(_loc4_));
                     break;
                  }
               }
               break;
            case §_-s2l§.§_-n1f§:
               if(param1[0] == 1)
               {
                  return;
               }
               if(param1[1] == this.hero.id)
               {
                  this.§_-VV§();
                  this.active = false;
                  break;
               }
               if(this.§_-fN§[param1[1]])
               {
                  this.§_-R12§(this.hero.game.squirrels.get(param1[1]));
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
               if(this.§_-fN§[param1[0]])
               {
                  this.§_-R12§(this.hero.game.squirrels.get(param1[0]));
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-42o§(param1:Hero, param2:int) : void
      {
         delete this.§_-i1r§[param1.id];
         if(!param1 || Boolean(this.§_-fN§[param1.id]))
         {
            return;
         }
         if(param1.shaman || param1.isDead || param1.inHollow || param2 >= §_-V1p§)
         {
            return;
         }
         var _loc3_:§_-c1R§ = new §_-c1R§(0,this.hero,param2);
         param1.behaviourController.§_-W10§(_loc3_);
         this.§_-fN§[param1.id] = _loc3_;
      }
      
      private function §_-R12§(param1:Hero) : void
      {
         if(!param1 || !this.§_-fN§[param1.id])
         {
            return;
         }
         var _loc2_:§_-c1R§ = this.§_-fN§[param1.id] as §_-c1R§;
         param1.behaviourController.removeState(_loc2_);
         delete this.§_-fN§[param1.id];
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
         this.§_-i9§ = new §_-r1n§(0);
         this.hero.behaviourController.§_-W10§(this.§_-i9§);
      }
      
      private function §_-n1n§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         var _loc3_:int = 0;
         if(this.§_-DX§() >= §_-V1p§)
         {
            return;
         }
         for each(_loc1_ in this.hero.game.squirrels.players)
         {
            if(this.§_-DX§() >= §_-V1p§)
            {
               break;
            }
            if(!(Boolean(_loc1_.isSelf || _loc1_.isStopped || _loc1_.isHare || _loc1_.isDragon || _loc1_.shaman || _loc1_.inHollow || this.§_-fN§[_loc1_.id] || this.§_-i1r§[_loc1_.id] || _loc1_.isSquirrel && _loc1_.perkController.§_-S1Q§(this.§_-T2a§) != -1) || Boolean(_loc1_.behaviourController.getState(§_-f6§) != null) || _loc1_.behaviourController.getState(§_-c1R§) != null))
            {
               _loc2_ = this.hero.position.Copy();
               _loc2_.Subtract(_loc1_.position);
               if(_loc2_.Length() <= §_-A2L§)
               {
                  _loc3_ = this.§_-DX§();
                  this.§_-i1r§[_loc1_.id] = true;
                  Connection.§_-e2T§(§_-u1O§.§_-u22§,this.§_-T2a§,_loc1_.id,1 + _loc3_);
               }
            }
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
         var _loc1_:String = null;
         for(_loc1_ in this.§_-fN§)
         {
            this.§_-R12§(this.hero.game.squirrels.get(int(_loc1_)));
         }
         this.§_-i1r§ = {};
         this.§_-N1l§.removeEventListener(Event.COMPLETE,this.§_-xw§);
         this.§_-N1l§.stop();
         this.§_-F19§.removeEventListener(Event.COMPLETE,this.§_-Z2V§);
         this.§_-F19§.stop();
         if(this.§_-i9§)
         {
            this.hero.behaviourController.removeState(this.§_-i9§);
         }
         this.§_-i9§ = null;
      }
      
      private function §_-DX§() : int
      {
         var _loc2_:String = null;
         var _loc1_:int = 0;
         for(_loc2_ in this.§_-fN§)
         {
            _loc1_++;
         }
         for(_loc2_ in this.§_-i1r§)
         {
            _loc1_++;
         }
         return _loc1_;
      }
   }
}


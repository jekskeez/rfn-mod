package §_-o10§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-22D§.TweenMax;
   import §_-61C§.§_-a2p§;
   import §_-X2V§.SquirrelEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-4§ extends §_-S2w§
   {
      
      private static const §_-A2L§:Number = 10;
      
      private static const §_-03P§:Number = 1;
      
      private var §_-L1m§:Number = 0;
      
      private var §_-c2B§:Array = [];
      
      private var §_-e1W§:int = 0;
      
      private var §_-H29§:Object = {};
      
      private var view:MovieClip = null;
      
      public function §_-4§(param1:Hero, param2:Array)
      {
         super(param1,param2);
         this.§_-T2a§ = §_-pl§.§_-py§;
      }
      
      override public function dispose() : void
      {
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-D3§);
            this.hero.removeEventListener(SquirrelEvent.§_-M15§,this.§_-D3§);
            this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-D3§);
         }
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-m1h§);
         }
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.hero.isSelf)
         {
            return;
         }
         if(§_-a2p§.§_-j2F§ != §_-s2l§.ROUND_START)
         {
            return;
         }
         this.§_-f1R§(param1);
      }
      
      override public function reset() : void
      {
         this.§_-c2B§.splice(0);
         super.reset();
      }
      
      override protected function activate() : void
      {
         if(!this.hero.game || this.hero.game.paused || this.hero.isDead || this.hero.inHollow)
         {
            this.active = false;
            return;
         }
         super.activate();
         this.hero.game.paused = true;
         this.hero.addEventListener(SquirrelEvent.§_-Z2N§,this.§_-D3§);
         this.hero.addEventListener(SquirrelEvent.§_-M15§,this.§_-D3§);
         this.hero.addEventListener(SquirrelEvent.§_-E25§,this.§_-D3§);
         this.view = new ChronosPerkView();
         this.view.addEventListener(Event.CHANGE,this.§_-m1h§);
         this.view.y = -Hero.§_-a1A§;
         this.hero.heroView.addChild(this.view);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         this.§_-c2B§.splice(0);
         if(this.hero)
         {
            this.hero.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-D3§);
            this.hero.removeEventListener(SquirrelEvent.§_-M15§,this.§_-D3§);
            this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-D3§);
            if(this.hero.game)
            {
               this.hero.game.paused = false;
            }
         }
         if(!this.view)
         {
            return;
         }
         this.view.removeEventListener(Event.CHANGE,this.§_-m1h§);
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§,§_-s2l§.§_-n1f§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         if(this.hero == null)
         {
            return;
         }
         switch(param1.type)
         {
            case §_-s2l§.§_-n1f§:
               if(param1[1] != this.hero.id)
               {
                  return;
               }
               this.active = false;
               return;
               break;
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if(!("timeMaster" in _loc2_))
               {
                  return;
               }
               if(!this.hero || _loc2_["timeMaster"][0] != this.hero.id)
               {
                  return;
               }
               if(!this.active)
               {
                  return;
               }
               this.§_-H29§ = {};
               this.§_-e1W§ = 0;
               this.§_-q1H§(_loc2_["timeMaster"][1]);
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-m1h§(param1:Event) : void
      {
         this.view.removeEventListener(Event.COMPLETE,this.§_-m1h§);
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
         this.§_-y2B§();
      }
      
      private function §_-f1R§(param1:Number) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Hero = null;
         if(Boolean(this.hero.game) && this.hero.game.paused)
         {
            return;
         }
         this.§_-L1m§ += param1;
         if(this.§_-L1m§ >= §_-03P§)
         {
            this.§_-L1m§ -= §_-03P§;
            if(this.§_-c2B§.length == §_-bx§())
            {
               this.§_-c2B§.shift();
            }
            _loc2_ = {};
            for each(_loc3_ in this.hero.game.squirrels.players)
            {
               if(Boolean(_loc3_) && !_loc3_.isDead)
               {
                  _loc2_[_loc3_.id] = {
                     "pos":_loc3_.position.Copy(),
                     "vel":_loc3_.velocity.Copy(),
                     "angle":_loc3_.angle
                  };
               }
            }
            this.§_-c2B§.push(_loc2_);
         }
      }
      
      private function §_-D3§(param1:SquirrelEvent) : void
      {
         this.active = false;
      }
      
      private function §_-y2B§() : void
      {
         if(this.§_-c2B§.length == 0)
         {
            this.deactivate();
         }
         if(this.hero.isSelf && this.§_-c2B§.length == 0 || !this.hero || !this.hero.game)
         {
            this.active = false;
            return;
         }
         if(!this.hero.isSelf)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"timeMaster":[this.hero.id,this.§_-c2B§.shift()]}));
      }
      
      private function §_-q1H§(param1:Object) : void
      {
         var _loc2_:Hero = null;
         for each(_loc2_ in this.hero.game.squirrels.players)
         {
            if(!(!this.§_-3M§(_loc2_) || !(_loc2_.id in param1)))
            {
               if(!(!this.§_-53U§ && _loc2_.id != this.hero.id))
               {
                  if(!(this.§_-53U§ && !this.§_-s1b§(_loc2_)))
                  {
                     ++this.§_-e1W§;
                     this.§_-H29§[_loc2_.id] = {
                        "pos":new b2Vec2(param1[_loc2_.id]["pos"].x,param1[_loc2_.id]["pos"].y),
                        "vel":new b2Vec2(param1[_loc2_.id]["vel"].x,param1[_loc2_.id]["vel"].y),
                        "angle":param1[_loc2_.id]["angle"]
                     };
                     TweenMax.to(_loc2_,1,{
                        "x":param1[_loc2_.id]["pos"].x * Game.§_-12A§,
                        "y":param1[_loc2_.id]["pos"].y * Game.§_-12A§,
                        "rotation":param1[_loc2_.id]["angle"] * Game.R2D,
                        "onComplete":this.§_-A2U§
                     });
                  }
               }
            }
         }
         if(this.§_-e1W§ == 0)
         {
            this.active = false;
         }
      }
      
      private function §_-A2U§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Hero = null;
         if(--this.§_-e1W§ != 0)
         {
            return;
         }
         if(Boolean(this.hero) && Boolean(this.hero.game) && Boolean(this.hero.game.squirrels.players))
         {
            for(_loc1_ in this.§_-H29§)
            {
               _loc2_ = this.hero.game.squirrels.get(int(_loc1_));
               if(this.§_-3M§(_loc2_))
               {
                  _loc2_.position = this.§_-H29§[_loc1_]["pos"];
                  _loc2_.velocity = this.§_-H29§[_loc1_]["vel"];
                  _loc2_.angle = this.§_-H29§[_loc1_]["angle"];
               }
            }
         }
         this.active = false;
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-K13§ && !param1.isDead && !param1.inHollow && !param1.hover;
      }
      
      private function §_-s1b§(param1:Hero) : Boolean
      {
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(param1.position);
         return _loc2_.Length() <= §_-A2L§;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 60;
      }
   }
}


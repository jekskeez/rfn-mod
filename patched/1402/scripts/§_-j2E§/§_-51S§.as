package §_-j2E§
{
   import §_-22D§.TweenMax;
   import flash.display.MovieClip;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-ke§;
   
   public class §_-51S§ extends §_-92f§
   {
      
      private var §_-e1W§:int = 0;
      
      private var §_-H29§:Object = {};
      
      private var view:MovieClip;
      
      public function §_-51S§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = §_-7d§;
      }
      
      override public function get switchable() : Boolean
      {
         return true;
      }
      
      override public function get canTurnOff() : Boolean
      {
         return false;
      }
      
      override public function get totalCooldown() : Number
      {
         return 30;
      }
      
      override public function get maxCountUse() : int
      {
         return 1;
      }
      
      override public function get available() : Boolean
      {
         return super.available && !this.hero.heroView.§_-52A§;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.view)
         {
            this.view.removeEventListener(Event.CHANGE,this.§_-C3R§);
         }
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
         this.view = new HatterPerkView();
         this.view.addEventListener(Event.CHANGE,this.§_-C3R§);
         this.view.y = -Hero.§_-a1A§;
         this.hero.heroView.addChild(this.view);
         if(!this.hero || !this.hero.game || this.hero.id != Game.selfId)
         {
            return;
         }
         this.§_-g1H§();
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(Boolean(this.hero) && Boolean(this.hero.game))
         {
            this.hero.game.paused = false;
         }
         if(!this.view)
         {
            return;
         }
         this.view.removeEventListener(Event.CHANGE,this.§_-C3R§);
         if(this.view.parent)
         {
            this.view.parent.removeChild(this.view);
         }
      }
      
      override protected function get packets() : Array
      {
         return super.packets.concat([§_-s2l§.§_-1q§]);
      }
      
      override protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Hero = null;
         var _loc6_:Hero = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if("hatterFail" in _loc2_)
               {
                  this.active = false;
                  return;
               }
               if(!("hatter" in _loc2_))
               {
                  return;
               }
               if(!this.hero || _loc2_["hatter"][0] != this.hero.id)
               {
                  return;
               }
               if(!this.active)
               {
                  return;
               }
               _loc3_ = _loc2_["hatter"][1];
               this.§_-e1W§ = _loc3_.length;
               this.§_-H29§ = {};
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc5_ = this.hero.game.squirrels.get(_loc3_[_loc4_][0]);
                  _loc6_ = this.hero.game.squirrels.get(_loc3_[_loc4_][1]);
                  if(!this.§_-3M§(_loc5_) || !this.§_-3M§(_loc6_))
                  {
                     --this.§_-e1W§;
                  }
                  else
                  {
                     this.§_-mX§(_loc5_,_loc6_);
                  }
                  _loc4_++;
               }
               if(this.§_-e1W§ == 0)
               {
                  this.active = false;
               }
               break;
            default:
               super.§_-x2f§(param1);
         }
      }
      
      private function §_-g1H§() : void
      {
         var _loc4_:Hero = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         for each(_loc4_ in this.hero.game.squirrels.players)
         {
            if(this.§_-3M§(_loc4_))
            {
               if(_loc4_.shaman)
               {
                  _loc1_.push(_loc4_);
               }
               else if(_loc4_.id != this.hero.id)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         if(_loc1_.length == 0)
         {
            _loc2_.push(this.hero);
         }
         else
         {
            _loc3_.push([this.hero.id,_loc1_[0].id]);
         }
         var _loc5_:int = int(_loc2_.length / 3);
         while(_loc2_.length > _loc5_)
         {
            _loc2_.splice(int(Math.random() * _loc2_.length),1);
         }
         if(_loc2_.length > 1)
         {
            _loc6_ = §_-ke§.§_-D1d§(1,_loc2_.length - 1);
            _loc7_ = 0;
            while(_loc7_ < _loc2_.length)
            {
               _loc3_.push([_loc2_[_loc7_].id,_loc2_[(_loc7_ + _loc6_) % _loc2_.length].id]);
               _loc7_++;
            }
         }
         if(_loc3_.length > 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"hatter":[this.hero.id,_loc3_]}));
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"hatterFail":true}));
         }
      }
      
      private function §_-mX§(param1:Hero, param2:Hero) : void
      {
         TweenMax.to(param1,1,{
            "x":param2.position.x * Game.§_-12A§,
            "y":param2.position.y * Game.§_-12A§,
            "onCompleteParams":[param1,param2],
            "onComplete":this.§_-A2U§
         });
      }
      
      private function §_-A2U§(param1:Hero, param2:Hero) : void
      {
         var _loc3_:String = null;
         var _loc4_:Hero = null;
         --this.§_-e1W§;
         if(this.§_-3M§(param1) && this.§_-3M§(param2))
         {
            this.§_-H29§[param1.id] = param2.position.Copy();
         }
         if(this.§_-e1W§ != 0)
         {
            return;
         }
         if(Boolean(this.hero) && Boolean(this.hero.game) && Boolean(this.hero.game.squirrels))
         {
            for(_loc3_ in this.§_-H29§)
            {
               _loc4_ = this.hero.game.squirrels.get(int(_loc3_));
               if(this.§_-3M§(_loc4_))
               {
                  _loc4_.position = this.§_-H29§[_loc3_];
               }
            }
         }
         this.active = false;
      }
      
      protected function §_-C3R§(param1:Event) : void
      {
         this.view.removeEventListener(Event.CHANGE,this.§_-C3R§);
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.parent.removeChild(this.view);
         }
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return param1 && param1.§_-K13§ && !param1.isDead && !param1.inHollow && !param1.hover;
      }
   }
}


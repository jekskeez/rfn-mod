package §_-Q2§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-8Q§.§_-7A§;
   import §_-F5§.§_-Y1d§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import §_-l2u§.§_-62b§;
   import §_-o10§.§_-pl§;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import game.mainGame.Cast;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-71b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-x12§ extends §_-7A§ implements §_-Y1d§, §_-71b§, §_-F1c§
   {
      
      private static const §_-w1v§:uint = 10;
      
      private static const §_-53q§:uint = 15;
      
      public var §_-w20§:Number;
      
      private var §_-42p§:Cast = null;
      
      private var §_-n2L§:§_-aS§ = null;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 0;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-K20§:Array = null;
      
      private var §_-D2x§:Object = {};
      
      private var buff:§_-Q2h§ = null;
      
      private var timer:Timer = new Timer(100,100);
      
      public function §_-x12§()
      {
         super();
         this.view = new §_-f1u§(new StormCloudImg());
         this.view.stop();
         this.view.§_-i18§();
         this.view.y = -60;
         §_-J2J§(this.view);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:Number = NaN;
         this.timer.delay = this.§_-w20§ / 100;
         this.§_-32u§ = true;
         super.build(param1);
         this.view.play();
         this.§_-n2L§ = new §_-aS§(new PerkRadius());
         this.§_-n2L§.scaleXY(§_-w1v§ * Game.§_-12A§ * 2 / this.§_-n2L§.width);
         §_-J2J§(this.§_-n2L§);
         this.§_-n2L§.§_-i18§();
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-K20§.length)
         {
            _loc3_ = this.§_-21H§.squirrels.get(this.§_-K20§[_loc2_]);
            if(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || _loc3_.id in this.§_-D2x§)
            {
               return;
            }
            _loc4_ = _loc3_.runSpeed * (§_-53q§ / 100);
            this.§_-D2x§[_loc3_.id] = _loc4_;
            _loc3_.runSpeed += _loc4_;
            _loc2_++;
         }
         this.§_-K20§.splice(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         this.removeFromParent();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         for(_loc1_ in this.§_-D2x§)
         {
            this.§_-42n§(int(_loc1_));
         }
         this.§_-D2x§ = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc3_:String = null;
         var _loc1_:Array = super.§_-m1Y§();
         var _loc2_:Array = [];
         for(_loc3_ in this.§_-D2x§)
         {
            _loc2_.push(int(_loc3_));
         }
         _loc1_.push([this.playerId,this.§_-w20§,this.aging,this.lifeTime,_loc2_]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1.pop();
         this.playerId = _loc2_[0];
         this.§_-w20§ = _loc2_[1];
         this.aging = Boolean(_loc2_[2]);
         this.lifeTime = _loc2_[3];
         this.§_-K20§ = _loc2_[4];
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-42p§.§_-B3f§ = 0;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-B3f§ = NaN;
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         super.update(param1);
         if(!this.aging || this.§_-C1L§ || !this.§_-32u§)
         {
            return;
         }
         this.§_-Q26§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
            return;
         }
         for each(_loc2_ in this.§_-21H§.squirrels.players)
         {
            if(this.§_-3M§(_loc2_))
            {
               _loc3_ = this.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() > §_-w1v§)
               {
                  if(!(!(_loc2_.id in this.§_-D2x§) || !_loc2_.isSelf))
                  {
                     this.timer.start();
                  }
               }
               else if(_loc2_.id in this.§_-D2x§ && _loc2_.isSelf)
               {
                  this.timer.reset();
                  this.buff.update(0);
               }
               else
               {
                  this.§_-Xs§(_loc2_.id);
               }
            }
         }
      }
      
      private function §_-Xs§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.boostSquirrel(param1);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"stormSquirrel":[this.id,param1]}));
         if(Hero.self)
         {
            Hero.self.sendLocation();
         }
      }
      
      private function §_-e18§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-21H§)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-u1L§(param1);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"resetStormSquirrel":[this.id,param1]}));
         if(Hero.self)
         {
            Hero.self.sendLocation();
         }
      }
      
      private function boostSquirrel(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.id in this.§_-D2x§)
         {
            return;
         }
         var _loc3_:Number = §_-53q§ / 100 * _loc2_.runSpeed;
         this.§_-D2x§[_loc2_.id] = _loc3_;
         _loc2_.runSpeed += _loc3_;
         if(!_loc2_.isSelf)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         if(!this.buff)
         {
            this.buff = new §_-Q2h§((new §_-pl§.perkData[§_-pl§.§_-e2z§]["buttonClass"]() as SimpleButton).upState,0.7,0.5,gls("Белка получила бонус скорости 15%."));
         }
         this.timer.reset();
         _loc2_.§_-W1T§(this.buff,this.timer);
      }
      
      private function §_-u1L§(param1:int) : void
      {
         this.§_-42n§(param1);
         delete this.§_-D2x§[param1];
      }
      
      private function §_-42n§(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || !_loc2_.§_-K13§ || !(_loc2_.id in this.§_-D2x§))
         {
            return;
         }
         _loc2_.runSpeed -= this.§_-D2x§[_loc2_.id];
         if(!_loc2_.isSelf)
         {
            return;
         }
         if(this.timer.running)
         {
            this.timer.reset();
         }
         if(this.buff)
         {
            _loc2_.removeBuff(this.buff,this.timer);
         }
         _loc2_.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(this.§_-21H§)
         {
            §_-21H§.map.§_-Y1E§(this,true);
         }
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-e18§(Hero.§_-M1O§);
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-e18§(param1["player"]["id"]);
      }
      
      private function §_-3M§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-K13§ || param1.isDead || param1.inHollow || param1.isHare || param1.isDragon) && (param1.shaman && param1.id == this.playerId || !param1.shaman);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("stormSquirrel" in _loc2_)
         {
            if(_loc2_["stormSquirrel"][0] != this.id)
            {
               return;
            }
            this.boostSquirrel(_loc2_["stormSquirrel"][1]);
         }
         if("resetStormSquirrel" in _loc2_)
         {
            if(_loc2_["resetStormSquirrel"][0] != this.id)
            {
               return;
            }
            this.§_-u1L§(_loc2_["resetStormSquirrel"][1]);
         }
      }
   }
}


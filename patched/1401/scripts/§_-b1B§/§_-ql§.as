package §_-b1B§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-637§.§_-Ft§;
   import §_-83V§.§_-e2B§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-T1r§.§_-03i§;
   import §_-vK§.§_-QC§;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import game.mainGame.Cast;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-Q2k§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-ql§ extends §_-e2B§ implements §_-Ft§, §_-Q2k§, §_-Tm§
   {
      
      private static const §_-O1N§:uint = 10;
      
      private static const §_-s2W§:uint = 15;
      
      public var §_-y1K§:Number;
      
      private var §_-Mf§:Cast = null;
      
      private var §_-VQ§:§_-h2I§ = null;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 0;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-eL§:Array = null;
      
      private var §_-xP§:Object = {};
      
      private var buff:§_-03i§ = null;
      
      private var timer:Timer = new Timer(100,100);
      
      public function §_-ql§()
      {
         super();
         this.view = new §_-d2d§(new StormCloudImg());
         this.view.stop();
         this.view.§_-x2x§();
         this.view.y = -60;
         §_-83v§(this.view);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         var _loc4_:Number = NaN;
         this.timer.delay = this.§_-y1K§ / 100;
         this.§_-m1I§ = true;
         super.build(param1);
         this.view.play();
         this.§_-VQ§ = new §_-h2I§(new PerkRadius());
         this.§_-VQ§.scaleXY(§_-O1N§ * Game.§_-x2P§ * 2 / this.§_-VQ§.width);
         §_-83v§(this.§_-VQ§);
         this.§_-VQ§.§_-x2x§();
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-eL§.length)
         {
            _loc3_ = this.§_-H2D§.squirrels.get(this.§_-eL§[_loc2_]);
            if(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || _loc3_.id in this.§_-xP§)
            {
               return;
            }
            _loc4_ = _loc3_.runSpeed * (§_-s2W§ / 100);
            this.§_-xP§[_loc3_.id] = _loc4_;
            _loc3_.runSpeed += _loc4_;
            _loc2_++;
         }
         this.§_-eL§.splice(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         this.removeFromParent();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         for(_loc1_ in this.§_-xP§)
         {
            this.§_-u1u§(int(_loc1_));
         }
         this.§_-xP§ = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc3_:String = null;
         var _loc1_:Array = super.§_-A1X§();
         var _loc2_:Array = [];
         for(_loc3_ in this.§_-xP§)
         {
            _loc2_.push(int(_loc3_));
         }
         _loc1_.push([this.playerId,this.§_-y1K§,this.aging,this.lifeTime,_loc2_]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1.pop();
         this.playerId = _loc2_[0];
         this.§_-y1K§ = _loc2_[1];
         this.aging = Boolean(_loc2_[2]);
         this.lifeTime = _loc2_[3];
         this.§_-eL§ = _loc2_[4];
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Mf§.§_-R1d§ = 0;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-R1d§ = NaN;
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         super.update(param1);
         if(!this.aging || this.§_-01O§ || !this.§_-m1I§)
         {
            return;
         }
         this.§_-C2o§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
            return;
         }
         for each(_loc2_ in this.§_-H2D§.squirrels.players)
         {
            if(this.§_-qu§(_loc2_))
            {
               _loc3_ = this.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() > §_-O1N§)
               {
                  if(!(!(_loc2_.id in this.§_-xP§) || !_loc2_.isSelf))
                  {
                     this.timer.start();
                  }
               }
               else if(_loc2_.id in this.§_-xP§ && _loc2_.isSelf)
               {
                  this.timer.reset();
                  this.buff.update(0);
               }
               else
               {
                  this.§_-Ul§(_loc2_.id);
               }
            }
         }
      }
      
      private function §_-Ul§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.boostSquirrel(param1);
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"stormSquirrel":[this.id,param1]}));
         if(Hero.self)
         {
            Hero.self.sendLocation();
         }
      }
      
      private function §_-R2c§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-H2D§)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-w2f§(param1);
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"resetStormSquirrel":[this.id,param1]}));
         if(Hero.self)
         {
            Hero.self.sendLocation();
         }
      }
      
      private function boostSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.id in this.§_-xP§)
         {
            return;
         }
         var _loc3_:Number = §_-s2W§ / 100 * _loc2_.runSpeed;
         this.§_-xP§[_loc2_.id] = _loc3_;
         _loc2_.runSpeed += _loc3_;
         if(!_loc2_.isSelf)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         if(!this.buff)
         {
            this.buff = new §_-03i§((new §_-QC§.perkData[§_-QC§.§_-93§]["buttonClass"]() as SimpleButton).upState,0.7,0.5,gls("Белка получила бонус скорости 15%."));
         }
         this.timer.reset();
         _loc2_.§_-Aj§(this.buff,this.timer);
      }
      
      private function §_-w2f§(param1:int) : void
      {
         this.§_-u1u§(param1);
         delete this.§_-xP§[param1];
      }
      
      private function §_-u1u§(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || !_loc2_.§_-k2W§ || !(_loc2_.id in this.§_-xP§))
         {
            return;
         }
         _loc2_.runSpeed -= this.§_-xP§[_loc2_.id];
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
         _loc2_.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(this.§_-H2D§)
         {
            §_-H2D§.map.§_-Qc§(this,true);
         }
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-R2c§(Hero.§_-74§);
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-R2c§(param1["player"]["id"]);
      }
      
      private function §_-qu§(param1:Hero) : Boolean
      {
         return !(!param1 || !param1.§_-k2W§ || param1.isDead || param1.inHollow || param1.isHare || param1.isDragon) && (param1.shaman && param1.id == this.playerId || !param1.shaman);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
            this.§_-w2f§(_loc2_["resetStormSquirrel"][1]);
         }
      }
   }
}


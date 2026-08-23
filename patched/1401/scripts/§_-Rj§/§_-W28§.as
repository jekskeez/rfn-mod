package §_-Rj§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-1§.§_-tY§;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.§_-f24§;
   import §_-B1O§.§_-rJ§;
   import §_-F1E§.§_-41e§;
   import §_-Q1P§.§_-V10§;
   import §_-Q1P§.§_-zW§;
   import §_-S1D§.§_-O1M§;
   import §_-T2y§.§_-P1Y§;
   import §_-X1Q§.§_-O6§;
   import §_-Y29§.§_-nJ§;
   import §_-rT§.§_-h1g§;
   import §_-s2l§.ControllerHeroLocal;
   import §_-s2l§.ControllerHeroRemote;
   import §_-s2l§.§_-z2c§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-W28§ extends SquirrelCollection
   {
      
      private static const §_-s1y§:int = -13;
      
      private static const §_-61K§:int = -45;
      
      private var §_-W1Y§:int;
      
      private var controller:§_-z2c§;
      
      private var arrow:MovieClip;
      
      public function §_-W28§()
      {
         super();
         this.arrow = new ArrowMovie();
         this.arrow.rotation = -90;
         this.arrow.x = §_-s1y§;
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§,false,0,true);
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         var _loc2_:Hero = get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-y2G§,false,0,true);
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-P2v§,false,0,true);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.self) && this.self.inHollow)
         {
            this.next();
         }
         if(!contains(this.arrow))
         {
            addChild(this.arrow);
         }
         var _loc2_:Hero = this.self;
         this.arrow.visible = _loc2_ != null;
         if(!_loc2_)
         {
            return;
         }
         this.arrow.x = _loc2_.x + §_-s1y§;
         this.arrow.y = _loc2_.y + §_-61K§;
      }
      
      override public function get isSynchronizing() : Boolean
      {
         return true;
      }
      
      override public function place() : void
      {
         this.§_-p2m§(GameMap.instance.get(§_-f24§));
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-W1t§();
      }
      
      override public function clear() : void
      {
         this.selfHeroId = 0;
         super.clear();
      }
      
      public function §_-Qa§(param1:int, param2:§_-zW§) : void
      {
      }
      
      public function §_-z2l§() : void
      {
      }
      
      public function §_-e1I§() : void
      {
         var _loc1_:int = -1;
         _loc1_ = this.§_-v2Q§(_loc1_);
         _loc1_ = this.§_-Fs§(_loc1_);
         this.§_-f2J§(_loc1_);
      }
      
      protected function §_-v2Q§(param1:int) : int
      {
         var _loc3_:Hero = null;
         var _loc2_:Object = §_-q1p§.§_-m15§[this.§_-l26§.§_-Z1G§];
         if(GameMap.instance.§_-2S§(§_-rJ§) && Boolean(_loc2_["shamanButton"]))
         {
            _loc3_ = get(param1);
            _loc3_.position = GameMap.instance.get(§_-rJ§)[0].position;
            §_-B1q§([param1--]);
         }
         return param1;
      }
      
      protected function §_-Fs§(param1:int) : int
      {
         return param1;
      }
      
      public function get selfHeroId() : int
      {
         return this.§_-W1Y§;
      }
      
      public function set selfHeroId(param1:int) : void
      {
         if(this.controller)
         {
            this.controller.remove();
         }
         var _loc2_:Hero = this.players[param1];
         if(_loc2_)
         {
            this.controller = §_-V10§.§_-c0§.§_-A3w§ ? new ControllerHeroRemote(_loc2_,§_-41e§.§_-C28§) : new ControllerHeroLocal(_loc2_);
         }
         var _loc3_:Hero = get(this.§_-W1Y§);
         if(_loc3_)
         {
            _loc3_.§_-Yn§(false);
            _loc3_.§_-71x§();
            if(SquirrelGame.instance.cast)
            {
               SquirrelGame.instance.cast.castObject = null;
            }
         }
         this.§_-W1Y§ = param1;
         §_-O1M§.hero = this.self;
         if(!this.self)
         {
            return;
         }
         this.self.perkController.§_-j22§();
         §_-O6§.hero = this.self;
         §_-nJ§.hero = this.self;
         §_-h1g§.hero = this.self;
         Hero.self = this.self;
         addChild(Hero.self);
         §_-83v§(Hero.self);
      }
      
      public function next() : void
      {
         var _loc4_:Hero = null;
         var _loc1_:Array = §_-f12§();
         _loc1_.sort();
         var _loc2_:int = _loc1_.indexOf(this.selfHeroId) + 1;
         var _loc3_:int = _loc2_;
         while(_loc3_ < _loc2_ + _loc1_.length)
         {
            _loc4_ = get(_loc1_[_loc3_ % _loc1_.length]);
            if(!(_loc4_.isDead || _loc4_.inHollow))
            {
               this.selfHeroId = _loc1_[_loc3_ % _loc1_.length];
               break;
            }
            _loc3_++;
         }
      }
      
      public function get self() : Hero
      {
         return this.players[this.selfHeroId];
      }
      
      public function §_-NJ§() : int
      {
         var _loc1_:int = this.§_-yo§();
         return GameMap.instance.§_-2S§(§_-f24§) ? int(this.§_-l26§.§_-Sv§.§_-I1y§ + _loc1_) : _loc1_;
      }
      
      override protected function §_-T1T§(param1:int) : void
      {
      }
      
      override protected function §_-y2G§(param1:SquirrelEvent = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Hero = null;
         var _loc5_:Hero = null;
         if(§_-tY§.§_-Yi§ in §_-P1Y§.§_-Vx§)
         {
            return;
         }
         super.§_-y2G§();
         var _loc2_:Hero = param1 ? param1.player as Hero : null;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.shaman)
         {
            _loc3_ = [];
            for each(_loc4_ in this.players)
            {
               if(!(_loc4_.inHollow || _loc4_.isDead || _loc4_.shaman || _loc4_.isHare))
               {
                  if(!(_loc2_.team != Hero.§_-JL§ && _loc4_.team != _loc2_.team && _loc4_.team != Hero.§_-JL§))
                  {
                     _loc3_.push(_loc4_);
                  }
               }
            }
            if(_loc3_.length > 0)
            {
               _loc5_ = _loc3_[int(Math.random() * _loc3_.length)];
               _loc2_.shaman = false;
               _loc5_.team = _loc2_.team;
               §_-B1q§([_loc5_.id],false);
            }
         }
         if(_loc2_.id == this.selfHeroId)
         {
            this.next();
         }
      }
      
      protected function §_-81G§() : Boolean
      {
         return this.§_-l26§.§_-Sv§.§_-T2t§ && §_-q1p§.§_-4N§(this.§_-l26§.§_-Z1G§);
      }
      
      protected function §_-A3x§() : Boolean
      {
         return this.§_-l26§.§_-Sv§.§_-R2k§ && §_-q1p§.§_-xI§(this.§_-l26§.§_-Z1G§,this.§_-l26§.§_-02I§);
      }
      
      protected function §_-yo§() : int
      {
         var _loc1_:Object = §_-q1p§.§_-m15§[this.§_-l26§.§_-Z1G§];
         if(!_loc1_)
         {
            return 0;
         }
         var _loc2_:int = 0;
         if(GameMap.instance.§_-2S§(§_-rJ§) && Boolean(_loc1_["shamanButton"]))
         {
            _loc2_++;
         }
         _loc2_ += this.§_-F2v§();
         if(this.§_-81G§())
         {
            _loc2_++;
         }
         if(this.§_-A3x§())
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      protected function §_-F2v§() : int
      {
         return 0;
      }
      
      protected function §_-f2J§(param1:int) : void
      {
         if(this.§_-81G§())
         {
            §_-GM§([param1--]);
         }
         if(this.§_-A3x§())
         {
            §_-M13§([param1--]);
         }
      }
      
      protected function §_-p2m§(param1:Array) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:Hero = null;
         if(param1.length == 0)
         {
            _loc3_ = this.§_-u1O§();
            if(_loc3_)
            {
               for each(_loc4_ in this.players)
               {
                  if(!_loc4_.shaman)
                  {
                     _loc4_.position = _loc3_;
                  }
               }
            }
            return;
         }
         var _loc2_:int = 0;
         for each(_loc4_ in this.players)
         {
            if(!_loc4_.shaman)
            {
               _loc4_.position = §_-63Q§(param1[_loc2_]).position;
               _loc2_ = (_loc2_ + 1) % param1.length;
            }
         }
      }
      
      protected function get §_-l26§() : §_-A32§
      {
         return SquirrelGame.instance as §_-A32§;
      }
      
      protected function §_-u1O§() : b2Vec2
      {
         var _loc1_:Hero = null;
         var _loc2_:Array = null;
         for each(_loc1_ in this.players)
         {
            if(_loc1_.shaman)
            {
               return _loc1_.position;
            }
         }
         _loc2_ = GameMap.instance.get(§_-rJ§);
         return _loc2_.length > 0 ? §_-63Q§(_loc2_[0]).position : null;
      }
      
      private function §_-W1t§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:Sprite = null;
         for each(_loc1_ in this.players)
         {
            _loc2_ = new Sprite();
            _loc2_.graphics.beginFill(16730405,0);
            _loc2_.graphics.drawRect(-23,-30,46,50);
            _loc2_.graphics.endFill();
            _loc1_.mouseChildren = false;
            _loc1_.hitArea = _loc2_;
            _loc1_.addChild(_loc2_);
         }
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            this.next();
         }
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         var _loc2_:Hero = param1.currentTarget as Hero;
         if(!_loc2_ || _loc2_.isDead || this.selfHeroId == _loc2_.id)
         {
            return;
         }
         this.selfHeroId = _loc2_.id;
      }
   }
}


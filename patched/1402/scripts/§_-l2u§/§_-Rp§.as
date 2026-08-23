package §_-l2u§
{
   import Box2D.Common.Math.b2Vec2;
   import §_-5P§.§_-Z1f§;
   import §_-61C§.§_-a2p§;
   import §_-G2y§.ControllerHeroLocal;
   import §_-G2y§.ControllerHeroRemote;
   import §_-G2y§.§_-53o§;
   import §_-P2Y§.§_-dn§;
   import §_-TN§.§_-cS§;
   import §_-X2V§.SquirrelEvent;
   import §_-ZL§.§_-3H§;
   import §_-ZL§.§_-g2m§;
   import §_-c2C§.§_-H1k§;
   import §_-j2H§.§_-62Y§;
   import §_-j2H§.§_-x2h§;
   import §_-v2M§.§_-A3f§;
   import §_-vz§.§_-r20§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelCollection;
   import game.mainGame.SquirrelGame;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-Rp§ extends SquirrelCollection
   {
      
      private static const §_-42s§:int = -13;
      
      private static const §_-Ko§:int = -45;
      
      private var §_-no§:int;
      
      private var controller:§_-53o§;
      
      private var arrow:MovieClip;
      
      public function §_-Rp§()
      {
         super();
         this.arrow = new ArrowMovie();
         this.arrow.rotation = -90;
         this.arrow.x = §_-42s§;
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§,false,0,true);
      }
      
      override public function add(param1:int) : void
      {
         super.add(param1);
         var _loc2_:Hero = get(param1);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-43r§,false,0,true);
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-H1h§,false,0,true);
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
         this.arrow.x = _loc2_.x + §_-42s§;
         this.arrow.y = _loc2_.y + §_-Ko§;
      }
      
      override public function get isSynchronizing() : Boolean
      {
         return true;
      }
      
      override public function place() : void
      {
         this.§_-F1G§(GameMap.instance.get(§_-x2h§));
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-E27§();
      }
      
      override public function clear() : void
      {
         this.selfHeroId = 0;
         super.clear();
      }
      
      public function §_-R10§(param1:int, param2:§_-g2m§) : void
      {
      }
      
      public function §_-y1S§() : void
      {
      }
      
      public function §_-V25§() : void
      {
         var _loc1_:int = -1;
         _loc1_ = this.§_-Ba§(_loc1_);
         _loc1_ = this.§_-o2o§(_loc1_);
         this.§_-A3P§(_loc1_);
      }
      
      protected function §_-Ba§(param1:int) : int
      {
         var _loc3_:Hero = null;
         var _loc2_:Object = §_-at§.§_-02X§[this.§_-E1v§.§_-H2E§];
         if(GameMap.instance.§_-FS§(§_-62Y§) && Boolean(_loc2_["shamanButton"]))
         {
            _loc3_ = get(param1);
            _loc3_.position = GameMap.instance.get(§_-62Y§)[0].position;
            §_-J1N§([param1--]);
         }
         return param1;
      }
      
      protected function §_-o2o§(param1:int) : int
      {
         return param1;
      }
      
      public function get selfHeroId() : int
      {
         return this.§_-no§;
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
            this.controller = §_-3H§.§_-rD§.§_-hY§ ? new ControllerHeroRemote(_loc2_,§_-A3f§.§_-73z§) : new ControllerHeroLocal(_loc2_);
         }
         var _loc3_:Hero = get(this.§_-no§);
         if(_loc3_)
         {
            _loc3_.§_-C2u§(false);
            _loc3_.§_-NI§();
            if(SquirrelGame.instance.cast)
            {
               SquirrelGame.instance.cast.castObject = null;
            }
         }
         this.§_-no§ = param1;
         §_-a2p§.hero = this.self;
         if(!this.self)
         {
            return;
         }
         this.self.perkController.§_-m2b§();
         §_-dn§.hero = this.self;
         §_-cS§.hero = this.self;
         §_-r20§.hero = this.self;
         Hero.self = this.self;
         addChild(Hero.self);
         §_-J2J§(Hero.self);
      }
      
      public function next() : void
      {
         var _loc4_:Hero = null;
         var _loc1_:Array = §_-n2K§();
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
      
      public function §_-A3b§() : int
      {
         var _loc1_:int = this.§_-01g§();
         return GameMap.instance.§_-FS§(§_-x2h§) ? int(this.§_-E1v§.§_-LL§.§_-e1W§ + _loc1_) : _loc1_;
      }
      
      override protected function §_-21b§(param1:int) : void
      {
      }
      
      override protected function §_-43r§(param1:SquirrelEvent = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Hero = null;
         var _loc5_:Hero = null;
         if(§_-Z1f§.§_-q1E§ in §_-H1k§.§_-t1y§)
         {
            return;
         }
         super.§_-43r§();
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
                  if(!(_loc2_.team != Hero.§_-PM§ && _loc4_.team != _loc2_.team && _loc4_.team != Hero.§_-PM§))
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
               §_-J1N§([_loc5_.id],false);
            }
         }
         if(_loc2_.id == this.selfHeroId)
         {
            this.next();
         }
      }
      
      protected function §_-jZ§() : Boolean
      {
         return this.§_-E1v§.§_-LL§.§_-v1a§ && §_-at§.§_-N2l§(this.§_-E1v§.§_-H2E§);
      }
      
      protected function §_-V1w§() : Boolean
      {
         return this.§_-E1v§.§_-LL§.§_-Ya§ && §_-at§.§_-y1P§(this.§_-E1v§.§_-H2E§,this.§_-E1v§.§_-YH§);
      }
      
      protected function §_-01g§() : int
      {
         var _loc1_:Object = §_-at§.§_-02X§[this.§_-E1v§.§_-H2E§];
         if(!_loc1_)
         {
            return 0;
         }
         var _loc2_:int = 0;
         if(GameMap.instance.§_-FS§(§_-62Y§) && Boolean(_loc1_["shamanButton"]))
         {
            _loc2_++;
         }
         _loc2_ += this.§_-9v§();
         if(this.§_-jZ§())
         {
            _loc2_++;
         }
         if(this.§_-V1w§())
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      protected function §_-9v§() : int
      {
         return 0;
      }
      
      protected function §_-A3P§(param1:int) : void
      {
         if(this.§_-jZ§())
         {
            §_-8r§([param1--]);
         }
         if(this.§_-V1w§())
         {
            §_-Jg§([param1--]);
         }
      }
      
      protected function §_-F1G§(param1:Array) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc4_:Hero = null;
         if(param1.length == 0)
         {
            _loc3_ = this.§_-iX§();
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
               _loc4_.position = §_-xn§(param1[_loc2_]).position;
               _loc2_ = (_loc2_ + 1) % param1.length;
            }
         }
      }
      
      protected function get §_-E1v§() : §_-62b§
      {
         return SquirrelGame.instance as §_-62b§;
      }
      
      protected function §_-iX§() : b2Vec2
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
         _loc2_ = GameMap.instance.get(§_-62Y§);
         return _loc2_.length > 0 ? §_-xn§(_loc2_[0]).position : null;
      }
      
      private function §_-E27§() : void
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
      
      private function §_-73S§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            this.next();
         }
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
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


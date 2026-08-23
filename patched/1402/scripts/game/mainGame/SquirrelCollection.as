package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import §_-G2y§.ControllerHeroLocal;
   import §_-M16§.§_-8M§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-u24§;
   import §_-j2H§.§_-Jb§;
   import §_-j2H§.§_-Y2n§;
   import chat.§_-g1j§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-33I§;
   import utils.§_-d1t§;
   
   public class SquirrelCollection extends §_-aS§ implements §_-F1c§
   {
      
      private static const §_-p1N§:int = 5000;
      
      private static var _instance:SquirrelCollection = null;
      
      protected var §_-UY§:int;
      
      protected var §_-h2Y§:Timer = new Timer(§_-p1N§);
      
      public var §_-71Y§:Class = Hero;
      
      public var players:Object = {};
      
      public var §_-o1w§:Boolean = false;
      
      public function SquirrelCollection()
      {
         _instance = this;
         §_-p2U§.add("SquirrelCollection.SquirrelCollection");
         §_-d1t§.§_-B12§(this);
         super();
         this.§_-h2Y§.addEventListener(TimerEvent.TIMER,this.§_-R2o§);
         this.§_-h2Y§.reset();
         Hero.§_-K2a§([SquirrelEvent.§_-E25§],this.§_-43r§);
      }
      
      public static function get instance() : SquirrelCollection
      {
         return _instance;
      }
      
      public function §_-I26§(param1:Boolean = true) : void
      {
      }
      
      public function round(param1:Array) : void
      {
      }
      
      protected function §_-R2o§(param1:TimerEvent = null) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-22R§);
      }
      
      public function dispose() : void
      {
         §_-p2U§.add("SquirrelCollection.dispose");
         Hero.forget(this.§_-43r§);
         this.§_-h2Y§.stop();
         this.§_-h2Y§.removeEventListener(TimerEvent.TIMER,this.§_-R2o§);
         this.§_-h2Y§ = null;
         §_-d1t§.§_-xx§(this);
         this.clear();
         if(_instance == this)
         {
            _instance = null;
         }
      }
      
      public function set(param1:Array) : void
      {
         this.clear();
         if(param1.length == 0)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.add(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function §_-n2K§() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.players)
         {
            _loc1_.push(parseInt(_loc2_));
         }
         return _loc1_;
      }
      
      public function add(param1:int) : void
      {
         if(!Game.toggle)
         {
            if(Game.activated)
            {
               if(param1 != Game.selfId)
               {
                  if(Game.getPlayer(param1) != null)
                  {
                     if(§_-33I§.§_-V1O§(Game.getPlayer(param1).rights,§_-33I§.§_-AJ§))
                     {
                        §_-u24§.§_-x2I§();
                        return;
                     }
                  }
               }
            }
         }
         if(!Game.toggle)
         {
            if(!SquirrelGame.instance || !this.players || param1 in this.players)
            {
               return;
            }
            §_-p2U§.add("SquirrelCollection.add: " + param1);
            this.players[param1] = new this.§_-71Y§(param1,SquirrelGame.instance.world,0,0);
            if(Boolean(SquirrelGame.instance) && Boolean(SquirrelGame.instance.§_-Qd§))
            {
               SquirrelGame.instance.§_-Qd§.§_-a1K§(this.players[param1]);
            }
            SquirrelGame.instance.§_-O1C§.addObject(this.players[param1]);
            §_-J2J§(this.players[param1]);
            addChild(this.players[param1]);
            if(Boolean(Game.selfId) && Game.selfId in this.players)
            {
               addChild(this.players[Game.selfId]);
               §_-J2J§(this.players[Game.selfId]);
            }
            this.§_-21b§(param1);
            if(Game.selfId != 0)
            {
               if(param1 != Game.selfId)
               {
                  §_-u24§.sendMessage(param1,gls("Твой друг {0} присоединился к игре.",this.players[param1].playerName),§_-g1j§.§_-j1p§);
               }
            }
            return;
         }
         if(!SquirrelGame.instance || !this.players || param1 in this.players)
         {
            return;
         }
         §_-p2U§.add("SquirrelCollection.add: " + param1);
         this.players[param1] = new this.§_-71Y§(param1,SquirrelGame.instance.world,0,0);
         if(Boolean(SquirrelGame.instance) && Boolean(SquirrelGame.instance.§_-Qd§))
         {
            SquirrelGame.instance.§_-Qd§.§_-a1K§(this.players[param1]);
         }
         SquirrelGame.instance.§_-O1C§.addObject(this.players[param1]);
         §_-J2J§(this.players[param1]);
         addChild(this.players[param1]);
         if(Boolean(Game.selfId) && Game.selfId in this.players)
         {
            addChild(this.players[Game.selfId]);
            §_-J2J§(this.players[Game.selfId]);
         }
         this.§_-21b§(param1);
      }
      
      public function show() : void
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.players)
         {
            _loc1_.show();
         }
      }
      
      public function reset() : void
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.players)
         {
            _loc1_.reset();
         }
      }
      
      public function hide() : void
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.players)
         {
            _loc1_.hide();
         }
      }
      
      public function remove(param1:int) : void
      {
         var _loc2_:Hero = this.get(param1);
         if(_loc2_ == null)
         {
            return;
         }
         §_-p2U§.add("SquirrelCollection.remove " + param1);
         SquirrelGame.instance.§_-Qd§.remove(_loc2_);
         SquirrelGame.instance.§_-O1C§.removeObject(_loc2_);
         _loc2_.remove();
         if(contains(_loc2_))
         {
            removeChild(_loc2_);
         }
         if(§_-U2E§(_loc2_))
         {
            removeChildStarling(_loc2_);
         }
         delete this.players[param1];
      }
      
      public function get count() : int
      {
         var _loc2_:Hero = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.players)
         {
            if(_loc2_ != null)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get isSynchronizing() : Boolean
      {
         return Game.selfId == this.§_-UY§;
      }
      
      public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:int = 0;
         var _loc1_:Vector.<b2Vec2> = GameMap.instance.§_-q2L§;
         var _loc2_:* = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in this.players)
         {
            _loc3_.push(_loc4_);
         }
         _loc3_.sort(this.§_-OC§);
         if(_loc1_.length != 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               _loc4_ = _loc3_[_loc5_];
               if(!_loc4_.shaman)
               {
                  _loc4_.position = _loc1_[_loc2_++];
                  if(_loc2_ == _loc1_.length)
                  {
                     _loc2_ = 0;
                  }
               }
               _loc5_++;
            }
         }
         _loc1_ = GameMap.instance.§_-02q§;
         _loc2_ = 0;
         if(_loc1_.length != 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               _loc4_ = _loc3_[_loc5_];
               if(_loc4_.shaman)
               {
                  _loc4_.position = _loc1_[_loc2_++];
                  if(_loc2_ == _loc1_.length)
                  {
                     _loc2_ = 0;
                  }
               }
               _loc5_++;
            }
         }
      }
      
      public function §_-u12§(param1:int, param2:int) : b2Vec2
      {
         var _loc4_:Hero = null;
         var _loc3_:b2Vec2 = null;
         switch(param2)
         {
            case Hero.§_-PM§:
               for each(_loc4_ in this.players)
               {
                  if(!(!_loc4_.shaman || _loc4_.isDead || _loc4_.id == param1 || this.§_-n22§(_loc4_)))
                  {
                     _loc3_ = _loc4_.position;
                  }
               }
               if(_loc3_ == null && GameMap.instance.§_-q2L§.length > 0)
               {
                  _loc3_ = GameMap.instance.§_-q2L§[0];
               }
               break;
            case Hero.§_-i1Y§:
               for each(_loc4_ in this.players)
               {
                  if(!(!_loc4_.shaman || _loc4_.isDead || _loc4_.id == param1 || _loc4_.team != Hero.§_-i1Y§ || this.§_-n22§(_loc4_)))
                  {
                     _loc3_ = _loc4_.position;
                  }
               }
               if(_loc3_ == null && GameMap.instance.get(§_-Jb§).length > 0)
               {
                  _loc3_ = (GameMap.instance.get(§_-Jb§)[0] as §_-xn§).position;
               }
               break;
            case Hero.§_-l1B§:
               for each(_loc4_ in this.players)
               {
                  if(!(!_loc4_.shaman || _loc4_.isDead || _loc4_.id == param1 || _loc4_.team != Hero.§_-l1B§ || this.§_-n22§(_loc4_)))
                  {
                     _loc3_ = _loc4_.position;
                  }
               }
               if(_loc3_ == null && GameMap.instance.get(§_-Y2n§).length > 0)
               {
                  _loc3_ = (GameMap.instance.get(§_-Y2n§)[0] as §_-xn§).position;
               }
         }
         return _loc3_;
      }
      
      public function clear() : void
      {
         var _loc1_:Array = this.§_-n2K§();
         §_-p2U§.add("SquirrelCollection.clear before(" + _loc1_.join(" | ") + ")");
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.remove(_loc1_[_loc2_]);
            _loc2_++;
         }
         _loc1_ = this.§_-n2K§();
         if(_loc1_.length > 0)
         {
            §_-p2U§.add("Warning: Not all Squirrels removed !!! (" + _loc1_.join(" | ") + ")");
         }
         this.players = {};
         while(this.numChildren > 0)
         {
            removeChildAt(0);
            §_-av§(0);
         }
      }
      
      public function §_-71g§(param1:int) : void
      {
         this.§_-UY§ = param1;
      }
      
      public function §_-i15§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.players)
         {
            this.get(int(_loc1_)).shaman = false;
         }
      }
      
      public function §_-wt§() : Array
      {
         var _loc2_:Hero = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.players)
         {
            if(_loc2_.shaman)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function §_-J1N§(param1:Array, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Hero = null;
         if(param2)
         {
            this.§_-i15§();
         }
         for each(_loc3_ in param1)
         {
            _loc4_ = this.get(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.shaman = true;
               §_-J2J§(_loc4_);
            }
         }
         if(!Hero.self)
         {
            return;
         }
         addChild(Hero.self);
         §_-J2J§(Hero.self);
      }
      
      public function §_-Jg§(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Hero = null;
         for(_loc2_ in this.players)
         {
            this.get(int(_loc2_)).isHare = false;
         }
         for each(_loc3_ in param1)
         {
            _loc4_ = this.get(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.isHare = true;
               addChild(_loc4_);
               §_-J2J§(_loc4_);
            }
         }
         if(Hero.self)
         {
            addChild(Hero.self);
            §_-J2J§(Hero.self);
         }
      }
      
      public function §_-8r§(param1:Array) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Hero = null;
         for(_loc2_ in this.players)
         {
            this.get(int(_loc2_)).isDragon = false;
         }
         for each(_loc3_ in param1)
         {
            _loc4_ = this.get(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.isDragon = true;
               addChild(_loc4_);
               §_-J2J§(_loc4_);
            }
         }
         if(Hero.self)
         {
            addChild(Hero.self);
            §_-J2J§(Hero.self);
         }
      }
      
      public function get(param1:int) : Hero
      {
         return this.players[param1] || null;
      }
      
      public function update(param1:Number = 0) : void
      {
         var _loc2_:Hero = null;
         for each(_loc2_ in this.players)
         {
            _loc2_.update(param1);
         }
      }
      
      public function get §_-q2q§() : int
      {
         var _loc2_:Hero = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.players)
         {
            if(!(_loc2_.inHollow || _loc2_.isDead))
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function get §_-mt§() : int
      {
         var _loc2_:Hero = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.players)
         {
            if(_loc2_.shaman)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function §_-qb§() : Array
      {
         var _loc2_:Hero = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.players)
         {
            if(!_loc2_.inHollow && !_loc2_.isDead && !_loc2_.shaman && !_loc2_.isHare)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function §_-Un§(param1:Boolean = true) : Boolean
      {
         var _loc2_:Hero = null;
         for each(_loc2_ in this.players)
         {
            if(!(_loc2_.isHare || _loc2_.shaman && param1 || _loc2_.inHollow || _loc2_.isDead))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-01a§(param1:int, param2:int) : Boolean
      {
         if(!this.get(param1) || !this.get(param2))
         {
            return false;
         }
         if(this.§_-Iq§(param1,param2))
         {
            return false;
         }
         var _loc3_:§_-8M§ = new §_-8M§();
         _loc3_.hero0 = this.get(param1);
         _loc3_.hero1 = this.get(param2);
         GameMap.instance.add(_loc3_);
         _loc3_.build(SquirrelGame.instance.world);
         return true;
      }
      
      public function §_-Iq§(param1:int, param2:int) : §_-8M§
      {
         var _loc4_:§_-8M§ = null;
         var _loc3_:Array = GameMap.instance.get(§_-8M§);
         for each(_loc4_ in _loc3_)
         {
            if(Boolean(_loc4_.hero0 && (_loc4_.hero0.id == param1 || _loc4_.hero0.id == param2)) && Boolean(_loc4_.hero1) && (_loc4_.hero1.id == param1 || _loc4_.hero1.id == param2))
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      protected function §_-21b§(param1:int) : void
      {
         new ControllerHeroLocal(this.players[param1],false);
      }
      
      protected function §_-43r§(param1:SquirrelEvent = null) : void
      {
      }
      
      protected function §_-n22§(param1:Hero) : Boolean
      {
         var _loc2_:int = 80;
         if(param1.x < -_loc2_ || param1.§_-sF§(_loc2_))
         {
            return true;
         }
         return param1.y > §_-Zy§.§_-02T§;
      }
      
      private function §_-OC§(param1:Hero, param2:Hero) : int
      {
         return int(param1.id) < int(param2.id) ? 1 : -1;
      }
   }
}


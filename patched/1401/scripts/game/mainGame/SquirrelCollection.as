package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.§_-S18§;
   import §_-B1O§.§_-T24§;
   import §_-RI§.§_-h2I§;
   import §_-Rn§.§_-Pb§;
   import §_-T2y§.§_-92z§;
   import §_-s2l§.ControllerHeroLocal;
   import chat.§_-A1n§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import game.mainGame.entity.§_-63Q§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-c10§;
   import utils.§_-vS§;
   
   public class SquirrelCollection extends §_-h2I§ implements §_-Tm§
   {
      
      private static const §_-Z1h§:int = 5000;
      
      private static var _instance:SquirrelCollection = null;
      
      protected var §_-82Y§:int;
      
      protected var §_-V2y§:Timer = new Timer(§_-Z1h§);
      
      public var §_-Y1k§:Class = Hero;
      
      public var players:Object = {};
      
      public var §_-g14§:Boolean = false;
      
      public function SquirrelCollection()
      {
         _instance = this;
         §_-TQ§.add("SquirrelCollection.SquirrelCollection");
         §_-vS§.§_-41D§(this);
         super();
         this.§_-V2y§.addEventListener(TimerEvent.TIMER,this.§_-Ck§);
         this.§_-V2y§.reset();
         Hero.§_-xd§([SquirrelEvent.§_-z1B§],this.§_-y2G§);
      }
      
      public static function get instance() : SquirrelCollection
      {
         return _instance;
      }
      
      public function §_-U1m§(param1:Boolean = true) : void
      {
      }
      
      public function round(param1:Array) : void
      {
      }
      
      protected function §_-Ck§(param1:TimerEvent = null) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-Zg§);
      }
      
      public function dispose() : void
      {
         §_-TQ§.add("SquirrelCollection.dispose");
         Hero.forget(this.§_-y2G§);
         this.§_-V2y§.stop();
         this.§_-V2y§.removeEventListener(TimerEvent.TIMER,this.§_-Ck§);
         this.§_-V2y§ = null;
         §_-vS§.§_-324§(this);
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
      
      public function §_-f12§() : Array
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
                     if(§_-c10§.§_-73j§(Game.getPlayer(param1).rights,§_-c10§.§_-639§))
                     {
                        §_-92z§.§_-j1q§();
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
            §_-TQ§.add("SquirrelCollection.add: " + param1);
            this.players[param1] = new this.§_-Y1k§(param1,SquirrelGame.instance.world,0,0);
            if(Boolean(SquirrelGame.instance) && Boolean(SquirrelGame.instance.§_-A3o§))
            {
               SquirrelGame.instance.§_-A3o§.§_-P2Y§(this.players[param1]);
            }
            SquirrelGame.instance.§_-i2k§.addObject(this.players[param1]);
            §_-83v§(this.players[param1]);
            addChild(this.players[param1]);
            if(Boolean(Game.selfId) && Game.selfId in this.players)
            {
               addChild(this.players[Game.selfId]);
               §_-83v§(this.players[Game.selfId]);
            }
            this.§_-T1T§(param1);
            if(Game.selfId != 0)
            {
               if(param1 != Game.selfId)
               {
                  §_-92z§.sendMessage(param1,gls("Твой друг {0} присоединился к игре.",this.players[param1].playerName),§_-A1n§.§_-N1c§);
               }
            }
            return;
         }
         if(!SquirrelGame.instance || !this.players || param1 in this.players)
         {
            return;
         }
         §_-TQ§.add("SquirrelCollection.add: " + param1);
         this.players[param1] = new this.§_-Y1k§(param1,SquirrelGame.instance.world,0,0);
         if(Boolean(SquirrelGame.instance) && Boolean(SquirrelGame.instance.§_-A3o§))
         {
            SquirrelGame.instance.§_-A3o§.§_-P2Y§(this.players[param1]);
         }
         SquirrelGame.instance.§_-i2k§.addObject(this.players[param1]);
         §_-83v§(this.players[param1]);
         addChild(this.players[param1]);
         if(Boolean(Game.selfId) && Game.selfId in this.players)
         {
            addChild(this.players[Game.selfId]);
            §_-83v§(this.players[Game.selfId]);
         }
         this.§_-T1T§(param1);
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
         §_-TQ§.add("SquirrelCollection.remove " + param1);
         SquirrelGame.instance.§_-A3o§.remove(_loc2_);
         SquirrelGame.instance.§_-i2k§.removeObject(_loc2_);
         _loc2_.remove();
         if(contains(_loc2_))
         {
            removeChild(_loc2_);
         }
         if(§_-ws§(_loc2_))
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
         return Game.selfId == this.§_-82Y§;
      }
      
      public function place() : void
      {
         var _loc4_:Hero = null;
         var _loc5_:int = 0;
         var _loc1_:Vector.<b2Vec2> = GameMap.instance.§_-c2O§;
         var _loc2_:* = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in this.players)
         {
            _loc3_.push(_loc4_);
         }
         _loc3_.sort(this.§_-X1O§);
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
         _loc1_ = GameMap.instance.§_-p2U§;
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
      
      public function §_-33L§(param1:int, param2:int) : b2Vec2
      {
         var _loc4_:Hero = null;
         var _loc3_:b2Vec2 = null;
         switch(param2)
         {
            case Hero.§_-JL§:
               for each(_loc4_ in this.players)
               {
                  if(!(!_loc4_.shaman || _loc4_.isDead || _loc4_.id == param1 || this.§_-B1y§(_loc4_)))
                  {
                     _loc3_ = _loc4_.position;
                  }
               }
               if(_loc3_ == null && GameMap.instance.§_-c2O§.length > 0)
               {
                  _loc3_ = GameMap.instance.§_-c2O§[0];
               }
               break;
            case Hero.§_-114§:
               for each(_loc4_ in this.players)
               {
                  if(!(!_loc4_.shaman || _loc4_.isDead || _loc4_.id == param1 || _loc4_.team != Hero.§_-114§ || this.§_-B1y§(_loc4_)))
                  {
                     _loc3_ = _loc4_.position;
                  }
               }
               if(_loc3_ == null && GameMap.instance.get(§_-T24§).length > 0)
               {
                  _loc3_ = (GameMap.instance.get(§_-T24§)[0] as §_-63Q§).position;
               }
               break;
            case Hero.§_-17§:
               for each(_loc4_ in this.players)
               {
                  if(!(!_loc4_.shaman || _loc4_.isDead || _loc4_.id == param1 || _loc4_.team != Hero.§_-17§ || this.§_-B1y§(_loc4_)))
                  {
                     _loc3_ = _loc4_.position;
                  }
               }
               if(_loc3_ == null && GameMap.instance.get(§_-S18§).length > 0)
               {
                  _loc3_ = (GameMap.instance.get(§_-S18§)[0] as §_-63Q§).position;
               }
         }
         return _loc3_;
      }
      
      public function clear() : void
      {
         var _loc1_:Array = this.§_-f12§();
         §_-TQ§.add("SquirrelCollection.clear before(" + _loc1_.join(" | ") + ")");
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.remove(_loc1_[_loc2_]);
            _loc2_++;
         }
         _loc1_ = this.§_-f12§();
         if(_loc1_.length > 0)
         {
            §_-TQ§.add("Warning: Not all Squirrels removed !!! (" + _loc1_.join(" | ") + ")");
         }
         this.players = {};
         while(this.numChildren > 0)
         {
            removeChildAt(0);
            §_-n2T§(0);
         }
      }
      
      public function §_-46§(param1:int) : void
      {
         this.§_-82Y§ = param1;
      }
      
      public function §_-LU§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.players)
         {
            this.get(int(_loc1_)).shaman = false;
         }
      }
      
      public function §_-K14§() : Array
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
      
      public function §_-B1q§(param1:Array, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Hero = null;
         if(param2)
         {
            this.§_-LU§();
         }
         for each(_loc3_ in param1)
         {
            _loc4_ = this.get(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.shaman = true;
               §_-83v§(_loc4_);
            }
         }
         if(!Hero.self)
         {
            return;
         }
         addChild(Hero.self);
         §_-83v§(Hero.self);
      }
      
      public function §_-M13§(param1:Array) : void
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
               §_-83v§(_loc4_);
            }
         }
         if(Hero.self)
         {
            addChild(Hero.self);
            §_-83v§(Hero.self);
         }
      }
      
      public function §_-GM§(param1:Array) : void
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
               §_-83v§(_loc4_);
            }
         }
         if(Hero.self)
         {
            addChild(Hero.self);
            §_-83v§(Hero.self);
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
      
      public function get §_-I2R§() : int
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
      
      public function get §_-62q§() : int
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
      
      public function §_-k8§() : Array
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
      
      public function §_-TV§(param1:Boolean = true) : Boolean
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
      
      public function §_-83Q§(param1:int, param2:int) : Boolean
      {
         if(!this.get(param1) || !this.get(param2))
         {
            return false;
         }
         if(this.§_-h2M§(param1,param2))
         {
            return false;
         }
         var _loc3_:§_-Pb§ = new §_-Pb§();
         _loc3_.hero0 = this.get(param1);
         _loc3_.hero1 = this.get(param2);
         GameMap.instance.add(_loc3_);
         _loc3_.build(SquirrelGame.instance.world);
         return true;
      }
      
      public function §_-h2M§(param1:int, param2:int) : §_-Pb§
      {
         var _loc4_:§_-Pb§ = null;
         var _loc3_:Array = GameMap.instance.get(§_-Pb§);
         for each(_loc4_ in _loc3_)
         {
            if(Boolean(_loc4_.hero0 && (_loc4_.hero0.id == param1 || _loc4_.hero0.id == param2)) && Boolean(_loc4_.hero1) && (_loc4_.hero1.id == param1 || _loc4_.hero1.id == param2))
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      protected function §_-T1T§(param1:int) : void
      {
         new ControllerHeroLocal(this.players[param1],false);
      }
      
      protected function §_-y2G§(param1:SquirrelEvent = null) : void
      {
      }
      
      protected function §_-B1y§(param1:Hero) : Boolean
      {
         var _loc2_:int = 80;
         if(param1.x < -_loc2_ || param1.§_-hv§(_loc2_))
         {
            return true;
         }
         return param1.y > §_-a9§.§_-31m§;
      }
      
      private function §_-X1O§(param1:Hero, param2:Hero) : int
      {
         return int(param1.id) < int(param2.id) ? 1 : -1;
      }
   }
}


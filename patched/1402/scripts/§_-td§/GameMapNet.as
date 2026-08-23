package §_-td§
{
   import Box2D.Collision.b2AABB;
   import Box2D.Common.Math.b2Vec2;
   import §_-8Q§.GameBody;
   import §_-8Q§.§_-01S§;
   import §_-8Q§.§_-u1i§;
   import §_-X1k§.§_-WS§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-u24§;
   import §_-h2P§.§_-4c§;
   import §_-h2P§.§_-hj§;
   import §_-j2H§.§_-72c§;
   import §_-n1h§.Perk;
   import chat.§_-g1j§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.entity.§_-Yv§;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-Q17§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   import utils.§_-11I§;
   
   public class GameMapNet extends GameMap
   {
      
      private static const §_-82e§:Number = 2;
      
      private static const §_-aj§:int = 1;
      
      private var timer:Timer = new Timer(2000,1);
      
      private var §_-9l§:String = null;
      
      private var §_-gs§:Boolean = false;
      
      protected var §_-51u§:int = 0;
      
      public var §_-j2F§:int = -1;
      
      public var §_-u1m§:§_-hj§;
      
      public var §_-q1X§:Boolean = false;
      
      public function GameMapNet(param1:SquirrelGame)
      {
         super(param1);
         this.§_-u1m§ = new §_-hj§(this);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-818§,§_-s2l§.§_-l11§,§_-s2l§.§_-1q§,§_-s2l§.§_-c2r§],1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-x8§);
      }
      
      override public function round(param1:Array) : void
      {
         if(Game.activated)
         {
            while(true)
            {
               if(Game.state != 7)
               {
                  if(Game.state != 8)
                  {
                     if(Game.state != 9)
                     {
                        if(Game.state != 11)
                        {
                           break;
                        }
                     }
                  }
               }
               Game.state = 12;
               Game.time = getTimer();
               Game.target = null;
               §_-u24§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 22 секунды.",§_-g1j§.§_-j1p§);
               break;
            }
         }
         if(Game.activated)
         {
            while(true)
            {
               if(Game.state != 7)
               {
                  if(Game.state != 8)
                  {
                     if(Game.state != 9)
                     {
                        if(Game.state != 11)
                        {
                           break;
                        }
                     }
                  }
               }
               Game.state = 1;
               Game.time = getTimer();
               Game.target = null;
               §_-u24§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 10 секунд.",§_-g1j§.§_-j1p§);
               break;
            }
         }
         if("6" in param1)
         {
            this.§_-9l§ = StringUtil.§_-a14§(param1[6]);
            §_-Q17§.add(param1[6]);
         }
         if("5" in param1)
         {
            this.§_-51u§ = param1[5];
         }
         if(param1[0] == §_-s2l§.ROUND_STARTING)
         {
            this.§_-a1H§();
         }
         else
         {
            this.§_-x8§();
         }
         switch(param1[0])
         {
            case §_-s2l§.ROUND_STARTING:
               this.§_-gs§ = false;
               this.§_-B36§ = false;
               this.§_-l2p§ = [];
               break;
            case §_-s2l§.ROUND_START:
               this.§_-j2F§ = param1[0];
               this.§_-u1m§.§_-a23§();
               §_-WS§.§_-y23§ = -1;
               §_-WS§.§_-Z3§ = -1;
               break;
            case §_-s2l§.ROUND_WAITING:
            case §_-s2l§.ROUND_PLAYING:
            case §_-s2l§.§_-02x§:
               this.§_-j2F§ = param1[0];
               this.§_-u1m§.§_-o2p§();
               break;
            case §_-s2l§.§_-F2f§:
         }
      }
      
      override public function §_-TP§(param1:§_-xn§, param2:Boolean) : void
      {
         var _loc3_:Object = {};
         if(param1 is §_-3l§)
         {
            _loc3_["Create"] = [§_-f1b§.§_-q2W§(param1),(param1 as §_-3l§).§_-m1Y§(),param2];
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc3_));
      }
      
      override public function §_-Y1E§(param1:§_-xn§, param2:Boolean) : void
      {
         if(!this.game.squirrels.isSynchronizing && (!(param1 is GameBody) || (param1 as GameBody).playerId != Hero.§_-M1O§))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"Destroy":[§_-923§(param1),param2]}));
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-u1m§.update(param1);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.§_-l2p§ = [];
         this.§_-B36§ = false;
         this.§_-gs§ = false;
         this.§_-u1m§.reset();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-u1m§.§_-Ca§ = false;
         this.§_-u1m§ = null;
         this.§_-9l§ = null;
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-x8§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-818§,§_-s2l§.§_-l11§,§_-s2l§.§_-1q§,§_-s2l§.§_-c2r§]);
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         if((param1 is Sprite || param1 is MovieClip) && !(param1 is §_-Yv§))
         {
            param1.mouseEnabled = false;
            param1.mouseChildren = false;
         }
         if(!(param1 is GameBody))
         {
            return;
         }
         this.§_-u1m§.§_-a1K§(new §_-4c§(param1 as GameBody));
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         if(param1 is GameBody && Boolean(this.§_-u1m§))
         {
            this.§_-u1m§.remove((param1 as GameBody).id);
         }
         super.remove(param1,param2);
      }
      
      public function §_-32A§() : void
      {
         if(this.§_-B36§ || !this.game.squirrels.isSynchronizing || this.§_-t2h§ == 0)
         {
            return;
         }
         var _loc1_:Array = [];
         var _loc2_:Array = get(§_-72c§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_.push((_loc2_[_loc3_] as §_-72c§).position);
            _loc3_++;
         }
         while(_loc1_.length > this.§_-t2h§)
         {
            _loc1_.splice(int(Math.random() * _loc1_.length),1);
         }
         if(_loc1_.length < this.§_-t2h§)
         {
            _loc1_ = _loc1_.concat(this.§_-s13§(§_-82e§,§_-82e§,this.§_-t2h§ - _loc1_.length));
         }
         this.§_-z2p§(_loc1_);
      }
      
      public function §_-o1j§(param1:int, param2:GameBody) : void
      {
         if(!this.game.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc3_:Array = this.§_-s13§(§_-82e§,§_-82e§,1);
         param2.position = _loc3_[0];
         param2.playerId = param1;
         this.§_-TP§(param2,true);
      }
      
      public function §_-s13§(param1:int, param2:int, param3:int) : Array
      {
         var _loc11_:Number = NaN;
         var _loc12_:b2AABB = null;
         var _loc13_:int = 0;
         var _loc4_:int = this.size.y - §_-Zy§.§_-02T§;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         var _loc5_:Point = new Point(0,-_loc4_);
         var _loc6_:Array = [];
         var _loc7_:Number = _loc5_.x / Game.§_-12A§;
         while(_loc7_ < (_loc5_.x + this.size.x) / Game.§_-12A§)
         {
            _loc11_ = _loc5_.y / Game.§_-12A§;
            while(_loc11_ < (_loc5_.y + this.size.y) / Game.§_-12A§ - 6)
            {
               _loc12_ = new b2AABB();
               _loc12_.upperBound = new b2Vec2(_loc7_,_loc11_);
               _loc12_.lowerBound = new b2Vec2(_loc7_ + param1,_loc11_ + param2);
               _loc6_.push(_loc12_);
               _loc11_ += param2;
            }
            _loc7_ += param1;
         }
         var _loc8_:Array = §_-11I§.§_-oP§(this.game.world,_loc6_,param3);
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < param3)
         {
            if(_loc8_.length == 0)
            {
               _loc9_.push(this.§_-A35§);
            }
            else
            {
               _loc13_ = Math.random() * _loc8_.length;
               while(_loc10_.indexOf(_loc13_) != -1 && _loc8_.length >= param3)
               {
                  _loc13_ = Math.random() * _loc8_.length;
               }
               _loc10_.push(_loc13_);
               _loc9_.push(new b2Vec2(_loc8_[_loc13_].x + param1 * 0.5,_loc8_[_loc13_].y + param2 * 0.5));
            }
            _loc7_++;
         }
         return _loc9_;
      }
      
      override protected function onHollow(param1:HollowEvent) : void
      {
         §_-p2U§.add("GameMapNet.onHollow");
         if(this.isBrokenWorld)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-n1f§,0);
      }
      
      override protected function §_-R2p§(param1:SquirrelEvent) : void
      {
         super.§_-R2p§(param1);
         §_-p2U§.add("GameMapNet.onNut");
         Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-A1F§);
      }
      
      override protected function §_-m1v§(param1:*) : Object
      {
         var _loc2_:Object = super.§_-m1v§(param1);
         if(!_loc2_)
         {
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
         }
         return _loc2_;
      }
      
      override protected function §_-qv§() : *
      {
         var _loc3_:Hero = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Perk = null;
         var _loc1_:Object = super.§_-qv§();
         var _loc2_:Array = [];
         for each(_loc3_ in this.game.squirrels.players)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc6_ = [];
            for each(_loc7_ in _loc3_.perkController.§_-rI§)
            {
               if(_loc7_.active)
               {
                  _loc4_.push(_loc7_.§_-T2a§);
               }
            }
            for each(_loc7_ in _loc3_.perkController.perksClothes)
            {
               if(_loc7_.active)
               {
                  _loc5_.push(_loc7_.§_-T2a§);
               }
            }
            for each(_loc7_ in _loc3_.perkController.§_-ov§)
            {
               if(_loc7_.active)
               {
                  _loc6_.push(_loc7_.§_-T2a§);
               }
            }
            _loc2_.push([_loc3_.player["id"],_loc3_.isDead,_loc3_.inHollow,_loc3_.§_-62F§,_loc3_.§_-P12§,_loc4_,_loc5_,_loc6_]);
         }
         _loc1_.push({"playersData":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-a2f§(param1:*, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Hero = null;
         if(!param2)
         {
            param1 = this.§_-m1v§(param1);
         }
         var _loc3_:Object = param1.pop();
         super.§_-a2f§(param1,true);
         if(!("playersData" in _loc3_))
         {
            return;
         }
         for each(_loc4_ in _loc3_["playersData"])
         {
            _loc5_ = game.squirrels.get(_loc4_[0]);
            if(_loc5_)
            {
               _loc5_.isDead = Boolean(_loc4_[1]);
               _loc5_.inHollow = Boolean(_loc4_[2]);
               _loc5_.§_-I1u§(_loc4_[3] ? Hero.§_-43e§ : Hero.§_-z2T§);
               _loc5_.§_-P12§ = Boolean(_loc4_[4]);
               this.§_-12E§(_loc5_.perkController.§_-rI§,_loc4_[5]);
               this.§_-12E§(_loc5_.perkController.perksClothes,_loc4_[6]);
               this.§_-12E§(_loc5_.perkController.§_-ov§,_loc4_[7]);
               if(this.§_-j2F§ == §_-s2l§.ROUND_START)
               {
                  _loc5_.§_-A2n§();
               }
            }
         }
      }
      
      protected function §_-12E§(param1:*, param2:Array) : void
      {
         var _loc3_:Perk = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param1)
         {
            for each(_loc4_ in param2)
            {
               _loc3_.active = _loc3_.§_-T2a§ == _loc4_;
            }
         }
      }
      
      protected function §_-z2p§(param1:Array) : void
      {
         var _loc3_:§_-u1i§ = null;
         var _loc4_:int = 0;
         var _loc5_:§_-01S§ = null;
         this.§_-B36§ = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-l2p§.length)
         {
            _loc3_ = new §_-u1i§();
            _loc3_.§_-Gk§ = this.§_-l2p§[_loc2_];
            _loc3_.itemId = this.§_-l2p§[_loc2_ + 1];
            _loc3_.index = _loc2_ >> 1;
            _loc3_.position = param1.pop();
            this.§_-TP§(_loc3_,true);
            if(!(!this.§_-q1X§ || _loc3_.§_-Gk§ != §_-u1i§.§_-13j§))
            {
               _loc4_ = 0;
               while(_loc4_ < §_-aj§)
               {
                  _loc5_ = new §_-01S§();
                  _loc5_.itemId = this.§_-l2p§[_loc2_ + 1];
                  _loc5_.index = _loc2_ >> 1;
                  _loc5_.position = param1.pop();
                  this.§_-TP§(_loc5_,true);
                  _loc4_++;
               }
            }
            _loc2_ += 2;
         }
      }
      
      protected function get §_-t2h§() : int
      {
         var _loc1_:int = this.§_-l2p§.length >> 1;
         return _loc1_ + _loc1_ * (this.§_-q1X§ ? §_-aj§ : 0);
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Class = null;
         var _loc4_:§_-xn§ = null;
         var _loc5_:§_-u1i§ = null;
         var _loc6_:§_-xn§ = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-818§:
               if(this.isBrokenWorld)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-M15§);
                  return;
               }
               if(this.§_-u1m§.§_-Ca§ || Hero.§_-Cg§ && this.game.squirrels.§_-q2q§ == 1)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-l11§,StringUtil.§_-8g§(§_-m1Y§()));
               }
               break;
            case §_-s2l§.§_-l11§:
               if(this.§_-gs§)
               {
                  §_-p2U§.add("ROUND_WORLD ignored, mapReady");
                  §_-Q17§.add(param1[0]);
                  break;
               }
               §_-o2I§(StringUtil.§_-a14§(param1[0]));
               §_-Q17§.add(param1[0]);
               build(this.game.world);
               this.§_-gs§ = true;
               break;
            case §_-s2l§.§_-1q§:
               _loc2_ = param1[1];
               if("Create" in _loc2_)
               {
                  _loc3_ = §_-f1b§.§_-N1m§(_loc2_["Create"][0]);
                  _loc4_ = new _loc3_();
                  (_loc4_ as §_-3l§).§_-o2I§(_loc2_["Create"][1]);
                  if(_loc4_ is §_-u1i§ && !(_loc4_ is §_-01S§))
                  {
                     _loc5_ = _loc4_ as §_-u1i§;
                     this.elements[_loc5_.index] = _loc4_;
                  }
                  this.add(_loc4_);
                  if(_loc2_["Create"][2])
                  {
                     _loc4_.build(this.game.world);
                  }
               }
               if("Destroy" in _loc2_)
               {
                  _loc6_ = this.getObject(_loc2_["Destroy"][0]);
                  if(_loc6_)
                  {
                     this.remove(_loc6_,Boolean(_loc2_["Destroy"][1]));
                  }
               }
               break;
            case §_-s2l§.§_-c2r§:
               this.§_-l2p§ = param1[0] || [];
         }
      }
      
      private function §_-x8§(param1:TimerEvent = null) : void
      {
         var e:TimerEvent = param1;
         var mapData:String = this.§_-9l§;
         this.§_-9l§ = null;
         try
         {
            if(mapData)
            {
               §_-o2I§(mapData);
               this.§_-gs§ = true;
               if(this.game.§_-T1y§)
               {
                  this.game.§_-O1C§.update();
               }
            }
         }
         catch(error:Error)
         {
            this.§_-gs§ = false;
            §_-p2U§.add("GameMapNet.loadMap failed",error.getStackTrace());
            Connection.§_-e2T§(§_-u1O§.§_-M15§);
         }
         this.timer.stop();
      }
      
      private function §_-a1H§() : void
      {
         this.timer.reset();
         this.timer.start();
      }
   }
}


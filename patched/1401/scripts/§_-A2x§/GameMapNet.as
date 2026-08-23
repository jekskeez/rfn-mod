package §_-A2x§
{
   import Box2D.Collision.b2AABB;
   import Box2D.Common.Math.b2Vec2;
   import §_-83V§.GameBody;
   import §_-83V§.§_-n19§;
   import §_-83V§.§_-o29§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.§_-Vf§;
   import §_-C1m§.§_-C3N§;
   import §_-C1m§.§_-P1B§;
   import §_-I10§.§_-k1C§;
   import §_-S2§.Perk;
   import §_-T2y§.§_-92z§;
   import chat.§_-A1n§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-83i§;
   import protocol.Connection;
   import protocol.§_-P1h§;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.StringUtil;
   import utils.§_-41A§;
   
   public class GameMapNet extends GameMap
   {
      
      private static const §_-36§:Number = 2;
      
      private static const §_-z1b§:int = 1;
      
      private var timer:Timer = new Timer(2000,1);
      
      private var §_-Sh§:String = null;
      
      private var §_-hG§:Boolean = false;
      
      protected var §_-23J§:int = 0;
      
      public var §_-F2g§:int = -1;
      
      public var §_-dJ§:§_-C3N§;
      
      public var §_-92w§:Boolean = false;
      
      public function GameMapNet(param1:SquirrelGame)
      {
         super(param1);
         this.§_-dJ§ = new §_-C3N§(this);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1r§,§_-S2I§.§_-s27§,§_-S2I§.§_-b1y§,§_-S2I§.§_-13Z§],1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.§_-72D§);
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
               §_-92z§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 22 секунды.",§_-A1n§.§_-N1c§);
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
               §_-92z§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 10 секунд.",§_-A1n§.§_-N1c§);
               break;
            }
         }
         if("6" in param1)
         {
            this.§_-Sh§ = StringUtil.§_-B1K§(param1[6]);
            §_-P1h§.add(param1[6]);
         }
         if("5" in param1)
         {
            this.§_-23J§ = param1[5];
         }
         if(param1[0] == §_-S2I§.ROUND_STARTING)
         {
            this.§_-bJ§();
         }
         else
         {
            this.§_-72D§();
         }
         switch(param1[0])
         {
            case §_-S2I§.ROUND_STARTING:
               this.§_-hG§ = false;
               this.§_-t2R§ = false;
               this.§_-f1d§ = [];
               break;
            case §_-S2I§.ROUND_START:
               this.§_-F2g§ = param1[0];
               this.§_-dJ§.§_-J2a§();
               §_-k1C§.§_-dC§ = -1;
               §_-k1C§.§_-g§ = -1;
               break;
            case §_-S2I§.ROUND_WAITING:
            case §_-S2I§.ROUND_PLAYING:
            case §_-S2I§.§_-RO§:
               this.§_-F2g§ = param1[0];
               this.§_-dJ§.§_-G1F§();
               break;
            case §_-S2I§.§_-JF§:
         }
      }
      
      override public function §_-nA§(param1:§_-63Q§, param2:Boolean) : void
      {
         var _loc3_:Object = {};
         if(param1 is §_-03u§)
         {
            _loc3_["Create"] = [§_-03s§.§_-X21§(param1),(param1 as §_-03u§).§_-A1X§(),param2];
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc3_));
      }
      
      override public function §_-Qc§(param1:§_-63Q§, param2:Boolean) : void
      {
         if(!this.game.squirrels.isSynchronizing && (!(param1 is GameBody) || (param1 as GameBody).playerId != Hero.§_-74§))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"Destroy":[§_-F2W§(param1),param2]}));
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         this.§_-dJ§.update(param1);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.§_-f1d§ = [];
         this.§_-t2R§ = false;
         this.§_-hG§ = false;
         this.§_-dJ§.reset();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-dJ§.§_-G1U§ = false;
         this.§_-dJ§ = null;
         this.§_-Sh§ = null;
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.§_-72D§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1r§,§_-S2I§.§_-s27§,§_-S2I§.§_-b1y§,§_-S2I§.§_-13Z§]);
      }
      
      override public function add(param1:* = null) : void
      {
         super.add(param1);
         if((param1 is Sprite || param1 is MovieClip) && !(param1 is §_-83i§))
         {
            param1.mouseEnabled = false;
            param1.mouseChildren = false;
         }
         if(!(param1 is GameBody))
         {
            return;
         }
         this.§_-dJ§.§_-P2Y§(new §_-P1B§(param1 as GameBody));
      }
      
      override public function remove(param1:*, param2:Boolean = false) : void
      {
         if(param1 is GameBody && Boolean(this.§_-dJ§))
         {
            this.§_-dJ§.remove((param1 as GameBody).id);
         }
         super.remove(param1,param2);
      }
      
      public function §_-O27§() : void
      {
         if(this.§_-t2R§ || !this.game.squirrels.isSynchronizing || this.§_-G2E§ == 0)
         {
            return;
         }
         var _loc1_:Array = [];
         var _loc2_:Array = get(§_-Vf§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_.push((_loc2_[_loc3_] as §_-Vf§).position);
            _loc3_++;
         }
         while(_loc1_.length > this.§_-G2E§)
         {
            _loc1_.splice(int(Math.random() * _loc1_.length),1);
         }
         if(_loc1_.length < this.§_-G2E§)
         {
            _loc1_ = _loc1_.concat(this.§_-S15§(§_-36§,§_-36§,this.§_-G2E§ - _loc1_.length));
         }
         this.§_-Ri§(_loc1_);
      }
      
      public function §_-x25§(param1:int, param2:GameBody) : void
      {
         if(!this.game.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc3_:Array = this.§_-S15§(§_-36§,§_-36§,1);
         param2.position = _loc3_[0];
         param2.playerId = param1;
         this.§_-nA§(param2,true);
      }
      
      public function §_-S15§(param1:int, param2:int, param3:int) : Array
      {
         var _loc11_:Number = NaN;
         var _loc12_:b2AABB = null;
         var _loc13_:int = 0;
         var _loc4_:int = this.size.y - §_-a9§.§_-31m§;
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         var _loc5_:Point = new Point(0,-_loc4_);
         var _loc6_:Array = [];
         var _loc7_:Number = _loc5_.x / Game.§_-x2P§;
         while(_loc7_ < (_loc5_.x + this.size.x) / Game.§_-x2P§)
         {
            _loc11_ = _loc5_.y / Game.§_-x2P§;
            while(_loc11_ < (_loc5_.y + this.size.y) / Game.§_-x2P§ - 6)
            {
               _loc12_ = new b2AABB();
               _loc12_.upperBound = new b2Vec2(_loc7_,_loc11_);
               _loc12_.lowerBound = new b2Vec2(_loc7_ + param1,_loc11_ + param2);
               _loc6_.push(_loc12_);
               _loc11_ += param2;
            }
            _loc7_ += param1;
         }
         var _loc8_:Array = §_-41A§.§_-U1a§(this.game.world,_loc6_,param3);
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < param3)
         {
            if(_loc8_.length == 0)
            {
               _loc9_.push(this.§_-w19§);
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
         §_-TQ§.add("GameMapNet.onHollow");
         if(this.isBrokenWorld)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-Vs§,0);
      }
      
      override protected function §_-92T§(param1:SquirrelEvent) : void
      {
         super.§_-92T§(param1);
         §_-TQ§.add("GameMapNet.onNut");
         Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
      }
      
      override protected function §_-a1O§(param1:*) : Object
      {
         var _loc2_:Object = super.§_-a1O§(param1);
         if(!_loc2_)
         {
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
         }
         return _loc2_;
      }
      
      override protected function §_-931§() : *
      {
         var _loc3_:Hero = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Perk = null;
         var _loc1_:Object = super.§_-931§();
         var _loc2_:Array = [];
         for each(_loc3_ in this.game.squirrels.players)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc6_ = [];
            for each(_loc7_ in _loc3_.perkController.§_-s13§)
            {
               if(_loc7_.active)
               {
                  _loc4_.push(_loc7_.§_-i2D§);
               }
            }
            for each(_loc7_ in _loc3_.perkController.perksClothes)
            {
               if(_loc7_.active)
               {
                  _loc5_.push(_loc7_.§_-i2D§);
               }
            }
            for each(_loc7_ in _loc3_.perkController.§_-515§)
            {
               if(_loc7_.active)
               {
                  _loc6_.push(_loc7_.§_-i2D§);
               }
            }
            _loc2_.push([_loc3_.player["id"],_loc3_.isDead,_loc3_.inHollow,_loc3_.§_-426§,_loc3_.§_-S1K§,_loc4_,_loc5_,_loc6_]);
         }
         _loc1_.push({"playersData":_loc2_});
         return _loc1_;
      }
      
      override protected function §_-sb§(param1:*, param2:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Hero = null;
         if(!param2)
         {
            param1 = this.§_-a1O§(param1);
         }
         var _loc3_:Object = param1.pop();
         super.§_-sb§(param1,true);
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
               _loc5_.§_-4j§(_loc4_[3] ? Hero.§_-517§ : Hero.§_-VP§);
               _loc5_.§_-S1K§ = Boolean(_loc4_[4]);
               this.§_-P2J§(_loc5_.perkController.§_-s13§,_loc4_[5]);
               this.§_-P2J§(_loc5_.perkController.perksClothes,_loc4_[6]);
               this.§_-P2J§(_loc5_.perkController.§_-515§,_loc4_[7]);
               if(this.§_-F2g§ == §_-S2I§.ROUND_START)
               {
                  _loc5_.§_-Dh§();
               }
            }
         }
      }
      
      protected function §_-P2J§(param1:*, param2:Array) : void
      {
         var _loc3_:Perk = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param1)
         {
            for each(_loc4_ in param2)
            {
               _loc3_.active = _loc3_.§_-i2D§ == _loc4_;
            }
         }
      }
      
      protected function §_-Ri§(param1:Array) : void
      {
         var _loc3_:§_-o29§ = null;
         var _loc4_:int = 0;
         var _loc5_:§_-n19§ = null;
         this.§_-t2R§ = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-f1d§.length)
         {
            _loc3_ = new §_-o29§();
            _loc3_.§_-y2u§ = this.§_-f1d§[_loc2_];
            _loc3_.itemId = this.§_-f1d§[_loc2_ + 1];
            _loc3_.index = _loc2_ >> 1;
            _loc3_.position = param1.pop();
            this.§_-nA§(_loc3_,true);
            if(!(!this.§_-92w§ || _loc3_.§_-y2u§ != §_-o29§.§_-Y1l§))
            {
               _loc4_ = 0;
               while(_loc4_ < §_-z1b§)
               {
                  _loc5_ = new §_-n19§();
                  _loc5_.itemId = this.§_-f1d§[_loc2_ + 1];
                  _loc5_.index = _loc2_ >> 1;
                  _loc5_.position = param1.pop();
                  this.§_-nA§(_loc5_,true);
                  _loc4_++;
               }
            }
            _loc2_ += 2;
         }
      }
      
      protected function get §_-G2E§() : int
      {
         var _loc1_:int = this.§_-f1d§.length >> 1;
         return _loc1_ + _loc1_ * (this.§_-92w§ ? §_-z1b§ : 0);
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Class = null;
         var _loc4_:§_-63Q§ = null;
         var _loc5_:§_-o29§ = null;
         var _loc6_:§_-63Q§ = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-b1r§:
               if(this.isBrokenWorld)
               {
                  Connection.§_-Li§(§_-h2B§.§_-n1x§);
                  return;
               }
               if(this.§_-dJ§.§_-G1U§ || Hero.§_-6g§ && this.game.squirrels.§_-I2R§ == 1)
               {
                  Connection.§_-Li§(§_-h2B§.§_-s27§,StringUtil.§_-c1R§(§_-A1X§()));
               }
               break;
            case §_-S2I§.§_-s27§:
               if(this.§_-hG§)
               {
                  §_-TQ§.add("ROUND_WORLD ignored, mapReady");
                  §_-P1h§.add(param1[0]);
                  break;
               }
               §_-41M§(StringUtil.§_-B1K§(param1[0]));
               §_-P1h§.add(param1[0]);
               build(this.game.world);
               this.§_-hG§ = true;
               break;
            case §_-S2I§.§_-b1y§:
               _loc2_ = param1[1];
               if("Create" in _loc2_)
               {
                  _loc3_ = §_-03s§.§_-F1T§(_loc2_["Create"][0]);
                  _loc4_ = new _loc3_();
                  (_loc4_ as §_-03u§).§_-41M§(_loc2_["Create"][1]);
                  if(_loc4_ is §_-o29§ && !(_loc4_ is §_-n19§))
                  {
                     _loc5_ = _loc4_ as §_-o29§;
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
            case §_-S2I§.§_-13Z§:
               this.§_-f1d§ = param1[0] || [];
         }
      }
      
      private function §_-72D§(param1:TimerEvent = null) : void
      {
         var e:TimerEvent = param1;
         var mapData:String = this.§_-Sh§;
         this.§_-Sh§ = null;
         try
         {
            if(mapData)
            {
               §_-41M§(mapData);
               this.§_-hG§ = true;
               if(this.game.§_-1q§)
               {
                  this.game.§_-i2k§.update();
               }
            }
         }
         catch(error:Error)
         {
            this.§_-hG§ = false;
            §_-TQ§.add("GameMapNet.loadMap failed",error.getStackTrace());
            Connection.§_-Li§(§_-h2B§.§_-n1x§);
         }
         this.timer.stop();
      }
      
      private function §_-bJ§() : void
      {
         this.timer.reset();
         this.timer.start();
      }
   }
}


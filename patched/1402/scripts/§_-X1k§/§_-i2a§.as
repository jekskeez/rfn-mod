package §_-X1k§
{
   import §_-ZL§.§_-82w§;
   import §_-bN§.Dialog;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   
   public class §_-i2a§
   {
      
      public static var §_-93T§:Array = [];
      
      public static var §_-J2W§:Array = [];
      
      public static var §_-B3I§:Array = [];
      
      public static var §_-51j§:Array = null;
      
      private static var §_-N2a§:Object = {};
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-93§:int = 0;
      
      public function §_-i2a§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-F§,§_-s2l§.§_-e2g§,§_-s2l§.§_-i6§,§_-s2l§.§_-nH§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-t1Y§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-93T§.length)
         {
            §_-93T§[_loc1_].show();
            _loc1_++;
         }
      }
      
      public static function §_-w2f§() : void
      {
         §_-J2W§.push(0,§_-s2l§.§_-s1a§,0,0,Game.§_-i24§);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.EVENT_CHANGE));
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-F§:
               §_-B3I§ = param1[0];
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.GIFT_CHANGE));
               §_-N2v§();
               break;
            case §_-s2l§.§_-i6§:
               §_-D1I§(param1[0]);
               break;
            case §_-s2l§.§_-nH§:
               if(param1[0] != Game.selfId)
               {
                  break;
               }
               §_-l1E§(§_-J2W§,[param1[1]]);
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.EVENT_CHANGE));
               if(§_-J2W§.length > 0)
               {
                  §_-L1H§.show(NotificationManager.§_-T1Z§);
               }
               break;
            case §_-s2l§.§_-e2g§:
               §_-51j§ = param1[0];
               §_-si§.§_-m1x§();
         }
      }
      
      private static function §_-D1I§(param1:Array) : void
      {
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Array = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Dialog = null;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:Array = [];
         var _loc5_:Object = {};
         var _loc6_:Object = {};
         var _loc7_:Object = {};
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         while(_loc9_ < param1.length)
         {
            _loc11_ = int(param1[_loc9_]);
            _loc12_ = int(param1[_loc9_ + 1]);
            _loc13_ = int(param1[_loc9_ + 2]);
            _loc14_ = int(param1[_loc9_ + 3]);
            _loc15_ = int(int(param1[_loc9_ + 4]) || 0);
            switch(_loc12_)
            {
               case §_-s2l§.MAP_APPROVED:
                  §_-93T§.push(new §_-82w§(_loc14_));
                  break;
               case §_-s2l§.§_-Y2P§:
                  _loc2_ = _loc11_;
                  break;
               case §_-s2l§.§_-r2w§:
                  _loc4_.push(_loc14_);
                  break;
               case §_-s2l§.§_-33l§:
                  _loc6_[_loc14_] = [_loc11_,_loc12_,_loc13_,_loc14_,_loc15_];
                  break;
               case §_-s2l§.§_-z1l§:
                  _loc7_[_loc14_] = _loc15_;
                  break;
               case §_-s2l§.§_-C2n§:
               case §_-s2l§.§_-e4§:
               case §_-s2l§.§_-b1j§:
                  _loc3_ = _loc11_;
            }
            if(_loc14_ != 0 && (_loc12_ == §_-s2l§.§_-Y2P§ || _loc12_ == §_-s2l§.§_-z1l§ || _loc12_ == §_-s2l§.§_-33l§) && (!_loc5_[_loc14_] || _loc5_[_loc14_].time < _loc15_))
            {
               _loc5_[_loc14_] = {
                  "type":_loc12_,
                  "time":_loc15_
               };
            }
            if(_loc14_ == 0 || _loc12_ != §_-s2l§.§_-Y2P§ && _loc12_ != §_-s2l§.§_-z1l§ && _loc12_ != §_-s2l§.§_-33l§)
            {
               _loc8_.push(_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
            }
            _loc9_ += 5;
         }
         for(_loc10_ in _loc6_)
         {
            _loc16_ = _loc6_[_loc10_];
            _loc17_ = int(_loc16_[4]);
            _loc18_ = int(_loc7_[_loc10_]);
            if(!(Boolean(_loc18_) && _loc18_ >= _loc17_))
            {
               if(!(Boolean(_loc5_[_loc10_]) && _loc5_[_loc10_].time > _loc17_))
               {
                  _loc8_.push.apply(_loc8_,_loc16_);
               }
            }
         }
         _loc9_ = 0;
         while(_loc9_ < param1.length)
         {
            _loc19_ = int(param1[_loc9_ + 3]);
            _loc12_ = int(param1[_loc9_ + 1]);
            _loc15_ = int(param1[_loc9_ + 4]);
            if(Boolean(_loc19_ != 0 && (_loc12_ == §_-s2l§.§_-Y2P§ || _loc12_ == §_-s2l§.§_-z1l§)) && Boolean(_loc5_[_loc19_]) && _loc5_[_loc19_].time == _loc15_)
            {
               _loc8_.push(param1[_loc9_],param1[_loc9_ + 1],param1[_loc9_ + 2],_loc19_,_loc15_);
            }
            _loc9_ += 5;
         }
         if(_loc2_ != -1)
         {
            §_-a2E§(_loc8_,_loc2_);
         }
         if(_loc3_ != -1)
         {
            §_-63G§(_loc8_,_loc3_);
         }
         if(_loc4_.length != 0)
         {
            §_-F2F§(_loc8_,_loc4_);
         }
         if(§_-t2c§.active is §_-si§)
         {
            for each(_loc20_ in §_-93T§)
            {
               _loc20_.show();
            }
         }
         §_-v1A§(_loc8_);
      }
      
      private static function §_-v1A§(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(!§_-N2a§[param1[_loc3_]])
            {
               §_-N2a§[param1[_loc3_]] = true;
               _loc2_.push(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 3],param1[_loc3_ + 4]);
            }
            _loc3_ += 5;
         }
         if(_loc2_.length == 0)
         {
            return;
         }
         §_-J2W§ = §_-J2W§.concat(_loc2_);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.EVENT_CHANGE));
         §_-L1H§.show(NotificationManager.§_-T1Z§);
      }
      
      private static function §_-a2E§(param1:Array, param2:int) : void
      {
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            if(!(param1[_loc3_ + 1] != §_-s2l§.§_-Y2P§ || param1[_loc3_] == param2 && Game.self["clan_id"] != 0))
            {
               param1.splice(_loc3_,5);
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-63G§(param1:Array, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            _loc4_ = int(param1[_loc3_ + 1]);
            if(!(_loc4_ != §_-s2l§.§_-C2n§ && _loc4_ != §_-s2l§.§_-e4§ && _loc4_ != §_-s2l§.§_-b1j§ || param1[_loc3_] == param2 && Game.self["clan_id"] != 0))
            {
               param1.splice(_loc3_,5);
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-F2F§(param1:Array, param2:Array) : void
      {
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            switch(param1[_loc3_ + 1])
            {
               case §_-s2l§.§_-33l§:
               case §_-s2l§.§_-z1l§:
               case §_-s2l§.§_-k1N§:
               case §_-s2l§.§_-63p§:
               case §_-s2l§.§_-Xy§:
               case §_-s2l§.§_-Y2P§:
               case §_-s2l§.§_-C2n§:
               case §_-s2l§.§_-e4§:
               case §_-s2l§.§_-b1j§:
                  if(param2.indexOf(param1[_loc3_ + 3]) != -1)
                  {
                     param1.splice(_loc3_,5);
                  }
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-l1E§(param1:Array, param2:Array) : void
      {
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            if(param1[_loc3_ + 1] == §_-s2l§.§_-33l§ && param2.indexOf(param1[_loc3_ + 3]) != -1)
            {
               param1.splice(_loc3_,5);
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-N2v§() : void
      {
         var _loc1_:int = Game.§_-i24§ + int(getTimer() / 1000);
         var _loc2_:int = 0;
         while(_loc2_ < §_-B3I§.length)
         {
            if(§_-B3I§[_loc2_ + 3] < _loc1_)
            {
               §_-L1H§.show(NotificationManager.§_-T1Z§);
            }
            else if(!(§_-93§ != 0 && §_-93§ < §_-B3I§[_loc2_ + 3] - _loc1_))
            {
               §_-93§ = §_-B3I§[_loc2_ + 3] - _loc1_;
            }
            _loc2_ += 4;
         }
         if(§_-93§ != 0)
         {
            §_-p1V§.§_-63T§(§_-t29§);
         }
      }
      
      private static function §_-t29§() : void
      {
         --§_-93§;
         if(§_-93§ != 0)
         {
            return;
         }
         §_-p1V§.§_-B3x§(§_-t29§);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.ON_CHANGE));
         §_-N2v§();
      }
   }
}


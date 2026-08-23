package §_-I10§
{
   import §_-Q1P§.§_-f1t§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-k1c§.Dialog;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   
   public class §_-Bg§
   {
      
      public static var §_-FT§:Array = [];
      
      public static var §_-t2C§:Array = [];
      
      public static var §_-Y9§:Array = [];
      
      public static var §_-I2L§:Array = null;
      
      private static var §_-N2j§:Object = {};
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-u2s§:int = 0;
      
      public function §_-Bg§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-U5§,§_-S2I§.§_-A3j§,§_-S2I§.§_-v9§,§_-S2I§.§_-t2k§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-g2K§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-FT§.length)
         {
            §_-FT§[_loc1_].show();
            _loc1_++;
         }
      }
      
      public static function §_-833§() : void
      {
         §_-t2C§.push(0,§_-S2I§.§_-m2d§,0,0,Game.§_-nE§);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EVENT_CHANGE));
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-U5§:
               §_-Y9§ = param1[0];
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.GIFT_CHANGE));
               §_-Hm§();
               break;
            case §_-S2I§.§_-v9§:
               §_-Lp§(param1[0]);
               break;
            case §_-S2I§.§_-t2k§:
               if(param1[0] != Game.selfId)
               {
                  break;
               }
               §_-c1o§(§_-t2C§,[param1[1]]);
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EVENT_CHANGE));
               if(§_-t2C§.length > 0)
               {
                  §_-fO§.show(NotificationManager.§_-V1P§);
               }
               break;
            case §_-S2I§.§_-A3j§:
               §_-I2L§ = param1[0];
               §_-5K§.§_-b1W§();
         }
      }
      
      private static function §_-Lp§(param1:Array) : void
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
               case §_-S2I§.MAP_APPROVED:
                  §_-FT§.push(new §_-f1t§(_loc14_));
                  break;
               case §_-S2I§.§_-z1J§:
                  _loc2_ = _loc11_;
                  break;
               case §_-S2I§.§_-UB§:
                  _loc4_.push(_loc14_);
                  break;
               case §_-S2I§.§_-Wx§:
                  _loc6_[_loc14_] = [_loc11_,_loc12_,_loc13_,_loc14_,_loc15_];
                  break;
               case §_-S2I§.§_-23Z§:
                  _loc7_[_loc14_] = _loc15_;
                  break;
               case §_-S2I§.§_-S1s§:
               case §_-S2I§.§_-E1L§:
               case §_-S2I§.§_-U1s§:
                  _loc3_ = _loc11_;
            }
            if(_loc14_ != 0 && (_loc12_ == §_-S2I§.§_-z1J§ || _loc12_ == §_-S2I§.§_-23Z§ || _loc12_ == §_-S2I§.§_-Wx§) && (!_loc5_[_loc14_] || _loc5_[_loc14_].time < _loc15_))
            {
               _loc5_[_loc14_] = {
                  "type":_loc12_,
                  "time":_loc15_
               };
            }
            if(_loc14_ == 0 || _loc12_ != §_-S2I§.§_-z1J§ && _loc12_ != §_-S2I§.§_-23Z§ && _loc12_ != §_-S2I§.§_-Wx§)
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
            if(Boolean(_loc19_ != 0 && (_loc12_ == §_-S2I§.§_-z1J§ || _loc12_ == §_-S2I§.§_-23Z§)) && Boolean(_loc5_[_loc19_]) && _loc5_[_loc19_].time == _loc15_)
            {
               _loc8_.push(param1[_loc9_],param1[_loc9_ + 1],param1[_loc9_ + 2],_loc19_,_loc15_);
            }
            _loc9_ += 5;
         }
         if(_loc2_ != -1)
         {
            §_-z2L§(_loc8_,_loc2_);
         }
         if(_loc3_ != -1)
         {
            §_-x1S§(_loc8_,_loc3_);
         }
         if(_loc4_.length != 0)
         {
            §_-e1l§(_loc8_,_loc4_);
         }
         if(§_-71o§.active is §_-5K§)
         {
            for each(_loc20_ in §_-FT§)
            {
               _loc20_.show();
            }
         }
         §_-31U§(_loc8_);
      }
      
      private static function §_-31U§(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(!§_-N2j§[param1[_loc3_]])
            {
               §_-N2j§[param1[_loc3_]] = true;
               _loc2_.push(param1[_loc3_],param1[_loc3_ + 1],param1[_loc3_ + 2],param1[_loc3_ + 3],param1[_loc3_ + 4]);
            }
            _loc3_ += 5;
         }
         if(_loc2_.length == 0)
         {
            return;
         }
         §_-t2C§ = §_-t2C§.concat(_loc2_);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.EVENT_CHANGE));
         §_-fO§.show(NotificationManager.§_-V1P§);
      }
      
      private static function §_-z2L§(param1:Array, param2:int) : void
      {
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            if(!(param1[_loc3_ + 1] != §_-S2I§.§_-z1J§ || param1[_loc3_] == param2 && Game.self["clan_id"] != 0))
            {
               param1.splice(_loc3_,5);
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-x1S§(param1:Array, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            _loc4_ = int(param1[_loc3_ + 1]);
            if(!(_loc4_ != §_-S2I§.§_-S1s§ && _loc4_ != §_-S2I§.§_-E1L§ && _loc4_ != §_-S2I§.§_-U1s§ || param1[_loc3_] == param2 && Game.self["clan_id"] != 0))
            {
               param1.splice(_loc3_,5);
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-e1l§(param1:Array, param2:Array) : void
      {
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            switch(param1[_loc3_ + 1])
            {
               case §_-S2I§.§_-Wx§:
               case §_-S2I§.§_-23Z§:
               case §_-S2I§.§_-11S§:
               case §_-S2I§.§_-Y1F§:
               case §_-S2I§.§_-vV§:
               case §_-S2I§.§_-z1J§:
               case §_-S2I§.§_-S1s§:
               case §_-S2I§.§_-E1L§:
               case §_-S2I§.§_-U1s§:
                  if(param2.indexOf(param1[_loc3_ + 3]) != -1)
                  {
                     param1.splice(_loc3_,5);
                  }
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-c1o§(param1:Array, param2:Array) : void
      {
         var _loc3_:int = param1.length - 5;
         while(_loc3_ >= 0)
         {
            if(param1[_loc3_ + 1] == §_-S2I§.§_-Wx§ && param2.indexOf(param1[_loc3_ + 3]) != -1)
            {
               param1.splice(_loc3_,5);
            }
            _loc3_ -= 5;
         }
      }
      
      private static function §_-Hm§() : void
      {
         var _loc1_:int = Game.§_-nE§ + int(getTimer() / 1000);
         var _loc2_:int = 0;
         while(_loc2_ < §_-Y9§.length)
         {
            if(§_-Y9§[_loc2_ + 3] < _loc1_)
            {
               §_-fO§.show(NotificationManager.§_-V1P§);
            }
            else if(!(§_-u2s§ != 0 && §_-u2s§ < §_-Y9§[_loc2_ + 3] - _loc1_))
            {
               §_-u2s§ = §_-Y9§[_loc2_ + 3] - _loc1_;
            }
            _loc2_ += 4;
         }
         if(§_-u2s§ != 0)
         {
            §_-01Y§.§_-c9§(§_-H5§);
         }
      }
      
      private static function §_-H5§() : void
      {
         --§_-u2s§;
         if(§_-u2s§ != 0)
         {
            return;
         }
         §_-01Y§.§_-l2K§(§_-H5§);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.ON_CHANGE));
         §_-Hm§();
      }
   }
}


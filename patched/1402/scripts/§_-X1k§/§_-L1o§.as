package §_-X1k§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-cx§;
   
   public class §_-L1o§
   {
      
      public static const §_-U1v§:int = 0;
      
      public static const §_-d1W§:int = 1;
      
      public static var §_-m2I§:Array = [];
      
      public static var §_-ig§:Array = [];
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      private static var §_-A1I§:Boolean = false;
      
      private static var packages:Array = [];
      
      private static var §_-W1t§:Object = {};
      
      private static var §_-H1x§:Object = {};
      
      private static var §_-B3s§:Object = {};
      
      private static var §_-SS§:Object = {};
      
      private static var accessories:Array = [];
      
      private static var §_-lq§:Object = {};
      
      public function §_-L1o§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-B30§,§_-s2l§.§_-Ip§,§_-s2l§.§_-93s§,§_-s2l§.§_-U1f§]);
         §_-p1V§.§_-63T§(§_-t29§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-G2K§(param1:int) : Boolean
      {
         return §_-Tg§(param1) != 0;
      }
      
      public static function §_-T1N§(param1:int) : Boolean
      {
         return !§_-G2K§(param1) && §_-63f§.indexOf(param1) != -1;
      }
      
      public static function §_-O1P§(param1:int) : Boolean
      {
         return §_-m2I§.indexOf(param1) != -1;
      }
      
      public static function §_-y2n§(param1:int) : Boolean
      {
         return §_-ig§.indexOf(param1) != -1;
      }
      
      public static function §_-M2a§(param1:int, param2:int) : Boolean
      {
         switch(param2)
         {
            case §_-U1v§:
               return §_-O1P§(param1);
            case §_-d1W§:
               return §_-y2n§(param1);
            default:
               return false;
         }
      }
      
      public static function §_-WM§(param1:int) : int
      {
         var _loc2_:int = 0;
         for each(_loc2_ in §_-m2I§)
         {
            if(_loc2_ >= 0)
            {
               if(§_-P2x§.§_-VY§(§_-P2x§.§_-b2c§(_loc2_)) == param1)
               {
                  return _loc2_;
               }
            }
         }
         return -1;
      }
      
      public static function get §_-f13§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < packages.length)
         {
            _loc1_.push(§_-P2x§.§_-b2c§(packages[_loc2_]));
            _loc2_++;
         }
         return §_-cx§.§_-y1Z§(_loc1_);
      }
      
      public static function §_-02s§(param1:int) : Boolean
      {
         if(packages.indexOf(param1) == -1)
         {
            return false;
         }
         return §_-Tg§(param1) == 0 || §_-Tg§(param1) > Game.§_-i24§ + int(getTimer() / 1000);
      }
      
      public static function get §_-63f§() : Array
      {
         return packages;
      }
      
      public static function get §_-Ki§() : Array
      {
         return accessories;
      }
      
      public static function §_-51J§(param1:int) : int
      {
         if(param1 in §_-W1t§)
         {
            return §_-W1t§[param1];
         }
         return -1;
      }
      
      public static function get isScrat() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-m2I§.length)
         {
            if(§_-P2x§.§_-r5§(§_-m2I§[_loc1_]))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public static function get §_-s1§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-m2I§.length)
         {
            if(§_-P2x§.§_-e2S§(§_-m2I§[_loc1_]))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public static function get §_-2g§() : Boolean
      {
         return packages.indexOf(§_-P2x§.§_-rR§) != -1;
      }
      
      public static function get §_-UU§() : Boolean
      {
         return packages.indexOf(§_-P2x§.§_-b2N§) != -1;
      }
      
      public static function §_-J2p§(param1:int, param2:int) : Boolean
      {
         switch(param2)
         {
            case §_-U1v§:
               return packages.indexOf(param1) != -1;
            case §_-d1W§:
               return accessories.indexOf(param1) != -1;
            default:
               return false;
         }
      }
      
      public static function §_-AY§(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case §_-U1v§:
               Connection.§_-e2T§(§_-u1O§.§_-Ip§,param1,param2,1);
               break;
            case §_-d1W§:
               Connection.§_-e2T§(§_-u1O§.§_-Ip§,param1,param2,1);
         }
      }
      
      public static function §_-R2f§(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case §_-U1v§:
               Connection.§_-e2T§(§_-u1O§.§_-Ip§,param1,param2,§_-O1P§(param2) ? 0 : 1);
               break;
            case §_-d1W§:
               Connection.§_-e2T§(§_-u1O§.§_-Ip§,param1,param2,§_-y2n§(param2) ? 0 : 1);
         }
         §_-Ac§.§_-91§(§_-Ac§.§_-71w§);
      }
      
      public static function §_-R1e§(param1:Array, param2:Array) : Array
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = _loc3_.concat(§_-P2x§.§_-Zv§(param1[_loc4_]));
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_ = _loc3_.concat(§_-P2x§.§_-F1F§(param2[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-Tg§(param1:int) : int
      {
         if(param1 in §_-H1x§)
         {
            return §_-H1x§[param1];
         }
         return 0;
      }
      
      public static function §_-31E§(param1:int) : int
      {
         if(param1 in §_-B3s§)
         {
            return §_-B3s§[param1];
         }
         return 0;
      }
      
      public static function §_-i2i§(param1:int) : int
      {
         var _loc2_:* = int(packages.length - 1);
         while(_loc2_ >= 0)
         {
            if(!(!(packages[_loc2_] in §_-SS§) || §_-SS§[packages[_loc2_]] != param1))
            {
               return packages[_loc2_];
            }
            _loc2_--;
         }
         return -1;
      }
      
      private static function §_-N1Z§(param1:int, param2:int) : Boolean
      {
         switch(param1)
         {
            case §_-U1v§:
               if(§_-O1P§(param2))
               {
                  return false;
               }
               §_-m2I§.push(param2);
               break;
            case §_-d1W§:
               if(§_-y2n§(param2))
               {
                  return false;
               }
               §_-ig§.push(param2);
         }
         return true;
      }
      
      private static function §_-O2O§(param1:int, param2:int) : Boolean
      {
         switch(param1)
         {
            case §_-U1v§:
               if(!§_-O1P§(param2))
               {
                  return false;
               }
               §_-m2I§.splice(§_-m2I§.indexOf(param2),1);
               break;
            case §_-d1W§:
               if(!§_-y2n§(param2))
               {
                  return false;
               }
               §_-ig§.splice(§_-ig§.indexOf(param2),1);
         }
         return true;
      }
      
      private static function §_-TA§() : void
      {
         if(Game.self)
         {
            Game.self["worn_packages"] = §_-m2I§.slice();
            Game.self["worn_accessories"] = §_-ig§.slice();
         }
         if(Hero.self)
         {
            Hero.self.heroView.setClothing(§_-m2I§,§_-ig§);
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_HERO_CHANGE));
      }
      
      private static function §_-t29§() : void
      {
         var _loc2_:int = 0;
         if(§_-A1I§)
         {
            return;
         }
         var _loc1_:int = Game.§_-i24§ + int(getTimer() / 1000);
         for each(_loc2_ in §_-H1x§)
         {
            if(_loc2_ > 0)
            {
               if(_loc2_ <= _loc1_)
               {
                  Connection.§_-e2T§(§_-u1O§.§_-w2G§,§_-u1O§.§_-q2B§);
                  Connection.§_-e2T§(§_-u1O§.§_-w2G§,§_-u1O§.§_-012§);
                  §_-A1I§ = true;
                  break;
               }
            }
         }
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-B30§:
               _loc2_ = false;
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  packages.push(param1[0][_loc3_]);
                  §_-W1t§[param1[0][_loc3_]] = param1[0][_loc3_ + 1];
                  §_-H1x§[param1[0][_loc3_]] = param1[0][_loc3_ + 2];
                  §_-B3s§[param1[0][_loc3_]] = param1[0][_loc3_ + 4];
                  §_-SS§[param1[0][_loc3_]] = param1[0][_loc3_ + 5];
                  if(param1[0][_loc3_ + 3])
                  {
                     if(§_-N1Z§(§_-U1v§,param1[0][_loc3_]))
                     {
                        _loc2_ = true;
                     }
                  }
                  else if(§_-O2O§(§_-U1v§,param1[0][_loc3_]))
                  {
                     _loc2_ = true;
                  }
                  _loc3_ += 6;
               }
               packages = §_-cx§.§_-y1Z§(packages);
               _loc3_ = 0;
               while(_loc3_ < param1[1].length)
               {
                  accessories.push(param1[1][_loc3_]);
                  §_-lq§[param1[1][_loc3_]] = param1[1][_loc3_ + 2];
                  if(param1[1][_loc3_ + 1])
                  {
                     if(§_-N1Z§(§_-d1W§,param1[1][_loc3_]))
                     {
                        _loc2_ = true;
                     }
                  }
                  else if(§_-O2O§(§_-d1W§,param1[1][_loc3_]))
                  {
                     _loc2_ = true;
                  }
                  _loc3_ += 3;
               }
               accessories = §_-cx§.§_-y1Z§(accessories);
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_STORAGE_CHANGE));
               if(_loc2_)
               {
                  §_-TA§();
               }
               break;
            case §_-s2l§.§_-Ip§:
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  if(param1[0][_loc3_ + 2])
                  {
                     §_-N1Z§(param1[0][_loc3_],param1[0][_loc3_ + 1]);
                  }
                  else
                  {
                     §_-O2O§(param1[0][_loc3_],param1[0][_loc3_ + 1]);
                  }
                  _loc3_ += 3;
               }
               §_-TA§();
               break;
            case §_-s2l§.§_-93s§:
               if(param1[0].length == 0)
               {
                  §_-A1I§ = false;
                  return;
               }
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  delete §_-W1t§[param1[0][_loc3_]];
                  delete §_-H1x§[param1[0][_loc3_]];
                  delete §_-SS§[param1[0][_loc3_]];
                  delete §_-B3s§[param1[0][_loc3_]];
                  packages.splice(packages.indexOf(param1[0][_loc3_]),1);
                  _loc3_++;
               }
               §_-A1I§ = false;
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_STORAGE_CHANGE));
               break;
            case §_-s2l§.§_-U1f§:
               if(param1[0] != 0)
               {
                  return;
               }
               §_-B3s§[param1[1]] = param1[2];
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_STORAGE_CHANGE_MAGIC));
         }
         §_-r1w§();
      }
      
      private static function §_-r1w§() : void
      {
         var _loc1_:int = 0;
         if(!§_-P2x§.§_-u21§)
         {
            return;
         }
         if(§_-m2I§.length == 0)
         {
            return;
         }
         for each(_loc1_ in §_-m2I§)
         {
            if(!§_-J2p§(§_-P2x§.§_-93Q§(_loc1_),§_-U1v§))
            {
               §_-R2f§(§_-U1v§,_loc1_);
            }
         }
      }
   }
}


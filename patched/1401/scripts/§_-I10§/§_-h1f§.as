package §_-I10§
{
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-qF§;
   
   public class §_-h1f§
   {
      
      public static const §_-A3r§:int = 0;
      
      public static const §_-03X§:int = 1;
      
      public static var §_-IS§:Array = [];
      
      public static var §_-51k§:Array = [];
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      private static var §_-B33§:Boolean = false;
      
      private static var packages:Array = [];
      
      private static var §_-Y2r§:Object = {};
      
      private static var §_-Z27§:Object = {};
      
      private static var §_-49§:Object = {};
      
      private static var §_-Ud§:Object = {};
      
      private static var accessories:Array = [];
      
      private static var §_-Ru§:Object = {};
      
      public function §_-h1f§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-M2J§,§_-S2I§.§_-e2H§,§_-S2I§.§_-W14§,§_-S2I§.§_-v2a§]);
         §_-01Y§.§_-c9§(§_-H5§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-62P§(param1:int) : Boolean
      {
         return §_-y2U§(param1) != 0;
      }
      
      public static function §_-Nf§(param1:int) : Boolean
      {
         return !§_-62P§(param1) && §_-j2e§.indexOf(param1) != -1;
      }
      
      public static function §_-vQ§(param1:int) : Boolean
      {
         return §_-IS§.indexOf(param1) != -1;
      }
      
      public static function §_-H1w§(param1:int) : Boolean
      {
         return §_-51k§.indexOf(param1) != -1;
      }
      
      public static function §_-ai§(param1:int, param2:int) : Boolean
      {
         switch(param2)
         {
            case §_-A3r§:
               return §_-vQ§(param1);
            case §_-03X§:
               return §_-H1w§(param1);
            default:
               return false;
         }
      }
      
      public static function §_-Y2o§(param1:int) : int
      {
         var _loc2_:int = 0;
         for each(_loc2_ in §_-IS§)
         {
            if(_loc2_ >= 0)
            {
               if(§_-g2W§.§_-018§(§_-g2W§.§_-X2e§(_loc2_)) == param1)
               {
                  return _loc2_;
               }
            }
         }
         return -1;
      }
      
      public static function get §_-Y1I§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < packages.length)
         {
            _loc1_.push(§_-g2W§.§_-X2e§(packages[_loc2_]));
            _loc2_++;
         }
         return §_-qF§.§_-yi§(_loc1_);
      }
      
      public static function §_-x1C§(param1:int) : Boolean
      {
         if(packages.indexOf(param1) == -1)
         {
            return false;
         }
         return §_-y2U§(param1) == 0 || §_-y2U§(param1) > Game.§_-nE§ + int(getTimer() / 1000);
      }
      
      public static function get §_-j2e§() : Array
      {
         return packages;
      }
      
      public static function get §_-s2p§() : Array
      {
         return accessories;
      }
      
      public static function §_-p1s§(param1:int) : int
      {
         if(param1 in §_-Y2r§)
         {
            return §_-Y2r§[param1];
         }
         return -1;
      }
      
      public static function get isScrat() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-IS§.length)
         {
            if(§_-g2W§.§_-91b§(§_-IS§[_loc1_]))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public static function get §_-SP§() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-IS§.length)
         {
            if(§_-g2W§.§_-W2e§(§_-IS§[_loc1_]))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public static function get §_-516§() : Boolean
      {
         return packages.indexOf(§_-g2W§.§_-q1G§) != -1;
      }
      
      public static function get §_-q2X§() : Boolean
      {
         return packages.indexOf(§_-g2W§.§_-qT§) != -1;
      }
      
      public static function §_-i21§(param1:int, param2:int) : Boolean
      {
         switch(param2)
         {
            case §_-A3r§:
               return packages.indexOf(param1) != -1;
            case §_-03X§:
               return accessories.indexOf(param1) != -1;
            default:
               return false;
         }
      }
      
      public static function §_-53U§(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case §_-A3r§:
               Connection.§_-Li§(§_-h2B§.§_-e2H§,param1,param2,1);
               break;
            case §_-03X§:
               Connection.§_-Li§(§_-h2B§.§_-e2H§,param1,param2,1);
         }
      }
      
      public static function §_-s1C§(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case §_-A3r§:
               Connection.§_-Li§(§_-h2B§.§_-e2H§,param1,param2,§_-vQ§(param2) ? 0 : 1);
               break;
            case §_-03X§:
               Connection.§_-Li§(§_-h2B§.§_-e2H§,param1,param2,§_-H1w§(param2) ? 0 : 1);
         }
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-I1X§);
      }
      
      public static function §_-E13§(param1:Array, param2:Array) : Array
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = _loc3_.concat(§_-g2W§.§_-w1D§(param1[_loc4_]));
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_ = _loc3_.concat(§_-g2W§.§_-Y2V§(param2[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function §_-y2U§(param1:int) : int
      {
         if(param1 in §_-Z27§)
         {
            return §_-Z27§[param1];
         }
         return 0;
      }
      
      public static function §_-Eo§(param1:int) : int
      {
         if(param1 in §_-49§)
         {
            return §_-49§[param1];
         }
         return 0;
      }
      
      public static function §_-L1b§(param1:int) : int
      {
         var _loc2_:* = int(packages.length - 1);
         while(_loc2_ >= 0)
         {
            if(!(!(packages[_loc2_] in §_-Ud§) || §_-Ud§[packages[_loc2_]] != param1))
            {
               return packages[_loc2_];
            }
            _loc2_--;
         }
         return -1;
      }
      
      private static function §_-83Y§(param1:int, param2:int) : Boolean
      {
         switch(param1)
         {
            case §_-A3r§:
               if(§_-vQ§(param2))
               {
                  return false;
               }
               §_-IS§.push(param2);
               break;
            case §_-03X§:
               if(§_-H1w§(param2))
               {
                  return false;
               }
               §_-51k§.push(param2);
         }
         return true;
      }
      
      private static function §_-q2v§(param1:int, param2:int) : Boolean
      {
         switch(param1)
         {
            case §_-A3r§:
               if(!§_-vQ§(param2))
               {
                  return false;
               }
               §_-IS§.splice(§_-IS§.indexOf(param2),1);
               break;
            case §_-03X§:
               if(!§_-H1w§(param2))
               {
                  return false;
               }
               §_-51k§.splice(§_-51k§.indexOf(param2),1);
         }
         return true;
      }
      
      private static function §_-h15§() : void
      {
         if(Game.self)
         {
            Game.self["worn_packages"] = §_-IS§.slice();
            Game.self["worn_accessories"] = §_-51k§.slice();
         }
         if(Hero.self)
         {
            Hero.self.heroView.setClothing(§_-IS§,§_-51k§);
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_HERO_CHANGE));
      }
      
      private static function §_-H5§() : void
      {
         var _loc2_:int = 0;
         if(§_-B33§)
         {
            return;
         }
         var _loc1_:int = Game.§_-nE§ + int(getTimer() / 1000);
         for each(_loc2_ in §_-Z27§)
         {
            if(_loc2_ > 0)
            {
               if(_loc2_ <= _loc1_)
               {
                  Connection.§_-Li§(§_-h2B§.§_-BN§,§_-h2B§.§_-F1b§);
                  Connection.§_-Li§(§_-h2B§.§_-BN§,§_-h2B§.§_-s2Z§);
                  §_-B33§ = true;
                  break;
               }
            }
         }
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-M2J§:
               _loc2_ = false;
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  packages.push(param1[0][_loc3_]);
                  §_-Y2r§[param1[0][_loc3_]] = param1[0][_loc3_ + 1];
                  §_-Z27§[param1[0][_loc3_]] = param1[0][_loc3_ + 2];
                  §_-49§[param1[0][_loc3_]] = param1[0][_loc3_ + 4];
                  §_-Ud§[param1[0][_loc3_]] = param1[0][_loc3_ + 5];
                  if(param1[0][_loc3_ + 3])
                  {
                     if(§_-83Y§(§_-A3r§,param1[0][_loc3_]))
                     {
                        _loc2_ = true;
                     }
                  }
                  else if(§_-q2v§(§_-A3r§,param1[0][_loc3_]))
                  {
                     _loc2_ = true;
                  }
                  _loc3_ += 6;
               }
               packages = §_-qF§.§_-yi§(packages);
               _loc3_ = 0;
               while(_loc3_ < param1[1].length)
               {
                  accessories.push(param1[1][_loc3_]);
                  §_-Ru§[param1[1][_loc3_]] = param1[1][_loc3_ + 2];
                  if(param1[1][_loc3_ + 1])
                  {
                     if(§_-83Y§(§_-03X§,param1[1][_loc3_]))
                     {
                        _loc2_ = true;
                     }
                  }
                  else if(§_-q2v§(§_-03X§,param1[1][_loc3_]))
                  {
                     _loc2_ = true;
                  }
                  _loc3_ += 3;
               }
               accessories = §_-qF§.§_-yi§(accessories);
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_STORAGE_CHANGE));
               if(_loc2_)
               {
                  §_-h15§();
               }
               break;
            case §_-S2I§.§_-e2H§:
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  if(param1[0][_loc3_ + 2])
                  {
                     §_-83Y§(param1[0][_loc3_],param1[0][_loc3_ + 1]);
                  }
                  else
                  {
                     §_-q2v§(param1[0][_loc3_],param1[0][_loc3_ + 1]);
                  }
                  _loc3_ += 3;
               }
               §_-h15§();
               break;
            case §_-S2I§.§_-W14§:
               if(param1[0].length == 0)
               {
                  §_-B33§ = false;
                  return;
               }
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  delete §_-Y2r§[param1[0][_loc3_]];
                  delete §_-Z27§[param1[0][_loc3_]];
                  delete §_-Ud§[param1[0][_loc3_]];
                  delete §_-49§[param1[0][_loc3_]];
                  packages.splice(packages.indexOf(param1[0][_loc3_]),1);
                  _loc3_++;
               }
               §_-B33§ = false;
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_STORAGE_CHANGE));
               break;
            case §_-S2I§.§_-v2a§:
               if(param1[0] != 0)
               {
                  return;
               }
               §_-49§[param1[1]] = param1[2];
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.CLOTHES_STORAGE_CHANGE_MAGIC));
         }
         §_-d1P§();
      }
      
      private static function §_-d1P§() : void
      {
         var _loc1_:int = 0;
         if(!§_-g2W§.§_-P20§)
         {
            return;
         }
         if(§_-IS§.length == 0)
         {
            return;
         }
         for each(_loc1_ in §_-IS§)
         {
            if(!§_-i21§(§_-g2W§.§_-s1h§(_loc1_),§_-A3r§))
            {
               §_-s1C§(§_-A3r§,_loc1_);
            }
         }
      }
   }
}


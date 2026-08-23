package §_-I10§
{
   import §_-S1D§.§_-V18§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-f22§
   {
      
      private static var §_-E1T§:int = -1;
      
      private static var §_-8y§:Object = {};
      
      private static var decorations:Array = [];
      
      private static var loaded:Boolean = false;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-f22§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-U2X§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function §_-q27§(param1:int) : Boolean
      {
         return decorations.indexOf(param1) != -1;
      }
      
      public static function set §_-a1r§(param1:int) : void
      {
         §_-E1T§ = param1;
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
      
      public static function get §_-a1r§() : int
      {
         return §_-E1T§;
      }
      
      public static function §_-r1O§(param1:int) : Boolean
      {
         var _loc2_:int = §_-I2h§.§_-eC§(param1);
         switch(_loc2_)
         {
            case §_-I2h§.§_-11b§:
               if(!(§_-I2h§.§_-Ka§ in §_-8y§) || §_-8y§[§_-I2h§.§_-Ka§] == -1)
               {
                  return false;
               }
               break;
            case §_-I2h§.§_-8P§:
               if(!(§_-I2h§.§_-m2O§ in §_-8y§) || §_-8y§[§_-I2h§.§_-m2O§] == -1)
               {
                  return false;
               }
         }
         return true;
      }
      
      public static function §_-E2I§(param1:int) : Boolean
      {
         var _loc2_:int = §_-I2h§.§_-eC§(param1);
         switch(_loc2_)
         {
            case §_-I2h§.§_-p1a§:
            case §_-I2h§.§_-j2V§:
            case §_-I2h§.§_-Z2Y§:
            case §_-I2h§.§_-Q2d§:
               return false;
            case §_-I2h§.§_-Ka§:
               if(§_-I2h§.§_-11b§ in §_-8y§ && §_-8y§[§_-I2h§.§_-11b§] != -1)
               {
                  return false;
               }
               break;
            case §_-I2h§.§_-m2O§:
               if(§_-I2h§.§_-8P§ in §_-8y§ && §_-8y§[§_-I2h§.§_-8P§] != -1)
               {
                  return false;
               }
         }
         return true;
      }
      
      public static function §_-sY§() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         if(loaded)
         {
            return;
         }
         loaded = true;
         var _loc2_:int = 0;
         while(_loc2_ < Game.self["interior"].length)
         {
            _loc1_ = §_-I2h§.§_-eC§(Game.self["interior"][_loc2_]);
            if(_loc1_ in §_-8y§)
            {
               _loc3_ = int(Game.self["interior"].indexOf(§_-8y§[_loc1_]));
               Game.self["interior"].splice(_loc3_,1);
               Connection.§_-Li§(§_-h2B§.INTERIOR_CHANGE,[§_-8y§[_loc1_],0]);
            }
            §_-8y§[_loc1_] = Game.self["interior"][_loc2_];
            _loc2_++;
         }
         §_-V18§.§_-R2G§();
      }
      
      public static function §_-72i§(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = §_-I2h§.§_-eC§(param1);
         if(§_-8y§[_loc2_] == param1)
         {
            return;
         }
         var _loc3_:Array = [param1,1];
         var _loc4_:int = _loc2_ in §_-8y§ ? int(§_-8y§[_loc2_]) : -1;
         if(_loc4_ != -1)
         {
            _loc5_ = int(Game.self["interior"].indexOf(_loc4_));
            Game.self["interior"].splice(_loc5_,1);
            _loc3_ = _loc3_.concat([_loc4_,0]);
         }
         §_-8y§[_loc2_] = param1;
         Game.self["interior"].push(param1);
         Connection.§_-Li§(§_-h2B§.INTERIOR_CHANGE,_loc3_);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
      
      public static function §_-j2F§(param1:int) : void
      {
         var _loc2_:int = §_-I2h§.§_-eC§(param1);
         if(§_-8y§[_loc2_] != param1)
         {
            return;
         }
         §_-8y§[_loc2_] = -1;
         var _loc3_:int = int(Game.self["interior"].indexOf(param1));
         Game.self["interior"].splice(_loc3_,1);
         Connection.§_-Li§(§_-h2B§.INTERIOR_CHANGE,[param1,0]);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         decorations = decorations.concat(param1[0]);
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
   }
}


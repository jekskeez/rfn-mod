package §_-X1k§
{
   import §_-61C§.§_-z1J§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-I2l§
   {
      
      private static var §_-4W§:int = -1;
      
      private static var §_-32h§:Object = {};
      
      private static var decorations:Array = [];
      
      private static var loaded:Boolean = false;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-I2l§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-sa§]);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function §_-b1x§(param1:int) : Boolean
      {
         return decorations.indexOf(param1) != -1;
      }
      
      public static function set §_-K2h§(param1:int) : void
      {
         §_-4W§ = param1;
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
      
      public static function get §_-K2h§() : int
      {
         return §_-4W§;
      }
      
      public static function §_-YW§(param1:int) : Boolean
      {
         var _loc2_:int = §_-m2r§.§_-iM§(param1);
         switch(_loc2_)
         {
            case §_-m2r§.§_-b1u§:
               if(!(§_-m2r§.§_-AN§ in §_-32h§) || §_-32h§[§_-m2r§.§_-AN§] == -1)
               {
                  return false;
               }
               break;
            case §_-m2r§.§_-64§:
               if(!(§_-m2r§.§_-8z§ in §_-32h§) || §_-32h§[§_-m2r§.§_-8z§] == -1)
               {
                  return false;
               }
         }
         return true;
      }
      
      public static function §_-qN§(param1:int) : Boolean
      {
         var _loc2_:int = §_-m2r§.§_-iM§(param1);
         switch(_loc2_)
         {
            case §_-m2r§.§_-n1E§:
            case §_-m2r§.§_-ed§:
            case §_-m2r§.§_-R1q§:
            case §_-m2r§.§_-A37§:
               return false;
            case §_-m2r§.§_-AN§:
               if(§_-m2r§.§_-b1u§ in §_-32h§ && §_-32h§[§_-m2r§.§_-b1u§] != -1)
               {
                  return false;
               }
               break;
            case §_-m2r§.§_-8z§:
               if(§_-m2r§.§_-64§ in §_-32h§ && §_-32h§[§_-m2r§.§_-64§] != -1)
               {
                  return false;
               }
         }
         return true;
      }
      
      public static function §_-C1q§() : void
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
            _loc1_ = §_-m2r§.§_-iM§(Game.self["interior"][_loc2_]);
            if(_loc1_ in §_-32h§)
            {
               _loc3_ = int(Game.self["interior"].indexOf(§_-32h§[_loc1_]));
               Game.self["interior"].splice(_loc3_,1);
               Connection.§_-e2T§(§_-u1O§.INTERIOR_CHANGE,[§_-32h§[_loc1_],0]);
            }
            §_-32h§[_loc1_] = Game.self["interior"][_loc2_];
            _loc2_++;
         }
         §_-z1J§.§_-S1j§();
      }
      
      public static function §_-KR§(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = §_-m2r§.§_-iM§(param1);
         if(§_-32h§[_loc2_] == param1)
         {
            return;
         }
         var _loc3_:Array = [param1,1];
         var _loc4_:int = _loc2_ in §_-32h§ ? int(§_-32h§[_loc2_]) : -1;
         if(_loc4_ != -1)
         {
            _loc5_ = int(Game.self["interior"].indexOf(_loc4_));
            Game.self["interior"].splice(_loc5_,1);
            _loc3_ = _loc3_.concat([_loc4_,0]);
         }
         §_-32h§[_loc2_] = param1;
         Game.self["interior"].push(param1);
         Connection.§_-e2T§(§_-u1O§.INTERIOR_CHANGE,_loc3_);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
      
      public static function §_-W2N§(param1:int) : void
      {
         var _loc2_:int = §_-m2r§.§_-iM§(param1);
         if(§_-32h§[_loc2_] != param1)
         {
            return;
         }
         §_-32h§[_loc2_] = -1;
         var _loc3_:int = int(Game.self["interior"].indexOf(param1));
         Game.self["interior"].splice(_loc3_,1);
         Connection.§_-e2T§(§_-u1O§.INTERIOR_CHANGE,[param1,0]);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         decorations = decorations.concat(param1[0]);
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.INTERIOR_CHANGE));
      }
   }
}


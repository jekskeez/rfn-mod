package §_-X1k§
{
   import §_-U19§.§_-B2U§;
   import §_-U2T§.§_-L1B§;
   import §_-U2T§.§_-uM§;
   import §_-c2C§.§_-t2c§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-cx§;
   
   public class §_-82O§
   {
      
      private static const §_-T2Q§:int = 1438549200;
      
      private static const §_-zh§:int = 604800;
      
      public static const §_-82V§:Number = 0.1;
      
      public static const §_-K3§:int = 0;
      
      public static const §_-OU§:int = 1;
      
      public static const §_-F2H§:int = 2;
      
      public static const §_-Kh§:int = 3;
      
      public static const §_-TH§:int = 0;
      
      public static const §_-M15§:int = 1;
      
      public static const PLAYER_TYPE:int = 0;
      
      public static const CLAN_TYPE:int = 1;
      
      public static const §_-x2G§:int = 1;
      
      private static var time:int = -1;
      
      private static var §_-b28§:Object = {};
      
      private static var §_-133§:Object = {};
      
      private static var §_-Y2Q§:Object = {};
      
      private static var §_-D1o§:Object = {};
      
      private static var §_-IN§:Object = {};
      
      private static var §_-AG§:Object = {};
      
      private static var §_-u21§:Object = {};
      
      private static var §_-K14§:Object = {};
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-82O§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-B5§,§_-s2l§.§_-x11§,§_-s2l§.§_-y1F§,§_-s2l§.§_-7§]);
         request();
         §_-Rd§(PLAYER_TYPE);
         §_-Rd§(CLAN_TYPE);
         addEventListener(GameEvent.LEAGUE_CHANGED,§_-G1C§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-hL§() : int
      {
         return (Game.§_-i24§ + int(getTimer() / 1000) - §_-T2Q§) / §_-zh§;
      }
      
      public static function §_-p1E§(param1:Array) : int
      {
         if(!param1)
         {
            return 0;
         }
         var _loc2_:int = §_-hL§ - 1;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] == _loc2_)
            {
               return param1[_loc3_ + 1];
            }
            _loc3_ += 2;
         }
         return 0;
      }
      
      public static function get §_-C1R§() : int
      {
         return time;
      }
      
      public static function §_-42M§(param1:int, param2:int) : void
      {
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.PLACE_CHANGED,{
            "type":param1,
            "value":param2
         }));
      }
      
      public static function §_-O2o§(param1:int, param2:int, param3:int) : void
      {
         switch(param2)
         {
            case PLAYER_TYPE:
               §_-IN§[param1] = param3;
               break;
            case CLAN_TYPE:
               §_-AG§[param1] = param3;
         }
      }
      
      public static function §_-3S§(param1:int, param2:int = 0) : int
      {
         switch(param2)
         {
            case PLAYER_TYPE:
               if(param1 in §_-IN§)
               {
                  return §_-IN§[param1];
               }
            case CLAN_TYPE:
               if(param1 in §_-AG§)
               {
                  return §_-AG§[param1];
               }
         }
         return -1;
      }
      
      public static function §_-T1q§(param1:int) : Array
      {
         if(param1 in §_-D1o§)
         {
            return §_-D1o§[param1];
         }
         return [];
      }
      
      public static function §_-n2K§(param1:int) : Array
      {
         if(param1 in §_-b28§)
         {
            return §_-b28§[param1];
         }
         return [];
      }
      
      public static function §_-h1C§(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         while(_loc3_ < §_-93H§.§_-B39§(param2))
         {
            if(§_-93H§.§_-V2W§(_loc3_,param2) > param1)
            {
               break;
            }
            _loc3_++;
         }
         return _loc3_ - 1;
      }
      
      public static function §_-PK§(param1:int) : int
      {
         switch(param1)
         {
            case PLAYER_TYPE:
               return Game.self["rating_score"];
            case CLAN_TYPE:
               return §_-B2U§.§_-Q2g§(Game.self["clan_id"]).§_-u2q§;
            default:
               return 0;
         }
      }
      
      public static function §_-QA§(param1:int) : int
      {
         if(§_-a15§(param1) == §_-93H§.§_-B39§(param1) - 1)
         {
            return 0;
         }
         if(§_-a15§(param1) != §_-h1C§(§_-PK§(param1),param1))
         {
            return 0;
         }
         return §_-93H§.§_-V2W§(§_-a15§(param1) + 1,param1) - §_-PK§(param1);
      }
      
      public static function §_-a15§(param1:int) : int
      {
         return §_-n2K§(param1).length == 0 ? 0 : §_-h1C§(§_-PK§(param1),param1);
      }
      
      public static function request() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-kB§);
      }
      
      public static function §_-Rd§(param1:int) : void
      {
         if(param1 in §_-K14§ && Boolean(§_-K14§[param1]))
         {
            return;
         }
         §_-K14§[param1] = true;
         Connection.§_-e2T§(§_-u1O§.§_-022§,param1);
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-B5§:
               if(param1[1] != §_-OU§ && param1[1] != §_-K3§)
               {
                  §_-x2X§(param1[1],param1[0]);
               }
               time = Math.max(1,param1[2]);
               _loc2_ = §_-n2K§(param1[0]).length == 0 == "4" in param1;
               §_-Y2Q§[param1[0]] = !("3" in param1) ? -1 : param1[3];
               §_-b28§[param1[0]] = !("4" in param1) ? [] : param1[4];
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.DIVISION_CHANGED,{"type":param1[0]}));
               if(_loc2_)
               {
                  §_-jx§.dispatchEvent(new GameEvent(GameEvent.LEAGUE_CHANGED,{
                     "value":§_-a15§(param1[0]),
                     "type":param1[0]
                  }));
                  if(Boolean(§_-a15§(param1[0]) > 0 && §_-u21§[param1[0]]) && Boolean(param1[1] == §_-OU§) && param1[0] != CLAN_TYPE)
                  {
                     showDialog(§_-a15§(param1[0]),param1[0]);
                  }
               }
               if(!§_-u21§[param1[0]] && time > 0)
               {
                  §_-p1V§.§_-63T§(§_-62z§);
                  §_-u21§[param1[0]] = true;
               }
               break;
            case §_-s2l§.§_-x11§:
               if(!(param1[0] in §_-b28§))
               {
                  return;
               }
               switch(param1[1])
               {
                  case §_-TH§:
                     (§_-b28§[param1[0]] as Array).push(param1[2]);
                     break;
                  case §_-M15§:
                     _loc6_ = (§_-b28§[param1[0]] as Array).indexOf(param1[2]);
                     if(_loc6_ != -1)
                     {
                        (§_-b28§[param1[0]] as Array).splice(_loc6_,1);
                     }
               }
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.DIVISION_CHANGED,{
                  "type":param1[0],
                  "reason":param1[1],
                  "delta":[param1[2]]
               }));
               break;
            case §_-s2l§.§_-y1F§:
               _loc3_ = !(param1[0] in §_-133§);
               _loc4_ = _loc3_ ? 0 : int(§_-133§[param1[0]]);
               §_-133§[param1[0]] = param1[1];
               if(param1[0] == PLAYER_TYPE)
               {
                  Game.self["rating_score"] = param1[1];
               }
               else if(param1[0] == CLAN_TYPE)
               {
                  §_-B2U§.§_-Q2g§(Game.self["clan_id"]).§_-u2q§ = param1[1];
               }
               §_-w1S§(_loc4_,§_-133§[param1[0]],param1[0],_loc3_);
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.RATING_CHANGED,{
                  "type":param1[0],
                  "value":§_-133§[param1[0]],
                  "delta":§_-133§[param1[0]] - _loc4_
               }));
               break;
            case §_-s2l§.§_-7§:
               §_-K14§[param1[0]] = false;
               _loc5_ = §_-T1q§(param1[0]);
               §_-D1o§[param1[0]] = param1[1];
               if(_loc5_.length == 0)
               {
                  §_-jx§.dispatchEvent(new GameEvent(GameEvent.TOP_CHANGED,{"type":param1[0]}));
               }
               else
               {
                  _loc7_ = §_-cx§.§_-i1c§(§_-T1q§(param1[0]),_loc5_);
                  _loc8_ = §_-cx§.§_-i1c§(_loc5_,§_-T1q§(param1[0]));
                  if(_loc7_.length != 0)
                  {
                     §_-jx§.dispatchEvent(new GameEvent(GameEvent.TOP_CHANGED,{
                        "type":param1[0],
                        "reason":§_-TH§,
                        "delta":_loc7_
                     }));
                  }
                  if(_loc8_.length != 0)
                  {
                     §_-jx§.dispatchEvent(new GameEvent(GameEvent.TOP_CHANGED,{
                        "type":param1[0],
                        "reason":§_-M15§,
                        "delta":_loc8_
                     }));
                  }
               }
         }
      }
      
      private static function §_-w1S§(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(§_-h1C§(param1,param3) == §_-h1C§(param2,param3) && !param4)
         {
            return;
         }
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.LEAGUE_CHANGED,{
            "value":§_-h1C§(param2,param3),
            "type":param3
         }));
         if(§_-a15§(param3) == 0 || param4)
         {
            return;
         }
         showDialog(§_-h1C§(param2,param3),param3);
      }
      
      private static function §_-G1C§(param1:GameEvent) : void
      {
         if(param1.data["value"] < §_-93H§.§_-B39§(param1.data["type"]) - 1)
         {
            return;
         }
         §_-Rd§(param1.data["type"]);
      }
      
      private static function showDialog(param1:int, param2:int) : void
      {
         var league:int = param1;
         var type:int = param2;
         §_-t2c§.addCallback(function():void
         {
            new §_-L1B§(league,type).show();
         });
      }
      
      private static function §_-x2X§(param1:int, param2:int) : void
      {
         var i:int;
         var value:int = 0;
         var state:int = param1;
         var type:int = param2;
         §_-jx§.dispatchEvent(new GameEvent(GameEvent.SEASON_CHANGED));
         if(type == PLAYER_TYPE)
         {
            Game.request(Game.selfId,§_-Y2E§.§_-t1a§ | §_-Y2E§.§_-w1y§,true);
            value = PLAYER_TYPE in §_-133§ ? int(§_-133§[PLAYER_TYPE]) : -1;
            §_-t2c§.addCallback(function():void
            {
               new §_-uM§(state,value,PLAYER_TYPE).show();
            });
            §_-IN§ = {};
         }
         else
         {
            §_-B2U§.request(Game.self["clan_id"],§_-eT§.§_-t1a§ | §_-eT§.§_-w1y§,true);
            value = CLAN_TYPE in §_-133§ ? int(§_-133§[CLAN_TYPE]) : -1;
            §_-t2c§.addCallback(function():void
            {
               new §_-uM§(state,value,CLAN_TYPE).show();
            });
            §_-AG§ = {};
         }
         §_-b28§ = {};
         §_-133§ = {};
         §_-D1o§ = {};
         i = 0;
         while(i < §_-x2G§)
         {
            §_-Rd§(i);
            i++;
         }
      }
      
      private static function §_-62z§() : void
      {
         if(time <= 0)
         {
            return;
         }
         --time;
         if(time <= 0)
         {
            request();
         }
      }
   }
}


package §_-I10§
{
   import §_-91§.§_-DD§;
   import §_-91§.§_-fD§;
   import §_-T2y§.§_-71o§;
   import §_-dc§.§_-e2W§;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-qF§;
   
   public class §_-13r§
   {
      
      private static const §_-83X§:int = 1438549200;
      
      private static const §_-72T§:int = 604800;
      
      public static const §_-1I§:Number = 0.1;
      
      public static const §_-F1U§:int = 0;
      
      public static const §_-I1g§:int = 1;
      
      public static const §_-l14§:int = 2;
      
      public static const §_-C2f§:int = 3;
      
      public static const §_-O2n§:int = 0;
      
      public static const §_-n1x§:int = 1;
      
      public static const PLAYER_TYPE:int = 0;
      
      public static const CLAN_TYPE:int = 1;
      
      public static const §_-6n§:int = 1;
      
      private static var time:int = -1;
      
      private static var §_-G1u§:Object = {};
      
      private static var §_-z1U§:Object = {};
      
      private static var §_-nS§:Object = {};
      
      private static var §_-t1T§:Object = {};
      
      private static var §_-RQ§:Object = {};
      
      private static var §_-S1§:Object = {};
      
      private static var §_-P20§:Object = {};
      
      private static var §_-014§:Object = {};
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-13r§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-P1y§,§_-S2I§.§_-x2a§,§_-S2I§.§_-52h§,§_-S2I§.§_-HZ§]);
         request();
         §_-Y1D§(PLAYER_TYPE);
         §_-Y1D§(CLAN_TYPE);
         addEventListener(GameEvent.LEAGUE_CHANGED,§_-K2x§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-fS§() : int
      {
         return (Game.§_-nE§ + int(getTimer() / 1000) - §_-83X§) / §_-72T§;
      }
      
      public static function §_-i1Z§(param1:Array) : int
      {
         if(!param1)
         {
            return 0;
         }
         var _loc2_:int = §_-fS§ - 1;
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
      
      public static function get §_-c1h§() : int
      {
         return time;
      }
      
      public static function §_-K29§(param1:int, param2:int) : void
      {
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.PLACE_CHANGED,{
            "type":param1,
            "value":param2
         }));
      }
      
      public static function §_-Y1x§(param1:int, param2:int, param3:int) : void
      {
         switch(param2)
         {
            case PLAYER_TYPE:
               §_-RQ§[param1] = param3;
               break;
            case CLAN_TYPE:
               §_-S1§[param1] = param3;
         }
      }
      
      public static function §_-B2w§(param1:int, param2:int = 0) : int
      {
         switch(param2)
         {
            case PLAYER_TYPE:
               if(param1 in §_-RQ§)
               {
                  return §_-RQ§[param1];
               }
            case CLAN_TYPE:
               if(param1 in §_-S1§)
               {
                  return §_-S1§[param1];
               }
         }
         return -1;
      }
      
      public static function §_-C3F§(param1:int) : Array
      {
         if(param1 in §_-t1T§)
         {
            return §_-t1T§[param1];
         }
         return [];
      }
      
      public static function §_-f12§(param1:int) : Array
      {
         if(param1 in §_-G1u§)
         {
            return §_-G1u§[param1];
         }
         return [];
      }
      
      public static function §_-K1M§(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         while(_loc3_ < §_-8S§.§_-Oh§(param2))
         {
            if(§_-8S§.§_-B18§(_loc3_,param2) > param1)
            {
               break;
            }
            _loc3_++;
         }
         return _loc3_ - 1;
      }
      
      public static function §_-4G§(param1:int) : int
      {
         switch(param1)
         {
            case PLAYER_TYPE:
               return Game.self["rating_score"];
            case CLAN_TYPE:
               return §_-e2W§.§_-W2X§(Game.self["clan_id"]).§_-t2n§;
            default:
               return 0;
         }
      }
      
      public static function §_-m1j§(param1:int) : int
      {
         if(§_-DX§(param1) == §_-8S§.§_-Oh§(param1) - 1)
         {
            return 0;
         }
         if(§_-DX§(param1) != §_-K1M§(§_-4G§(param1),param1))
         {
            return 0;
         }
         return §_-8S§.§_-B18§(§_-DX§(param1) + 1,param1) - §_-4G§(param1);
      }
      
      public static function §_-DX§(param1:int) : int
      {
         return §_-f12§(param1).length == 0 ? 0 : §_-K1M§(§_-4G§(param1),param1);
      }
      
      public static function request() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-s2L§);
      }
      
      public static function §_-Y1D§(param1:int) : void
      {
         if(param1 in §_-014§ && Boolean(§_-014§[param1]))
         {
            return;
         }
         §_-014§[param1] = true;
         Connection.§_-Li§(§_-h2B§.§_-FW§,param1);
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
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
            case §_-S2I§.§_-P1y§:
               if(param1[1] != §_-I1g§ && param1[1] != §_-F1U§)
               {
                  §_-13C§(param1[1],param1[0]);
               }
               time = Math.max(1,param1[2]);
               _loc2_ = §_-f12§(param1[0]).length == 0 == "4" in param1;
               §_-nS§[param1[0]] = !("3" in param1) ? -1 : param1[3];
               §_-G1u§[param1[0]] = !("4" in param1) ? [] : param1[4];
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DIVISION_CHANGED,{"type":param1[0]}));
               if(_loc2_)
               {
                  §_-u1o§.dispatchEvent(new GameEvent(GameEvent.LEAGUE_CHANGED,{
                     "value":§_-DX§(param1[0]),
                     "type":param1[0]
                  }));
                  if(Boolean(§_-DX§(param1[0]) > 0 && §_-P20§[param1[0]]) && Boolean(param1[1] == §_-I1g§) && param1[0] != CLAN_TYPE)
                  {
                     showDialog(§_-DX§(param1[0]),param1[0]);
                  }
               }
               if(!§_-P20§[param1[0]] && time > 0)
               {
                  §_-01Y§.§_-c9§(§_-A1b§);
                  §_-P20§[param1[0]] = true;
               }
               break;
            case §_-S2I§.§_-x2a§:
               if(!(param1[0] in §_-G1u§))
               {
                  return;
               }
               switch(param1[1])
               {
                  case §_-O2n§:
                     (§_-G1u§[param1[0]] as Array).push(param1[2]);
                     break;
                  case §_-n1x§:
                     _loc6_ = (§_-G1u§[param1[0]] as Array).indexOf(param1[2]);
                     if(_loc6_ != -1)
                     {
                        (§_-G1u§[param1[0]] as Array).splice(_loc6_,1);
                     }
               }
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.DIVISION_CHANGED,{
                  "type":param1[0],
                  "reason":param1[1],
                  "delta":[param1[2]]
               }));
               break;
            case §_-S2I§.§_-52h§:
               _loc3_ = !(param1[0] in §_-z1U§);
               _loc4_ = _loc3_ ? 0 : int(§_-z1U§[param1[0]]);
               §_-z1U§[param1[0]] = param1[1];
               if(param1[0] == PLAYER_TYPE)
               {
                  Game.self["rating_score"] = param1[1];
               }
               else if(param1[0] == CLAN_TYPE)
               {
                  §_-e2W§.§_-W2X§(Game.self["clan_id"]).§_-t2n§ = param1[1];
               }
               §_-N9§(_loc4_,§_-z1U§[param1[0]],param1[0],_loc3_);
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.RATING_CHANGED,{
                  "type":param1[0],
                  "value":§_-z1U§[param1[0]],
                  "delta":§_-z1U§[param1[0]] - _loc4_
               }));
               break;
            case §_-S2I§.§_-HZ§:
               §_-014§[param1[0]] = false;
               _loc5_ = §_-C3F§(param1[0]);
               §_-t1T§[param1[0]] = param1[1];
               if(_loc5_.length == 0)
               {
                  §_-u1o§.dispatchEvent(new GameEvent(GameEvent.TOP_CHANGED,{"type":param1[0]}));
               }
               else
               {
                  _loc7_ = §_-qF§.§_-D1h§(§_-C3F§(param1[0]),_loc5_);
                  _loc8_ = §_-qF§.§_-D1h§(_loc5_,§_-C3F§(param1[0]));
                  if(_loc7_.length != 0)
                  {
                     §_-u1o§.dispatchEvent(new GameEvent(GameEvent.TOP_CHANGED,{
                        "type":param1[0],
                        "reason":§_-O2n§,
                        "delta":_loc7_
                     }));
                  }
                  if(_loc8_.length != 0)
                  {
                     §_-u1o§.dispatchEvent(new GameEvent(GameEvent.TOP_CHANGED,{
                        "type":param1[0],
                        "reason":§_-n1x§,
                        "delta":_loc8_
                     }));
                  }
               }
         }
      }
      
      private static function §_-N9§(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(§_-K1M§(param1,param3) == §_-K1M§(param2,param3) && !param4)
         {
            return;
         }
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.LEAGUE_CHANGED,{
            "value":§_-K1M§(param2,param3),
            "type":param3
         }));
         if(§_-DX§(param3) == 0 || param4)
         {
            return;
         }
         showDialog(§_-K1M§(param2,param3),param3);
      }
      
      private static function §_-K2x§(param1:GameEvent) : void
      {
         if(param1.data["value"] < §_-8S§.§_-Oh§(param1.data["type"]) - 1)
         {
            return;
         }
         §_-Y1D§(param1.data["type"]);
      }
      
      private static function showDialog(param1:int, param2:int) : void
      {
         var league:int = param1;
         var type:int = param2;
         §_-71o§.addCallback(function():void
         {
            new §_-DD§(league,type).show();
         });
      }
      
      private static function §_-13C§(param1:int, param2:int) : void
      {
         var i:int;
         var value:int = 0;
         var state:int = param1;
         var type:int = param2;
         §_-u1o§.dispatchEvent(new GameEvent(GameEvent.SEASON_CHANGED));
         if(type == PLAYER_TYPE)
         {
            Game.request(Game.selfId,§_-hF§.§_-Ng§ | §_-hF§.§_-81Z§,true);
            value = PLAYER_TYPE in §_-z1U§ ? int(§_-z1U§[PLAYER_TYPE]) : -1;
            §_-71o§.addCallback(function():void
            {
               new §_-fD§(state,value,PLAYER_TYPE).show();
            });
            §_-RQ§ = {};
         }
         else
         {
            §_-e2W§.request(Game.self["clan_id"],§_-Oy§.§_-Ng§ | §_-Oy§.§_-81Z§,true);
            value = CLAN_TYPE in §_-z1U§ ? int(§_-z1U§[CLAN_TYPE]) : -1;
            §_-71o§.addCallback(function():void
            {
               new §_-fD§(state,value,CLAN_TYPE).show();
            });
            §_-S1§ = {};
         }
         §_-G1u§ = {};
         §_-z1U§ = {};
         §_-t1T§ = {};
         i = 0;
         while(i < §_-6n§)
         {
            §_-Y1D§(i);
            i++;
         }
      }
      
      private static function §_-A1b§() : void
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


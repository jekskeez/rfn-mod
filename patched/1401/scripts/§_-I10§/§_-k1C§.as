package §_-I10§
{
   import §_-61U§.§_-in§;
   import §_-68§.§_-EI§;
   import §_-f1x§.§_-72Y§;
   import §_-f1x§.§_-W2G§;
   import §_-k1c§.DialogRepost;
   import com.api.Player;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-73l§;
   import utils.§_-Y25§;
   import utils.§_-qF§;
   
   public class §_-k1C§
   {
      
      public static var §_-dC§:int = -1;
      
      public static var §_-g§:int = -1;
      
      public static var §_-G1c§:Vector.<§_-Y25§> = new Vector.<§_-Y25§>();
      
      public static var §_-D1W§:Vector.<§_-Y25§> = new Vector.<§_-Y25§>();
      
      private static var §_-02G§:Array = null;
      
      private static var §_-f2T§:Array = null;
      
      private static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public function §_-k1C§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-vy§.§_-U2M§.length)
         {
            §_-G1c§.push(new §_-Y25§());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < §_-vy§.§_-C3T§.length)
         {
            §_-D1W§.push(new §_-Y25§());
            _loc1_++;
         }
         Connection.listen(§_-o2C§,[§_-S2I§.§_-3C§,§_-S2I§.COLLECTION_PICKUP,§_-S2I§.§_-x2e§,§_-S2I§.§_-C§,§_-S2I§.§_-63o§,§_-S2I§.§_-13Z§]);
         Game.self.addEventListener(§_-hF§.§_-C§,§_-P9§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-u1o§.removeEventListener(param1,param2);
      }
      
      public static function get §_-Zy§() : Boolean
      {
         return §_-dC§ != -1;
      }
      
      public static function §_-vr§(param1:int) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-x2e§,§_-vy§.§_-N§,param1);
      }
      
      public static function §_-e1c§(param1:int) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-x2e§,§_-vy§.§_-Ro§,param1);
      }
      
      public static function §_-o0§(param1:int, param2:int, param3:int = 1) : void
      {
         §_-X1y§(Game.selfId,param1,param2,param3);
      }
      
      public static function §_-Mv§(param1:int, param2:int, param3:int = 1) : void
      {
         §_-I1O§(Game.selfId,param1,param2,param3);
      }
      
      public static function §_-n1T§(param1:int) : void
      {
         if(!§_-02G§ || §_-02G§.indexOf(param1) != -1)
         {
            return;
         }
         var _loc2_:Boolean = §_-W2G§.§_-n1T§(param1);
         if(!_loc2_)
         {
            return;
         }
         §_-W2G§.§_-K2Y§(param1,true);
         Connection.§_-Li§(§_-h2B§.§_-ZZ§,[param1]);
         §_-f2T§ = §_-02G§.slice();
         Game.self["collection_exchange"] = §_-02G§;
      }
      
      public static function §_-72N§(param1:int, param2:Boolean = false) : void
      {
         if(!§_-02G§)
         {
            return;
         }
         var _loc3_:int = §_-02G§.indexOf(param1);
         if(_loc3_ == -1)
         {
            return;
         }
         §_-02G§.splice(_loc3_,1);
         if(param2)
         {
            §_-f2T§ = §_-02G§.slice();
         }
         if(!§_-W2G§.§_-P20§)
         {
            return;
         }
         §_-W2G§.§_-K2Y§(param1,false);
         §_-W2G§.§_-72N§(param1);
         Connection.§_-Li§(§_-h2B§.§_-a1§,[param1]);
         §_-f2T§ = §_-02G§.slice();
         Game.self["collection_exchange"] = §_-02G§;
      }
      
      public static function §_-Qb§() : void
      {
         if(!§_-02G§)
         {
            return;
         }
         if(!§_-f2T§)
         {
            §_-f2T§ = §_-02G§.slice();
            return;
         }
         var _loc1_:Boolean = §_-qF§.§_-J3§(§_-02G§,§_-f2T§);
         if(_loc1_)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < §_-f2T§.length)
         {
            if(§_-02G§.indexOf(§_-f2T§[_loc4_]) == -1)
            {
               _loc2_.push(§_-f2T§[_loc4_]);
               Game.self["collection_exchange"].splice(Game.self["collection_exchange"].indexOf(§_-f2T§[_loc4_]),1);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < §_-02G§.length)
         {
            if(§_-f2T§.indexOf(§_-02G§[_loc4_]) == -1)
            {
               _loc3_.push(§_-02G§[_loc4_]);
               Game.self["collection_exchange"].push(§_-02G§[_loc4_]);
            }
            _loc4_++;
         }
         §_-f2T§ = §_-02G§.slice();
         if(_loc2_.length != 0)
         {
            Connection.§_-Li§(§_-h2B§.§_-a1§,_loc2_);
         }
         if(_loc3_.length != 0)
         {
            Connection.§_-Li§(§_-h2B§.§_-ZZ§,_loc3_);
         }
      }
      
      public static function get §_-93B§() : Boolean
      {
         if(§_-02G§ == null)
         {
            return true;
         }
         return §_-02G§.length == 0;
      }
      
      public static function get §_-h1G§() : Array
      {
         return §_-02G§;
      }
      
      public static function §_-A1B§() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(§_-D1W§.length);
         while(_loc2_ < _loc3_)
         {
            if("set" in §_-vy§.§_-C3T§[_loc2_])
            {
               _loc1_ = true;
               for each(_loc4_ in §_-vy§.§_-C3T§[_loc2_]["set"])
               {
                  _loc1_ &&= §_-G1c§[_loc4_].count > 0;
               }
               if(_loc1_)
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      public static function §_-sY§() : void
      {
         §_-W2G§.§_-k1i§(§_-G1c§,§_-D1W§);
         if(!§_-02G§)
         {
            §_-W2G§.§_-TU§([]);
            §_-72Y§.§_-k1i§(§_-D1W§);
            §_-72Y§.§_-12G§();
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < §_-02G§.length)
         {
            if("icon" in §_-vy§.§_-U2M§[§_-02G§[_loc1_]])
            {
               §_-W2G§.§_-K2Y§(§_-02G§[_loc1_],true);
            }
            _loc1_++;
         }
         §_-W2G§.§_-TU§(§_-02G§);
         §_-72Y§.§_-k1i§(§_-D1W§);
         §_-72Y§.§_-12G§();
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var data:Array = null;
         var i:int = 0;
         var packet:§_-S2I§ = param1;
         switch(packet.type)
         {
            case §_-S2I§.§_-3C§:
               data = packet[0];
               i = 0;
               while(i < data.length)
               {
                  switch(data[i])
                  {
                     case §_-vy§.§_-13q§:
                        §_-G1c§[data[i + 1]].count = data[i + 2];
                        break;
                     case §_-vy§.§_-N§:
                        §_-D1W§[data[i + 1]].count = data[i + 2];
                  }
                  i += 3;
               }
               break;
            case §_-S2I§.COLLECTION_PICKUP:
               §_-G1c§[packet[0]].count += packet[1];
               §_-u1o§.dispatchEvent(new GameEvent(GameEvent.COLLECTION_PICKUP,{
                  "id":packet[0],
                  "value":packet[1]
               }));
               break;
            case §_-S2I§.§_-x2e§:
               if(packet[1] == §_-vy§.§_-N§)
               {
                  §_-W2G§.§_-31O§(packet[0] == §_-S2I§.§_-B15§,packet[2]);
               }
               else if(packet[1] == §_-vy§.§_-Ro§)
               {
                  §_-72Y§.§_-31O§(packet[0] == §_-S2I§.§_-B15§,packet[2]);
               }
               if(packet[0] == §_-S2I§.§_-w1M§)
               {
                  break;
               }
               switch(packet[1])
               {
                  case §_-vy§.§_-N§:
                     if(§_-D1W§ == null || !(packet[2] in §_-D1W§))
                     {
                        break;
                     }
                     §_-I1O§(Game.selfId,§_-vy§.§_-N§,packet[2]);
                     new DialogRepost(§_-73l§.WALL_COLLECTION_UNIQUE,packet[2]).show();
                     break;
                  case §_-vy§.§_-Ro§:
                     new DialogRepost(§_-73l§.WALL_COLLECTION_AWARD,packet[2]).show();
                     if(§_-72Y§.§_-P20§)
                     {
                        §_-72Y§.§_-12G§();
                     }
               }
               break;
            case §_-S2I§.§_-C§:
               if(packet[1] == Game.selfId)
               {
                  §_-EI§.load(function():void
                  {
                     new §_-in§(packet[3],packet[4],packet[0] == §_-S2I§.§_-617§).show();
                  },true);
               }
               if(packet[0] == §_-S2I§.§_-236§)
               {
                  return;
               }
               if(packet[1] == Game.selfId)
               {
                  §_-72N§(packet[3],true);
               }
               else
               {
                  §_-72N§(packet[4],true);
               }
               §_-X1y§(packet[1],§_-vy§.§_-13q§,packet[3]);
               §_-X1y§(packet[2],§_-vy§.§_-13q§,packet[4]);
               §_-I1O§(packet[1],§_-vy§.§_-13q§,packet[4]);
               §_-I1O§(packet[2],§_-vy§.§_-13q§,packet[3]);
               break;
            case §_-S2I§.§_-13Z§:
               §_-k1C§.§_-dC§ = -1;
               §_-k1C§.§_-g§ = -1;
               break;
            case §_-S2I§.§_-63o§:
               if(packet[0] != Game.selfId)
               {
                  return;
               }
               §_-k1C§.§_-dC§ = packet[2];
               §_-k1C§.§_-g§ = packet[1];
         }
      }
      
      private static function §_-X1y§(param1:int, param2:int, param3:int, param4:int = 1) : void
      {
         var _loc6_:int = 0;
         var _loc5_:Player = Game.getPlayer(param1);
         if("collection_exchange" in _loc5_ && param2 == §_-vy§.§_-13q§)
         {
            _loc6_ = int(_loc5_["collection_exchange"].indexOf(param3));
            if(_loc6_ != -1)
            {
               _loc5_["collection_exchange"].splice(_loc6_,1);
            }
         }
         if(param1 != Game.selfId)
         {
            return;
         }
         switch(param2)
         {
            case §_-vy§.§_-13q§:
               §_-G1c§[param3].count = Math.max(§_-G1c§[param3].count - param4,0);
               break;
            case §_-vy§.§_-N§:
               §_-D1W§[param3].count = Math.max(§_-D1W§[param3].count - param4,0);
         }
      }
      
      private static function §_-I1O§(param1:int, param2:int, param3:int, param4:int = 1) : void
      {
         if(param1 != Game.selfId)
         {
            return;
         }
         if(param2 == §_-vy§.§_-13q§)
         {
            §_-G1c§[param3].count += param4;
         }
         if(param2 == §_-vy§.§_-N§)
         {
            §_-D1W§[param3].count += param4;
         }
      }
      
      private static function §_-P9§(param1:Player) : void
      {
         Game.self.removeEventListener(§_-P9§);
         §_-02G§ = Game.self["collection_exchange"].slice();
         §_-f2T§ = §_-02G§.slice();
         var _loc2_:* = 0;
         while(_loc2_ < §_-02G§.length)
         {
            if("icon" in §_-vy§.§_-U2M§[§_-02G§[_loc2_]])
            {
               if(§_-G1c§[§_-02G§[_loc2_]].count < 2)
               {
                  §_-02G§.splice(_loc2_,1);
                  _loc2_--;
               }
            }
            _loc2_++;
         }
         if(§_-A1B§())
         {
            §_-fO§.show(NotificationManager.§_-M0§);
         }
      }
   }
}


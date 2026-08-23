package §_-X1k§
{
   import §_-5T§.§_-22e§;
   import §_-5T§.§_-S2l§;
   import §_-bN§.DialogRepost;
   import §_-i2A§.§_-r2z§;
   import §_-s2e§.§_-U2d§;
   import com.api.Player;
   import events.GameEvent;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-Y11§;
   import utils.§_-cx§;
   import utils.§_-j2O§;
   
   public class §_-WS§
   {
      
      public static var §_-y23§:int = -1;
      
      public static var §_-Z3§:int = -1;
      
      public static var §_-2P§:Vector.<§_-Y11§> = new Vector.<§_-Y11§>();
      
      public static var §_-c8§:Vector.<§_-Y11§> = new Vector.<§_-Y11§>();
      
      private static var §_-l2Y§:Array = null;
      
      private static var §_-61§:Array = null;
      
      private static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public function §_-WS§()
      {
         super();
      }
      
      public static function init() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-42H§.§_-U13§.length)
         {
            §_-2P§.push(new §_-Y11§());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < §_-42H§.§_-V10§.length)
         {
            §_-c8§.push(new §_-Y11§());
            _loc1_++;
         }
         Connection.listen(§_-x2f§,[§_-s2l§.§_-9h§,§_-s2l§.COLLECTION_PICKUP,§_-s2l§.§_-130§,§_-s2l§.§_-CN§,§_-s2l§.§_-kF§,§_-s2l§.§_-c2r§]);
         Game.self.addEventListener(§_-Y2E§.§_-CN§,§_-Y16§);
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.addEventListener(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         §_-jx§.removeEventListener(param1,param2);
      }
      
      public static function get §_-m1b§() : Boolean
      {
         return §_-y23§ != -1;
      }
      
      public static function §_-h1v§(param1:int) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-130§,§_-42H§.§_-zL§,param1);
      }
      
      public static function §_-o1s§(param1:int) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-130§,§_-42H§.§_-R1m§,param1);
      }
      
      public static function §_-U1X§(param1:int, param2:int, param3:int = 1) : void
      {
         §_-y17§(Game.selfId,param1,param2,param3);
      }
      
      public static function §_-D2§(param1:int, param2:int, param3:int = 1) : void
      {
         §_-Aa§(Game.selfId,param1,param2,param3);
      }
      
      public static function §_-e2E§(param1:int) : void
      {
         if(!§_-l2Y§ || §_-l2Y§.indexOf(param1) != -1)
         {
            return;
         }
         var _loc2_:Boolean = §_-S2l§.§_-e2E§(param1);
         if(!_loc2_)
         {
            return;
         }
         §_-S2l§.§_-21R§(param1,true);
         Connection.§_-e2T§(§_-u1O§.§_-x1A§,[param1]);
         §_-61§ = §_-l2Y§.slice();
         Game.self["collection_exchange"] = §_-l2Y§;
      }
      
      public static function §_-eL§(param1:int, param2:Boolean = false) : void
      {
         if(!§_-l2Y§)
         {
            return;
         }
         var _loc3_:int = §_-l2Y§.indexOf(param1);
         if(_loc3_ == -1)
         {
            return;
         }
         §_-l2Y§.splice(_loc3_,1);
         if(param2)
         {
            §_-61§ = §_-l2Y§.slice();
         }
         if(!§_-S2l§.§_-u21§)
         {
            return;
         }
         §_-S2l§.§_-21R§(param1,false);
         §_-S2l§.§_-eL§(param1);
         Connection.§_-e2T§(§_-u1O§.§_-22K§,[param1]);
         §_-61§ = §_-l2Y§.slice();
         Game.self["collection_exchange"] = §_-l2Y§;
      }
      
      public static function §_-N14§() : void
      {
         if(!§_-l2Y§)
         {
            return;
         }
         if(!§_-61§)
         {
            §_-61§ = §_-l2Y§.slice();
            return;
         }
         var _loc1_:Boolean = §_-cx§.§_-83G§(§_-l2Y§,§_-61§);
         if(_loc1_)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < §_-61§.length)
         {
            if(§_-l2Y§.indexOf(§_-61§[_loc4_]) == -1)
            {
               _loc2_.push(§_-61§[_loc4_]);
               Game.self["collection_exchange"].splice(Game.self["collection_exchange"].indexOf(§_-61§[_loc4_]),1);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < §_-l2Y§.length)
         {
            if(§_-61§.indexOf(§_-l2Y§[_loc4_]) == -1)
            {
               _loc3_.push(§_-l2Y§[_loc4_]);
               Game.self["collection_exchange"].push(§_-l2Y§[_loc4_]);
            }
            _loc4_++;
         }
         §_-61§ = §_-l2Y§.slice();
         if(_loc2_.length != 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-22K§,_loc2_);
         }
         if(_loc3_.length != 0)
         {
            Connection.§_-e2T§(§_-u1O§.§_-x1A§,_loc3_);
         }
      }
      
      public static function get §_-qT§() : Boolean
      {
         if(§_-l2Y§ == null)
         {
            return true;
         }
         return §_-l2Y§.length == 0;
      }
      
      public static function get §_-l2b§() : Array
      {
         return §_-l2Y§;
      }
      
      public static function §_-c1e§() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(§_-c8§.length);
         while(_loc2_ < _loc3_)
         {
            if("set" in §_-42H§.§_-V10§[_loc2_])
            {
               _loc1_ = true;
               for each(_loc4_ in §_-42H§.§_-V10§[_loc2_]["set"])
               {
                  _loc1_ &&= §_-2P§[_loc4_].count > 0;
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
      
      public static function §_-C1q§() : void
      {
         §_-S2l§.§_-s1l§(§_-2P§,§_-c8§);
         if(!§_-l2Y§)
         {
            §_-S2l§.§_-t1M§([]);
            §_-22e§.§_-s1l§(§_-c8§);
            §_-22e§.§_-tx§();
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < §_-l2Y§.length)
         {
            if("icon" in §_-42H§.§_-U13§[§_-l2Y§[_loc1_]])
            {
               §_-S2l§.§_-21R§(§_-l2Y§[_loc1_],true);
            }
            _loc1_++;
         }
         §_-S2l§.§_-t1M§(§_-l2Y§);
         §_-22e§.§_-s1l§(§_-c8§);
         §_-22e§.§_-tx§();
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var data:Array = null;
         var i:int = 0;
         var packet:§_-s2l§ = param1;
         switch(packet.type)
         {
            case §_-s2l§.§_-9h§:
               data = packet[0];
               i = 0;
               while(i < data.length)
               {
                  switch(data[i])
                  {
                     case §_-42H§.§_-R2h§:
                        §_-2P§[data[i + 1]].count = data[i + 2];
                        break;
                     case §_-42H§.§_-zL§:
                        §_-c8§[data[i + 1]].count = data[i + 2];
                  }
                  i += 3;
               }
               break;
            case §_-s2l§.COLLECTION_PICKUP:
               §_-2P§[packet[0]].count += packet[1];
               §_-jx§.dispatchEvent(new GameEvent(GameEvent.COLLECTION_PICKUP,{
                  "id":packet[0],
                  "value":packet[1]
               }));
               break;
            case §_-s2l§.§_-130§:
               if(packet[1] == §_-42H§.§_-zL§)
               {
                  §_-S2l§.§_-g2U§(packet[0] == §_-s2l§.§_-322§,packet[2]);
               }
               else if(packet[1] == §_-42H§.§_-R1m§)
               {
                  §_-22e§.§_-g2U§(packet[0] == §_-s2l§.§_-322§,packet[2]);
               }
               if(packet[0] == §_-s2l§.§_-T2x§)
               {
                  break;
               }
               switch(packet[1])
               {
                  case §_-42H§.§_-zL§:
                     if(§_-c8§ == null || !(packet[2] in §_-c8§))
                     {
                        break;
                     }
                     §_-Aa§(Game.selfId,§_-42H§.§_-zL§,packet[2]);
                     new DialogRepost(§_-j2O§.WALL_COLLECTION_UNIQUE,packet[2]).show();
                     break;
                  case §_-42H§.§_-R1m§:
                     new DialogRepost(§_-j2O§.WALL_COLLECTION_AWARD,packet[2]).show();
                     if(§_-22e§.§_-u21§)
                     {
                        §_-22e§.§_-tx§();
                     }
               }
               break;
            case §_-s2l§.§_-CN§:
               if(packet[1] == Game.selfId)
               {
                  §_-U2d§.load(function():void
                  {
                     new §_-r2z§(packet[3],packet[4],packet[0] == §_-s2l§.§_-FN§).show();
                  },true);
               }
               if(packet[0] == §_-s2l§.§_-cG§)
               {
                  return;
               }
               if(packet[1] == Game.selfId)
               {
                  §_-eL§(packet[3],true);
               }
               else
               {
                  §_-eL§(packet[4],true);
               }
               §_-y17§(packet[1],§_-42H§.§_-R2h§,packet[3]);
               §_-y17§(packet[2],§_-42H§.§_-R2h§,packet[4]);
               §_-Aa§(packet[1],§_-42H§.§_-R2h§,packet[4]);
               §_-Aa§(packet[2],§_-42H§.§_-R2h§,packet[3]);
               break;
            case §_-s2l§.§_-c2r§:
               §_-WS§.§_-y23§ = -1;
               §_-WS§.§_-Z3§ = -1;
               break;
            case §_-s2l§.§_-kF§:
               if(packet[0] != Game.selfId)
               {
                  return;
               }
               §_-WS§.§_-y23§ = packet[2];
               §_-WS§.§_-Z3§ = packet[1];
         }
      }
      
      private static function §_-y17§(param1:int, param2:int, param3:int, param4:int = 1) : void
      {
         var _loc6_:int = 0;
         var _loc5_:Player = Game.getPlayer(param1);
         if("collection_exchange" in _loc5_ && param2 == §_-42H§.§_-R2h§)
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
            case §_-42H§.§_-R2h§:
               §_-2P§[param3].count = Math.max(§_-2P§[param3].count - param4,0);
               break;
            case §_-42H§.§_-zL§:
               §_-c8§[param3].count = Math.max(§_-c8§[param3].count - param4,0);
         }
      }
      
      private static function §_-Aa§(param1:int, param2:int, param3:int, param4:int = 1) : void
      {
         if(param1 != Game.selfId)
         {
            return;
         }
         if(param2 == §_-42H§.§_-R2h§)
         {
            §_-2P§[param3].count += param4;
         }
         if(param2 == §_-42H§.§_-zL§)
         {
            §_-c8§[param3].count += param4;
         }
      }
      
      private static function §_-Y16§(param1:Player) : void
      {
         Game.self.removeEventListener(§_-Y16§);
         §_-l2Y§ = Game.self["collection_exchange"].slice();
         §_-61§ = §_-l2Y§.slice();
         var _loc2_:* = 0;
         while(_loc2_ < §_-l2Y§.length)
         {
            if("icon" in §_-42H§.§_-U13§[§_-l2Y§[_loc2_]])
            {
               if(§_-2P§[§_-l2Y§[_loc2_]].count < 2)
               {
                  §_-l2Y§.splice(_loc2_,1);
                  _loc2_--;
               }
            }
            _loc2_++;
         }
         if(§_-c1e§())
         {
            §_-L1H§.show(NotificationManager.§_-Xd§);
         }
      }
   }
}


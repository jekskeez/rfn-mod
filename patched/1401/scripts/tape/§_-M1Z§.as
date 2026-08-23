package tape
{
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-r2Y§.TapeDataEvent;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.GameEvent;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import views.§_-82F§;
   
   public class §_-M1Z§ extends §_-y1x§
   {
      
      public static const §_-s1u§:int = 0;
      
      public static const §_-135§:int = 1;
      
      public static const §_-12F§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-31X§ | §_-hF§.§_-P13§ | §_-hF§.§_-B3k§ | §_-hF§.§_-N2C§ | §_-hF§.§_-329§ | §_-hF§.§_-k2y§;
      
      public var §_-Ld§:§_-82F§;
      
      private var §_-21p§:String = "";
      
      private var §_-Q23§:int = 0;
      
      public function §_-M1Z§(param1:String = "", param2:int = 0)
      {
         super();
         this.§_-Ld§ = new §_-82F§();
         this.§_-21p§ = param1;
         this.§_-Q23§ = param2;
         this.§_-vE§ = §_-12F§;
         Game.listen(this.§_-S1E§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-v1k§,§_-S2I§.§_-t2k§,§_-S2I§.§_-J2A§]);
      }
      
      private static function §_-Tn§(param1:TapePlayer, param2:TapePlayer) : int
      {
         if(param1.player["clan_duty"] == Clan.§_-jY§ && param2.player["clan_duty"] != Clan.§_-jY§)
         {
            return -1;
         }
         if(param1.player["clan_duty"] != Clan.§_-jY§ && param2.player["clan_duty"] == Clan.§_-jY§)
         {
            return 1;
         }
         if(param1.player["exp"] < param2.player["exp"])
         {
            return 1;
         }
         return -1;
      }
      
      private static function §_-Z1k§(param1:TapePlayer, param2:TapePlayer) : int
      {
         if(param1.player["clan_duty"] == Clan.§_-jY§ && param2.player["clan_duty"] != Clan.§_-jY§)
         {
            return -1;
         }
         if(param1.player["clan_duty"] != Clan.§_-jY§ && param2.player["clan_duty"] == Clan.§_-jY§)
         {
            return 1;
         }
         if(Boolean(param1.player["online"]) && !param2.player["online"])
         {
            return -1;
         }
         if(!param1.player["online"] && Boolean(param2.player["online"]))
         {
            return 1;
         }
         if(param1.player["last_online"] < param2.player["last_online"])
         {
            return 1;
         }
         return -1;
      }
      
      override protected function §_-Y1n§() : void
      {
         if(this.§_-Q23§ == §_-135§)
         {
            this.objects.sort(§_-Z1k§);
         }
         else
         {
            this.objects.sort(§_-Tn§);
         }
      }
      
      public function §_-i5§() : void
      {
         this.§_-Y1n§();
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      public function §_-z1G§(param1:int) : void
      {
         this.§_-Q23§ = param1;
      }
      
      public function §_-I1b§(param1:String) : Vector.<§_-K2k§>
      {
         var _loc2_:Vector.<§_-K2k§> = new Vector.<§_-K2k§>();
         var _loc3_:int = 0;
         while(_loc3_ < this.objects.length)
         {
            if(!((this.objects[_loc3_] as TapePlayer).player == null || ((this.objects[_loc3_] as TapePlayer).player as Player).name.toLowerCase().indexOf(param1.toLowerCase()) == -1))
            {
               _loc2_.push(this.objects[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function §_-U1w§(param1:Vector.<§_-K2k§>) : void
      {
         this.objects = param1;
      }
      
      public function remove(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            if((this.objects[_loc2_] as TapePlayer).playerId == param1)
            {
               this.objects[_loc2_].forget(§_-YC§);
               this.objects.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Clan = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-v1k§:
               if(Game.self["clan_id"] != param1[0] || this.§_-21p§ != "")
               {
                  return;
               }
               _loc2_ = §_-e2W§.§_-W2X§(Game.self["clan_id"]);
               _loc3_ = [];
               _loc4_ = int(param1[1].length);
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc6_ = int(param1[1][_loc5_]);
                  if(_loc6_ == _loc2_.§_-R2z§)
                  {
                     this.§_-Ld§.playerId = _loc2_.§_-R2z§;
                     Game.request(this.§_-Ld§.playerId,§_-12F§);
                  }
                  else
                  {
                     _loc3_.push(new TapePlayer(_loc6_,TapePlayer.§_-ww§));
                  }
                  _loc5_++;
               }
               clear();
               set(_loc3_);
               break;
            case §_-S2I§.§_-t2k§:
               if(this.§_-21p§ != "")
               {
                  break;
               }
               if(param1[0] == Game.selfId)
               {
                  break;
               }
               add(new TapePlayer(param1[0],TapePlayer.§_-ww§));
               break;
            case §_-S2I§.§_-J2A§:
               this.remove(param1[0]);
         }
      }
      
      private function §_-S1E§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.§_-Ld§.playerId)
         {
            return;
         }
         this.§_-Ld§.§_-031§(_loc2_);
         dispatchEvent(new GameEvent(GameEvent.FRIENDS_UPDATE));
      }
   }
}


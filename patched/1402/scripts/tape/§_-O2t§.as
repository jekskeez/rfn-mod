package tape
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-a11§.TapeDataEvent;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.GameEvent;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import views.§_-BB§;
   
   public class §_-O2t§ extends §_-j2a§
   {
      
      public static const §_-B1w§:int = 0;
      
      public static const §_-P1y§:int = 1;
      
      public static const §_-TW§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-s10§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-W1l§ | §_-Y2E§.§_-l1l§ | §_-Y2E§.§_-L1b§ | §_-Y2E§.§_-rC§;
      
      public var §_-s2G§:§_-BB§;
      
      private var §_-K17§:String = "";
      
      private var §_-V1L§:int = 0;
      
      public function §_-O2t§(param1:String = "", param2:int = 0)
      {
         super();
         this.§_-s2G§ = new §_-BB§();
         this.§_-K17§ = param1;
         this.§_-V1L§ = param2;
         this.§_-hI§ = §_-TW§;
         Game.listen(this.§_-8q§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-Ww§,§_-s2l§.§_-nH§,§_-s2l§.§_-A1p§]);
      }
      
      private static function §_-t2x§(param1:TapePlayer, param2:TapePlayer) : int
      {
         if(param1.player["clan_duty"] == Clan.§_-HJ§ && param2.player["clan_duty"] != Clan.§_-HJ§)
         {
            return -1;
         }
         if(param1.player["clan_duty"] != Clan.§_-HJ§ && param2.player["clan_duty"] == Clan.§_-HJ§)
         {
            return 1;
         }
         if(param1.player["exp"] < param2.player["exp"])
         {
            return 1;
         }
         return -1;
      }
      
      private static function §_-sj§(param1:TapePlayer, param2:TapePlayer) : int
      {
         if(param1.player["clan_duty"] == Clan.§_-HJ§ && param2.player["clan_duty"] != Clan.§_-HJ§)
         {
            return -1;
         }
         if(param1.player["clan_duty"] != Clan.§_-HJ§ && param2.player["clan_duty"] == Clan.§_-HJ§)
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
      
      override protected function §_-J2c§() : void
      {
         if(this.§_-V1L§ == §_-P1y§)
         {
            this.objects.sort(§_-sj§);
         }
         else
         {
            this.objects.sort(§_-t2x§);
         }
      }
      
      public function §_-U2n§() : void
      {
         this.§_-J2c§();
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      public function §_-11X§(param1:int) : void
      {
         this.§_-V1L§ = param1;
      }
      
      public function §_-C2L§(param1:String) : Vector.<§_-QN§>
      {
         var _loc2_:Vector.<§_-QN§> = new Vector.<§_-QN§>();
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
      
      public function §_-j1a§(param1:Vector.<§_-QN§>) : void
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
               this.objects[_loc2_].forget(§_-Z1P§);
               this.objects.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Clan = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-Ww§:
               if(Game.self["clan_id"] != param1[0] || this.§_-K17§ != "")
               {
                  return;
               }
               _loc2_ = §_-B2U§.§_-Q2g§(Game.self["clan_id"]);
               _loc3_ = [];
               _loc4_ = int(param1[1].length);
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc6_ = int(param1[1][_loc5_]);
                  if(_loc6_ == _loc2_.§_-W2t§)
                  {
                     this.§_-s2G§.playerId = _loc2_.§_-W2t§;
                     Game.request(this.§_-s2G§.playerId,§_-TW§);
                  }
                  else
                  {
                     _loc3_.push(new TapePlayer(_loc6_,TapePlayer.§_-ri§));
                  }
                  _loc5_++;
               }
               clear();
               set(_loc3_);
               break;
            case §_-s2l§.§_-nH§:
               if(this.§_-K17§ != "")
               {
                  break;
               }
               if(param1[0] == Game.selfId)
               {
                  break;
               }
               add(new TapePlayer(param1[0],TapePlayer.§_-ri§));
               break;
            case §_-s2l§.§_-A1p§:
               this.remove(param1[0]);
         }
      }
      
      private function §_-8q§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.§_-s2G§.playerId)
         {
            return;
         }
         this.§_-s2G§.§_-yC§(_loc2_);
         dispatchEvent(new GameEvent(GameEvent.FRIENDS_UPDATE));
      }
   }
}


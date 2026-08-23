package §_-dc§
{
   import §_-81S§.§_-e1x§;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-d2x§;
   import §_-S1D§.§_-V18§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-F2y§;
   import §_-e2w§.§_-1W§;
   import §_-k1c§.§_-Q13§;
   import §_-xm§.§_-by§;
   import §_-xm§.§_-n29§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.ClanNoticeEvent;
   import events.§_-n13§;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import utils.§_-c10§;
   import utils.§_-qF§;
   
   public class §_-e2W§ extends EventDispatcher
   {
      
      public static const §_-AK§:int = 10;
      
      private static var §_-W2l§:§_-Q13§;
      
      private static var §_-H2I§:§_-Q13§;
      
      public static var §_-u1o§:EventDispatcher = new EventDispatcher();
      
      public static var §_-924§:Array = [];
      
      public static var §_-WR§:Array = null;
      
      public static var §_-Rg§:String = null;
      
      private static var §_-I2n§:Object = {};
      
      private static var §_-E2t§:Object = {};
      
      private static var §_-BJ§:int = -1;
      
      private static var §_-N2M§:Boolean = false;
      
      public function §_-e2W§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-o2C§,[§_-S2I§.§_-v9§,§_-S2I§.§_-M1P§,§_-S2I§.§_-t2k§,§_-S2I§.§_-J2A§,§_-S2I§.§_-F1y§,§_-S2I§.§_-H2P§,§_-S2I§.§_-x4§]);
         Game.listen(§_-wb§);
         listen(§_-r1P§);
      }
      
      public static function listen(param1:Function, param2:String = "onClanLoaded", param3:Boolean = true) : void
      {
         §_-u1o§.addEventListener(param2,param1,false,0,param3);
      }
      
      public static function forget(param1:Function, param2:String = "onClanLoaded") : void
      {
         §_-u1o§.removeEventListener(param2,param1);
      }
      
      public static function notify(param1:Clan, param2:Boolean = false, param3:uint = 4294967295) : void
      {
         §_-u1o§.dispatchEvent(new §_-n13§(param1,param2));
         param1.dispatchEvent(param3);
      }
      
      public static function §_-v1v§() : void
      {
         if(Game.self.clan_id == 0)
         {
            return;
         }
         if(§_-W2X§(Game.self.clan_id).state != §_-S2I§.§_-F2Q§)
         {
            return;
         }
         new §_-Q13§(gls("Клан заблокирован."),gls("Твой клан заблокирован за нарушения.")).show();
      }
      
      public static function §_-W2X§(param1:int) : Clan
      {
         if(!(param1 in §_-I2n§))
         {
            §_-I2n§[param1] = new Clan(param1);
         }
         return §_-I2n§[param1];
      }
      
      public static function request(param1:*, param2:uint, param3:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Clan = null;
         if(!(param1 is Array))
         {
            param1 = [param1];
         }
         param1 = §_-qF§.§_-yi§(param1);
         §_-TQ§.add("[Request clan info] ids:" + (param1 is Array ? "[" + param1.join() + "]" : param1 + " nocache:" + param3));
         var _loc4_:Array = [];
         for each(_loc5_ in param1)
         {
            if(_loc5_ != 0)
            {
               _loc6_ = §_-W2X§(_loc5_);
               _loc6_.§_-3Y§(param3);
               if(_loc6_.isLoaded(param2))
               {
                  notify(_loc6_,true,param2);
               }
               else
               {
                  if(!_loc6_.§_-uM§(param2))
                  {
                     _loc4_.push(_loc5_);
                  }
                  _loc6_.§_-3i§(param2);
               }
            }
         }
         if(_loc4_.length == 0)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-9h§,_loc4_,param2);
      }
      
      public static function dataLoaded(param1:Object, param2:uint = 4294967295) : void
      {
         var _loc3_:Clan = §_-W2X§(param1["id"]);
         _loc3_.§_-U1w§(param1);
         _loc3_.§_-s10§(param2);
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-639§))
         {
            §_-TQ§.add("ClanManager clan=" + JSON.stringify(param1));
         }
         if(_loc3_.§_-Y2w§())
         {
            notify(_loc3_,false,param2);
         }
      }
      
      private static function §_-x1D§(param1:String) : void
      {
         if(§_-Rg§ == param1)
         {
            return;
         }
         if(§_-Rg§ == null || param1 == "")
         {
            §_-Rg§ = param1;
            return;
         }
         §_-Rg§ = param1;
         §_-u1o§.dispatchEvent(new ClanNoticeEvent(ClanNoticeEvent.CLAN_NEWS_CHANGED));
         if(§_-71o§.active is §_-5B§)
         {
            return;
         }
         new §_-n29§(param1).show();
         GameSounds.play("window_big_open2");
      }
      
      private static function §_-Dj§(param1:int) : void
      {
         var _loc2_:Clan = null;
         var _loc3_:Player = null;
         _loc2_ = §_-W2X§(param1);
         _loc2_.state = §_-S2I§.§_-N1b§;
         _loc2_.size = 0;
         _loc2_.§_-t2n§ = 0;
         if(!(param1 in §_-E2t§))
         {
            return;
         }
         for each(_loc3_ in §_-E2t§[param1])
         {
            if(_loc3_["clan_id"] == param1)
            {
               _loc3_["clan_id"] = 0;
               Game.request(_loc3_["id"],§_-hF§.ALL);
            }
         }
         delete §_-E2t§[param1];
         if(_loc2_.§_-Y2w§())
         {
            notify(_loc2_,true);
         }
      }
      
      private static function §_-PR§(param1:Array, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Player = null;
         var _loc6_:int = 0;
         if(param3)
         {
            _loc4_ = 0;
            while(_loc4_ < §_-924§.length)
            {
               _loc5_ = Game.getPlayer(§_-924§[_loc4_]);
               _loc5_["clan_duty"] = Clan.§_-73C§;
               if(_loc5_.id == Game.selfId)
               {
                  §_-V18§.§_-v1o§ = false;
               }
               _loc4_++;
            }
            Game.request(§_-924§,§_-hF§.ALL);
            §_-924§ = [];
         }
         switch(param2)
         {
            case §_-S2I§.§_-82G§:
               if(param3)
               {
                  §_-924§ = param1;
                  _loc4_ = 0;
                  while(_loc4_ < §_-924§.length)
                  {
                     _loc5_ = Game.getPlayer(§_-924§[_loc4_]);
                     _loc5_["clan_duty"] = Clan.§_-jY§;
                     _loc4_++;
                  }
                  Game.request(§_-924§,§_-hF§.ALL);
                  break;
               }
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  if(§_-924§.indexOf(param1[_loc4_]) == -1)
                  {
                     §_-924§.push(param1[_loc4_]);
                     _loc5_ = Game.getPlayer(param1[_loc4_]);
                     _loc5_["clan_duty"] = Clan.§_-jY§;
                  }
                  _loc4_++;
               }
               Game.request(param1,§_-hF§.ALL);
               break;
            case §_-S2I§.§_-I1E§:
               if(param3)
               {
                  break;
               }
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  _loc6_ = §_-924§.indexOf(param1[_loc4_]);
                  if(_loc6_ != -1)
                  {
                     §_-924§.splice(_loc6_,1);
                     _loc5_ = Game.getPlayer(param1[_loc4_]);
                     _loc5_["clan_duty"] = Clan.§_-73C§;
                  }
                  _loc4_++;
               }
               Game.request(param1,§_-hF§.ALL);
         }
         §_-u1o§.dispatchEvent(new ClanNoticeEvent(ClanNoticeEvent.CLAN_SUBLEADERS_CHANGED));
      }
      
      private static function §_-r1P§(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(§_-BJ§ == _loc2_.id)
         {
            new §_-Q13§(gls("Низкий уровень"),gls("Вы не можете вступить в данный\nклан, так как ваш уровень ниже {0}",§_-W2X§(§_-BJ§).§_-xy§)).show();
            §_-BJ§ = -1;
            return;
         }
         if(Game.self["clan_id"] != _loc2_.id)
         {
            return;
         }
         §_-x1D§(_loc2_.news);
         if(§_-N2M§)
         {
            §_-N2M§ = false;
         }
      }
      
      private static function §_-wb§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_["clan_id"] == 0)
         {
            return;
         }
         if(!(_loc2_["clan_id"] in §_-E2t§))
         {
            §_-E2t§[_loc2_["clan_id"]] = {};
         }
         §_-E2t§[_loc2_["clan_id"]][_loc2_["id"]] = _loc2_;
      }
      
      private static function §_-51c§(param1:§_-U1M§, param2:int) : Array
      {
         var _loc5_:Object = null;
         var _loc3_:Array = §_-Oy§.parse(param1,param2);
         var _loc4_:Array = [];
         for each(_loc5_ in _loc3_)
         {
            _loc4_.push(_loc5_["id"]);
            dataLoaded(_loc5_,param2);
         }
         return _loc4_;
      }
      
      private static function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Clan = null;
         var _loc3_:Player = null;
         var _loc4_:Array = null;
         switch(param1.type)
         {
            case §_-S2I§.§_-v9§:
               _loc4_ = param1[0];
               if(_loc4_.length != 5)
               {
                  break;
               }
               switch(_loc4_[1])
               {
                  case §_-S2I§.§_-UB§:
                     §_-Dj§(_loc4_[3]);
                     break;
                  case §_-S2I§.§_-Y1F§:
                     if(_loc4_[3] != Game.§_-qZ§)
                     {
                        break;
                     }
                     Game.§_-qZ§ = 0;
                     break;
                  case §_-S2I§.§_-vV§:
                     if(_loc4_[3] != Game.self["clan_id"])
                     {
                        break;
                     }
                     _loc2_ = §_-W2X§(Game.self["clan_id"]);
                     _loc2_.state = §_-S2I§.§_-13l§;
                     request(Game.self["clan_id"],§_-Oy§.ALL);
               }
               break;
            case §_-S2I§.§_-M1P§:
               switch(param1[0])
               {
                  case §_-S2I§.§_-Wr§:
                     if(Game.self["clan_id"] != 0 || param1[1] == 0)
                     {
                        break;
                     }
                     Game.self["clan_duty"] = Clan.§_-k1P§;
                     Game.self["clan_id"] = param1[1];
                     §_-5B§.§_-R1G§(Game.selfId);
                     §_-71o§.show(§_-F2y§.instance);
                     §_-5B§.§_-p2a§();
                     §_-F2y§.§_-p2a§();
                     §_-N2M§ = true;
                     §_-V18§.§_-v1o§ = true;
                     _loc2_ = §_-W2X§(param1[1]);
                     _loc2_.size = 1;
                     Game.request(Game.selfId,§_-hF§.ALL);
                     request(Game.self["clan_id"],§_-Oy§.ALL,true);
                     §_-F2D§();
                     break;
                  case §_-S2I§.§_-N1b§:
                     if(Game.§_-qZ§ == param1[1])
                     {
                        Game.§_-qZ§ = 0;
                        if(§_-W2l§ == null)
                        {
                           §_-W2l§ = new §_-Q13§(gls("Клан закрыт"),gls("Клан, в который ты подал заявку, закрыт."),false);
                        }
                        §_-W2l§.show();
                     }
                     §_-Dj§(param1[1]);
                     break;
                  case §_-S2I§.§_-13l§:
                     if(Game.§_-qZ§ == param1[1] || §_-e1x§.§_-o1§ == param1[1])
                     {
                        if(§_-H2I§ == null)
                        {
                           §_-H2I§ = new §_-Q13§(gls("Клан заблокирован"),gls("Клан, в который ты подал заявку, заблокирован."),false);
                        }
                        §_-H2I§.show();
                        Game.§_-qZ§ = 0;
                        §_-e1x§.§_-o1§ = 0;
                     }
                     _loc2_ = §_-W2X§(param1[1]);
                     _loc2_.state = §_-S2I§.§_-13l§;
                     request(_loc2_.id,§_-Oy§.ALL);
                     break;
                  case §_-S2I§.§_-F2Q§:
                     if(Game.§_-qZ§ != param1[1])
                     {
                        break;
                     }
                     _loc2_ = §_-W2X§(param1[1]);
                     _loc2_.state = §_-S2I§.§_-F2Q§;
                     Game.§_-qZ§ = 0;
                     if(§_-H2I§ == null)
                     {
                        §_-H2I§ = new §_-Q13§(gls("Клан заблокирован"),gls("Клан, в который ты подал заявку, заблокирован."),false);
                     }
                     §_-H2I§.show();
                     request(_loc2_.id,§_-Oy§.ALL);
                     break;
                  case §_-S2I§.§_-v1I§:
                     new §_-Q13§(gls("Вы в черном списке"),gls("Вы не можете вступить в данный клан,\nтак как вы в черном списке этого клана")).show();
                     break;
                  case §_-S2I§.§_-xq§:
                     if(§_-d2x§.§_-z2o§ >= §_-W2X§(param1[1]).§_-xy§)
                     {
                        §_-BJ§ = param1[1];
                        request(param1[1],§_-Oy§.ALL,true);
                        return;
                     }
                     new §_-Q13§(gls("Низкий уровень"),gls("Вы не можете вступить в данный\nклан, так как ваш уровень ниже {0}",§_-W2X§(param1[1]).§_-xy§)).show();
               }
               break;
            case §_-S2I§.§_-t2k§:
               switch(param1[0])
               {
                  case Game.selfId:
                     Game.self["clan_duty"] = Clan.§_-73C§;
                     Game.self["clan_id"] = param1[1];
                     Game.§_-qZ§ = 0;
                     if(§_-71o§.active is §_-5B§ && §_-5B§.playerId == Game.selfId)
                     {
                        §_-71o§.show("Clan");
                        §_-5B§.§_-p2a§();
                        §_-F2y§.§_-p2a§();
                     }
                     §_-V18§.§_-v1o§ = true;
                     §_-by§.dispose();
                     Game.request(Game.selfId,§_-hF§.ALL);
                     request(Game.self["clan_id"],§_-Oy§.ALL,true);
                     §_-F2D§();
                     break;
                  default:
                     _loc2_ = §_-W2X§(Game.self["clan_id"]);
                     ++_loc2_.size;
                     _loc3_ = Game.getPlayer(param1[0]);
                     _loc3_["clan_id"] = Game.self["clan_id"];
                     Game.request(param1[0],§_-hF§.ALL);
                     request(Game.self["clan_id"],§_-Oy§.ALL);
               }
               break;
            case §_-S2I§.§_-J2A§:
               switch(param1[0])
               {
                  case Game.selfId:
                     _loc2_ = §_-W2X§(Game.self["clan_id"]);
                     --_loc2_.size;
                     if(Game.self["clan_duty"] == Clan.§_-k1P§)
                     {
                        §_-Dj§(_loc2_.id);
                     }
                     Game.self["clan_duty"] = Clan.§_-73C§;
                     Game.self["clan_id"] = 0;
                     §_-PR§([],§_-S2I§.§_-I1E§,true);
                     if(§_-71o§.active is §_-F2y§)
                     {
                        §_-5B§.§_-R1G§(Game.selfId);
                        §_-71o§.show("Profile");
                     }
                     else if(§_-71o§.active is §_-5B§)
                     {
                        §_-1W§.§_-Q1v§(true);
                     }
                     §_-5B§.§_-725§();
                     §_-F2y§.§_-725§();
                     §_-Rg§ = null;
                     Game.request(param1[0],§_-hF§.ALL);
                     request(_loc2_.id,§_-Oy§.ALL);
                     §_-V18§.§_-v1o§ = false;
                     §_-F2D§();
                     break;
                  default:
                     _loc3_ = Game.getPlayer(param1[0]);
                     _loc2_ = §_-W2X§(_loc3_["clan_id"]);
                     --_loc2_.size;
                     _loc3_["clan_id"] = 0;
                     Game.request(param1[0],§_-hF§.ALL);
                     request(_loc2_.id,§_-Oy§.ALL);
               }
               break;
            case §_-S2I§.§_-F1y§:
               §_-51c§(param1[0],param1[1]);
               break;
            case §_-S2I§.§_-H2P§:
               _loc2_ = §_-W2X§(Game.self["clan_id"]);
               _loc2_.coins = param1[0];
               _loc2_.acorns = param1[1];
               if(_loc2_.coins - param1[0] < 0 && _loc2_.coins >= 0 || _loc2_.acorns - param1[1] < 0 && _loc2_.acorns >= 0)
               {
                  request(_loc2_.id,§_-Oy§.ALL,true);
                  break;
               }
               request(_loc2_.id,§_-Oy§.ALL);
               break;
            case §_-S2I§.§_-x4§:
               if(!("1" in param1))
               {
                  §_-PR§(param1[0],§_-S2I§.§_-82G§,true);
                  break;
               }
               §_-PR§(param1[0],param1[1],false);
               if(!§_-X1g§.§_-P20§)
               {
                  break;
               }
               if(param1[0].length == 1 && param1[0][0] == Game.selfId)
               {
                  §_-u1o§.dispatchEvent(new ClanNoticeEvent(ClanNoticeEvent.CLAN_TRANSACTIONS_UPDATE));
                  if(Boolean(param1[1]) && §_-X1g§.§_-G2p§)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-cw§);
                  }
                  else
                  {
                     §_-X1g§.§_-13o§ = 0;
                  }
               }
         }
      }
      
      private static function §_-F2D§() : void
      {
         §_-13r§.request();
         §_-13r§.§_-Y1D§(§_-13r§.CLAN_TYPE);
      }
   }
}


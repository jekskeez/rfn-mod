package §_-U19§
{
   import §_-1k§.§_-md§;
   import §_-61C§.§_-z1J§;
   import §_-I18§.§_-c2Q§;
   import §_-I18§.§_-jv§;
   import §_-J1i§.§_-W1v§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-LZ§;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-t2c§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.ClanNoticeEvent;
   import events.§_-a1V§;
   import flash.events.EventDispatcher;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import protocol.§_-z1i§;
   import sounds.GameSounds;
   import utils.§_-33I§;
   import utils.§_-cx§;
   
   public class §_-B2U§ extends EventDispatcher
   {
      
      public static const §_-sc§:int = 10;
      
      private static var §_-GK§:§_-Fk§;
      
      private static var §_-Ui§:§_-Fk§;
      
      public static var §_-jx§:EventDispatcher = new EventDispatcher();
      
      public static var §_-T2u§:Array = [];
      
      public static var §_-32F§:Array = null;
      
      public static var §_-Z2Y§:String = null;
      
      private static var §_-e3§:Object = {};
      
      private static var §_-R1H§:Object = {};
      
      private static var §_-N1k§:int = -1;
      
      private static var §_-rX§:Boolean = false;
      
      public function §_-B2U§()
      {
         super();
      }
      
      public static function init() : void
      {
         Connection.listen(§_-x2f§,[§_-s2l§.§_-i6§,§_-s2l§.§_-R1X§,§_-s2l§.§_-nH§,§_-s2l§.§_-A1p§,§_-s2l§.§_-k1w§,§_-s2l§.§_-n1N§,§_-s2l§.§_-C2K§]);
         Game.listen(§_-U15§);
         listen(§_-g1w§);
      }
      
      public static function listen(param1:Function, param2:String = "onClanLoaded", param3:Boolean = true) : void
      {
         §_-jx§.addEventListener(param2,param1,false,0,param3);
      }
      
      public static function forget(param1:Function, param2:String = "onClanLoaded") : void
      {
         §_-jx§.removeEventListener(param2,param1);
      }
      
      public static function notify(param1:Clan, param2:Boolean = false, param3:uint = 4294967295) : void
      {
         §_-jx§.dispatchEvent(new §_-a1V§(param1,param2));
         param1.dispatchEvent(param3);
      }
      
      public static function §_-Js§() : void
      {
         if(Game.self.clan_id == 0)
         {
            return;
         }
         if(§_-Q2g§(Game.self.clan_id).state != §_-s2l§.§_-F2E§)
         {
            return;
         }
         new §_-Fk§(gls("Клан заблокирован."),gls("Твой клан заблокирован за нарушения.")).show();
      }
      
      public static function §_-Q2g§(param1:int) : Clan
      {
         if(!(param1 in §_-e3§))
         {
            §_-e3§[param1] = new Clan(param1);
         }
         return §_-e3§[param1];
      }
      
      public static function request(param1:*, param2:uint, param3:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Clan = null;
         if(!(param1 is Array))
         {
            param1 = [param1];
         }
         param1 = §_-cx§.§_-y1Z§(param1);
         §_-p2U§.add("[Request clan info] ids:" + (param1 is Array ? "[" + param1.join() + "]" : param1 + " nocache:" + param3));
         var _loc4_:Array = [];
         for each(_loc5_ in param1)
         {
            if(_loc5_ != 0)
            {
               _loc6_ = §_-Q2g§(_loc5_);
               _loc6_.§_-c2k§(param3);
               if(_loc6_.isLoaded(param2))
               {
                  notify(_loc6_,true,param2);
               }
               else
               {
                  if(!_loc6_.§_-t1C§(param2))
                  {
                     _loc4_.push(_loc5_);
                  }
                  _loc6_.§_-l2O§(param2);
               }
            }
         }
         if(_loc4_.length == 0)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-G2D§,_loc4_,param2);
      }
      
      public static function dataLoaded(param1:Object, param2:uint = 4294967295) : void
      {
         var _loc3_:Clan = §_-Q2g§(param1["id"]);
         _loc3_.§_-j1a§(param1);
         _loc3_.§_-9P§(param2);
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-AJ§))
         {
            §_-p2U§.add("ClanManager clan=" + JSON.stringify(param1));
         }
         if(_loc3_.§_-HU§())
         {
            notify(_loc3_,false,param2);
         }
      }
      
      private static function §_-m1W§(param1:String) : void
      {
         if(§_-Z2Y§ == param1)
         {
            return;
         }
         if(§_-Z2Y§ == null || param1 == "")
         {
            §_-Z2Y§ = param1;
            return;
         }
         §_-Z2Y§ = param1;
         §_-jx§.dispatchEvent(new ClanNoticeEvent(ClanNoticeEvent.CLAN_NEWS_CHANGED));
         if(§_-t2c§.active is §_-51A§)
         {
            return;
         }
         new §_-jv§(param1).show();
         GameSounds.play("window_big_open2");
      }
      
      private static function §_-t2v§(param1:int) : void
      {
         var _loc2_:Clan = null;
         var _loc3_:Player = null;
         _loc2_ = §_-Q2g§(param1);
         _loc2_.state = §_-s2l§.§_-s2b§;
         _loc2_.size = 0;
         _loc2_.§_-u2q§ = 0;
         if(!(param1 in §_-R1H§))
         {
            return;
         }
         for each(_loc3_ in §_-R1H§[param1])
         {
            if(_loc3_["clan_id"] == param1)
            {
               _loc3_["clan_id"] = 0;
               Game.request(_loc3_["id"],§_-Y2E§.ALL);
            }
         }
         delete §_-R1H§[param1];
         if(_loc2_.§_-HU§())
         {
            notify(_loc2_,true);
         }
      }
      
      private static function §_-r2h§(param1:Array, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Player = null;
         var _loc6_:int = 0;
         if(param3)
         {
            _loc4_ = 0;
            while(_loc4_ < §_-T2u§.length)
            {
               _loc5_ = Game.getPlayer(§_-T2u§[_loc4_]);
               _loc5_["clan_duty"] = Clan.§_-Y2B§;
               if(_loc5_.id == Game.selfId)
               {
                  §_-z1J§.§_-E2e§ = false;
               }
               _loc4_++;
            }
            Game.request(§_-T2u§,§_-Y2E§.ALL);
            §_-T2u§ = [];
         }
         switch(param2)
         {
            case §_-s2l§.§_-d1T§:
               if(param3)
               {
                  §_-T2u§ = param1;
                  _loc4_ = 0;
                  while(_loc4_ < §_-T2u§.length)
                  {
                     _loc5_ = Game.getPlayer(§_-T2u§[_loc4_]);
                     _loc5_["clan_duty"] = Clan.§_-HJ§;
                     _loc4_++;
                  }
                  Game.request(§_-T2u§,§_-Y2E§.ALL);
                  break;
               }
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  if(§_-T2u§.indexOf(param1[_loc4_]) == -1)
                  {
                     §_-T2u§.push(param1[_loc4_]);
                     _loc5_ = Game.getPlayer(param1[_loc4_]);
                     _loc5_["clan_duty"] = Clan.§_-HJ§;
                  }
                  _loc4_++;
               }
               Game.request(param1,§_-Y2E§.ALL);
               break;
            case §_-s2l§.§_-ie§:
               if(param3)
               {
                  break;
               }
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  _loc6_ = §_-T2u§.indexOf(param1[_loc4_]);
                  if(_loc6_ != -1)
                  {
                     §_-T2u§.splice(_loc6_,1);
                     _loc5_ = Game.getPlayer(param1[_loc4_]);
                     _loc5_["clan_duty"] = Clan.§_-Y2B§;
                  }
                  _loc4_++;
               }
               Game.request(param1,§_-Y2E§.ALL);
         }
         §_-jx§.dispatchEvent(new ClanNoticeEvent(ClanNoticeEvent.CLAN_SUBLEADERS_CHANGED));
      }
      
      private static function §_-g1w§(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(§_-N1k§ == _loc2_.id)
         {
            new §_-Fk§(gls("Низкий уровень"),gls("Вы не можете вступить в данный\nклан, так как ваш уровень ниже {0}",§_-Q2g§(§_-N1k§).§_-B1D§)).show();
            §_-N1k§ = -1;
            return;
         }
         if(Game.self["clan_id"] != _loc2_.id)
         {
            return;
         }
         §_-m1W§(_loc2_.news);
         if(§_-rX§)
         {
            §_-rX§ = false;
         }
      }
      
      private static function §_-U15§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_["clan_id"] == 0)
         {
            return;
         }
         if(!(_loc2_["clan_id"] in §_-R1H§))
         {
            §_-R1H§[_loc2_["clan_id"]] = {};
         }
         §_-R1H§[_loc2_["clan_id"]][_loc2_["id"]] = _loc2_;
      }
      
      private static function §_-238§(param1:§_-z1i§, param2:int) : Array
      {
         var _loc5_:Object = null;
         var _loc3_:Array = §_-eT§.parse(param1,param2);
         var _loc4_:Array = [];
         for each(_loc5_ in _loc3_)
         {
            _loc4_.push(_loc5_["id"]);
            dataLoaded(_loc5_,param2);
         }
         return _loc4_;
      }
      
      private static function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Clan = null;
         var _loc3_:Player = null;
         var _loc4_:Array = null;
         switch(param1.type)
         {
            case §_-s2l§.§_-i6§:
               _loc4_ = param1[0];
               if(_loc4_.length != 5)
               {
                  break;
               }
               switch(_loc4_[1])
               {
                  case §_-s2l§.§_-r2w§:
                     §_-t2v§(_loc4_[3]);
                     break;
                  case §_-s2l§.§_-63p§:
                     if(_loc4_[3] != Game.§_-KO§)
                     {
                        break;
                     }
                     Game.§_-KO§ = 0;
                     break;
                  case §_-s2l§.§_-Xy§:
                     if(_loc4_[3] != Game.self["clan_id"])
                     {
                        break;
                     }
                     _loc2_ = §_-Q2g§(Game.self["clan_id"]);
                     _loc2_.state = §_-s2l§.§_-M3§;
                     request(Game.self["clan_id"],§_-eT§.ALL);
               }
               break;
            case §_-s2l§.§_-R1X§:
               switch(param1[0])
               {
                  case §_-s2l§.§_-YU§:
                     if(Game.self["clan_id"] != 0 || param1[1] == 0)
                     {
                        break;
                     }
                     Game.self["clan_duty"] = Clan.§_-01X§;
                     Game.self["clan_id"] = param1[1];
                     §_-51A§.§_-h2w§(Game.selfId);
                     §_-t2c§.show(§_-P1w§.instance);
                     §_-51A§.§_-71A§();
                     §_-P1w§.§_-71A§();
                     §_-rX§ = true;
                     §_-z1J§.§_-E2e§ = true;
                     _loc2_ = §_-Q2g§(param1[1]);
                     _loc2_.size = 1;
                     Game.request(Game.selfId,§_-Y2E§.ALL);
                     request(Game.self["clan_id"],§_-eT§.ALL,true);
                     §_-m1R§();
                     break;
                  case §_-s2l§.§_-s2b§:
                     if(Game.§_-KO§ == param1[1])
                     {
                        Game.§_-KO§ = 0;
                        if(§_-GK§ == null)
                        {
                           §_-GK§ = new §_-Fk§(gls("Клан закрыт"),gls("Клан, в который ты подал заявку, закрыт."),false);
                        }
                        §_-GK§.show();
                     }
                     §_-t2v§(param1[1]);
                     break;
                  case §_-s2l§.§_-M3§:
                     if(Game.§_-KO§ == param1[1] || §_-md§.§_-J2u§ == param1[1])
                     {
                        if(§_-Ui§ == null)
                        {
                           §_-Ui§ = new §_-Fk§(gls("Клан заблокирован"),gls("Клан, в который ты подал заявку, заблокирован."),false);
                        }
                        §_-Ui§.show();
                        Game.§_-KO§ = 0;
                        §_-md§.§_-J2u§ = 0;
                     }
                     _loc2_ = §_-Q2g§(param1[1]);
                     _loc2_.state = §_-s2l§.§_-M3§;
                     request(_loc2_.id,§_-eT§.ALL);
                     break;
                  case §_-s2l§.§_-F2E§:
                     if(Game.§_-KO§ != param1[1])
                     {
                        break;
                     }
                     _loc2_ = §_-Q2g§(param1[1]);
                     _loc2_.state = §_-s2l§.§_-F2E§;
                     Game.§_-KO§ = 0;
                     if(§_-Ui§ == null)
                     {
                        §_-Ui§ = new §_-Fk§(gls("Клан заблокирован"),gls("Клан, в который ты подал заявку, заблокирован."),false);
                     }
                     §_-Ui§.show();
                     request(_loc2_.id,§_-eT§.ALL);
                     break;
                  case §_-s2l§.§_-I1x§:
                     new §_-Fk§(gls("Вы в черном списке"),gls("Вы не можете вступить в данный клан,\nтак как вы в черном списке этого клана")).show();
                     break;
                  case §_-s2l§.§_-b2r§:
                     if(§_-LZ§.§_-mA§ >= §_-Q2g§(param1[1]).§_-B1D§)
                     {
                        §_-N1k§ = param1[1];
                        request(param1[1],§_-eT§.ALL,true);
                        return;
                     }
                     new §_-Fk§(gls("Низкий уровень"),gls("Вы не можете вступить в данный\nклан, так как ваш уровень ниже {0}",§_-Q2g§(param1[1]).§_-B1D§)).show();
               }
               break;
            case §_-s2l§.§_-nH§:
               switch(param1[0])
               {
                  case Game.selfId:
                     Game.self["clan_duty"] = Clan.§_-Y2B§;
                     Game.self["clan_id"] = param1[1];
                     Game.§_-KO§ = 0;
                     if(§_-t2c§.active is §_-51A§ && §_-51A§.playerId == Game.selfId)
                     {
                        §_-t2c§.show("Clan");
                        §_-51A§.§_-71A§();
                        §_-P1w§.§_-71A§();
                     }
                     §_-z1J§.§_-E2e§ = true;
                     §_-c2Q§.dispose();
                     Game.request(Game.selfId,§_-Y2E§.ALL);
                     request(Game.self["clan_id"],§_-eT§.ALL,true);
                     §_-m1R§();
                     break;
                  default:
                     _loc2_ = §_-Q2g§(Game.self["clan_id"]);
                     ++_loc2_.size;
                     _loc3_ = Game.getPlayer(param1[0]);
                     _loc3_["clan_id"] = Game.self["clan_id"];
                     Game.request(param1[0],§_-Y2E§.ALL);
                     request(Game.self["clan_id"],§_-eT§.ALL);
               }
               break;
            case §_-s2l§.§_-A1p§:
               switch(param1[0])
               {
                  case Game.selfId:
                     _loc2_ = §_-Q2g§(Game.self["clan_id"]);
                     --_loc2_.size;
                     if(Game.self["clan_duty"] == Clan.§_-01X§)
                     {
                        §_-t2v§(_loc2_.id);
                     }
                     Game.self["clan_duty"] = Clan.§_-Y2B§;
                     Game.self["clan_id"] = 0;
                     §_-r2h§([],§_-s2l§.§_-ie§,true);
                     if(§_-t2c§.active is §_-P1w§)
                     {
                        §_-51A§.§_-h2w§(Game.selfId);
                        §_-t2c§.show("Профиль");
                     }
                     else if(§_-t2c§.active is §_-51A§)
                     {
                        §_-W1v§.§_-83E§(true);
                     }
                     §_-51A§.§_-51k§();
                     §_-P1w§.§_-51k§();
                     §_-Z2Y§ = null;
                     Game.request(param1[0],§_-Y2E§.ALL);
                     request(_loc2_.id,§_-eT§.ALL);
                     §_-z1J§.§_-E2e§ = false;
                     §_-m1R§();
                     break;
                  default:
                     _loc3_ = Game.getPlayer(param1[0]);
                     _loc2_ = §_-Q2g§(_loc3_["clan_id"]);
                     --_loc2_.size;
                     _loc3_["clan_id"] = 0;
                     Game.request(param1[0],§_-Y2E§.ALL);
                     request(_loc2_.id,§_-eT§.ALL);
               }
               break;
            case §_-s2l§.§_-k1w§:
               §_-238§(param1[0],param1[1]);
               break;
            case §_-s2l§.§_-n1N§:
               _loc2_ = §_-Q2g§(Game.self["clan_id"]);
               _loc2_.coins = param1[0];
               _loc2_.acorns = param1[1];
               if(_loc2_.coins - param1[0] < 0 && _loc2_.coins >= 0 || _loc2_.acorns - param1[1] < 0 && _loc2_.acorns >= 0)
               {
                  request(_loc2_.id,§_-eT§.ALL,true);
                  break;
               }
               request(_loc2_.id,§_-eT§.ALL);
               break;
            case §_-s2l§.§_-C2K§:
               if(!("1" in param1))
               {
                  §_-r2h§(param1[0],§_-s2l§.§_-d1T§,true);
                  break;
               }
               §_-r2h§(param1[0],param1[1],false);
               if(!§_-m1L§.§_-u21§)
               {
                  break;
               }
               if(param1[0].length == 1 && param1[0][0] == Game.selfId)
               {
                  §_-jx§.dispatchEvent(new ClanNoticeEvent(ClanNoticeEvent.CLAN_TRANSACTIONS_UPDATE));
                  if(Boolean(param1[1]) && §_-m1L§.§_-K1W§)
                  {
                     Connection.§_-e2T§(§_-u1O§.§_-12j§);
                  }
                  else
                  {
                     §_-m1L§.§_-12V§ = 0;
                  }
               }
         }
      }
      
      private static function §_-m1R§() : void
      {
         §_-82O§.request();
         §_-82O§.§_-Rd§(§_-82O§.CLAN_TYPE);
      }
   }
}


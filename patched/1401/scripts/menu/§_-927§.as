package menu
{
   import §_-61U§.§_-9m§;
   import §_-68§.§_-EI§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-k1C§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-w17§;
   import §_-U2w§.§_-72h§;
   import §_-U2w§.§_-Qh§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import §_-k1c§.§_-V2t§;
   import §_-l26§.§_-MZ§;
   import com.api.Player;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import utils.§_-c10§;
   import views.§_-B1w§;
   
   public class §_-927§ extends ContextMenu
   {
      
      private static var _instance:§_-927§;
      
      private static var §_-D1e§:EventDispatcher = new EventDispatcher();
      
      private var player:Player = null;
      
      private var title:Sprite;
      
      private var game:ContextMenuItem;
      
      private var §_-u2A§:ContextMenuItem;
      
      private var friend:ContextMenuItem;
      
      private var §_-oG§:ContextMenuItem;
      
      private var §_-S14§:ContextMenuItem;
      
      private var §_-23m§:ContextMenuItem;
      
      private var §_-qZ§:ContextMenuItem;
      
      private var §_-s2i§:ContextMenuItem;
      
      private var §_-62X§:ContextMenuItem;
      
      private var §_-E5§:ContextMenuItem;
      
      private var §_-W1v§:ContextMenuItem;
      
      private var §_-YV§:ContextMenuItem;
      
      private var ban:ContextMenuItem;
      
      private var message:ContextMenuItem;
      
      private var §_-d1Q§:ContextMenuItem;
      
      private var exchange:ContextMenuItem;
      
      private var §_-a2P§:ContextMenuItem;
      
      private var §_-z2O§:ContextMenuItem;
      
      private var §_-Gg§:§_-B1w§;
      
      private var §_-Qr§:§_-22V§;
      
      private var §_-53w§:DisplayObject;
      
      private var §_-2j§:Dialog = null;
      
      private var §_-93p§:§_-Q13§ = null;
      
      private var §_-ha§:§_-V2t§ = null;
      
      private var §_-h1W§:§_-Q13§ = null;
      
      private var §_-r2X§:§_-Q13§ = null;
      
      private var §_-22P§:§_-V2t§ = null;
      
      private var §_-o2I§:§_-Q13§ = null;
      
      private var §_-CH§:§_-Q13§ = null;
      
      private var §_-Rr§:§_-Q13§ = null;
      
      private var §_-94§:§_-V2t§ = null;
      
      private var §_-m1d§:§_-V2t§ = null;
      
      private var dialogOutBlacklist:§_-V2t§ = null;
      
      private var §_-P20§:Boolean = false;
      
      public function §_-927§()
      {
         _instance = this;
         super(141);
      }
      
      public static function §_-i2I§(param1:int) : void
      {
         if(!§_-Bm§.§_-2S§(§_-T2o§.§_-g1f§) || §_-71o§.active is §_-w17§)
         {
            return;
         }
         if(!_instance.§_-P20§)
         {
            _instance.init();
            _instance.§_-P20§ = true;
         }
         if(param1 == Game.selfId)
         {
            return;
         }
         var _loc2_:Player = Game.getPlayer(param1);
         if(_loc2_ == null)
         {
            return;
         }
         if(_instance.player)
         {
            _instance.player.removeEventListener(_instance.§_-P9§);
         }
         _instance.player = _loc2_;
         Game.stage.addEventListener(MouseEvent.MOUSE_UP,_instance.§_-I1L§);
      }
      
      public static function §_-P21§() : Boolean
      {
         return _instance.visible;
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      public static function update() : void
      {
         _instance.update();
      }
      
      public static function listen(param1:String, param2:Function) : void
      {
         if(§_-D1e§)
         {
            §_-D1e§.addEventListener(param1,param2);
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         §_-D1e§.dispatchEvent(new GameEvent(GameEvent.SHOWED));
      }
      
      override public function update(param1:int = 42) : void
      {
         if(!param1)
         {
         }
         super.update(this.title.height);
         this.§_-53w§.height = int(this.title.height) + this.§_-Dw§ * 22 + 0.5;
      }
      
      override protected function show(param1:MouseEvent) : void
      {
         this.§_-S14§.hide();
         this.§_-23m§.hide();
         this.friend.hide();
         this.§_-oG§.hide();
         this.§_-qZ§.hide();
         this.§_-s2i§.hide();
         this.§_-62X§.hide();
         this.§_-a2P§.hide();
         this.§_-z2O§.hide();
         this.§_-E5§.hide();
         this.§_-W1v§.hide();
         this.§_-YV§.hide();
         this.ban.hide();
         this.message.hide();
         this.§_-d1Q§.hide();
         this.game.active = false;
         this.§_-YV§.active = false;
         this.§_-Qr§.text = §_-My§.§_-n1z§(this.player["exp"]);
         this.§_-Gg§.§_-031§(this.player);
         (this.title as §_-03b§).§_-031§(this.player);
         this.§_-w2m§();
         if(!Game.§_-aC§(this.player.id))
         {
            this.friend.show();
         }
         else
         {
            this.§_-oG§.show();
         }
         this.exchange.active = !§_-k1C§.§_-93B§;
         var _loc2_:Clan = §_-e2W§.§_-W2X§(Game.self["clan_id"]);
         if(Game.self["clan_id"] == 0 && this.player["clan_id"] != 0 && §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§)
         {
            this.§_-qZ§.show();
         }
         if(Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-k1P§)
         {
            if(this.player["level"] >= §_-My§.§_-U1R§ && this.player["clan_id"] != Game.self["clan_id"] && _loc2_.blacklist.indexOf(this.player["id"]) == -1)
            {
               this.§_-s2i§.show();
            }
            if(this.player["clan_id"] == Game.self["clan_id"])
            {
               this.§_-62X§.show();
            }
         }
         if(Game.self["clan_id"] != 0 && (Game.self["clan_duty"] == Clan.§_-jY§ && §_-e2W§.§_-924§.indexOf(this.player["id"]) == -1 && this.player["id"] != _loc2_.§_-R2z§ || Game.self["clan_duty"] == Clan.§_-k1P§))
         {
            if(_loc2_.blacklist.indexOf(this.player["id"]) != -1)
            {
               this.§_-z2O§.show();
            }
            else
            {
               this.§_-a2P§.show();
            }
         }
         if(Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-jY§)
         {
            if(this.player["clan_id"] == Game.self["clan_id"] && this.player["clan_duty"] != Clan.§_-jY§ && this.player.id != _loc2_.§_-R2z§)
            {
               this.§_-62X§.show();
            }
            if(this.player["clan_id"] != Game.self["clan_id"])
            {
               this.§_-s2i§.show();
            }
         }
         if(Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-k1P§)
         {
            if(this.player["clan_id"] == Game.self["clan_id"])
            {
               if(this.player["clan_duty"] != Clan.§_-jY§)
               {
                  this.§_-E5§.show();
               }
               else
               {
                  this.§_-W1v§.show();
               }
            }
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
            this.§_-S14§.hide();
            this.§_-YV§.show();
            this.message.show();
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-639§) && !§_-c10§.§_-73j§(this.player.rights,§_-c10§.§_-639§))
         {
            this.ban.show();
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            this.ban.show();
            this.§_-d1Q§.show();
         }
         this.game.active = !(§_-71o§.active is §_-92z§);
         this.§_-YV§.active = !(§_-71o§.active is §_-92z§);
         this.§_-u2A§.active = !(§_-71o§.active is §_-92z§);
         this.update();
         super.show(param1);
      }
      
      private function §_-I1L§(param1:MouseEvent = null) : void
      {
         if(this.player)
         {
            this.player.addEventListener(§_-hF§.ALL,this.§_-P9§);
            Game.request(this.player["id"],§_-hF§.ALL);
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-I1L§);
      }
      
      private function §_-P9§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-P9§);
         this.show(null);
      }
      
      private function init() : void
      {
         this.title = new §_-03b§();
         this.title.x = 1;
         addChild(this.title);
         this.game = add({
            "active":new GameActiveMenuItem(),
            "passive":new GameMenuItem(),
            "name":gls("Перейти в игру"),
            "handler":this.§_-Q0§
         });
         this.§_-u2A§ = add({
            "active":new InviteActiveMenuItem(),
            "passive":new InviteMenuItem(),
            "name":gls("Сходить в гости"),
            "handler":this.§_-e1k§
         });
         this.friend = add({
            "active":new FriendActiveMenuItem(),
            "name":gls("Добавить в друзья"),
            "handler":this.§_-cj§
         });
         this.§_-oG§ = add({
            "active":new NoFriendActiveMenuItem(),
            "name":gls("Убрать из друзей"),
            "handler":this.§_-r2J§
         });
         this.§_-S14§ = add({
            "active":new IgnoreActiveMenuItem(),
            "name":gls("Игнорировать"),
            "handler":this.§_-a1P§
         });
         this.§_-23m§ = add({
            "active":new NotIgnoreActiveMenuItem(),
            "name":gls("Убрать из игнора"),
            "handler":this.§_-I1B§
         });
         this.§_-qZ§ = add({
            "active":new ClanInviteActiveMenuItem(),
            "name":gls("Попроситься в клан"),
            "handler":this.§_-33u§
         });
         this.§_-s2i§ = add({
            "active":new ClanInviteActiveMenuItem(),
            "name":gls("Пригласить в клан"),
            "handler":this.§_-D1u§
         });
         this.§_-62X§ = add({
            "active":new ClanKickActiveMenuItem(),
            "name":gls("Выгнать из клана"),
            "handler":this.§_-d28§
         });
         this.§_-a2P§ = add({
            "active":new ClanAddInBlacklist(),
            "name":gls("Добавить в чс"),
            "handler":this.§_-L2r§
         });
         this.§_-z2O§ = add({
            "active":new ClanRemoveFromBlacklist(),
            "name":gls("Удалить из чс"),
            "handler":this.§_-d2s§
         });
         this.§_-E5§ = add({
            "active":new ClanSubleaderActiveMenuItem(),
            "name":gls("Сделать помощником"),
            "handler":this.§_-be§
         });
         this.§_-W1v§ = add({
            "active":new ClanFireSubleaderActiveMenuItem(),
            "name":gls("Снять с должности"),
            "handler":this.§_-S1r§
         });
         this.exchange = add({
            "active":new ProfileExchangeActiveMenuItem(),
            "passive":new ProfileExchangeMenuItem(),
            "name":gls("Обмен"),
            "handler":this.§_-L1x§
         });
         this.§_-YV§ = add({
            "active":new SpyMenuActiveItem(),
            "passive":new SpyMenuItem(),
            "name":gls("Наблюдать"),
            "handler":this.§_-m1O§
         });
         this.ban = add({
            "active":new BanMenuActiveItem(),
            "name":gls("Забанить"),
            "handler":this.§_-Pf§
         });
         this.message = add({
            "active":new WhisperActiveMenuItem(),
            "passive":new WhisperMenuItem(),
            "name":gls("Сообщение"),
            "handler":this.§_-PG§
         });
         this.§_-d1Q§ = add({
            "active":new CompareActiveMenuItem(),
            "name":gls("Редактировать"),
            "handler":this.§_-V2z§
         });
         this.§_-53w§ = new ProfileContextMenuImage();
         addChild(this.§_-53w§);
         this.§_-Qr§ = new §_-22V§("200",-1,4,new TextFormat(§_-22V§.§_-F2z§,11,16777215,true));
         this.§_-Qr§.width = 25;
         this.§_-Qr§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-Qr§);
         this.§_-Gg§ = new §_-B1w§();
         this.§_-Gg§.x = 131;
         this.§_-Gg§.y = 3;
         addChild(this.§_-Gg§);
         this.§_-93p§ = new §_-Q13§(gls("Добавление в друзья"),gls("Добавив игрока в друзья, ты\nвсегда сможешь быстро его найти, чтобы\nпоиграть с ним или сходить в гости."),true,this.§_-x2V§);
         this.§_-ha§ = new §_-V2t§(gls("Удаление из друзей"),gls("Ты уверен, что хочешь\nудалить игрока из друзей?"),this.§_-6q§);
         this.§_-o2I§ = new §_-Q13§(gls("Попроситься в клан"),gls("Ты уверен, что хочешь\nподать заявку на вступление в клан?"),true,this.§_-d1a§);
         this.§_-CH§ = new §_-Q13§(gls("Пригласить в клан"),gls("Ты уверен, что хочешь\nпригласить игрока в клан?"),true,this.§_-kB§);
         this.§_-Rr§ = new §_-Q13§(gls("Пригласить в клан"),gls("Ты не можешь приглашать в клан,\nт.к. твой клан заблокирован."));
         this.§_-94§ = new §_-V2t§(gls("Выгнать из клана"),gls("Ты уверен, что хочешь\nвыгнать игрока из клана?"),this.§_-Wc§);
         this.§_-m1d§ = new §_-V2t§(gls("Добавить в черный список клана"),gls("Ты уверен, что хочешь добавить\nигрока в черный список клана?"),this.§_-q1§);
         this.dialogOutBlacklist = new §_-V2t§(gls("Удалить из черного списка клана"),gls("Ты уверен, что хочешь удалить\nигрока из черного списка клана?"),this.§_-52R§);
         this.§_-h1W§ = new §_-Q13§(gls("Сделать помощником"),gls("Ты точно хочешь сделать игрока твоим помощником?"),true,this.§_-61Z§);
         this.§_-r2X§ = new §_-Q13§(gls("Сделать помощником"),gls("Ты можешь сделать не более {0} помощников.",§_-e2W§.§_-AK§));
         this.§_-22P§ = new §_-V2t§(gls("Снять с должности помощника"),gls("Ты точно хочешь снять игрока с должности помощника?"),this.§_-s1w§);
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-W2P§);
      }
      
      private function §_-w2m§() : void
      {
         if(§_-IP§.§_-r1m§(this.player.id))
         {
            this.§_-23m§.show();
            return;
         }
         this.§_-S14§.show();
      }
      
      private function §_-L1x§(param1:Event) : void
      {
         var e:Event = param1;
         §_-k1C§.§_-Qb§();
         §_-EI§.load(function():void
         {
            §_-9m§.§_-031§(player.id);
         });
      }
      
      private function §_-W2P§(param1:ScreenEvent) : void
      {
         this.visible = false;
      }
      
      private function §_-Q0§(param1:Event) : void
      {
         var e:Event = param1;
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         §_-EI§.load(function():void
         {
            §_-92z§.start(player.id,true);
         },false,true);
      }
      
      private function §_-e1k§(param1:Event) : void
      {
         §_-71o§.show(§_-5B§.instance);
         §_-5B§.§_-R1G§(this.player.id);
      }
      
      private function §_-cj§(param1:Event) : void
      {
         this.§_-93p§.show();
      }
      
      private function §_-r2J§(param1:Event) : void
      {
         this.§_-ha§.show();
      }
      
      private function §_-a1P§(param1:Event) : void
      {
         §_-IP§.§_-S14§(this.player.id);
      }
      
      private function §_-I1B§(param1:Event) : void
      {
         §_-IP§.§_-b1X§(this.player.id);
      }
      
      private function §_-m1O§(param1:Event) : void
      {
         var e:Event = param1;
         §_-EI§.load(function():void
         {
            §_-92z§.start(player.id,false,true);
         },false,true);
      }
      
      private function §_-Pf§(param1:Event) : void
      {
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         if(!this.§_-2j§)
         {
            this.§_-2j§ = new §_-Qh§();
         }
         (this.§_-2j§ as §_-Qh§).playerId = this.player.id;
         this.§_-2j§.show();
      }
      
      private function §_-V2z§(param1:Event) : void
      {
         §_-MZ§.§_-g26§(this.player.id);
      }
      
      private function §_-PG§(param1:Event) : void
      {
         §_-72h§.§_-R2a§(this.player.id);
      }
      
      private function §_-33u§(param1:Event) : void
      {
         if(§_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§)
         {
            this.§_-o2I§.show();
         }
         else
         {
            new §_-Q13§(gls("Подать заявку"),gls("Вы не можете подавать заявки в кланы, если ваш уровень ниже {0}",§_-My§.§_-U1R§)).show();
         }
      }
      
      private function §_-D1u§(param1:Event) : void
      {
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).state != §_-S2I§.§_-F2Q§)
         {
            if(this.player["level"] >= §_-My§.§_-U1R§)
            {
               this.§_-CH§.show();
            }
            else
            {
               new §_-Q13§(gls("Приглашение в клан"),gls("В клан можно приглашать только белок {0} уровня и выше",§_-My§.§_-U1R§)).show();
            }
         }
         else
         {
            this.§_-Rr§.show();
         }
      }
      
      private function §_-d28§(param1:Event) : void
      {
         this.§_-94§.show();
      }
      
      private function §_-L2r§(param1:Event) : void
      {
         this.§_-m1d§.show();
      }
      
      private function §_-q1§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-G1j§,this.player.id);
      }
      
      private function §_-d2s§(param1:Event) : void
      {
         this.dialogOutBlacklist.show();
      }
      
      private function §_-52R§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-x1v§,this.player.id);
      }
      
      private function §_-x2V§() : void
      {
         Game.§_-x2V§(this.player.id);
      }
      
      private function §_-6q§() : void
      {
         Game.§_-6q§(this.player.id);
      }
      
      private function §_-kB§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-Wx§,this.player.id);
      }
      
      private function §_-Wc§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-23Z§,this.player.id);
      }
      
      private function §_-d1a§() : void
      {
         if(Game.self["clan_id"] != 0)
         {
            return;
         }
         Game.§_-qZ§ = this.player["clan_id"];
         Connection.§_-Li§(§_-h2B§.§_-t2k§,this.player["clan_id"]);
      }
      
      private function §_-be§(param1:Event) : void
      {
         if(§_-e2W§.§_-924§.length >= §_-e2W§.§_-AK§)
         {
            this.§_-r2X§.show();
            return;
         }
         this.§_-h1W§.show();
      }
      
      private function §_-61Z§() : void
      {
         if(this.player["clan_id"] == 0 || this.player["clan_id"] != Game.self["clan_id"])
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-x4§,this.player.id);
      }
      
      private function §_-S1r§(param1:Event) : void
      {
         this.§_-22P§.show();
      }
      
      private function §_-s1w§() : void
      {
         if(this.player["clan_id"] == 0 || this.player["clan_id"] != Game.self["clan_id"] || this.player["clan_duty"] != Clan.§_-jY§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-h1c§,this.player.id);
      }
   }
}


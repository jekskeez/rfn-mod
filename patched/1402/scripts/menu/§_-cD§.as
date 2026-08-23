package menu
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-WS§;
   import §_-X1k§.§_-Wd§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-r12§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-7y§;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-d1P§.§_-93K§;
   import §_-d1P§.§_-c1N§;
   import §_-i2A§.§_-k1O§;
   import §_-s2e§.§_-U2d§;
   import com.api.Player;
   import events.GameEvent;
   import events.ScreenEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-33I§;
   import views.§_-z§;
   
   public class §_-cD§ extends ContextMenu
   {
      
      private static var _instance:§_-cD§;
      
      private static var §_-E16§:EventDispatcher = new EventDispatcher();
      
      private var player:Player = null;
      
      private var title:Sprite;
      
      private var game:ContextMenuItem;
      
      private var §_-W23§:ContextMenuItem;
      
      private var friend:ContextMenuItem;
      
      private var §_-st§:ContextMenuItem;
      
      private var §_-l2i§:ContextMenuItem;
      
      private var §_-e1M§:ContextMenuItem;
      
      private var §_-KO§:ContextMenuItem;
      
      private var §_-e29§:ContextMenuItem;
      
      private var §_-ts§:ContextMenuItem;
      
      private var §_-D2c§:ContextMenuItem;
      
      private var §_-Z20§:ContextMenuItem;
      
      private var §_-YE§:ContextMenuItem;
      
      private var ban:ContextMenuItem;
      
      private var message:ContextMenuItem;
      
      private var §_-Nu§:ContextMenuItem;
      
      private var exchange:ContextMenuItem;
      
      private var §_-x1T§:ContextMenuItem;
      
      private var §_-S2h§:ContextMenuItem;
      
      private var §_-118§:§_-z§;
      
      private var §_-D2w§:§_-i5§;
      
      private var §_-43D§:DisplayObject;
      
      private var §_-Y2k§:Dialog = null;
      
      private var §_-U2p§:§_-Fk§ = null;
      
      private var §_-g2S§:§_-7y§ = null;
      
      private var §_-tq§:§_-Fk§ = null;
      
      private var §_-X2f§:§_-Fk§ = null;
      
      private var §_-c1d§:§_-7y§ = null;
      
      private var §_-21w§:§_-Fk§ = null;
      
      private var §_-81W§:§_-Fk§ = null;
      
      private var §_-xf§:§_-Fk§ = null;
      
      private var §_-5C§:§_-7y§ = null;
      
      private var §_-Yu§:§_-7y§ = null;
      
      private var dialogOutBlacklist:§_-7y§ = null;
      
      private var §_-u21§:Boolean = false;
      
      public function §_-cD§()
      {
         _instance = this;
         super(141);
      }
      
      public static function §_-e25§(param1:int) : void
      {
         if(!§_-r12§.§_-FS§(§_-n2E§.§_-33J§) || §_-t2c§.active is §_-fx§)
         {
            return;
         }
         if(!_instance.§_-u21§)
         {
            _instance.init();
            _instance.§_-u21§ = true;
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
            _instance.player.removeEventListener(_instance.§_-Y16§);
         }
         _instance.player = _loc2_;
         Game.stage.addEventListener(MouseEvent.MOUSE_UP,_instance.§_-43G§);
      }
      
      public static function §_-41k§() : Boolean
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
         if(§_-E16§)
         {
            §_-E16§.addEventListener(param1,param2);
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         §_-E16§.dispatchEvent(new GameEvent(GameEvent.SHOWED));
      }
      
      override public function update(param1:int = 42) : void
      {
         if(!param1)
         {
         }
         super.update(this.title.height);
         this.§_-43D§.height = int(this.title.height) + this.§_-jR§ * 22 + 0.5;
      }
      
      override protected function show(param1:MouseEvent) : void
      {
         this.§_-l2i§.hide();
         this.§_-e1M§.hide();
         this.friend.hide();
         this.§_-st§.hide();
         this.§_-KO§.hide();
         this.§_-e29§.hide();
         this.§_-ts§.hide();
         this.§_-x1T§.hide();
         this.§_-S2h§.hide();
         this.§_-D2c§.hide();
         this.§_-Z20§.hide();
         this.§_-YE§.hide();
         this.ban.hide();
         this.message.hide();
         this.§_-Nu§.show();
         this.game.active = false;
         this.§_-YE§.active = false;
         this.§_-D2w§.text = §_-XW§.§_-Wh§(this.player["exp"]);
         this.§_-118§.§_-yC§(this.player);
         (this.title as §_-y2z§).§_-yC§(this.player);
         this.§_-o2H§();
         if(!Game.§_-t2I§(this.player.id))
         {
            this.friend.show();
         }
         else
         {
            this.§_-st§.show();
         }
         this.exchange.active = !§_-WS§.§_-qT§;
         var _loc2_:Clan = §_-B2U§.§_-Q2g§(Game.self["clan_id"]);
         if(Game.self["clan_id"] == 0 && this.player["clan_id"] != 0 && §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§)
         {
            this.§_-KO§.show();
         }
         if(Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-01X§)
         {
            if(this.player["level"] >= §_-XW§.§_-I1V§ && this.player["clan_id"] != Game.self["clan_id"] && _loc2_.blacklist.indexOf(this.player["id"]) == -1)
            {
               this.§_-e29§.show();
            }
            if(this.player["clan_id"] == Game.self["clan_id"])
            {
               this.§_-ts§.show();
            }
         }
         if(Game.self["clan_id"] != 0 && (Game.self["clan_duty"] == Clan.§_-HJ§ && §_-B2U§.§_-T2u§.indexOf(this.player["id"]) == -1 && this.player["id"] != _loc2_.§_-W2t§ || Game.self["clan_duty"] == Clan.§_-01X§))
         {
            if(_loc2_.blacklist.indexOf(this.player["id"]) != -1)
            {
               this.§_-S2h§.show();
            }
            else
            {
               this.§_-x1T§.show();
            }
         }
         if(Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-HJ§)
         {
            if(this.player["clan_id"] == Game.self["clan_id"] && this.player["clan_duty"] != Clan.§_-HJ§ && this.player.id != _loc2_.§_-W2t§)
            {
               this.§_-ts§.show();
            }
            if(this.player["clan_id"] != Game.self["clan_id"])
            {
               this.§_-e29§.show();
            }
         }
         if(Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-01X§)
         {
            if(this.player["clan_id"] == Game.self["clan_id"])
            {
               if(this.player["clan_duty"] != Clan.§_-HJ§)
               {
                  this.§_-D2c§.show();
               }
               else
               {
                  this.§_-Z20§.show();
               }
            }
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
            this.§_-l2i§.hide();
            this.§_-YE§.show();
            this.message.show();
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-AJ§) && !§_-33I§.§_-V1O§(this.player.rights,§_-33I§.§_-AJ§))
         {
            this.ban.show();
         }
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            this.ban.show();
            this.§_-Nu§.show();
         }
         this.game.active = !(§_-t2c§.active is §_-u24§);
         this.§_-YE§.active = !(§_-t2c§.active is §_-u24§);
         this.§_-W23§.active = !(§_-t2c§.active is §_-u24§);
         this.update();
         super.show(param1);
      }
      
      private function §_-43G§(param1:MouseEvent = null) : void
      {
         if(this.player)
         {
            this.player.addEventListener(§_-Y2E§.ALL,this.§_-Y16§);
            Game.request(this.player["id"],§_-Y2E§.ALL);
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-43G§);
      }
      
      private function §_-Y16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-Y16§);
         this.show(null);
      }
      
      private function init() : void
      {
         this.title = new §_-y2z§();
         this.title.x = 1;
         addChild(this.title);
         this.game = add({
            "active":new GameActiveMenuItem(),
            "passive":new GameMenuItem(),
            "name":gls("Перейти в игру"),
            "handler":this.§_-A1E§
         });
         this.§_-W23§ = add({
            "active":new InviteActiveMenuItem(),
            "passive":new InviteMenuItem(),
            "name":gls("Сходить в гости"),
            "handler":this.§_-N7§
         });
         this.friend = add({
            "active":new FriendActiveMenuItem(),
            "name":gls("Добавить в друзья"),
            "handler":this.§_-dg§
         });
         this.§_-st§ = add({
            "active":new NoFriendActiveMenuItem(),
            "name":gls("Убрать из друзей"),
            "handler":this.§_-231§
         });
         this.§_-l2i§ = add({
            "active":new IgnoreActiveMenuItem(),
            "name":gls("Игнорировать"),
            "handler":this.§_-w19§
         });
         this.§_-e1M§ = add({
            "active":new NotIgnoreActiveMenuItem(),
            "name":gls("Убрать из игнора"),
            "handler":this.§_-lo§
         });
         this.§_-KO§ = add({
            "active":new ClanInviteActiveMenuItem(),
            "name":gls("Попроситься в клан"),
            "handler":this.§_-9g§
         });
         this.§_-e29§ = add({
            "active":new ClanInviteActiveMenuItem(),
            "name":gls("Пригласить в клан"),
            "handler":this.§_-11B§
         });
         this.§_-ts§ = add({
            "active":new ClanKickActiveMenuItem(),
            "name":gls("Выгнать из клана"),
            "handler":this.§_-w1C§
         });
         this.§_-x1T§ = add({
            "active":new ClanAddInBlacklist(),
            "name":gls("Добавить в чс"),
            "handler":this.§_-6K§
         });
         this.§_-S2h§ = add({
            "active":new ClanRemoveFromBlacklist(),
            "name":gls("Удалить из чс"),
            "handler":this.§_-03r§
         });
         this.§_-D2c§ = add({
            "active":new ClanSubleaderActiveMenuItem(),
            "name":gls("Сделать помощником"),
            "handler":this.§_-C2F§
         });
         this.§_-Z20§ = add({
            "active":new ClanFireSubleaderActiveMenuItem(),
            "name":gls("Снять с должности"),
            "handler":this.§_-61t§
         });
         this.exchange = add({
            "active":new ProfileExchangeActiveMenuItem(),
            "passive":new ProfileExchangeMenuItem(),
            "name":gls("Обмен"),
            "handler":this.§_-E7§
         });
         this.§_-YE§ = add({
            "active":new SpyMenuActiveItem(),
            "passive":new SpyMenuItem(),
            "name":gls("Наблюдать"),
            "handler":this.§_-Z2S§
         });
         this.ban = add({
            "active":new BanMenuActiveItem(),
            "name":gls("Забанить"),
            "handler":this.§_-y28§
         });
         this.message = add({
            "active":new WhisperActiveMenuItem(),
            "passive":new WhisperMenuItem(),
            "name":gls("Сообщение"),
            "handler":this.§_-zB§
         });
         this.§_-Nu§ = add({
            "active":new CompareActiveMenuItem(),
            "name":gls("Перейти на профиль"),
            "handler":this.§_-61A§
         });
         this.§_-43D§ = new ProfileContextMenuImage();
         addChild(this.§_-43D§);
         this.§_-D2w§ = new §_-i5§("200",-1,4,new TextFormat(§_-i5§.§_-c10§,11,16777215,true));
         this.§_-D2w§.width = 25;
         this.§_-D2w§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-D2w§);
         this.§_-118§ = new §_-z§();
         this.§_-118§.x = 131;
         this.§_-118§.y = 3;
         addChild(this.§_-118§);
         this.§_-U2p§ = new §_-Fk§(gls("Добавление в друзья"),gls("Добавив игрока в друзья, ты\nвсегда сможешь быстро его найти, чтобы\nпоиграть с ним или сходить в гости."),true,this.§_-J14§);
         this.§_-g2S§ = new §_-7y§(gls("Удаление из друзей"),gls("Ты уверен, что хочешь\nудалить игрока из друзей?"),this.§_-c1u§);
         this.§_-21w§ = new §_-Fk§(gls("Попроситься в клан"),gls("Ты уверен, что хочешь\nподать заявку на вступление в клан?"),true,this.§_-11e§);
         this.§_-81W§ = new §_-Fk§(gls("Пригласить в клан"),gls("Ты уверен, что хочешь\nпригласить игрока в клан?"),true,this.§_-U2k§);
         this.§_-xf§ = new §_-Fk§(gls("Пригласить в клан"),gls("Ты не можешь приглашать в клан,\nт.к. твой клан заблокирован."));
         this.§_-5C§ = new §_-7y§(gls("Выгнать из клана"),gls("Ты уверен, что хочешь\nвыгнать игрока из клана?"),this.§_-s1K§);
         this.§_-Yu§ = new §_-7y§(gls("Добавить в черный список клана"),gls("Ты уверен, что хочешь добавить\nигрока в черный список клана?"),this.§_-C2a§);
         this.dialogOutBlacklist = new §_-7y§(gls("Удалить из черного списка клана"),gls("Ты уверен, что хочешь удалить\nигрока из черного списка клана?"),this.§_-3R§);
         this.§_-tq§ = new §_-Fk§(gls("Сделать помощником"),gls("Ты точно хочешь сделать игрока твоим помощником?"),true,this.§_-21A§);
         this.§_-X2f§ = new §_-Fk§(gls("Сделать помощником"),gls("Ты можешь сделать не более {0} помощников.",§_-B2U§.§_-sc§));
         this.§_-c1d§ = new §_-7y§(gls("Снять с должности помощника"),gls("Ты точно хочешь снять игрока с должности помощника?"),this.§_-t1T§);
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-T14§);
      }
      
      private function §_-o2H§() : void
      {
         if(§_-u1T§.§_-P1f§(this.player.id))
         {
            this.§_-e1M§.show();
            return;
         }
         this.§_-l2i§.show();
      }
      
      private function §_-E7§(param1:Event) : void
      {
         var e:Event = param1;
         §_-WS§.§_-N14§();
         §_-U2d§.load(function():void
         {
            §_-k1O§.§_-yC§(player.id);
         });
      }
      
      private function §_-T14§(param1:ScreenEvent) : void
      {
         this.visible = false;
      }
      
      private function §_-A1E§(param1:Event) : void
      {
         var e:Event = param1;
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         §_-U2d§.load(function():void
         {
            §_-u24§.start(player.id,true);
         },false,true);
      }
      
      private function §_-N7§(param1:Event) : void
      {
         §_-t2c§.show(§_-51A§.instance);
         §_-51A§.§_-h2w§(this.player.id);
      }
      
      private function §_-dg§(param1:Event) : void
      {
         this.§_-U2p§.show();
      }
      
      private function §_-231§(param1:Event) : void
      {
         this.§_-g2S§.show();
      }
      
      private function §_-w19§(param1:Event) : void
      {
         §_-u1T§.§_-l2i§(this.player.id);
      }
      
      private function §_-lo§(param1:Event) : void
      {
         §_-u1T§.§_-yO§(this.player.id);
      }
      
      private function §_-Z2S§(param1:Event) : void
      {
         var e:Event = param1;
         §_-U2d§.load(function():void
         {
            §_-u24§.start(player.id,false,true);
         },false,true);
      }
      
      private function §_-y28§(param1:Event) : void
      {
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         if(!this.§_-Y2k§)
         {
            this.§_-Y2k§ = new §_-93K§();
         }
         (this.§_-Y2k§ as §_-93K§).playerId = this.player.id;
         this.§_-Y2k§.show();
      }
      
      private function §_-61A§(param1:Event) : void
      {
         var _loc2_:Player = Game.getPlayer(this.player.id);
         var _loc3_:* = _loc2_.profile;
         if(!_loc3_)
         {
            if(_loc2_.type != §_-Zy§.§_-Q1M§)
            {
               if(_loc2_.type != §_-Zy§.§_-zE§)
               {
                  return;
               }
               _loc3_ = "https://ok.ru/profile/" + _loc2_.nid;
            }
            else
            {
               _loc3_ = "https://vk.com/id" + _loc2_.nid;
            }
         }
         navigateToURL(new URLRequest(_loc3_),"_blank");
      }
      
      private function §_-zB§(param1:Event) : void
      {
         §_-c1N§.§_-q2d§(this.player.id);
      }
      
      private function §_-9g§(param1:Event) : void
      {
         if(§_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§)
         {
            this.§_-21w§.show();
         }
         else
         {
            new §_-Fk§(gls("Подать заявку"),gls("Вы не можете подавать заявки в кланы, если ваш уровень ниже {0}",§_-XW§.§_-I1V§)).show();
         }
      }
      
      private function §_-11B§(param1:Event) : void
      {
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).state != §_-s2l§.§_-F2E§)
         {
            if(this.player["level"] >= §_-XW§.§_-I1V§)
            {
               this.§_-81W§.show();
            }
            else
            {
               new §_-Fk§(gls("Приглашение в клан"),gls("В клан можно приглашать только белок {0} уровня и выше",§_-XW§.§_-I1V§)).show();
            }
         }
         else
         {
            this.§_-xf§.show();
         }
      }
      
      private function §_-w1C§(param1:Event) : void
      {
         this.§_-5C§.show();
      }
      
      private function §_-6K§(param1:Event) : void
      {
         this.§_-Yu§.show();
      }
      
      private function §_-C2a§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-X1H§,this.player.id);
      }
      
      private function §_-03r§(param1:Event) : void
      {
         this.dialogOutBlacklist.show();
      }
      
      private function §_-3R§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-22c§,this.player.id);
      }
      
      private function §_-J14§() : void
      {
         Game.§_-J14§(this.player.id);
      }
      
      private function §_-c1u§() : void
      {
         Game.§_-c1u§(this.player.id);
      }
      
      private function §_-U2k§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-33l§,this.player.id);
      }
      
      private function §_-s1K§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-z1l§,this.player.id);
      }
      
      private function §_-11e§() : void
      {
         if(Game.self["clan_id"] != 0)
         {
            return;
         }
         Game.§_-KO§ = this.player["clan_id"];
         Connection.§_-e2T§(§_-u1O§.§_-nH§,this.player["clan_id"]);
      }
      
      private function §_-C2F§(param1:Event) : void
      {
         if(§_-B2U§.§_-T2u§.length >= §_-B2U§.§_-sc§)
         {
            this.§_-X2f§.show();
            return;
         }
         this.§_-tq§.show();
      }
      
      private function §_-21A§() : void
      {
         if(this.player["clan_id"] == 0 || this.player["clan_id"] != Game.self["clan_id"])
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-C2K§,this.player.id);
      }
      
      private function §_-61t§(param1:Event) : void
      {
         this.§_-c1d§.show();
      }
      
      private function §_-t1T§() : void
      {
         if(this.player["clan_id"] == 0 || this.player["clan_id"] != Game.self["clan_id"] || this.player["clan_duty"] != Clan.§_-HJ§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-k5§,this.player.id);
      }
   }
}


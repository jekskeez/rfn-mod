package
{
   import §_-61C§.§_-a2p§;
   import §_-61C§.§_-im§;
   import §_-61C§.§_-z1J§;
   import §_-6f§.§_-y1G§;
   import §_-B37§.§_-Y7§;
   import §_-E1v§.§_-31Y§;
   import §_-J19§.§_-T2V§;
   import §_-J19§.§_-d2J§;
   import §_-J1i§.§_-H1z§;
   import §_-J1i§.§_-W1v§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.EventsManager;
   import §_-X1k§.NotificationManager;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-4v§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-86§;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-C3E§;
   import §_-X1k§.§_-EJ§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-I2l§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-N10§;
   import §_-X1k§.§_-OG§;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-Q2l§;
   import §_-X1k§.§_-T2A§;
   import §_-X1k§.§_-WS§;
   import §_-X1k§.§_-Wd§;
   import §_-X1k§.§_-X2k§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-f4§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-i2a§;
   import §_-X1k§.§_-ku§;
   import §_-X1k§.§_-r12§;
   import §_-X1k§.§_-u2n§;
   import §_-X1k§.§_-y2L§;
   import §_-bN§.§_-33Q§;
   import §_-bN§.§_-Fk§;
   import §_-bN§.§_-G25§;
   import §_-bN§.§_-LD§;
   import §_-bN§.§_-OB§;
   import §_-bN§.§_-Sg§;
   import §_-bN§.§_-TB§;
   import §_-bN§.§_-UK§;
   import §_-bN§.§_-YP§;
   import §_-bN§.§_-c2O§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-QI§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-cT§;
   import §_-c2C§.§_-e1v§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-gc§;
   import §_-c2C§.§_-j2f§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-c2C§.§_-x2y§;
   import §_-c2C§.§_-y10§;
   import §_-d1P§.§_-IW§;
   import §_-d1P§.§_-RU§;
   import §_-d1P§.§_-c1N§;
   import §_-hd§.§_-Hy§;
   import §_-s2e§.§_-O1h§;
   import §_-s2e§.§_-U2d§;
   import §_-s2e§.§_-UB§;
   import chat.§_-A2w§;
   import chat.§_-Q1F§;
   import com.api.ApiEvent;
   import com.api.LoggerEvent;
   import com.api.LoginEvent;
   import com.api.Player;
   import com.api.PlayerEvent;
   import com.api.Players;
   import com.api.PlayersEvent;
   import com.api.ReferralEvent;
   import com.api.RefillEvent;
   import com.api.Services;
   import events.GameEvent;
   import events.§_-a1V§;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.ui.ContextMenuItem;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-f1b§;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import protocol.§_-z1i§;
   import sounds.GameMusic;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import starling.core.Starling;
   import tape.§_-K21§;
   import utils.§_-316§;
   import utils.§_-33I§;
   import utils.§_-X2n§;
   import utils.§_-cx§;
   import views.§_-O2E§;
   import views.§_-aW§;
   import views.§_-y27§;
   
   public class Game extends MovieClip
   {
      
      public static const §_-W1G§:int = 600;
      
      public static const §_-m26§:int = 20;
      
      public static const R2D:Number = 57.29577951308232;
      
      public static const D2R:Number = 0.017453292519943295;
      
      public static const §_-sT§:int = 531;
      
      public static const §_-12A§:int = 10;
      
      public static const §_-mN§:int = 4;
      
      public static const §_-83g§:int = 4;
      
      public static const §_-E2T§:int = 4;
      
      public static const §_-da§:int = 4;
      
      public static const §_-K1o§:int = 6;
      
      public static const §_-oK§:int = 12;
      
      public static const §_-z1U§:int = 5;
      
      public static const §_-h2M§:int = 5;
      
      public static const §_-V1W§:int = 10;
      
      public static const §_-Bq§:int = 16;
      
      public static const §_-63u§:int = 50;
      
      public static const §_-kd§:int = 100;
      
      public static const §_-q7§:int = 300;
      
      public static const §_-Tz§:int = 1;
      
      public static const §_-z19§:int = 500;
      
      public static const §_-jn§:int = 1;
      
      public static const §_-f2J§:int = 100;
      
      public static const §_-w2P§:int = 1;
      
      public static const §_-n1I§:int = 15;
      
      private static const §_-9D§:int = 1;
      
      private static const §_-s1W§:int = 2;
      
      public static var §_-h5§:Array;
      
      private static var _instance:Game;
      
      public static var toggle:Boolean;
      
      public static var state:int;
      
      public static var activated:Boolean;
      
      public static var immortal:Boolean;
      
      public static var time:int;
      
      public static var target:Object;
      
      private static const §_-7S§:int = §_-9D§ | §_-s1W§;
      
      public static var starling:Starling = null;
      
      public static var §_-q1L§:Sprite = null;
      
      public static var self:Player = null;
      
      public static var §_-i24§:int = 0;
      
      public static var §_-KO§:int = 0;
      
      public static var §_-T2v§:int = 0;
      
      public static var §_-Qp§:int = -1;
      
      public static var §_-pn§:Boolean = false;
      
      public static var §_-7Z§:int = 0;
      
      public static var §_-C32§:int = 0;
      
      public static var §_-K1E§:int = 0;
      
      public static var §_-82§:Array = [];
      
      public static var §_-dj§:Array = [];
      
      public static var §_-d1o§:Array = [];
      
      public static var §_-p2R§:int = 0;
      
      public static var §_-53N§:int = 0;
      
      public static var §_-z16§:Boolean = true;
      
      public static var §_-dS§:Boolean = false;
      
      public static var §_-ul§:Boolean = true;
      
      private static var §_-o2b§:int = 0;
      
      private var §_-l3§:Analytics = null;
      
      private var friends:Object = {};
      
      private var §_-X29§:Object = {};
      
      private var §_-oj§:int = 0;
      
      private var §_-53Q§:Timer = new Timer(1000,1);
      
      private var §_-H1R§:Boolean = true;
      
      private var §_-g2d§:§_-A2w§ = null;
      
      private var §_-h1r§:§_-Fk§ = null;
      
      private var §_-s18§:§_-Fk§ = null;
      
      private var §_-m1T§:§_-Fk§ = null;
      
      private var §_-2j§:§_-Fk§ = null;
      
      private var §_-X1x§:§_-Fk§ = null;
      
      private var §_-T2o§:§_-Fk§ = null;
      
      private var §_-h2a§:Boolean = false;
      
      private var §_-82d§:Boolean = false;
      
      public function Game()
      {
         _instance = this;
         super();
         if(this.stage != null)
         {
            this.init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      public static function get chat() : §_-A2w§
      {
         return _instance.§_-g2d§;
      }
      
      public static function get §_-v1T§() : int
      {
         return Game.self.nuts;
      }
      
      public static function get §_-I20§() : int
      {
         return Game.self.coins;
      }
      
      public static function get rights() : int
      {
         return Game.§_-o2b§;
      }
      
      public static function get §_-u2f§() : Analytics
      {
         if(!_instance)
         {
            return null;
         }
         return _instance.§_-l3§;
      }
      
      public static function get §_-Z9§() : Boolean
      {
         return false;
      }
      
      public static function inviteFriendsByKey(param1:Event = null) : void
      {
         if(Game.self.type != §_-Zy§.§_-S2j§)
         {
            Game.inviteFriends();
            return;
         }
         Services.inviteFriendsByKey();
      }
      
      public static function inviteFriends(param1:Event = null) : void
      {
         §_-73Q§.§_-R1R§ = false;
         Services.inviteFriends();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-4u§);
      }
      
      public static function get §_-sl§() : Boolean
      {
         return Game.self != null && (Game.self.type == §_-Zy§.§_-nn§ || Boolean(Services.isOAuth));
      }
      
      public static function buy(param1:int, param2:uint, param3:uint, param4:int = 0, param5:int = 0) : void
      {
         _instance.buy(param1,param2,param3,param4,param5);
      }
      
      public static function §_-u2z§(param1:int, param2:uint, param3:uint, param4:int = 0, param5:int = 0) : Boolean
      {
         return _instance.§_-u2z§(param1,param2,param3,param4,param5);
      }
      
      public static function §_-53O§(param1:String, param2:Function, param3:int = 0) : void
      {
         if(_instance)
         {
            _instance.addEventListener(param1,param2,false,param3);
         }
      }
      
      public static function dispatchEvent(param1:Event) : void
      {
         _instance.dispatchEvent(param1);
      }
      
      public static function §_-72j§(param1:String, param2:Function) : void
      {
         if(_instance)
         {
            _instance.removeEventListener(param1,param2);
         }
      }
      
      public static function §_-t2I§(param1:int) : Boolean
      {
         return param1 in _instance.friends;
      }
      
      public static function §_-X1Y§(param1:int) : Boolean
      {
         return param1 in _instance.§_-X29§;
      }
      
      public static function get friends() : Object
      {
         return _instance.friends;
      }
      
      public static function §_-J14§(param1:int) : void
      {
         _instance.§_-J14§([param1]);
      }
      
      public static function §_-c1u§(param1:int) : void
      {
         _instance.§_-c1u§(param1);
      }
      
      public static function listen(param1:Function) : void
      {
         Services.players.listen(param1);
      }
      
      public static function forget(param1:Function) : void
      {
         Services.players.forget(param1);
      }
      
      public static function request(param1:*, param2:*, param3:Boolean = false) : void
      {
         if(param1 is Array && param1.length == 0)
         {
            return;
         }
         if(!(param2 is Array))
         {
            param2 = [param2,0];
         }
         if(param2.length == 1)
         {
            param2.push(0);
         }
         §_-p2U§.add("[Request user info] ids:" + (param1 is Array ? "[" + param1.join() + "]" : param1) + " type:" + param2 + " nocache:" + param3);
         Services.players.requestInfo(param1,param2,!param3);
      }
      
      public static function getPlayer(param1:int) : Player
      {
         return Services.players.getPlayer(param1);
      }
      
      public static function §_-p2c§(param1:§_-z1i§, param2:uint, param3:Boolean = false) : Array
      {
         return _instance.§_-p2c§(param1,param2,param3);
      }
      
      public static function get stage() : Stage
      {
         return _instance.stage;
      }
      
      public static function get selfId() : int
      {
         if(!Game.self || !Game.self.id)
         {
            return 0;
         }
         return Game.self.id;
      }
      
      public static function §_-01l§(param1:Object) : void
      {
         _instance.§_-01l§(param1);
      }
      
      public static function §_-23l§() : void
      {
         _instance.§_-23l§();
      }
      
      public static function §_-I1F§(param1:int, param2:int, param3:int = 0) : void
      {
         if(Game.self.nuts == param1 && Game.self.coins == param2)
         {
            return;
         }
         switch(param3)
         {
            case §_-s2l§.§_-G1n§:
               new §_-y1G§({
                  "contentItems":[{
                     "type":§_-A3y§.§_-l2X§,
                     "id":0,
                     "count":param1 - Game.self.nuts
                  }],
                  "description":gls("Спасибо за покупку!")
               }).show();
               break;
            case §_-s2l§.§_-cn§:
               §_-O2E§.coins = param2 - Game.self.coins;
               break;
            case §_-s2l§.§_-Vy§:
               §_-LD§.show();
               break;
            case §_-s2l§.§_-58§:
               new §_-UK§(param1 - Game.self.nuts).show();
         }
         if(param3 != §_-s2l§.§_-Aq§ && param3 != §_-s2l§.§_-49§ && param3 != §_-s2l§.§_-s1R§ && param3 != §_-s2l§.§_-11o§)
         {
            Game.self.nutsOld = param1;
         }
         Game.self.nuts = param1;
         Game.self.coins = param2 - §_-O2E§.coins;
         _instance.dispatchEvent(new GameEvent(GameEvent.BALANCE_CHANGED));
      }
      
      public static function §_-C3C§() : void
      {
         new §_-Hy§();
         §_-Y7§.instance.§_-03j§(new AtlasGameObjects());
      }
      
      public static function §_-036§(param1:Event) : void
      {
         Clipboard.generalClipboard.clear();
         Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,(param1.type == "menuItemSelect" ? param1.target.caption : param1.target.text).split(" ")[1],false);
      }
      
      private function init(param1:Event = null) : void
      {
         var _loc4_:String = null;
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         §_-uR§.setStatus(gls("Выполняется инициализация приложения"));
         this.§_-53Q§.addEventListener(TimerEvent.TIMER,Services.login);
         var _loc2_:Connection = new Connection();
         _loc2_.addEventListener(Event.CONNECT,this.onConnect);
         _loc2_.addEventListener(Connection.§_-GN§,this.onError);
         _loc2_.addEventListener(Connection.CONNECTION_CLOSED,this.onError);
         new GameMusic();
         new GameSounds();
         new §_-RH§();
         GameSounds.§_-zY§(§_-RH§.§_-N28§);
         Services.init(new §_-f2f§(§_-uR§.loaderInfo.parameters,§_-uR§.loaderInfo));
         Services.config.log = this.§_-5H§;
         Services.addEventListener(ApiEvent.LOADED,this.§_-n2k§);
         Services.addEventListener(LoginEvent.LOGIN,this.§_-G2t§);
         Services.addEventListener(LoggerEvent.LOGGER,this.§_-v17§);
         Services.addEventListener(RefillEvent.REFILL,this.§_-r2R§);
         Services.addEventListener(ReferralEvent.REFERRAL,this.§_-F1k§);
         (Services.players as Players).addEventListener(PlayersEvent.REQUEST,this.§_-Z2f§);
         (Services.players as Players).addEventListener(PlayersEvent.SAVE_SELF_PHOTO,this.§_-W16§);
         (Services.players as Players).addEventListener(PlayersEvent.SAVE_SELF_INFO,this.§_-W16§);
         var _loc3_:String = "";
         for(_loc4_ in §_-uR§.loaderInfo.parameters)
         {
            _loc3_ += "&" + _loc4_ + "=" + §_-uR§.loaderInfo.parameters[_loc4_];
         }
         §_-p2U§.add(_loc3_);
         Analytics.§_-q2V§();
         Services.load();
         new §_-Q2l§();
         NotificationManager.instance;
         Connection.listen(this.§_-x2f§,[§_-s2l§.LOGIN,§_-s2l§.§_-P26§,§_-s2l§.§_-12I§,§_-s2l§.§_-x1i§,§_-s2l§.§_-K1j§,§_-s2l§.§_-C2J§,§_-s2l§.BUY,§_-s2l§.§_-A19§,§_-s2l§.§_-M2g§]);
         Services.players.requestDelay = 1000;
         §_-Y2E§.§_-C1e§ = Services.config.noName;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
      }
      
      private function §_-5H§(... rest) : void
      {
         §_-p2U§.add("SERVICE LOG:",rest);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.target;
         if(_loc2_ is TextField)
         {
            if((_loc2_ as TextField).selectable && Game.stage.focus != _loc2_)
            {
               Game.stage.focus = _loc2_;
            }
         }
      }
      
      private function §_-Rx§() : void
      {
         if(this.§_-82d§)
         {
            return;
         }
         this.§_-82d§ = true;
         addChild(new §_-t2c§());
         §_-t2c§.§_-a1K§("Learning",new §_-fx§());
         §_-t2c§.§_-a1K§("Location",new §_-si§());
         §_-t2c§.§_-a1K§("Профиль",new §_-51A§());
         §_-t2c§.§_-a1K§("Wardrobe",new §_-x2y§());
         §_-t2c§.§_-a1K§("Collection",new §_-e1v§());
         §_-t2c§.§_-a1K§("Clan",new §_-P1w§());
         §_-t2c§.§_-a1K§("Rating",new §_-j2f§());
         §_-t2c§.§_-a1K§("Edit",new §_-H1k§());
         §_-t2c§.§_-a1K§("Game",new §_-u24§());
         §_-t2c§.§_-a1K§("School",new §_-S2E§());
         §_-t2c§.§_-a1K§("Award",new §_-y10§());
         §_-t2c§.§_-a1K§("ShamanTree",new §_-QI§());
      }
      
      private function §_-3h§() : void
      {
         if(this.§_-h2a§)
         {
            return;
         }
         this.§_-h2a§ = true;
         §_-uR§.setStatus(gls("Выполняется инициализация библиотек"));
         new §_-U2d§();
         §_-O1h§.§_-OV§();
         §_-UB§.§_-F1X§();
         this.§_-z1r§();
         Game.listen(this.§_-Y16§);
         §_-B2U§.listen(this.onClanLoaded);
         §_-86§.init();
         §_-C3E§.init();
         §_-OG§.init();
         §_-B2U§.init();
         §_-P2x§.init();
         §_-L1o§.init();
         §_-y2L§.init();
         §_-WS§.init();
         §_-X2k§.init();
         §_-kG§.init();
         §_-N10§.init();
         §_-I2l§.init();
         §_-Ac§.init();
         EventsManager.init();
         §_-31Y§.init();
         §_-XW§.init();
         §_-LZ§.init();
         §_-ku§.init();
         §_-C2b§.init();
         NuttyPassManager.init();
         §_-hO§.init();
         §_-T2A§.init();
         §_-82O§.init();
         §_-f4§.init();
         §_-Wd§.init();
         §_-u2n§.init();
         §_-4v§.init();
         §_-F1Z§.init();
         §_-EJ§.init();
         §_-i2a§.init();
         §_-Qw§.init();
         new §_-at§();
         new §_-u1T§();
         new §_-cD§();
         new §_-I2l§();
         this.§_-Rx§();
         §_-73Q§.init();
         §_-p2U§.init(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-AJ§ | §_-33I§.§_-m12§));
         GameMusic.§_-A3z§();
         this.§_-VS§();
         addChild(new §_-im§());
         addChild(new §_-H1z§());
         new §_-Mf§();
      }
      
      private function §_-VS§() : void
      {
         new §_-G25§();
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
         {
         }
         new §_-RU§();
         new §_-IW§();
         new §_-c1N§();
      }
      
      private function §_-23l§() : void
      {
         §_-C3C§();
         §_-f1b§.init();
         this.§_-g2d§ = new §_-A2w§();
         this.§_-g2d§.§_-C1s§();
         addChild(this.§_-g2d§);
         §_-a2p§.§_-Q1u§();
      }
      
      private function onConnect(param1:Event) : void
      {
         §_-p2U§.add("Game.onConnect");
         §_-r12§.onLoad(this.§_-P2N§);
         §_-r12§.init();
         Services.login();
      }
      
      private function §_-P2N§() : void
      {
         GameMusic.on = !§_-r12§.§_-FS§(§_-n2E§.§_-U1G§);
         GameSounds.on = !§_-r12§.§_-FS§(§_-n2E§.§_-XU§);
         Game.§_-ul§ = §_-r12§.§_-FS§(§_-n2E§.§_-T2s§);
         Game.§_-z16§ = !§_-r12§.§_-FS§(§_-n2E§.§_-S1K§);
         Game.§_-dS§ = !§_-r12§.§_-FS§(§_-n2E§.§_-F1o§);
         if(!§_-r12§.§_-FS§(§_-n2E§.§_-33J§))
         {
            new §_-c2O§().show();
         }
      }
      
      private function onError(param1:Event) : void
      {
         §_-p2U§.add("error",param1);
         if(§_-t2c§.active is §_-H1k§)
         {
            _instance.dispatchEvent(new GameEvent(GameEvent.CONNECTION_CLOSED));
            return;
         }
         this.setStatus(~§_-9D§);
         §_-uR§.hide();
         if(!§_-t2c§.instance)
         {
            addChild(new §_-t2c§());
         }
         §_-t2c§.§_-51H§(false);
         §_-t2c§.§_-a1K§("Disconnected",new §_-gc§());
         §_-t2c§.show("Disconnected");
      }
      
      private function buy(param1:uint, param2:uint, param3:uint, param4:int, param5:int) : void
      {
         if(!this.§_-41h§(param2,param3))
         {
            return;
         }
         GameSounds.play("buy",true);
         Connection.§_-e2T§(§_-u1O§.BUY,param1,param2,param3,param4,param5);
      }
      
      private function §_-u2z§(param1:uint, param2:uint, param3:uint, param4:int, param5:int) : Boolean
      {
         if(§_-Wd§.§_-xR§)
         {
            return false;
         }
         if(Game.§_-I20§ < param2)
         {
            Services.bank.open(§_-Sg§.§_-7G§);
            return false;
         }
         if(Game.§_-v1T§ < param3)
         {
            Services.bank.open(§_-Sg§.§_-23U§);
            return false;
         }
         Connection.§_-e2T§(§_-u1O§.BUY,param1,param2,param3,param4,param5);
         return true;
      }
      
      private function §_-41h§(param1:uint, param2:uint) : Boolean
      {
         if(§_-Wd§.§_-xR§)
         {
            return false;
         }
         if(Game.§_-I20§ < param1)
         {
            Services.bank.open(§_-Sg§.§_-7G§);
            return false;
         }
         if(Game.§_-v1T§ < param2)
         {
            Services.bank.open(§_-Sg§.§_-23U§);
            return false;
         }
         Game.§_-I1F§(Game.self.nuts - param2,Game.self.coins - param1,§_-s2l§.§_-W1j§);
         return true;
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(Game.self.clan_id == 0 || Game.self.clan_id != 0 && _loc2_.id != Game.self.clan_id)
         {
            return;
         }
         if(Game.self.id == _loc2_.§_-W2t§)
         {
            Game.self.clan_duty = Clan.§_-01X§;
         }
         this.setStatus(§_-s1W§);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != Game.selfId)
         {
            return;
         }
         if(_loc2_.clan_id != 0)
         {
            return;
         }
         this.setStatus(§_-s1W§);
      }
      
      private function §_-T12§(param1:Array) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1 = §_-cx§.§_-Q1v§(param1);
         Game.§_-d1o§ = param1;
         Game.§_-Qp§ = param1.length;
         Connection.§_-e2T§(§_-u1O§.§_-v2S§,Game.§_-d1o§);
      }
      
      private function §_-o14§(param1:Array) : void
      {
         if(param1 == null)
         {
            return;
         }
         Game.§_-dj§ = §_-cx§.§_-Q1v§(param1);
         §_-OB§.init();
      }
      
      private function setStatus(param1:int) : void
      {
         var _loc2_:int = this.§_-oj§;
         this.§_-oj§ |= param1;
         §_-p2U§.add("setStatus",this.§_-oj§);
         if(_loc2_ == §_-7S§ || this.§_-oj§ != §_-7S§)
         {
            return;
         }
         Services.initBank();
         Services.setCounter(0);
         this.§_-1w§();
         Services.friends.get(this.§_-o14§);
         Services.friends.getAppUsers(this.§_-T12§);
         this.startGame();
      }
      
      private function startGame() : void
      {
         §_-W1v§.update();
         §_-t2c§.§_-51H§(true);
         §_-si§.§_-eV§(§_-LZ§.§_-mA§);
         §_-uR§.hide();
         §_-t2c§.show("Location");
         §_-33Q§.§_-T1k§();
         §_-Q2l§.§_-03g§();
         Services.players.requestDelay = 0;
         if(Game.self.type == §_-Zy§.§_-Q1M§ && !Services.isOAuth)
         {
            Services.requestNotification();
         }
      }
      
      private function §_-1w§() : void
      {
         §_-p2U§.add("setReferrer for id " + Game.self.id + " and referrer " + §_-A1Y§.get());
         if(§_-A1Y§.§_-x1q§())
         {
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-U1C§,Game.self["type"]);
         }
      }
      
      private function save(param1:Player) : void
      {
         var _loc2_:String = param1.name == Services.config.noName ? "" : param1.name;
         §_-p2U§.add("SAVED player.name, player.sex, player.bdate, player.photoBig, player.profile, player.email, player.country",param1.name,param1.sex,param1.bdate,param1.photoBig,param1.profile,param1.email,param1.country);
         if("country" in param1)
         {
            Connection.§_-e2T§(§_-u1O§.§_-P26§,_loc2_,param1.sex,param1.bdate,param1.photoBig,param1.profile,param1.email,§_-316§.§_-336§(param1.country,Game.self.type));
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-P26§,_loc2_,param1.sex,param1.bdate,param1.photoBig,param1.profile,param1.email);
         }
      }
      
      private function §_-01l§(param1:Object) : void
      {
         Game.self.name = param1["name"];
         Game.self.sex = param1["sex"];
         if("email" in param1)
         {
            Game.self.email = param1["email"];
         }
         this.save(Game.self);
      }
      
      private function §_-J14§(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(!§_-t2I§(param1[_loc3_]))
            {
               §_-p2U§.add("Game.addFriend " + param1[_loc3_]);
               this.friends[param1[_loc3_]] = true;
               ++Game.§_-T2v§;
               _loc2_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         dispatchEvent(new GameEvent(GameEvent.ADD_FRIEND,{"value":_loc2_}));
         Connection.§_-e2T§(§_-u1O§.§_-w11§,param1);
      }
      
      private function §_-c1u§(param1:int) : void
      {
         if(!§_-t2I§(param1))
         {
            return;
         }
         §_-p2U§.add("Game.removeFriend " + param1);
         delete this.friends[param1];
         --Game.§_-T2v§;
         dispatchEvent(new GameEvent(GameEvent.REMOVE_FRIEND,{"value":[param1]}));
         Connection.§_-e2T§(§_-u1O§.§_-j15§,param1);
      }
      
      private function §_-z1r§() : void
      {
         var copyIDButton:ContextMenuItem = null;
         try
         {
            §_-uR§.§_-h1A§(Game.§_-q1L§);
            copyIDButton = new ContextMenuItem("ID: " + Game.selfId,true,true);
            copyIDButton.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,§_-036§);
            Game.§_-q1L§.contextMenu.customItems.push(copyIDButton);
         }
         catch(e:Error)
         {
            §_-p2U§.add("Error addContextUid",e);
         }
      }
      
      private function §_-p2c§(param1:§_-z1i§, param2:uint, param3:Boolean = false) : Array
      {
         var _loc6_:Object = null;
         var _loc4_:Array = §_-Y2E§.parse(param1,param2);
         var _loc5_:Array = [];
         for each(_loc6_ in _loc4_)
         {
            if("photo_big" in _loc6_ && _loc6_["photo_big"] != "" || !param3)
            {
               _loc5_.push(_loc6_["uid"]);
            }
            if(_loc6_["uid"] == Game.selfId)
            {
               if("exp" in _loc6_ && !this.§_-H1R§ && §_-XW§.§_-UG§(§_-LZ§.§_-v1§,_loc6_["exp"]))
               {
                  §_-LZ§.§_-1L§(_loc6_["exp"]);
               }
               if("vip_info" in _loc6_ && _loc6_["vip_buy"] != 0 && _loc6_["vip_time"] == 0 && this.§_-H1R§)
               {
                  §_-t2c§.addCallback(§_-YP§.show);
               }
               if("respawn_totem" in _loc6_)
               {
                  _loc6_["respawn_totem_last_update"] = getTimer() / 1000;
               }
            }
            Services.players.dataLoaded(_loc6_,param2);
            if(this.§_-H1R§)
            {
               if(§_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§)
               {
                  §_-y27§.§_-i1S§();
               }
               this.§_-H1R§ = false;
            }
         }
         return _loc5_;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Player = null;
         var _loc8_:int = 0;
         var _loc9_:§_-Fk§ = null;
         switch(param1.type)
         {
            case §_-s2l§.LOGIN:
               _loc2_ = int(param1[§_-s2l§.§_-l20§]);
               switch(_loc2_)
               {
                  case §_-s2l§.§_-JE§:
                     §_-uR§.setStatus(gls("Выполняется загрузка данных"));
                     Game.self = Services.players.getPlayer(param1[§_-s2l§.§_-d5§]);
                     Game.self.type = Services.netType();
                     Game.self.email = param1[§_-s2l§.§_-211§];
                     Game.§_-o2b§ = param1[§_-s2l§.§_-ZT§];
                     Game.§_-KO§ = param1[§_-s2l§.§_-a19§];
                     Game.§_-i24§ = param1[§_-s2l§.§_-m1B§];
                     Game.§_-7Z§ = param1[§_-s2l§.§_-ZQ§];
                     Game.§_-C32§ = param1[§_-s2l§.§_-b1z§];
                     Game.§_-K1E§ = param1[§_-s2l§.§_-q11§];
                     Game.§_-h5§ = param1[§_-s2l§.§_-l1T§];
                     this.§_-3h§();
                     this.setStatus(§_-9D§);
                     Services.requestLiked();
                     Services.requestGroup();
                     Connection.§_-e2T§(§_-u1O§.§_-C1j§);
                     Connection.§_-e2T§(§_-u1O§.§_-g1y§);
                     Game.§_-p2R§ = param1[§_-s2l§.§_-9n§];
                     if(Game.§_-p2R§ == 0)
                     {
                        Services.referral();
                     }
                     break;
                  case §_-s2l§.LOGIN_EXIST:
                     §_-uR§.setStatus(gls("Ожидание завершения предыдущего подключения"));
                     this.§_-53Q§.reset();
                     this.§_-53Q§.start();
                     break;
                  case §_-s2l§.LOGIN_FAILED:
                     §_-uR§.setStatus(gls("Не удалось войти в игру"));
                     break;
                  case §_-s2l§.§_-a2k§:
                     §_-uR§.hide();
                     Game.self = Services.players.getPlayer(param1[§_-s2l§.§_-d5§]);
                     this.§_-z1r§();
                     if(!§_-t2c§.instance)
                     {
                        addChild(new §_-t2c§());
                     }
                     §_-t2c§.§_-a1K§("Block",new §_-cT§());
                     break;
                  case §_-s2l§.§_-f27§:
                     §_-uR§.setStatus(gls("Доступ ограничен, попробуйте позже..."));
                     setTimeout(Connection.§_-P6§,5000);
               }
               this.§_-l3§ = new Analytics(Game.selfId);
               Analytics.§_-v2g§(_loc2_);
               break;
            case §_-s2l§.§_-P26§:
               this.§_-p2c§(param1[0],param1[1]);
               break;
            case §_-s2l§.§_-12I§:
               _loc3_ = Game.§_-p2c§(param1[0],param1[1],true);
               Game.§_-82§ = Game.§_-82§.concat(_loc3_);
               _loc4_ = [];
               _loc5_ = 0;
               while(_loc5_ < _loc3_.length)
               {
                  if(!(§_-t2I§(_loc3_[_loc5_]) || §_-X1Y§(_loc3_[_loc5_])))
                  {
                     _loc4_.push(_loc3_[_loc5_]);
                  }
                  _loc5_++;
               }
               if(_loc4_.length > 0)
               {
                  this.§_-J14§(_loc4_);
               }
               break;
            case §_-s2l§.§_-x1i§:
               if(param1[1] == §_-u1O§.§_-K1q§ && param1[0] == Game.selfId)
               {
                  Game.§_-53N§ = getTimer() / 1000 + param1[4];
                  if(this.§_-g2d§)
                  {
                     this.§_-g2d§.§_-C1s§();
                  }
                  §_-Q1F§.§_-C1s§();
               }
               if(param1[2] != §_-u1O§.§_-b2O§)
               {
                  return;
               }
               _loc6_ = int(param1[0]);
               _loc7_ = getPlayer(_loc6_);
               _loc7_.name = "Player " + _loc6_;
               _loc7_.resetPhoto();
               Game.request(_loc6_,§_-Y2E§.ALL,true);
               break;
            case §_-s2l§.§_-K1j§:
               Game.§_-I1F§(param1[1],param1[0],param1[2]);
               break;
            case §_-s2l§.§_-C2J§:
               _loc8_ = 0;
               while(_loc8_ < param1[0].length)
               {
                  if(param1[0][_loc8_ + 1] == 1)
                  {
                     this.§_-X29§[param1[0][_loc8_]] = true;
                  }
                  else
                  {
                     this.friends[param1[0][_loc8_]] = true;
                     Game.§_-82§.push(param1[0][_loc8_]);
                     ++Game.§_-T2v§;
                  }
                  _loc8_ += 2;
               }
               break;
            case §_-s2l§.BUY:
               if(param1[5] != Game.selfId)
               {
                  break;
               }
               switch(param1[0])
               {
                  case §_-s2l§.§_-v1E§:
                     GameSounds.play("buy",true);
                     switch(param1[2])
                     {
                        case §_-u1O§.§_-O27§:
                           §_-K21§.§_-9V§(param1[6]);
                           break;
                        case §_-u1O§.§_-gh§:
                           if(Game.self["clan_id"] > 0)
                           {
                              §_-B2U§.request(Game.self["clan_id"],§_-eT§.§_-x2Q§,true);
                           }
                           break;
                        case §_-u1O§.§_-63I§:
                           if(§_-t2c§.active is §_-u24§)
                           {
                              return;
                           }
                           §_-t2c§.show(§_-51A§.instance);
                           §_-51A§.§_-h2w§(Game.selfId);
                           §_-z1J§.§_-e22§();
                           break;
                        case §_-u1O§.§_-j1U§:
                           new §_-T2V§(param1[6]).show();
                           break;
                        case §_-u1O§.§_-Z2l§:
                           new §_-T2V§(param1[6]).show();
                           break;
                        case §_-u1O§.§_-RL§:
                           if("6" in param1)
                           {
                              new §_-d2J§().show();
                           }
                     }
                     break;
                  case §_-s2l§.§_-l1C§:
                  case §_-s2l§.§_-Q10§:
                  case §_-s2l§.§_-T2r§:
               }
               break;
            case §_-s2l§.§_-A19§:
               _loc9_ = new §_-Fk§(gls("Сообщение"),gls(param1[0].toString()),false,null,300);
               _loc9_.show();
               break;
            case §_-s2l§.§_-M2g§:
               §_-aW§.instance.open();
               switch(param1[0])
               {
                  case §_-s2l§.§_-L2W§:
                     if(!this.§_-h1r§)
                     {
                        this.§_-h1r§ = new §_-Fk§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как он находится не в игре"),false,null,350);
                     }
                     this.§_-h1r§.show();
                     break;
                  case §_-s2l§.§_-b9§:
                     if(!this.§_-s18§)
                     {
                        this.§_-s18§ = new §_-Fk§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу: либо он не в игре, либо в его команде нет свободных мест."),false,null,350);
                     }
                     this.§_-s18§.show();
                     break;
                  case §_-s2l§.§_-bw§:
                     if(!this.§_-m1T§)
                     {
                        this.§_-m1T§ = new §_-Fk§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как его нет в игровой локации"),false,null,350);
                     }
                     this.§_-m1T§.show();
                     break;
                  case §_-s2l§.§_-uC§:
                     if(!this.§_-2j§)
                     {
                        this.§_-2j§ = new §_-Fk§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как в его команде нет свободных мест."),false,null,350);
                     }
                     this.§_-2j§.show();
                     break;
                  case §_-s2l§.§_-q1p§:
                     if(!this.§_-X1x§)
                     {
                        this.§_-X1x§ = new §_-Fk§(gls("Перейти в игру"),gls("Ты не можешь перейти в игру к другу, так как не состоишь в его клане"),false,null,350);
                     }
                     this.§_-X1x§.show();
                     break;
                  case §_-s2l§.§_-62a§:
                     if(!this.§_-T2o§)
                     {
                        this.§_-T2o§ = new §_-Fk§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как эта локация тебе еще не доступна."),false,null,350);
                     }
                     this.§_-T2o§.show();
                     break;
                  case §_-s2l§.§_-w2v§:
                     §_-TB§.show(param1[1]);
               }
         }
      }
      
      private function §_-n2k§(param1:Event) : void
      {
         §_-uR§.setStatus(gls("Выполняется подключение к серверу"));
         Connection.connect(§_-Zy§.§_-z2c§,§_-Zy§.§_-m1G§,§_-Zy§.§_-G2Y§);
      }
      
      private function §_-r2R§(param1:Event) : void
      {
         if(§_-Zy§.§_-t2A§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.REFILL);
      }
      
      private function §_-G2t§(param1:LoginEvent) : void
      {
         §_-uR§.setStatus(gls("Выполняется авторизация на сервере"));
         if(Boolean(Services.isOAuth) && Boolean(§_-uR§.§_-p2P§["token"]))
         {
            Connection.§_-e2T§(§_-u1O§.LOGIN,param1.netType,new §_-X2n§(param1.id),§_-uR§.§_-p2P§["token"],§_-A1Y§.get());
            return;
         }
         if(param1.authKey == "")
         {
            Connection.§_-e2T§(§_-u1O§.LOGIN,param1.netType,new §_-X2n§(param1.id),param1.key,§_-A1Y§.get());
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.LOGIN,param1.netType,new §_-X2n§(param1.id),param1.key,§_-A1Y§.get(),param1.authKey);
         }
      }
      
      private function §_-v17§(param1:LoggerEvent) : void
      {
         §_-p2U§.add("New loggerEvent: " + param1.message);
      }
      
      private function §_-Z2f§(param1:PlayersEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.REQUEST,param1.uids,param1.rType[0]);
      }
      
      private function §_-W16§(param1:PlayersEvent) : void
      {
         this.save(Game.self);
      }
      
      private function §_-F1k§(param1:ReferralEvent) : void
      {
         var _loc2_:§_-X2n§ = new §_-X2n§(param1.id);
         if(_loc2_.lowValue <= 0 || _loc2_.toString() == Game.self.nid)
         {
            return;
         }
         §_-p2U§.add("REFERRAL DETECTED!! ID INVITER " + _loc2_);
         Connection.§_-e2T§(§_-u1O§.§_-C1g§,_loc2_);
      }
   }
}


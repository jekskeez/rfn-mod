package
{
   import §_-68§.§_-EI§;
   import §_-68§.§_-M10§;
   import §_-68§.§_-c1l§;
   import §_-C1l§.§_-AF§;
   import §_-D2q§.§_-cu§;
   import §_-D2q§.§_-i1e§;
   import §_-I10§.EventsManager;
   import §_-I10§.NotificationManager;
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-01k§;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-3U§;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-82N§;
   import §_-I10§.§_-A29§;
   import §_-I10§.§_-B3s§;
   import §_-I10§.§_-Bg§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-S9§;
   import §_-I10§.§_-W1e§;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-a1D§;
   import §_-I10§.§_-ct§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-e1z§;
   import §_-I10§.§_-f22§;
   import §_-I10§.§_-f2P§;
   import §_-I10§.§_-g1R§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-I10§.§_-k1C§;
   import §_-I10§.§_-l1f§;
   import §_-I10§.§_-m2t§;
   import §_-O24§.§_-l1D§;
   import §_-S1D§.§_-3m§;
   import §_-S1D§.§_-O1M§;
   import §_-S1D§.§_-V18§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-5T§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-F2y§;
   import §_-T2y§.§_-J29§;
   import §_-T2y§.§_-J2n§;
   import §_-T2y§.§_-M1j§;
   import §_-T2y§.§_-P1Y§;
   import §_-T2y§.§_-ac§;
   import §_-T2y§.§_-cG§;
   import §_-T2y§.§_-n2a§;
   import §_-T2y§.§_-w17§;
   import §_-U2w§.§_-33G§;
   import §_-U2w§.§_-72h§;
   import §_-U2w§.§_-f2U§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-e2w§.§_-1W§;
   import §_-e2w§.§_-B1d§;
   import §_-k1c§.§_-7O§;
   import §_-k1c§.§_-83D§;
   import §_-k1c§.§_-F2X§;
   import §_-k1c§.§_-G1§;
   import §_-k1c§.§_-Q13§;
   import §_-k1c§.§_-c2J§;
   import §_-k1c§.§_-e15§;
   import §_-k1c§.§_-h1y§;
   import §_-k1c§.§_-t1I§;
   import §_-k1c§.§_-z1T§;
   import §_-l26§.§_-MZ§;
   import §_-t1F§.§_-oT§;
   import chat.§_-6O§;
   import chat.§_-v13§;
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
   import events.§_-n13§;
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
   import game.mainGame.entity.§_-03s§;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-U1M§;
   import protocol.§_-h2B§;
   import sounds.GameMusic;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import starling.core.Starling;
   import tape.§_-Y5§;
   import utils.§_-ae§;
   import utils.§_-c10§;
   import utils.§_-qF§;
   import utils.§_-t2g§;
   import views.§_-5b§;
   import views.§_-U1§;
   import views.§_-Vm§;
   
   public class Game extends MovieClip
   {
      
      public static const §_-233§:int = 600;
      
      public static const §_-KX§:int = 20;
      
      public static const R2D:Number = 57.29577951308232;
      
      public static const D2R:Number = 0.017453292519943295;
      
      public static const §_-s2q§:int = 531;
      
      public static const §_-x2P§:int = 10;
      
      public static const §_-t1X§:int = 4;
      
      public static const §_-M29§:int = 4;
      
      public static const §_-Z7§:int = 4;
      
      public static const §_-P2z§:int = 4;
      
      public static const §_-o9§:int = 6;
      
      public static const §_-b2u§:int = 12;
      
      public static const §_-LO§:int = 5;
      
      public static const §_-CY§:int = 5;
      
      public static const §_-ow§:int = 10;
      
      public static const §_-L1O§:int = 16;
      
      public static const §_-Rb§:int = 50;
      
      public static const §_-z2b§:int = 100;
      
      public static const §_-pl§:int = 300;
      
      public static const §_-X8§:int = 1;
      
      public static const §_-Z1x§:int = 500;
      
      public static const §_-71S§:int = 1;
      
      public static const §_-Y1B§:int = 100;
      
      public static const §_-n2b§:int = 1;
      
      public static const §_-Q2m§:int = 15;
      
      private static const §_-In§:int = 1;
      
      private static const §_-j1u§:int = 2;
      
      public static var §_-N2V§:Array;
      
      private static var _instance:Game;
      
      public static var toggle:Boolean;
      
      public static var state:int;
      
      public static var activated:Boolean;
      
      public static var immortal:Boolean;
      
      public static var time:int;
      
      public static var target:Object;
      
      private static const §_-Wd§:int = §_-In§ | §_-j1u§;
      
      public static var starling:Starling = null;
      
      public static var §_-d2t§:Sprite = null;
      
      public static var self:Player = null;
      
      public static var §_-nE§:int = 0;
      
      public static var §_-qZ§:int = 0;
      
      public static var §_-n1s§:int = 0;
      
      public static var §_-b2g§:int = -1;
      
      public static var §_-s17§:Boolean = false;
      
      public static var §_-91C§:int = 0;
      
      public static var §_-a1l§:int = 0;
      
      public static var §_-d2H§:int = 0;
      
      public static var §_-t1u§:Array = [];
      
      public static var §_-B2U§:Array = [];
      
      public static var §_-B3t§:Array = [];
      
      public static var §_-51E§:int = 0;
      
      public static var §_-K3§:int = 0;
      
      public static var §_-L2T§:Boolean = true;
      
      public static var §_-nC§:Boolean = false;
      
      public static var §_-v4§:Boolean = true;
      
      private static var §_-t1v§:int = 0;
      
      private var §_-c2A§:Analytics = null;
      
      private var friends:Object = {};
      
      private var §_-cJ§:Object = {};
      
      private var §_-XW§:int = 0;
      
      private var §_-51v§:Timer = new Timer(1000,1);
      
      private var §_-W1b§:Boolean = true;
      
      private var §_-53E§:§_-6O§ = null;
      
      private var §_-N1L§:§_-Q13§ = null;
      
      private var §_-73R§:§_-Q13§ = null;
      
      private var §_-w21§:§_-Q13§ = null;
      
      private var §_-d1i§:§_-Q13§ = null;
      
      private var §_-m1D§:§_-Q13§ = null;
      
      private var §_-L1r§:§_-Q13§ = null;
      
      private var §_-V2I§:Boolean = false;
      
      private var §_-S§:Boolean = false;
      
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
      
      public static function get chat() : §_-6O§
      {
         return _instance.§_-53E§;
      }
      
      public static function get §_-I2M§() : int
      {
         return Game.self.nuts;
      }
      
      public static function get §_-DJ§() : int
      {
         return Game.self.coins;
      }
      
      public static function get rights() : int
      {
         return Game.§_-t1v§;
      }
      
      public static function get §_-B3U§() : Analytics
      {
         if(!_instance)
         {
            return null;
         }
         return _instance.§_-c2A§;
      }
      
      public static function get §_-S2k§() : Boolean
      {
         return false;
      }
      
      public static function inviteFriendsByKey(param1:Event = null) : void
      {
         if(Game.self.type != §_-a9§.§_-kT§)
         {
            Game.inviteFriends();
            return;
         }
         Services.inviteFriendsByKey();
      }
      
      public static function inviteFriends(param1:Event = null) : void
      {
         §_-K1r§.§_-O1P§ = false;
         Services.inviteFriends();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-32b§);
      }
      
      public static function get §_-m1n§() : Boolean
      {
         return Game.self != null && (Game.self.type == §_-a9§.§_-3n§ || Boolean(Services.isOAuth));
      }
      
      public static function buy(param1:int, param2:uint, param3:uint, param4:int = 0, param5:int = 0) : void
      {
         _instance.buy(param1,param2,param3,param4,param5);
      }
      
      public static function §_-K2t§(param1:int, param2:uint, param3:uint, param4:int = 0, param5:int = 0) : Boolean
      {
         return _instance.§_-K2t§(param1,param2,param3,param4,param5);
      }
      
      public static function §_-Y2s§(param1:String, param2:Function, param3:int = 0) : void
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
      
      public static function §_-R1D§(param1:String, param2:Function) : void
      {
         if(_instance)
         {
            _instance.removeEventListener(param1,param2);
         }
      }
      
      public static function §_-aC§(param1:int) : Boolean
      {
         return param1 in _instance.friends;
      }
      
      public static function §_-Q1X§(param1:int) : Boolean
      {
         return param1 in _instance.§_-cJ§;
      }
      
      public static function get friends() : Object
      {
         return _instance.friends;
      }
      
      public static function §_-x2V§(param1:int) : void
      {
         _instance.§_-x2V§([param1]);
      }
      
      public static function §_-6q§(param1:int) : void
      {
         _instance.§_-6q§(param1);
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
         §_-TQ§.add("[Request user info] ids:" + (param1 is Array ? "[" + param1.join() + "]" : param1) + " type:" + param2 + " nocache:" + param3);
         Services.players.requestInfo(param1,param2,!param3);
      }
      
      public static function getPlayer(param1:int) : Player
      {
         return Services.players.getPlayer(param1);
      }
      
      public static function §_-X2Q§(param1:§_-U1M§, param2:uint, param3:Boolean = false) : Array
      {
         return _instance.§_-X2Q§(param1,param2,param3);
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
      
      public static function §_-tR§(param1:Object) : void
      {
         _instance.§_-tR§(param1);
      }
      
      public static function §_-A1Q§() : void
      {
         _instance.§_-A1Q§();
      }
      
      public static function §_-pw§(param1:int, param2:int, param3:int = 0) : void
      {
         if(Game.self.nuts == param1 && Game.self.coins == param2)
         {
            return;
         }
         switch(param3)
         {
            case §_-S2I§.§_-42a§:
               new §_-oT§({
                  "contentItems":[{
                     "type":§_-428§.§_-wG§,
                     "id":0,
                     "count":param1 - Game.self.nuts
                  }],
                  "description":gls("Спасибо за покупку!")
               }).show();
               break;
            case §_-S2I§.§_-11N§:
               §_-U1§.coins = param2 - Game.self.coins;
               break;
            case §_-S2I§.§_-nU§:
               §_-c2J§.show();
               break;
            case §_-S2I§.§_-lk§:
               new §_-e15§(param1 - Game.self.nuts).show();
         }
         if(param3 != §_-S2I§.§_-43c§ && param3 != §_-S2I§.§_-93W§ && param3 != §_-S2I§.§_-52J§ && param3 != §_-S2I§.§_-V1q§)
         {
            Game.self.nutsOld = param1;
         }
         Game.self.nuts = param1;
         Game.self.coins = param2 - §_-U1§.coins;
         _instance.dispatchEvent(new GameEvent(GameEvent.BALANCE_CHANGED));
      }
      
      public static function §_-F15§() : void
      {
         new §_-AF§();
         §_-l1D§.instance.§_-X16§(new AtlasGameObjects());
      }
      
      public static function §_-S1F§(param1:Event) : void
      {
         Clipboard.generalClipboard.clear();
         Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,(param1.type == "menuItemSelect" ? param1.target.caption : param1.target.text).split(" ")[1],false);
      }
      
      private function init(param1:Event = null) : void
      {
         var _loc4_:String = null;
         removeEventListener(Event.ADDED_TO_STAGE,this.init);
         §_-k2X§.setStatus(gls("Выполняется инициализация приложения"));
         this.§_-51v§.addEventListener(TimerEvent.TIMER,Services.login);
         var _loc2_:Connection = new Connection();
         _loc2_.addEventListener(Event.CONNECT,this.onConnect);
         _loc2_.addEventListener(Connection.§_-l2L§,this.onError);
         _loc2_.addEventListener(Connection.CONNECTION_CLOSED,this.onError);
         new GameMusic();
         new GameSounds();
         new §_-43Z§();
         GameSounds.§_-wL§(§_-43Z§.§_-PW§);
         Services.init(new §_-AU§(§_-k2X§.loaderInfo.parameters,§_-k2X§.loaderInfo));
         Services.config.log = this.§_-ag§;
         Services.addEventListener(ApiEvent.LOADED,this.§_-T2k§);
         Services.addEventListener(LoginEvent.LOGIN,this.§_-x2M§);
         Services.addEventListener(LoggerEvent.LOGGER,this.§_-X1m§);
         Services.addEventListener(RefillEvent.REFILL,this.§_-h1k§);
         Services.addEventListener(ReferralEvent.REFERRAL,this.§_-73A§);
         (Services.players as Players).addEventListener(PlayersEvent.REQUEST,this.§_-53F§);
         (Services.players as Players).addEventListener(PlayersEvent.SAVE_SELF_PHOTO,this.§_-O1§);
         (Services.players as Players).addEventListener(PlayersEvent.SAVE_SELF_INFO,this.§_-O1§);
         var _loc3_:String = "";
         for(_loc4_ in §_-k2X§.loaderInfo.parameters)
         {
            _loc3_ += "&" + _loc4_ + "=" + §_-k2X§.loaderInfo.parameters[_loc4_];
         }
         §_-TQ§.add(_loc3_);
         Analytics.§_-ZF§();
         Services.load();
         new §_-3U§();
         NotificationManager.instance;
         Connection.listen(this.§_-o2C§,[§_-S2I§.LOGIN,§_-S2I§.§_-g2n§,§_-S2I§.§_-uL§,§_-S2I§.§_-N29§,§_-S2I§.§_-s1J§,§_-S2I§.§_-42o§,§_-S2I§.BUY,§_-S2I§.§_-o7§,§_-S2I§.§_-9L§]);
         Services.players.requestDelay = 1000;
         §_-hF§.§_-8H§ = Services.config.noName;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
      }
      
      private function §_-ag§(... rest) : void
      {
         §_-TQ§.add("SERVICE LOG:",rest);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
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
      
      private function §_-uF§() : void
      {
         if(this.§_-S§)
         {
            return;
         }
         this.§_-S§ = true;
         addChild(new §_-71o§());
         §_-71o§.§_-P2Y§("Learning",new §_-w17§());
         §_-71o§.§_-P2Y§("Location",new §_-5K§());
         §_-71o§.§_-P2Y§("Profile",new §_-5B§());
         §_-71o§.§_-P2Y§("Wardrobe",new §_-ac§());
         §_-71o§.§_-P2Y§("Collection",new §_-5T§());
         §_-71o§.§_-P2Y§("Clan",new §_-F2y§());
         §_-71o§.§_-P2Y§("Rating",new §_-J2n§());
         §_-71o§.§_-P2Y§("Edit",new §_-P1Y§());
         §_-71o§.§_-P2Y§("Game",new §_-92z§());
         §_-71o§.§_-P2Y§("School",new §_-F29§());
         §_-71o§.§_-P2Y§("Award",new §_-J29§());
         §_-71o§.§_-P2Y§("ShamanTree",new §_-n2a§());
      }
      
      private function §_-g1N§() : void
      {
         if(this.§_-V2I§)
         {
            return;
         }
         this.§_-V2I§ = true;
         §_-k2X§.setStatus(gls("Выполняется инициализация библиотек"));
         new §_-EI§();
         §_-M10§.§_-Z2R§();
         §_-c1l§.§_-Q1L§();
         this.§_-11p§();
         Game.listen(this.§_-P9§);
         §_-e2W§.listen(this.onClanLoaded);
         §_-f2P§.init();
         §_-S9§.init();
         §_-B3s§.init();
         §_-e2W§.init();
         §_-g2W§.init();
         §_-h1f§.init();
         §_-g1R§.init();
         §_-k1C§.init();
         §_-m2t§.init();
         §_-R1c§.init();
         §_-W1e§.init();
         §_-f22§.init();
         §_-Q2v§.init();
         EventsManager.init();
         §_-MZ§.init();
         §_-My§.init();
         §_-d2x§.init();
         §_-e1z§.init();
         §_-a1D§.init();
         NuttyPassManager.init();
         §_-Z1F§.init();
         §_-l1f§.init();
         §_-13r§.init();
         §_-A29§.init();
         §_-S16§.init();
         §_-82N§.init();
         §_-ct§.init();
         §_-Br§.init();
         §_-01k§.init();
         §_-Bg§.init();
         §_-019§.init();
         new §_-q1p§();
         new §_-IP§();
         new §_-927§();
         new §_-f22§();
         this.§_-uF§();
         §_-K1r§.init();
         §_-TQ§.init(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-639§ | §_-c10§.§_-N1O§));
         GameMusic.§_-h1R§();
         this.§_-Dk§();
         addChild(new §_-3m§());
         addChild(new §_-B1d§());
         new §_-t1V§();
      }
      
      private function §_-Dk§() : void
      {
         new §_-G1§();
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
         {
         }
         new §_-33G§();
         new §_-f2U§();
         new §_-72h§();
      }
      
      private function §_-A1Q§() : void
      {
         §_-F15§();
         §_-03s§.init();
         this.§_-53E§ = new §_-6O§();
         this.§_-53E§.§_-r17§();
         addChild(this.§_-53E§);
         §_-O1M§.§_-RG§();
      }
      
      private function onConnect(param1:Event) : void
      {
         §_-TQ§.add("Game.onConnect");
         §_-Bm§.onLoad(this.§_-M§);
         §_-Bm§.init();
         Services.login();
      }
      
      private function §_-M§() : void
      {
         GameMusic.on = !§_-Bm§.§_-2S§(§_-T2o§.§_-32D§);
         GameSounds.on = !§_-Bm§.§_-2S§(§_-T2o§.§_-62Z§);
         Game.§_-v4§ = §_-Bm§.§_-2S§(§_-T2o§.§_-T1J§);
         Game.§_-L2T§ = !§_-Bm§.§_-2S§(§_-T2o§.§_-K1N§);
         Game.§_-nC§ = !§_-Bm§.§_-2S§(§_-T2o§.§_-d1b§);
         if(!§_-Bm§.§_-2S§(§_-T2o§.§_-g1f§))
         {
            new §_-z1T§().show();
         }
      }
      
      private function onError(param1:Event) : void
      {
         §_-TQ§.add("error",param1);
         if(§_-71o§.active is §_-P1Y§)
         {
            _instance.dispatchEvent(new GameEvent(GameEvent.CONNECTION_CLOSED));
            return;
         }
         this.setStatus(~§_-In§);
         §_-k2X§.hide();
         if(!§_-71o§.instance)
         {
            addChild(new §_-71o§());
         }
         §_-71o§.§_-rH§(false);
         §_-71o§.§_-P2Y§("Disconnected",new §_-cG§());
         §_-71o§.show("Disconnected");
      }
      
      private function buy(param1:uint, param2:uint, param3:uint, param4:int, param5:int) : void
      {
         if(!this.§_-Q26§(param2,param3))
         {
            return;
         }
         GameSounds.play("buy",true);
         Connection.§_-Li§(§_-h2B§.BUY,param1,param2,param3,param4,param5);
      }
      
      private function §_-K2t§(param1:uint, param2:uint, param3:uint, param4:int, param5:int) : Boolean
      {
         if(§_-S16§.§_-j1Q§)
         {
            return false;
         }
         if(Game.§_-DJ§ < param2)
         {
            Services.bank.open(§_-7O§.§_-s1Z§);
            return false;
         }
         if(Game.§_-I2M§ < param3)
         {
            Services.bank.open(§_-7O§.§_-K2P§);
            return false;
         }
         Connection.§_-Li§(§_-h2B§.BUY,param1,param2,param3,param4,param5);
         return true;
      }
      
      private function §_-Q26§(param1:uint, param2:uint) : Boolean
      {
         if(§_-S16§.§_-j1Q§)
         {
            return false;
         }
         if(Game.§_-DJ§ < param1)
         {
            Services.bank.open(§_-7O§.§_-s1Z§);
            return false;
         }
         if(Game.§_-I2M§ < param2)
         {
            Services.bank.open(§_-7O§.§_-K2P§);
            return false;
         }
         Game.§_-pw§(Game.self.nuts - param2,Game.self.coins - param1,§_-S2I§.§_-T2W§);
         return true;
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(Game.self.clan_id == 0 || Game.self.clan_id != 0 && _loc2_.id != Game.self.clan_id)
         {
            return;
         }
         if(Game.self.id == _loc2_.§_-R2z§)
         {
            Game.self.clan_duty = Clan.§_-k1P§;
         }
         this.setStatus(§_-j1u§);
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
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
         this.setStatus(§_-j1u§);
      }
      
      private function §_-i1X§(param1:Array) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1 = §_-qF§.§_-f1M§(param1);
         Game.§_-B3t§ = param1;
         Game.§_-b2g§ = param1.length;
         Connection.§_-Li§(§_-h2B§.§_-720§,Game.§_-B3t§);
      }
      
      private function §_-e2x§(param1:Array) : void
      {
         if(param1 == null)
         {
            return;
         }
         Game.§_-B2U§ = §_-qF§.§_-f1M§(param1);
         §_-h1y§.init();
      }
      
      private function setStatus(param1:int) : void
      {
         var _loc2_:int = this.§_-XW§;
         this.§_-XW§ |= param1;
         §_-TQ§.add("setStatus",this.§_-XW§);
         if(_loc2_ == §_-Wd§ || this.§_-XW§ != §_-Wd§)
         {
            return;
         }
         Services.initBank();
         Services.setCounter(0);
         this.§_-Bu§();
         Services.friends.get(this.§_-e2x§);
         Services.friends.getAppUsers(this.§_-i1X§);
         this.startGame();
      }
      
      private function startGame() : void
      {
         §_-1W§.update();
         §_-71o§.§_-rH§(true);
         §_-5K§.§_-a2t§(§_-d2x§.§_-z2o§);
         §_-k2X§.hide();
         §_-71o§.show("Location");
         §_-83D§.§_-11Y§();
         §_-3U§.§_-9T§();
         Services.players.requestDelay = 0;
         if(Game.self.type == §_-a9§.§_-JO§ && !Services.isOAuth)
         {
            Services.requestNotification();
         }
      }
      
      private function §_-Bu§() : void
      {
         §_-TQ§.add("setReferrer for id " + Game.self.id + " and referrer " + §_-v1w§.get());
         if(§_-v1w§.§_-A1L§())
         {
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-U9§,Game.self["type"]);
         }
      }
      
      private function save(param1:Player) : void
      {
         var _loc2_:String = param1.name == Services.config.noName ? "" : param1.name;
         §_-TQ§.add("SAVED player.name, player.sex, player.bdate, player.photoBig, player.profile, player.email, player.country",param1.name,param1.sex,param1.bdate,param1.photoBig,param1.profile,param1.email,param1.country);
         if("country" in param1)
         {
            Connection.§_-Li§(§_-h2B§.§_-g2n§,_loc2_,param1.sex,param1.bdate,param1.photoBig,param1.profile,param1.email,§_-ae§.§_-l9§(param1.country,Game.self.type));
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-g2n§,_loc2_,param1.sex,param1.bdate,param1.photoBig,param1.profile,param1.email);
         }
      }
      
      private function §_-tR§(param1:Object) : void
      {
         Game.self.name = param1["name"];
         Game.self.sex = param1["sex"];
         if("email" in param1)
         {
            Game.self.email = param1["email"];
         }
         this.save(Game.self);
      }
      
      private function §_-x2V§(param1:Array) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(!§_-aC§(param1[_loc3_]))
            {
               §_-TQ§.add("Game.addFriend " + param1[_loc3_]);
               this.friends[param1[_loc3_]] = true;
               ++Game.§_-n1s§;
               _loc2_.push(param1[_loc3_]);
            }
            _loc3_++;
         }
         dispatchEvent(new GameEvent(GameEvent.ADD_FRIEND,{"value":_loc2_}));
         Connection.§_-Li§(§_-h2B§.§_-D1R§,param1);
      }
      
      private function §_-6q§(param1:int) : void
      {
         if(!§_-aC§(param1))
         {
            return;
         }
         §_-TQ§.add("Game.removeFriend " + param1);
         delete this.friends[param1];
         --Game.§_-n1s§;
         dispatchEvent(new GameEvent(GameEvent.REMOVE_FRIEND,{"value":[param1]}));
         Connection.§_-Li§(§_-h2B§.§_-32l§,param1);
      }
      
      private function §_-11p§() : void
      {
         var copyIDButton:ContextMenuItem = null;
         try
         {
            §_-k2X§.§_-U26§(Game.§_-d2t§);
            copyIDButton = new ContextMenuItem("ID: " + Game.selfId,true,true);
            copyIDButton.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,§_-S1F§);
            Game.§_-d2t§.contextMenu.customItems.push(copyIDButton);
         }
         catch(e:Error)
         {
            §_-TQ§.add("Error addContextUid",e);
         }
      }
      
      private function §_-X2Q§(param1:§_-U1M§, param2:uint, param3:Boolean = false) : Array
      {
         var _loc6_:Object = null;
         var _loc4_:Array = §_-hF§.parse(param1,param2);
         var _loc5_:Array = [];
         for each(_loc6_ in _loc4_)
         {
            if("photo_big" in _loc6_ && _loc6_["photo_big"] != "" || !param3)
            {
               _loc5_.push(_loc6_["uid"]);
            }
            if(_loc6_["uid"] == Game.selfId)
            {
               if("exp" in _loc6_ && !this.§_-W1b§ && §_-My§.§_-1P§(§_-d2x§.§_-s2O§,_loc6_["exp"]))
               {
                  §_-d2x§.§_-N1h§(_loc6_["exp"]);
               }
               if("vip_info" in _loc6_ && _loc6_["vip_buy"] != 0 && _loc6_["vip_time"] == 0 && this.§_-W1b§)
               {
                  §_-71o§.addCallback(§_-F2X§.show);
               }
               if("respawn_totem" in _loc6_)
               {
                  _loc6_["respawn_totem_last_update"] = getTimer() / 1000;
               }
            }
            Services.players.dataLoaded(_loc6_,param2);
            if(this.§_-W1b§)
            {
               if(§_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§)
               {
                  §_-5b§.§_-RC§();
               }
               this.§_-W1b§ = false;
            }
         }
         return _loc5_;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Player = null;
         var _loc8_:int = 0;
         var _loc9_:§_-Q13§ = null;
         switch(param1.type)
         {
            case §_-S2I§.LOGIN:
               _loc2_ = int(param1[§_-S2I§.§_-p20§]);
               switch(_loc2_)
               {
                  case §_-S2I§.§_-q1b§:
                     §_-k2X§.setStatus(gls("Выполняется загрузка данных"));
                     Game.self = Services.players.getPlayer(param1[§_-S2I§.§_-V1s§]);
                     Game.self.type = Services.netType();
                     Game.self.email = param1[§_-S2I§.§_-z1l§];
                     Game.§_-t1v§ = param1[§_-S2I§.§_-c2W§];
                     Game.§_-qZ§ = param1[§_-S2I§.§_-j2L§];
                     Game.§_-nE§ = param1[§_-S2I§.§_-a1q§];
                     Game.§_-91C§ = param1[§_-S2I§.§_-4Q§];
                     Game.§_-a1l§ = param1[§_-S2I§.§_-b1Z§];
                     Game.§_-d2H§ = param1[§_-S2I§.§_-5H§];
                     Game.§_-N2V§ = param1[§_-S2I§.§_-929§];
                     this.§_-g1N§();
                     this.setStatus(§_-In§);
                     Services.requestLiked();
                     Services.requestGroup();
                     Connection.§_-Li§(§_-h2B§.§_-93T§);
                     Connection.§_-Li§(§_-h2B§.§_-Z5§);
                     Game.§_-51E§ = param1[§_-S2I§.§_-N2D§];
                     if(Game.§_-51E§ == 0)
                     {
                        Services.referral();
                     }
                     break;
                  case §_-S2I§.LOGIN_EXIST:
                     §_-k2X§.setStatus(gls("Ожидание завершения предыдущего подключения"));
                     this.§_-51v§.reset();
                     this.§_-51v§.start();
                     break;
                  case §_-S2I§.LOGIN_FAILED:
                     §_-k2X§.setStatus(gls("Не удалось войти в игру"));
                     break;
                  case §_-S2I§.LOGIN_BLOCKED:
                     §_-k2X§.hide();
                     Game.self = Services.players.getPlayer(param1[§_-S2I§.§_-V1s§]);
                     this.§_-11p§();
                     if(!§_-71o§.instance)
                     {
                        addChild(new §_-71o§());
                     }
                     §_-71o§.§_-P2Y§("Block",new §_-M1j§());
               }
               this.§_-c2A§ = new Analytics(Game.selfId);
               Analytics.§_-T5§(_loc2_);
               break;
            case §_-S2I§.§_-g2n§:
               this.§_-X2Q§(param1[0],param1[1]);
               break;
            case §_-S2I§.§_-uL§:
               _loc3_ = Game.§_-X2Q§(param1[0],param1[1],true);
               Game.§_-t1u§ = Game.§_-t1u§.concat(_loc3_);
               _loc4_ = [];
               _loc5_ = 0;
               while(_loc5_ < _loc3_.length)
               {
                  if(!(§_-aC§(_loc3_[_loc5_]) || §_-Q1X§(_loc3_[_loc5_])))
                  {
                     _loc4_.push(_loc3_[_loc5_]);
                  }
                  _loc5_++;
               }
               if(_loc4_.length > 0)
               {
                  this.§_-x2V§(_loc4_);
               }
               break;
            case §_-S2I§.§_-N29§:
               if(param1[1] == §_-h2B§.§_-c26§ && param1[0] == Game.selfId)
               {
                  Game.§_-K3§ = getTimer() / 1000 + param1[4];
                  if(this.§_-53E§)
                  {
                     this.§_-53E§.§_-r17§();
                  }
                  §_-v13§.§_-r17§();
               }
               if(param1[2] != §_-h2B§.§_-C8§)
               {
                  return;
               }
               _loc6_ = int(param1[0]);
               _loc7_ = getPlayer(_loc6_);
               _loc7_.name = "Player " + _loc6_;
               _loc7_.resetPhoto();
               Game.request(_loc6_,§_-hF§.ALL,true);
               break;
            case §_-S2I§.§_-s1J§:
               Game.§_-pw§(param1[1],param1[0],param1[2]);
               break;
            case §_-S2I§.§_-42o§:
               _loc8_ = 0;
               while(_loc8_ < param1[0].length)
               {
                  if(param1[0][_loc8_ + 1] == 1)
                  {
                     this.§_-cJ§[param1[0][_loc8_]] = true;
                  }
                  else
                  {
                     this.friends[param1[0][_loc8_]] = true;
                     Game.§_-t1u§.push(param1[0][_loc8_]);
                     ++Game.§_-n1s§;
                  }
                  _loc8_ += 2;
               }
               break;
            case §_-S2I§.BUY:
               if(param1[5] != Game.selfId)
               {
                  break;
               }
               switch(param1[0])
               {
                  case §_-S2I§.§_-k2l§:
                     GameSounds.play("buy",true);
                     switch(param1[2])
                     {
                        case §_-h2B§.§_-h29§:
                           §_-Y5§.§_-MW§(param1[6]);
                           break;
                        case §_-h2B§.§_-W2d§:
                           if(Game.self["clan_id"] > 0)
                           {
                              §_-e2W§.request(Game.self["clan_id"],§_-Oy§.§_-6V§,true);
                           }
                           break;
                        case §_-h2B§.§_-I1C§:
                           if(§_-71o§.active is §_-92z§)
                           {
                              return;
                           }
                           §_-71o§.show(§_-5B§.instance);
                           §_-5B§.§_-R1G§(Game.selfId);
                           §_-V18§.§_-yc§();
                           break;
                        case §_-h2B§.§_-m1U§:
                           new §_-cu§(param1[6]).show();
                           break;
                        case §_-h2B§.§_-a2Z§:
                           new §_-cu§(param1[6]).show();
                           break;
                        case §_-h2B§.§_-6d§:
                           if("6" in param1)
                           {
                              new §_-i1e§().show();
                           }
                     }
                     break;
                  case §_-S2I§.§_-g1w§:
                  case §_-S2I§.§_-ua§:
                  case §_-S2I§.§_-wE§:
               }
               break;
            case §_-S2I§.§_-o7§:
               _loc9_ = new §_-Q13§(gls("Сообщение"),gls(param1[0].toString()),false,null,300);
               _loc9_.show();
               break;
            case §_-S2I§.§_-9L§:
               §_-Vm§.instance.open();
               switch(param1[0])
               {
                  case §_-S2I§.§_-N1j§:
                     if(!this.§_-N1L§)
                     {
                        this.§_-N1L§ = new §_-Q13§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как он находится не в игре"),false,null,350);
                     }
                     this.§_-N1L§.show();
                     break;
                  case §_-S2I§.§_-f2l§:
                     if(!this.§_-73R§)
                     {
                        this.§_-73R§ = new §_-Q13§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу: либо он не в игре, либо в его команде нет свободных мест."),false,null,350);
                     }
                     this.§_-73R§.show();
                     break;
                  case §_-S2I§.§_-o24§:
                     if(!this.§_-w21§)
                     {
                        this.§_-w21§ = new §_-Q13§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как его нет в игровой локации"),false,null,350);
                     }
                     this.§_-w21§.show();
                     break;
                  case §_-S2I§.§_-k1H§:
                     if(!this.§_-d1i§)
                     {
                        this.§_-d1i§ = new §_-Q13§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как в его команде нет свободных мест."),false,null,350);
                     }
                     this.§_-d1i§.show();
                     break;
                  case §_-S2I§.§_-t1d§:
                     if(!this.§_-m1D§)
                     {
                        this.§_-m1D§ = new §_-Q13§(gls("Перейти в игру"),gls("Ты не можешь перейти в игру к другу, так как не состоишь в его клане"),false,null,350);
                     }
                     this.§_-m1D§.show();
                     break;
                  case §_-S2I§.§_-111§:
                     if(!this.§_-L1r§)
                     {
                        this.§_-L1r§ = new §_-Q13§(gls("Перейти в игру"),gls("Сейчас ты не можешь перейти в игру к другу, так как эта локация тебе еще не доступна."),false,null,350);
                     }
                     this.§_-L1r§.show();
                     break;
                  case §_-S2I§.§_-U7§:
                     §_-t1I§.show(param1[1]);
               }
         }
      }
      
      private function §_-T2k§(param1:Event) : void
      {
         §_-k2X§.setStatus(gls("Выполняется подключение к серверу"));
         Connection.connect(§_-a9§.§_-t4§,§_-a9§.§_-o2V§,§_-a9§.§_-8h§);
      }
      
      private function §_-h1k§(param1:Event) : void
      {
         if(§_-a9§.§_-73q§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.REFILL);
      }
      
      private function §_-x2M§(param1:LoginEvent) : void
      {
         §_-k2X§.setStatus(gls("Выполняется авторизация на сервере"));
         if(Boolean(Services.isOAuth) && Boolean(§_-k2X§.§_-J2e§["token"]))
         {
            Connection.§_-Li§(§_-h2B§.LOGIN,param1.netType,new §_-t2g§(param1.id),§_-k2X§.§_-J2e§["token"],§_-v1w§.get());
            return;
         }
         if(param1.authKey == "")
         {
            Connection.§_-Li§(§_-h2B§.LOGIN,param1.netType,new §_-t2g§(param1.id),param1.key,§_-v1w§.get());
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.LOGIN,param1.netType,new §_-t2g§(param1.id),param1.key,§_-v1w§.get(),param1.authKey);
         }
      }
      
      private function §_-X1m§(param1:LoggerEvent) : void
      {
         §_-TQ§.add("New loggerEvent: " + param1.message);
      }
      
      private function §_-53F§(param1:PlayersEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.REQUEST,param1.uids,param1.rType[0]);
      }
      
      private function §_-O1§(param1:PlayersEvent) : void
      {
         this.save(Game.self);
      }
      
      private function §_-73A§(param1:ReferralEvent) : void
      {
         var _loc2_:§_-t2g§ = new §_-t2g§(param1.id);
         if(_loc2_.lowValue <= 0 || _loc2_.toString() == Game.self.nid)
         {
            return;
         }
         §_-TQ§.add("REFERRAL DETECTED!! ID INVITER " + _loc2_);
         Connection.§_-Li§(§_-h2B§.§_-wS§,_loc2_);
      }
   }
}


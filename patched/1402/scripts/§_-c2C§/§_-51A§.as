package §_-c2C§
{
   import §_-61C§.§_-z1J§;
   import §_-I18§.§_-BK§;
   import §_-J1i§.§_-W1v§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-I2l§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-Wd§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-r12§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import §_-bN§.§_-T25§;
   import §_-bN§.§_-cp§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-Z2B§;
   import buttons.§_-c6§;
   import com.api.Player;
   import events.GameEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.StringUtil;
   import utils.§_-33I§;
   import utils.§_-72U§;
   import utils.§_-L2J§;
   import utils.§_-S1m§;
   import views.§_-53g§;
   import views.§_-92Q§;
   import views.§_-B2R§;
   import views.§_-O2s§;
   import views.§_-j1o§;
   import views.§_-o1H§;
   import views.§_-p25§;
   
   public class §_-51A§ extends Screen
   {
      
      private static var _instance:§_-51A§;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #363636;","}","a {","text-decoration: underline;","margin-right: 0px;","}",".blackSmall {","color: #0B0B0A;","font-size: 10px;","}","a:hover {","text-decoration: underline;","color: #FF1B00;","}",".small {","color: #0C0801;","font-size: 10px;","}"].join("\n");
      
      private static const §_-M2p§:GlowFilter = new GlowFilter(16777215,0.7,4,4);
      
      private static const §_-A24§:uint = §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-qK§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-D20§;
      
      private static const §_-M2J§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,14372634,true,null,null,null,null,"center");
      
      private static const §_-s2Q§:TextFormat = new TextFormat(null,14,16777215,true,null,null,null,null,"center");
      
      private static const §_-D1j§:TextFormat = new TextFormat(null,12,16777215,true,null,null,null,null,"center");
      
      private static const §_-RW§:TextFormat = new TextFormat(null,11,16777215,true);
      
      private var player:Player = null;
      
      private var playerId:int = 0;
      
      private var §_-5Q§:int = 0;
      
      private var §_-u21§:Boolean = false;
      
      private var §_-m2t§:Sprite = new Sprite();
      
      private var §_-EC§:§_-i5§ = null;
      
      private var §_-D2w§:§_-i5§ = null;
      
      private var §_-B0§:§_-72U§;
      
      private var §_-23q§:§_-i5§;
      
      private var §_-62q§:§_-j1o§ = null;
      
      private var §_-LM§:§_-kr§ = null;
      
      private var §_-c1D§:§_-c6§ = null;
      
      private var §_-P2g§:§_-i5§ = null;
      
      private var §_-X2i§:SimpleButton = null;
      
      private var §_-N13§:MovieClip = null;
      
      private var §_-Ob§:SimpleButton = null;
      
      private var §_-rk§:MovieClip = null;
      
      private var §_-3t§:Sprite = null;
      
      private var §_-NX§:Sprite;
      
      private var §_-nd§:§_-92Q§ = null;
      
      private var §_-X28§:§_-O2s§ = null;
      
      private var §_-c3§:Sprite = null;
      
      private var hero:§_-o1H§ = null;
      
      private var §_-p2V§:Dialog = null;
      
      private var §_-Z6§:§_-53g§ = null;
      
      private var §_-K2K§:Sprite;
      
      private var §_-Nn§:Object = {};
      
      public function §_-51A§()
      {
         _instance = this;
         super();
         if(this.playerId == Game.selfId)
         {
            §_-82O§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-g1A§);
         }
      }
      
      public static function get instance() : §_-51A§
      {
         return _instance;
      }
      
      public static function §_-71A§() : void
      {
         if(!_instance.§_-u21§)
         {
            return;
         }
         if(Boolean(Game.self) && Boolean(Game.self["clan_id"]))
         {
            instance.§_-nd§.clanId = Game.self["clan_id"];
         }
         §_-g2P§(false);
         §_-BK§.hide();
      }
      
      public static function §_-51k§() : void
      {
         if(!_instance.§_-u21§)
         {
            return;
         }
         _instance.§_-nd§.clanId = 0;
         _instance.§_-nd§.visible = false;
         §_-g2P§(true);
      }
      
      public static function §_-Q11§() : void
      {
         if(!_instance.§_-u21§)
         {
            return;
         }
         if(§_-51A§.playerId != Game.selfId)
         {
            return;
         }
         _instance.§_-Q11§();
      }
      
      public static function §_-A3z§(param1:String, param2:Function) : void
      {
         if(!_instance)
         {
            return;
         }
         switch(param1)
         {
            case GameEvent.PROFILE_PLAYER_CHANGED:
               _instance.addEventListener(GameEvent.PROFILE_PLAYER_CHANGED,param2);
               break;
            case GameEvent.SHOWED:
               _instance.addEventListener(GameEvent.SHOWED,param2);
         }
      }
      
      public static function §_-DO§(param1:String, param2:Function) : void
      {
         if(!_instance)
         {
            return;
         }
         switch(param1)
         {
            case GameEvent.PROFILE_PLAYER_CHANGED:
               _instance.removeEventListener(GameEvent.PROFILE_PLAYER_CHANGED,param2);
               break;
            case GameEvent.SHOWED:
               _instance.removeEventListener(GameEvent.SHOWED,param2);
         }
      }
      
      public static function §_-h2w§(param1:int) : void
      {
         _instance.§_-h2w§(param1);
      }
      
      public static function get playerId() : int
      {
         return _instance.playerId != 0 ? _instance.playerId : _instance.§_-5Q§;
      }
      
      public static function §_-g2P§(param1:Boolean) : void
      {
         _instance.§_-NX§.visible = param1;
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-u21§)
         {
            this.init();
            this.§_-u21§ = true;
            this.§_-h2w§(this.§_-5Q§);
            §_-z1J§.§_-e22§();
         }
         §_-Ac§.§_-91§(§_-Ac§.HOME);
         §_-z1J§.§_-s2d§();
         dispatchEvent(new GameEvent(GameEvent.SHOWED));
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-Z6§ = new §_-53g§(Game.self["interior"]);
         addChild(this.§_-Z6§);
         §_-I2l§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-U1J§);
         this.§_-K2K§ = new Sprite();
         addChild(this.§_-K2K§);
         this.§_-m2t§.x = 10;
         this.§_-m2t§.y = 105;
         this.§_-K2K§.addChild(this.§_-m2t§);
         var _loc2_:* = new ProfileHeroBoard();
         this.§_-m2t§.addChild(_loc2_);
         this.§_-Nn§["common"] = _loc2_;
         _loc2_ = new ProfileHeroBoardVIP();
         this.§_-m2t§.addChild(_loc2_);
         this.§_-Nn§["VIP"] = _loc2_;
         this.§_-NX§ = new Sprite();
         this.§_-NX§.x = 107;
         this.§_-NX§.y = 95;
         this.§_-m2t§.addChild(this.§_-NX§);
         var _loc3_:ButtonClan = new ButtonClan();
         _loc3_.addEventListener(MouseEvent.CLICK,§_-BK§.show);
         this.§_-NX§.addChild(_loc3_);
         new §_-kr§(_loc3_,gls("Создать клан"));
         var _loc4_:§_-i5§ = this.§_-NX§.addChild(new §_-i5§(gls("Создать"),0,-10,§_-RW§)) as §_-i5§;
         _loc4_.x -= _loc4_.textWidth + 30;
         this.§_-NX§.addChild(new §_-i5§(gls("свой клан"),20,-10,§_-RW§));
         this.§_-nd§ = new §_-92Q§();
         this.§_-nd§.y = 85;
         this.§_-m2t§.addChild(this.§_-nd§);
         this.§_-B0§ = new §_-72U§("",12,45,190,28,§_-M2J§,§_-M2J§,§_-Zy§.§_-u2H§);
         this.§_-B0§.border = false;
         this.§_-B0§.background = false;
         this.§_-B0§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         this.§_-B0§.visible = false;
         this.§_-m2t§.addChild(this.§_-B0§);
         this.§_-c1D§ = new §_-c6§(new ButtonChangeNick(),new ButtonSaveUsername(),false);
         this.§_-c1D§.x = 183;
         this.§_-c1D§.y = 50;
         this.§_-m2t§.addChild(this.§_-c1D§);
         this.§_-c1D§.§_-A3W§.x = -9;
         this.§_-c1D§.§_-A3W§.y = -3;
         new §_-kr§(this.§_-c1D§.§_-A3W§,gls("Сохранить имя"));
         new §_-kr§(this.§_-c1D§.§_-3I§,gls("Изменить имя"));
         this.§_-c1D§.§_-A3W§.addEventListener(MouseEvent.CLICK,this.§_-HQ§);
         this.§_-c1D§.§_-A3W§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-c1D§.§_-3I§.addEventListener(MouseEvent.CLICK,this.§_-61A§);
         this.§_-c1D§.§_-3I§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-EC§ = new §_-i5§("",12,45,§_-M2J§);
         this.§_-EC§.width = 190;
         this.§_-EC§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-m2t§.addChild(this.§_-EC§);
         this.§_-D2w§ = new §_-i5§("",184,10,§_-D1j§);
         this.§_-D2w§.width = 22;
         this.§_-D2w§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-m2t§.addChild(this.§_-D2w§);
         this.§_-23q§ = new §_-i5§("",12,10,§_-s2Q§);
         this.§_-23q§.width = 190;
         this.§_-23q§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-m2t§.addChild(this.§_-23q§);
         this.§_-3t§ = new §_-B2R§();
         this.§_-3t§.x = 7;
         this.§_-3t§.y = 7;
         this.§_-m2t§.addChild(this.§_-3t§);
         this.§_-X2i§ = new ButtonShowPalette();
         this.§_-X2i§.x = 230 - this.§_-X2i§.width;
         this.§_-X2i§.y = 125 - this.§_-X2i§.height;
         this.§_-X2i§.addEventListener(MouseEvent.CLICK,§_-T25§.show);
         this.§_-m2t§.addChild(this.§_-X2i§);
         new §_-kr§(this.§_-X2i§,gls("Сменить цвет имени"));
         this.§_-P2g§ = new §_-i5§("",0,70,_loc1_);
         this.§_-P2g§.addEventListener(MouseEvent.CLICK,Game.§_-036§);
         this.§_-P2g§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.§_-m2t§.addChild(this.§_-P2g§);
         this.§_-P2g§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§);
         new §_-kr§(this.§_-P2g§,gls("Нажми, чтобы скопировать в буфер обмена."));
         this.§_-rk§ = new ShamanCertificateReceived();
         this.§_-rk§.x = 434;
         this.§_-rk§.y = 96;
         this.§_-rk§.addEventListener(MouseEvent.CLICK,this.§_-zM§);
         this.§_-K2K§.addChild(this.§_-rk§);
         new §_-kr§(this.§_-rk§,gls("Аттестат школы шаманов"));
         this.§_-Ob§ = new ShamanCertificatePlace();
         this.§_-Ob§.x = this.§_-rk§.x;
         this.§_-Ob§.y = this.§_-rk§.y;
         this.§_-K2K§.addChild(this.§_-Ob§);
         new §_-kr§(this.§_-Ob§,gls("Место для Аттестата Шамана"));
         this.§_-N13§ = new ImageLeftSaveWorld();
         this.§_-N13§.x = 427;
         this.§_-N13§.y = 362;
         this.§_-K2K§.addChild(this.§_-N13§);
         this.hero = new §_-o1H§();
         this.hero.x = 486;
         this.hero.y = 470;
         this.§_-K2K§.addChild(this.hero);
         this.§_-X28§ = new §_-O2s§();
         this.§_-X28§.x = 600;
         this.§_-X28§.y = 430;
         this.§_-K2K§.addChild(this.§_-X28§);
         this.§_-c3§ = new §_-p25§();
         this.§_-c3§.x = 720;
         this.§_-c3§.y = 330;
         this.§_-K2K§.addChild(this.§_-c3§);
         var _loc5_:§_-Z2B§ = new §_-Z2B§();
         _loc5_.x = 600;
         _loc5_.y = 135;
         this.§_-K2K§.addChild(_loc5_);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-M29§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-y1t§);
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-hb§);
         §_-LZ§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-On§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         this.§_-K2K§.x = (Game.starling.stage.stageWidth - §_-Zy§.§_-21V§) * 0.5;
         this.§_-K2K§.y = (Game.starling.stage.stageHeight - §_-Zy§.§_-02T§) * 0.5;
      }
      
      private function §_-zM§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            §_-S2E§.type = §_-S2E§.§_-Z2N§;
            §_-t2c§.show("School");
         },true);
      }
      
      private function §_-y1t§(param1:GameEvent) : void
      {
         this.§_-X2i§.visible = false;
         this.§_-Nn§["common"].visible = true;
         this.§_-Nn§["VIP"].visible = false;
         §_-T25§.hide();
      }
      
      private function §_-hb§(param1:GameEvent) : void
      {
         this.§_-X2i§.visible = true;
         this.§_-Nn§["common"].visible = false;
         this.§_-Nn§["VIP"].visible = true;
      }
      
      private function §_-On§(param1:GameEvent) : void
      {
         if(§_-51A§.playerId != Game.selfId)
         {
            return;
         }
         this.§_-23q§.text = String(§_-XW§.§_-3f§(§_-LZ§.§_-mA§,false));
         §_-g2P§(§_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§ && Game.self["clan_id"] == 0);
      }
      
      private function §_-33p§(param1:Boolean) : void
      {
         this.§_-B0§.visible = false;
         this.§_-c1D§.visible = false;
         this.§_-EC§.visible = true;
         this.§_-D2w§.visible = true;
         §_-g2P§(param1 && this.player != null && this.player["level"] >= §_-XW§.§_-I1V§ && this.player["clan_id"] == 0);
         this.§_-X2i§.visible = param1 && this.player["vip_exist"] > 0;
         this.§_-Nn§["common"].visible = !(param1 && this.player["vip_exist"] > 0);
         this.§_-Nn§["VIP"].visible = param1 && this.player["vip_exist"] > 0;
         this.§_-F1E§(param1);
         if(§_-t2c§.active is §_-51A§)
         {
            §_-W1v§.§_-83E§(param1);
         }
         this.§_-c1D§.visible = param1;
         if(param1 && Game.self["clan_id"] == 0)
         {
            this.§_-nd§.clanId = 0;
         }
      }
      
      private function §_-h2w§(param1:int) : void
      {
         if(!this.§_-u21§)
         {
            this.§_-5Q§ = param1;
            return;
         }
         if(param1 == Game.selfId && this.player != null)
         {
            this.§_-33p§(true);
         }
         if(this.playerId == param1)
         {
            return;
         }
         if(this.player != null)
         {
            this.player.removeEventListener(this.§_-Y16§);
         }
         this.playerId = param1;
         this.player = Game.getPlayer(param1);
         this.player.addEventListener(§_-51A§.§_-A24§,this.§_-Y16§);
         Game.request(param1,§_-51A§.§_-A24§);
         dispatchEvent(new GameEvent(GameEvent.PROFILE_PLAYER_CHANGED));
      }
      
      private function §_-M29§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!this.§_-B0§.visible)
         {
            return;
         }
         this.§_-HQ§();
      }
      
      private function §_-Y16§(param1:Player) : void
      {
         if(param1.id != this.player.id)
         {
            return;
         }
         this.§_-33p§(this.player.id == Game.selfId);
         §_-L2J§.§_-CS§(this.§_-P2g§,"<body><a class=\'blackSmall\' href=\'event:" + this.player.id + "\'>ID: " + String(param1.id) + "</a></body>",70,true,true,this.player.id);
         this.§_-P2g§.x = 200 - this.§_-P2g§.width;
         this.§_-Z6§.load(this.player["interior"]);
         §_-L2J§.§_-CS§(this.§_-EC§,this.player.name,140,false,true);
         this.§_-D2w§.text = this.player["level"];
         this.§_-23q§.text = String(§_-XW§.§_-3f§(this.player["level"],false));
         (this.§_-3t§ as §_-B2R§).§_-939§(this.player.sex);
         this.§_-Q11§();
         if(Boolean(this.player["online"]) && this.player["uid"] != Game.selfId)
         {
            this.hero.visible = false;
            this.§_-N13§.visible = true;
         }
         else
         {
            this.hero.visible = true;
            this.§_-N13§.visible = false;
         }
         this.§_-nd§.clanId = this.player["clan_id"];
         if(this.playerId == Game.selfId)
         {
            this.league = §_-82O§.§_-a15§(§_-82O§.PLAYER_TYPE);
         }
         else
         {
            this.league = §_-82O§.§_-h1C§(param1["rating_score"],§_-82O§.PLAYER_TYPE);
         }
      }
      
      private function §_-31U§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.CLICK);
      }
      
      private function §_-61A§(param1:MouseEvent) : void
      {
         this.§_-G2B§(true);
         param1.stopImmediatePropagation();
      }
      
      private function §_-HQ§(param1:MouseEvent = null) : void
      {
         var _loc2_:String = §_-S1m§.§_-o15§(this.§_-B0§.text);
         if(_loc2_ == "" || _loc2_ == Game.self.name)
         {
            this.cancel();
            return;
         }
         if(!§_-Qw§.§_-L16§(_loc2_))
         {
            new §_-Fk§(gls("Ошибка"),gls("Имя должно быть цензурным")).show();
            this.cancel();
            return;
         }
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         if(§_-LZ§.§_-mA§ >= §_-XW§.§_-01R§)
         {
            if(!this.§_-p2V§)
            {
               this.§_-p2V§ = new §_-cp§(this.§_-on§,this.cancel);
            }
            this.§_-p2V§.show();
         }
         else
         {
            this.save();
         }
      }
      
      private function §_-on§() : void
      {
         var _loc1_:String = §_-S1m§.§_-o15§(this.§_-B0§.text);
         Connection.§_-e2T§(§_-u1O§.§_-Im§,_loc1_);
         §_-L2J§.§_-CS§(this.§_-EC§,_loc1_,140);
         this.§_-G2B§(false);
      }
      
      private function save() : void
      {
         var _loc1_:String = StringUtil.§_-Sv§(this.§_-B0§.text);
         Game.§_-01l§({
            "name":_loc1_,
            "sex":Game.self.sex
         });
         §_-L2J§.§_-CS§(this.§_-EC§,Game.self.name,140);
         this.§_-G2B§(false);
         Game.request(Game.selfId,§_-Y2E§.§_-n2H§);
      }
      
      private function cancel() : void
      {
         this.§_-G2B§(false);
      }
      
      private function §_-G2B§(param1:Boolean) : void
      {
         this.§_-B0§.visible = param1;
         if(param1)
         {
            this.§_-B0§.text = Game.self["name"];
            this.§_-B0§.setSelection(this.§_-B0§.text.length,this.§_-B0§.text.length);
            Game.stage.focus = this.§_-B0§;
         }
         this.§_-EC§.visible = !param1;
      }
      
      private function §_-F1E§(param1:Boolean) : void
      {
         this.§_-rk§.visible = param1 && §_-r12§.§_-FS§(§_-n2E§.§_-X1A§);
         this.§_-Ob§.visible = param1 && !§_-r12§.§_-FS§(§_-n2E§.§_-X1A§);
      }
      
      private function §_-Q11§() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(this.player.id == Game.selfId)
         {
            if(§_-L1o§.isScrat)
            {
               this.hero.view = §_-P2x§.§_-C1d§;
            }
            else if(§_-L1o§.§_-s1§)
            {
               this.hero.view = §_-P2x§.§_-9f§;
            }
            else
            {
               this.hero.view = §_-P2x§.§_-T1B§;
            }
            this.hero.§_-VM§(§_-L1o§.§_-m2I§,§_-L1o§.§_-ig§);
         }
         else
         {
            _loc1_ = false;
            _loc2_ = 0;
            while(_loc2_ < this.player["worn_packages"].length)
            {
               _loc1_ ||= §_-P2x§.§_-r5§(this.player["worn_packages"][_loc2_]);
               _loc2_++;
            }
            _loc3_ = false;
            _loc2_ = 0;
            while(_loc2_ < this.player["worn_packages"].length)
            {
               _loc3_ ||= §_-P2x§.§_-e2S§(this.player["worn_packages"][_loc2_]);
               _loc2_++;
            }
            if(_loc1_)
            {
               this.hero.view = §_-P2x§.§_-C1d§;
            }
            else if(_loc3_)
            {
               this.hero.view = §_-P2x§.§_-9f§;
            }
            else
            {
               this.hero.view = §_-P2x§.§_-T1B§;
            }
            this.hero.§_-VM§(this.player["worn_packages"],this.player["worn_accessories"]);
         }
      }
      
      private function §_-U1J§(param1:GameEvent) : void
      {
         this.§_-Z6§.load(Game.self["interior"]);
      }
      
      private function §_-g1A§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-82O§.PLAYER_TYPE)
         {
            return;
         }
         this.league = param1.data["value"];
      }
      
      private function set league(param1:int) : void
      {
         if(!this.§_-62q§)
         {
            this.§_-62q§ = new §_-j1o§(this.playerId,§_-82O§.PLAYER_TYPE,0.8,true,false);
            this.§_-m2t§.addChild(this.§_-62q§);
         }
         this.§_-62q§.league = param1;
         this.§_-62q§.x = this.§_-m2t§.x + (this.§_-m2t§.width - this.§_-62q§.width) * 0.5;
         this.§_-62q§.y = -1;
         this.§_-62q§.filters = [§_-M2p§];
         this.§_-LM§ = new §_-kr§(this.§_-62q§,gls("Лига: ") + §_-93H§.§_-XY§(Math.max(0,param1),§_-82O§.PLAYER_TYPE));
      }
   }
}


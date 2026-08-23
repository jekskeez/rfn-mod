package §_-T2y§
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-d2x§;
   import §_-I10§.§_-f22§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-S1D§.§_-V18§;
   import §_-e1G§.§_-Hb§;
   import §_-e2w§.§_-1W§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import §_-k1c§.§_-r1n§;
   import §_-k1c§.§_-w2B§;
   import §_-xm§.§_-32P§;
   import buttons.§_-LD§;
   import buttons.§_-p1R§;
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
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.StringUtil;
   import utils.§_-Y1S§;
   import utils.§_-c10§;
   import utils.§_-vo§;
   import utils.§_-w2j§;
   import views.§_-914§;
   import views.§_-B2T§;
   import views.§_-D1d§;
   import views.§_-DR§;
   import views.§_-JP§;
   import views.§_-Q2i§;
   import views.§_-Z18§;
   
   public class §_-5B§ extends Screen
   {
      
      private static var _instance:§_-5B§;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #363636;","}","a {","text-decoration: underline;","margin-right: 0px;","}",".blackSmall {","color: #0B0B0A;","font-size: 10px;","}","a:hover {","text-decoration: underline;","color: #FF1B00;","}",".small {","color: #0C0801;","font-size: 10px;","}"].join("\n");
      
      private static const §_-f2Q§:GlowFilter = new GlowFilter(16777215,0.7,4,4);
      
      private static const §_-03g§:uint = §_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-R2P§ | §_-hF§.§_-P13§ | §_-hF§.§_-61o§;
      
      private static const §_-v2P§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,14372634,true,null,null,null,null,"center");
      
      private static const §_-01G§:TextFormat = new TextFormat(null,14,16777215,true,null,null,null,null,"center");
      
      private static const §_-d1x§:TextFormat = new TextFormat(null,12,16777215,true,null,null,null,null,"center");
      
      private static const §_-T1k§:TextFormat = new TextFormat(null,11,16777215,true);
      
      private var player:Player = null;
      
      private var playerId:int = 0;
      
      private var §_-Pv§:int = 0;
      
      private var §_-P20§:Boolean = false;
      
      private var §_-R17§:Sprite = new Sprite();
      
      private var §_-V2v§:§_-22V§ = null;
      
      private var §_-Qr§:§_-22V§ = null;
      
      private var §_-T14§:§_-w2j§;
      
      private var §_-X2P§:§_-22V§;
      
      private var §_-Z25§:§_-914§ = null;
      
      private var §_-32m§:§_-Hb§ = null;
      
      private var §_-A3X§:§_-p1R§ = null;
      
      private var §_-ji§:§_-22V§ = null;
      
      private var §_-N2F§:SimpleButton = null;
      
      private var §_-Cb§:MovieClip = null;
      
      private var §_-Ua§:SimpleButton = null;
      
      private var §_-B1o§:MovieClip = null;
      
      private var §_-j1Y§:Sprite = null;
      
      private var §_-u1L§:Sprite;
      
      private var §_-TS§:§_-Z18§ = null;
      
      private var §_-13O§:§_-Q2i§ = null;
      
      private var §_-615§:Sprite = null;
      
      private var hero:§_-DR§ = null;
      
      private var §_-r1§:Dialog = null;
      
      private var §_-C3d§:§_-B2T§ = null;
      
      private var §_-H1g§:Sprite;
      
      private var §_-81y§:Object = {};
      
      public function §_-5B§()
      {
         _instance = this;
         super();
         if(this.playerId == Game.selfId)
         {
            §_-13r§.addEventListener(GameEvent.LEAGUE_CHANGED,this.§_-42g§);
         }
      }
      
      public static function get instance() : §_-5B§
      {
         return _instance;
      }
      
      public static function §_-p2a§() : void
      {
         if(!_instance.§_-P20§)
         {
            return;
         }
         if(Boolean(Game.self) && Boolean(Game.self["clan_id"]))
         {
            instance.§_-TS§.clanId = Game.self["clan_id"];
         }
         §_-H0§(false);
         §_-32P§.hide();
      }
      
      public static function §_-725§() : void
      {
         if(!_instance.§_-P20§)
         {
            return;
         }
         _instance.§_-TS§.clanId = 0;
         _instance.§_-TS§.visible = false;
         §_-H0§(true);
      }
      
      public static function §_-Y1h§() : void
      {
         if(!_instance.§_-P20§)
         {
            return;
         }
         if(§_-5B§.playerId != Game.selfId)
         {
            return;
         }
         _instance.§_-Y1h§();
      }
      
      public static function §_-h1R§(param1:String, param2:Function) : void
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
      
      public static function §_-t1s§(param1:String, param2:Function) : void
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
      
      public static function §_-R1G§(param1:int) : void
      {
         _instance.§_-R1G§(param1);
      }
      
      public static function get playerId() : int
      {
         return _instance.playerId != 0 ? _instance.playerId : _instance.§_-Pv§;
      }
      
      public static function §_-H0§(param1:Boolean) : void
      {
         _instance.§_-u1L§.visible = param1;
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-P20§)
         {
            this.init();
            this.§_-P20§ = true;
            this.§_-R1G§(this.§_-Pv§);
            §_-V18§.§_-yc§();
         }
         §_-Q2v§.§_-S2y§(§_-Q2v§.HOME);
         §_-V18§.§_-W8§();
         dispatchEvent(new GameEvent(GameEvent.SHOWED));
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-C3d§ = new §_-B2T§(Game.self["interior"]);
         addChild(this.§_-C3d§);
         §_-f22§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-oZ§);
         this.§_-H1g§ = new Sprite();
         addChild(this.§_-H1g§);
         this.§_-R17§.x = 10;
         this.§_-R17§.y = 105;
         this.§_-H1g§.addChild(this.§_-R17§);
         var _loc2_:* = new ProfileHeroBoard();
         this.§_-R17§.addChild(_loc2_);
         this.§_-81y§["common"] = _loc2_;
         _loc2_ = new ProfileHeroBoardVIP();
         this.§_-R17§.addChild(_loc2_);
         this.§_-81y§["VIP"] = _loc2_;
         this.§_-u1L§ = new Sprite();
         this.§_-u1L§.x = 107;
         this.§_-u1L§.y = 95;
         this.§_-R17§.addChild(this.§_-u1L§);
         var _loc3_:ButtonClan = new ButtonClan();
         _loc3_.addEventListener(MouseEvent.CLICK,§_-32P§.show);
         this.§_-u1L§.addChild(_loc3_);
         new §_-Hb§(_loc3_,gls("Создать клан"));
         var _loc4_:§_-22V§ = this.§_-u1L§.addChild(new §_-22V§(gls("Создать"),0,-10,§_-T1k§)) as §_-22V§;
         _loc4_.x -= _loc4_.textWidth + 30;
         this.§_-u1L§.addChild(new §_-22V§(gls("свой клан"),20,-10,§_-T1k§));
         this.§_-TS§ = new §_-Z18§();
         this.§_-TS§.y = 85;
         this.§_-R17§.addChild(this.§_-TS§);
         this.§_-T14§ = new §_-w2j§("",12,45,190,28,§_-v2P§,§_-v2P§,§_-a9§.§_-y1i§);
         this.§_-T14§.border = false;
         this.§_-T14§.background = false;
         this.§_-T14§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         this.§_-T14§.visible = false;
         this.§_-R17§.addChild(this.§_-T14§);
         this.§_-A3X§ = new §_-p1R§(new ButtonChangeNick(),new ButtonSaveUsername(),false);
         this.§_-A3X§.x = 183;
         this.§_-A3X§.y = 50;
         this.§_-R17§.addChild(this.§_-A3X§);
         this.§_-A3X§.§_-l2A§.x = -9;
         this.§_-A3X§.§_-l2A§.y = -3;
         new §_-Hb§(this.§_-A3X§.§_-l2A§,gls("Сохранить имя"));
         new §_-Hb§(this.§_-A3X§.§_-H1o§,gls("Изменить имя"));
         this.§_-A3X§.§_-l2A§.addEventListener(MouseEvent.CLICK,this.§_-D1w§);
         this.§_-A3X§.§_-l2A§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-A3X§.§_-H1o§.addEventListener(MouseEvent.CLICK,this.§_-V2z§);
         this.§_-A3X§.§_-H1o§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-V2v§ = new §_-22V§("",12,45,§_-v2P§);
         this.§_-V2v§.width = 190;
         this.§_-V2v§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-R17§.addChild(this.§_-V2v§);
         this.§_-Qr§ = new §_-22V§("",184,10,§_-d1x§);
         this.§_-Qr§.width = 22;
         this.§_-Qr§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-R17§.addChild(this.§_-Qr§);
         this.§_-X2P§ = new §_-22V§("",12,10,§_-01G§);
         this.§_-X2P§.width = 190;
         this.§_-X2P§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-R17§.addChild(this.§_-X2P§);
         this.§_-j1Y§ = new §_-JP§();
         this.§_-j1Y§.x = 7;
         this.§_-j1Y§.y = 7;
         this.§_-R17§.addChild(this.§_-j1Y§);
         this.§_-N2F§ = new ButtonShowPalette();
         this.§_-N2F§.x = 230 - this.§_-N2F§.width;
         this.§_-N2F§.y = 125 - this.§_-N2F§.height;
         this.§_-N2F§.addEventListener(MouseEvent.CLICK,§_-r1n§.show);
         this.§_-R17§.addChild(this.§_-N2F§);
         new §_-Hb§(this.§_-N2F§,gls("Сменить цвет имени"));
         this.§_-ji§ = new §_-22V§("",0,70,_loc1_);
         this.§_-ji§.addEventListener(MouseEvent.CLICK,Game.§_-S1F§);
         this.§_-ji§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.§_-R17§.addChild(this.§_-ji§);
         this.§_-ji§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§);
         new §_-Hb§(this.§_-ji§,gls("Нажми, чтобы скопировать в буфер обмена."));
         this.§_-B1o§ = new ShamanCertificateReceived();
         this.§_-B1o§.x = 434;
         this.§_-B1o§.y = 96;
         this.§_-B1o§.addEventListener(MouseEvent.CLICK,this.§_-C24§);
         this.§_-H1g§.addChild(this.§_-B1o§);
         new §_-Hb§(this.§_-B1o§,gls("Аттестат школы шаманов"));
         this.§_-Ua§ = new ShamanCertificatePlace();
         this.§_-Ua§.x = this.§_-B1o§.x;
         this.§_-Ua§.y = this.§_-B1o§.y;
         this.§_-H1g§.addChild(this.§_-Ua§);
         new §_-Hb§(this.§_-Ua§,gls("Место для Аттестата Шамана"));
         this.§_-Cb§ = new ImageLeftSaveWorld();
         this.§_-Cb§.x = 427;
         this.§_-Cb§.y = 362;
         this.§_-H1g§.addChild(this.§_-Cb§);
         this.hero = new §_-DR§();
         this.hero.x = 486;
         this.hero.y = 470;
         this.§_-H1g§.addChild(this.hero);
         this.§_-13O§ = new §_-Q2i§();
         this.§_-13O§.x = 600;
         this.§_-13O§.y = 430;
         this.§_-H1g§.addChild(this.§_-13O§);
         this.§_-615§ = new §_-D1d§();
         this.§_-615§.x = 720;
         this.§_-615§.y = 330;
         this.§_-H1g§.addChild(this.§_-615§);
         var _loc5_:§_-LD§ = new §_-LD§();
         _loc5_.x = 600;
         _loc5_.y = 135;
         this.§_-H1g§.addChild(_loc5_);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-52t§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-Fj§);
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-Jv§);
         §_-d2x§.addEventListener(GameEvent.EXPERIENCE_CHANGED,this.§_-iE§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         this.§_-H1g§.x = (Game.starling.stage.stageWidth - §_-a9§.§_-9o§) * 0.5;
         this.§_-H1g§.y = (Game.starling.stage.stageHeight - §_-a9§.§_-31m§) * 0.5;
      }
      
      private function §_-C24§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            §_-F29§.type = §_-F29§.§_-S2i§;
            §_-71o§.show("School");
         },true);
      }
      
      private function §_-Fj§(param1:GameEvent) : void
      {
         this.§_-N2F§.visible = false;
         this.§_-81y§["common"].visible = true;
         this.§_-81y§["VIP"].visible = false;
         §_-r1n§.hide();
      }
      
      private function §_-Jv§(param1:GameEvent) : void
      {
         this.§_-N2F§.visible = true;
         this.§_-81y§["common"].visible = false;
         this.§_-81y§["VIP"].visible = true;
      }
      
      private function §_-iE§(param1:GameEvent) : void
      {
         if(§_-5B§.playerId != Game.selfId)
         {
            return;
         }
         this.§_-X2P§.text = String(§_-My§.§_-bh§(§_-d2x§.§_-z2o§,false));
         §_-H0§(§_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§ && Game.self["clan_id"] == 0);
      }
      
      private function §_-3K§(param1:Boolean) : void
      {
         this.§_-T14§.visible = false;
         this.§_-A3X§.visible = false;
         this.§_-V2v§.visible = true;
         this.§_-Qr§.visible = true;
         §_-H0§(param1 && this.player != null && this.player["level"] >= §_-My§.§_-U1R§ && this.player["clan_id"] == 0);
         this.§_-N2F§.visible = param1 && this.player["vip_exist"] > 0;
         this.§_-81y§["common"].visible = !(param1 && this.player["vip_exist"] > 0);
         this.§_-81y§["VIP"].visible = param1 && this.player["vip_exist"] > 0;
         this.§_-A20§(param1);
         if(§_-71o§.active is §_-5B§)
         {
            §_-1W§.§_-Q1v§(param1);
         }
         this.§_-A3X§.visible = param1;
         if(param1 && Game.self["clan_id"] == 0)
         {
            this.§_-TS§.clanId = 0;
         }
      }
      
      private function §_-R1G§(param1:int) : void
      {
         if(!this.§_-P20§)
         {
            this.§_-Pv§ = param1;
            return;
         }
         if(param1 == Game.selfId && this.player != null)
         {
            this.§_-3K§(true);
         }
         if(this.playerId == param1)
         {
            return;
         }
         if(this.player != null)
         {
            this.player.removeEventListener(this.§_-P9§);
         }
         this.playerId = param1;
         this.player = Game.getPlayer(param1);
         this.player.addEventListener(§_-5B§.§_-03g§,this.§_-P9§);
         Game.request(param1,§_-5B§.§_-03g§);
         dispatchEvent(new GameEvent(GameEvent.PROFILE_PLAYER_CHANGED));
      }
      
      private function §_-52t§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         if(!this.§_-T14§.visible)
         {
            return;
         }
         this.§_-D1w§();
      }
      
      private function §_-P9§(param1:Player) : void
      {
         if(param1.id != this.player.id)
         {
            return;
         }
         this.§_-3K§(this.player.id == Game.selfId);
         §_-vo§.§_-A2B§(this.§_-ji§,"<body><a class=\'blackSmall\' href=\'event:" + this.player.id + "\'>ID: " + String(param1.id) + "</a></body>",70,true,true,this.player.id);
         this.§_-ji§.x = 200 - this.§_-ji§.width;
         this.§_-C3d§.load(this.player["interior"]);
         §_-vo§.§_-A2B§(this.§_-V2v§,this.player.name,140,false,true);
         this.§_-Qr§.text = this.player["level"];
         this.§_-X2P§.text = String(§_-My§.§_-bh§(this.player["level"],false));
         (this.§_-j1Y§ as §_-JP§).§_-Tx§(this.player.sex);
         this.§_-Y1h§();
         if(Boolean(this.player["online"]) && this.player["uid"] != Game.selfId)
         {
            this.hero.visible = false;
            this.§_-Cb§.visible = true;
         }
         else
         {
            this.hero.visible = true;
            this.§_-Cb§.visible = false;
         }
         this.§_-TS§.clanId = this.player["clan_id"];
         if(this.playerId == Game.selfId)
         {
            this.league = §_-13r§.§_-DX§(§_-13r§.PLAYER_TYPE);
         }
         else
         {
            this.league = §_-13r§.§_-K1M§(param1["rating_score"],§_-13r§.PLAYER_TYPE);
         }
      }
      
      private function §_-23n§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.CLICK);
      }
      
      private function §_-V2z§(param1:MouseEvent) : void
      {
         this.§_-nI§(true);
         param1.stopImmediatePropagation();
      }
      
      private function §_-D1w§(param1:MouseEvent = null) : void
      {
         var _loc2_:String = §_-Y1S§.§_-9K§(this.§_-T14§.text);
         if(_loc2_ == "" || _loc2_ == Game.self.name)
         {
            this.cancel();
            return;
         }
         if(!§_-019§.§_-B2p§(_loc2_))
         {
            new §_-Q13§(gls("Ошибка"),gls("Имя должно быть цензурным")).show();
            this.cancel();
            return;
         }
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         if(§_-d2x§.§_-z2o§ >= §_-My§.§_-32h§)
         {
            if(!this.§_-r1§)
            {
               this.§_-r1§ = new §_-w2B§(this.§_-91g§,this.cancel);
            }
            this.§_-r1§.show();
         }
         else
         {
            this.save();
         }
      }
      
      private function §_-91g§() : void
      {
         var _loc1_:String = §_-Y1S§.§_-9K§(this.§_-T14§.text);
         Connection.§_-Li§(§_-h2B§.§_-n1O§,_loc1_);
         §_-vo§.§_-A2B§(this.§_-V2v§,_loc1_,140);
         this.§_-nI§(false);
      }
      
      private function save() : void
      {
         var _loc1_:String = StringUtil.§_-22O§(this.§_-T14§.text);
         Game.§_-tR§({
            "name":_loc1_,
            "sex":Game.self.sex
         });
         §_-vo§.§_-A2B§(this.§_-V2v§,Game.self.name,140);
         this.§_-nI§(false);
         Game.request(Game.selfId,§_-hF§.§_-31q§);
      }
      
      private function cancel() : void
      {
         this.§_-nI§(false);
      }
      
      private function §_-nI§(param1:Boolean) : void
      {
         this.§_-T14§.visible = param1;
         if(param1)
         {
            this.§_-T14§.text = Game.self["name"];
            this.§_-T14§.setSelection(this.§_-T14§.text.length,this.§_-T14§.text.length);
            Game.stage.focus = this.§_-T14§;
         }
         this.§_-V2v§.visible = !param1;
      }
      
      private function §_-A20§(param1:Boolean) : void
      {
         this.§_-B1o§.visible = param1 && §_-Bm§.§_-2S§(§_-T2o§.§_-m11§);
         this.§_-Ua§.visible = param1 && !§_-Bm§.§_-2S§(§_-T2o§.§_-m11§);
      }
      
      private function §_-Y1h§() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(this.player.id == Game.selfId)
         {
            if(§_-h1f§.isScrat)
            {
               this.hero.view = §_-g2W§.§_-x2F§;
            }
            else if(§_-h1f§.§_-SP§)
            {
               this.hero.view = §_-g2W§.§_-k22§;
            }
            else
            {
               this.hero.view = §_-g2W§.§_-O2w§;
            }
            this.hero.§_-7H§(§_-h1f§.§_-IS§,§_-h1f§.§_-51k§);
         }
         else
         {
            _loc1_ = false;
            _loc2_ = 0;
            while(_loc2_ < this.player["worn_packages"].length)
            {
               _loc1_ ||= §_-g2W§.§_-91b§(this.player["worn_packages"][_loc2_]);
               _loc2_++;
            }
            _loc3_ = false;
            _loc2_ = 0;
            while(_loc2_ < this.player["worn_packages"].length)
            {
               _loc3_ ||= §_-g2W§.§_-W2e§(this.player["worn_packages"][_loc2_]);
               _loc2_++;
            }
            if(_loc1_)
            {
               this.hero.view = §_-g2W§.§_-x2F§;
            }
            else if(_loc3_)
            {
               this.hero.view = §_-g2W§.§_-k22§;
            }
            else
            {
               this.hero.view = §_-g2W§.§_-O2w§;
            }
            this.hero.§_-7H§(this.player["worn_packages"],this.player["worn_accessories"]);
         }
      }
      
      private function §_-oZ§(param1:GameEvent) : void
      {
         this.§_-C3d§.load(Game.self["interior"]);
      }
      
      private function §_-42g§(param1:GameEvent) : void
      {
         if(param1.data["type"] != §_-13r§.PLAYER_TYPE)
         {
            return;
         }
         this.league = param1.data["value"];
      }
      
      private function set league(param1:int) : void
      {
         if(!this.§_-Z25§)
         {
            this.§_-Z25§ = new §_-914§(this.playerId,§_-13r§.PLAYER_TYPE,0.8,true,false);
            this.§_-R17§.addChild(this.§_-Z25§);
         }
         this.§_-Z25§.league = param1;
         this.§_-Z25§.x = this.§_-R17§.x + (this.§_-R17§.width - this.§_-Z25§.width) * 0.5;
         this.§_-Z25§.y = -1;
         this.§_-Z25§.filters = [§_-f2Q§];
         this.§_-32m§ = new §_-Hb§(this.§_-Z25§,gls("Лига: ") + §_-8S§.§_-11s§(Math.max(0,param1),§_-13r§.PLAYER_TYPE));
      }
   }
}


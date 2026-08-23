package §_-dc§
{
   import §_-I10§.§_-13r§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-F2y§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import §_-k1c§.§_-V2t§;
   import §_-xm§.§_-01x§;
   import §_-xm§.§_-53k§;
   import §_-xm§.§_-93l§;
   import §_-xm§.§_-I2I§;
   import §_-xm§.§_-v10§;
   import buttons.§_-j18§;
   import chat.§_-11X§;
   import chat.§_-E1R§;
   import chat.§_-Yr§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.§_-T25§;
   import events.§_-n13§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import tape.§_-3l§;
   import tape.§_-X2h§;
   import tape.§_-m1§;
   import tape.§_-xc§;
   import utils.StringUtil;
   import utils.§_-vo§;
   import utils.§_-w2j§;
   import utils.§_-x1Z§;
   import views.§_-C1Q§;
   import views.§_-F1z§;
   import views.§_-n1t§;
   import views.§_-t1N§;
   
   public class §_-X1g§ extends Sprite
   {
      
      private static const §_-q10§:int = 5000;
      
      private static const §_-12o§:int = 60000;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #363636;","}","a {","text-decoration: underline;","margin-right: 0px;","}","a:hover {","text-decoration: underline;","color: #FF1B00;","}",".blackSmall {","color: #0B0B0A;","font-size: 10px;","}",".whiteSmall {","color: #FFFFFF;","font-size: 10px;","}",".red {","color: #FF0909;","font-size: 11px;","font-weight: bold","}",".black {","color: #000000;","font-size: 11px;","font-weight: bold","}"].join("\n");
      
      private static const CSS2:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 15px;","color: #FFFFFF;","font-weight: bold;","text-align: center;","}","a {","margin-right: 0px;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static var _instance:§_-X1g§ = null;
      
      private var §_-oa§:§_-F1z§ = null;
      
      private var §_-B3q§:Number = 0;
      
      private var §_-41I§:Number = -1;
      
      private var view:MovieClip;
      
      private var §_-33I§:§_-t1N§;
      
      private var §_-e1O§:Player = null;
      
      private var §_-81t§:Clan = null;
      
      private var §_-a1R§:int = 0;
      
      private var §_-913§:int = -1;
      
      private var §_-G2J§:int = 0;
      
      private var §_-B1s§:int;
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-j1p§:§_-Hb§ = null;
      
      private var §_-P2C§:§_-Hb§ = null;
      
      private var §_-81I§:§_-22V§ = null;
      
      private var §_-z1s§:§_-22V§ = null;
      
      private var §_-A2L§:§_-22V§ = null;
      
      private var §_-V2s§:§_-22V§ = null;
      
      private var §_-d1O§:§_-22V§ = null;
      
      private var §_-21B§:§_-22V§ = null;
      
      private var §_-A2p§:§_-22V§ = null;
      
      private var §_-93N§:§_-w2j§ = null;
      
      private var §_-7x§:Dialog = null;
      
      private var §_-T3§:Sprite;
      
      private var §_-Ju§:§_-V2t§ = null;
      
      private var §_-Z2y§:§_-V2t§ = null;
      
      private var §_-qn§:Dialog = null;
      
      private var §_-eZ§:Dialog = null;
      
      private var §_-l1r§:Dialog = null;
      
      private var §_-33R§:Boolean = false;
      
      private var §_-227§:§_-3l§ = null;
      
      private var §_-33P§:§_-xc§ = null;
      
      private var §_-pD§:Sprite = null;
      
      private var §_-n8§:MovieClip = null;
      
      private var §_-G2I§:Sprite = null;
      
      private var §_-1H§:Sprite = null;
      
      private var §_-2c§:§_-22V§ = null;
      
      public function §_-X1g§()
      {
         super();
         this.init();
         _instance = this;
         Game.listen(this.§_-P9§);
         §_-e2W§.listen(this.onClanLoaded);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-g1W§,§_-S2I§.BUY,§_-S2I§.§_-o1Y§]);
      }
      
      public static function get §_-P20§() : Boolean
      {
         return _instance != null;
      }
      
      public static function set §_-13o§(param1:int) : void
      {
         _instance.§_-13o§ = param1;
      }
      
      public static function set §_-G2p§(param1:Boolean) : void
      {
         _instance.§_-33R§ = param1;
      }
      
      public static function get §_-G2p§() : Boolean
      {
         return _instance.§_-33R§;
      }
      
      public static function §_-l29§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in (_instance.§_-33P§ as §_-m1§).§_-Z23§)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get clanId() : int
      {
         return this.§_-a1R§;
      }
      
      public function set clanId(param1:int) : void
      {
         if(this.clanId == param1)
         {
            return;
         }
         this.§_-a1R§ = param1;
         if(this.§_-41I§ == -1)
         {
            this.§_-41I§ = setInterval(this.§_-BT§,§_-12o§);
         }
         (this.§_-l1r§ as §_-v10§).clanId = this.clanId;
      }
      
      public function get §_-R2z§() : int
      {
         return this.§_-913§;
      }
      
      public function set §_-R2z§(param1:int) : void
      {
         if(this.§_-913§ == param1)
         {
            return;
         }
         this.§_-913§ = param1;
         Game.request(this.§_-913§,§_-hF§.§_-31q§ | §_-hF§.§_-31X§);
      }
      
      public function §_-j11§() : void
      {
         (this.§_-T3§ as §_-E1R§).§_-j11§();
      }
      
      public function §_-725§() : void
      {
         this.§_-a1R§ = 0;
         this.§_-13o§ = 0;
         (this.§_-1H§ as §_-C1Q§).§_-M2W§ = 0;
         this.§_-33P§.clear();
         this.§_-2c§.visible = true;
         (this.§_-G2I§ as §_-51P§).§_-7g§();
         this.§_-j1k§ = "";
         if(this.§_-7x§ != null)
         {
            (this.§_-7x§ as §_-I2I§).clear();
            this.§_-qn§ = null;
            §_-e2W§.§_-WR§ = [];
            this.§_-33R§ = false;
         }
         (this.§_-T3§ as §_-E1R§).§_-j11§();
         if(this.§_-41I§ == -1)
         {
            return;
         }
         clearInterval(this.§_-41I§);
         this.§_-41I§ = -1;
      }
      
      public function set §_-13o§(param1:int) : void
      {
         if(!Game.self)
         {
            return;
         }
         this.view.requestButton.visible = Game.selfId == this.§_-R2z§ || Game.self["clan_duty"] == Clan.§_-jY§;
         this.view.buttonInfo.visible = Game.selfId == this.§_-R2z§ || Game.self["clan_duty"] == Clan.§_-jY§;
         this.§_-G2J§ = param1;
      }
      
      public function §_-m1Y§(param1:int, param2:int) : void
      {
         this.§_-B1s§ = param1;
         this.§_-V2s§.text = gls("Участники: {0}/{1}",param1,param2);
      }
      
      public function set §_-83c§(param1:int) : void
      {
         var _loc3_:int = 0;
         if(this.§_-P2C§ != null)
         {
            this.§_-P2C§.remove();
            this.§_-P2C§ = null;
         }
         var _loc2_:String = param1.toString();
         if(param1 < -99999 || param1 > 999999)
         {
            _loc3_ = param1 / 1000;
            _loc2_ = _loc3_.toString() + "к";
            this.§_-P2C§ = new §_-Hb§(this.§_-d1O§,param1.toString(),true);
         }
         this.§_-d1O§.htmlText = "<P ALIGN=\"RIGHT\"><FONT FACE=\"a_PlakatTitul\" SIZE=\"19\" COLOR=\"" + (param1 >= 0 ? "#FFFFFF" : "#FF0000") + "\" LETTERSPACING=\"6\" KERNING=\"1\"><B>" + _loc2_ + "</B></FONT></P>";
         this.§_-d1O§.x = this.view.x + 669 + 110 - this.§_-d1O§.textWidth;
      }
      
      public function set §_-FU§(param1:int) : void
      {
         var _loc3_:int = 0;
         if(this.§_-j1p§ != null)
         {
            this.§_-j1p§.remove();
            this.§_-j1p§ = null;
         }
         var _loc2_:String = param1.toString();
         if(param1 < -99999 || param1 > 999999)
         {
            _loc3_ = param1 / 1000;
            _loc2_ = _loc3_.toString() + "к";
            this.§_-j1p§ = new §_-Hb§(this.§_-21B§,param1.toString(),true);
         }
         this.§_-21B§.htmlText = "<P ALIGN=\"RIGHT\"><FONT FACE=\"a_PlakatTitul\" SIZE=\"19\" COLOR=\"" + (param1 >= 0 ? "#FFFFFF" : "#FF8080") + "\" LETTERSPACING=\"5.8\" KERNING=\"1\"><B>" + _loc2_ + "</B></FONT></P>";
         this.§_-21B§.x = this.view.x + 528 + 110 - this.§_-21B§.textWidth;
      }
      
      public function set §_-j1k§(param1:String) : void
      {
         this.§_-93N§.text = param1;
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-I2U§);
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(CSS2);
         this.§_-Ju§ = new §_-V2t§(gls("Покинуть клан"),gls("Ты точно хочешь\nвыйти из клана?"),this.§_-w2J§,170);
         this.§_-Z2y§ = new §_-V2t§(gls("Распустить клан"),gls("Ты точно хочешь распустить клан?\nВесь бюджет будет потерян!"),this.§_-v2J§);
         this.§_-eZ§ = new §_-01x§();
         this.§_-7x§ = new §_-I2I§();
         this.§_-7x§.addEventListener(§_-T25§.§_-31q§,this.§_-53r§);
         this.§_-l1r§ = new §_-v10§(this.clanId);
         this.view = new ClanRoomView();
         this.view.x = 70;
         this.view.y = 50;
         addChild(this.view);
         this.§_-oa§ = new §_-F1z§("",39,105);
         this.§_-oa§.mouseEnabled = false;
         this.§_-oa§.mouseChildren = false;
         this.view.addChild(this.§_-oa§);
         this.view.addChild(new §_-22V§(gls("Клан"),this.view.x + 135,this.view.y + 23,new TextFormat(§_-22V§.§_-pJ§,23,16763904))).filters = Dialog.§_-m2A§;
         (this.view as ClanRoomView).closeClanButton.addEventListener(MouseEvent.CLICK,this.§_-q2q§);
         new §_-Hb§((this.view as ClanRoomView).closeClanButton,gls("Распустить клан"));
         (this.view as ClanRoomView).retireButton.addEventListener(MouseEvent.CLICK,this.§_-W1l§);
         new §_-Hb§((this.view as ClanRoomView).retireButton,gls("Выйти из клана"));
         this.§_-A2L§ = new §_-22V§("",this.view.x + 68,this.view.y + 62,new TextFormat(§_-22V§.§_-F2z§,17,14372634,true,null,null,null,null,"center"),210);
         this.view.addChild(this.§_-A2L§);
         this.§_-81I§ = new §_-22V§(gls("<body><a class=\'blackSmall\' href=\'event:#\'>Изменить данные</a></body>"),255,138,this.style);
         this.§_-81I§.addEventListener(MouseEvent.CLICK,this.§_-92u§);
         this.§_-81I§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.view.addChild(this.§_-81I§);
         this.§_-z1s§ = new §_-22V§("",135,138,this.style);
         this.§_-z1s§.addEventListener(MouseEvent.CLICK,Game.§_-S1F§);
         this.§_-z1s§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         this.view.addChild(this.§_-z1s§);
         new §_-Hb§(this.§_-z1s§,gls("Нажми, чтобы скопировать в буфер обмена."));
         this.§_-V2s§ = new §_-22V§(gls("Участники: {0}/{1}",999,999),this.view.x + 68,this.view.y + 135,new TextFormat(§_-22V§.§_-F2z§,16,16777215,true,null,null,null,null,"center"),204);
         this.§_-V2s§.mouseEnabled = false;
         this.view.addChild(this.§_-V2s§);
         this.§_-pD§ = new §_-n1t§();
         this.§_-pD§.x = this.view.x + 62;
         this.§_-pD§.y = this.view.y + 104;
         this.view.addChild(this.§_-pD§);
         (this.view as ClanRoomView).requestButton.addEventListener(MouseEvent.CLICK,this.§_-B1j§);
         new §_-Hb§((this.view as ClanRoomView).requestButton,gls("Заявки в клан"));
         this.§_-13o§ = 0;
         this.§_-1H§ = new §_-C1Q§();
         this.§_-1H§.x = (this.view as ClanRoomView).requestButton.x + 50;
         this.§_-1H§.y = (this.view as ClanRoomView).requestButton.y + 60;
         addChild(this.§_-1H§);
         (this.§_-1H§ as §_-C1Q§).§_-M2W§ = 0;
         (this.view as ClanRoomView).buttonInfo.visible = false;
         (this.view as ClanRoomView).buttonInfo.addEventListener(MouseEvent.CLICK,this.§_-T2U§);
         (this.view as ClanRoomView).buttonInfo.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-23n§);
         new §_-Hb§((this.view as ClanRoomView).buttonInfo,gls("Статистика клана"));
         this.§_-33I§ = new §_-t1N§(§_-13r§.CLAN_TYPE);
         this.§_-33I§.x = this.view.x + 139;
         this.§_-33I§.y = this.view.y + 163;
         this.view.addChild(this.§_-33I§);
         this.§_-G2I§ = new §_-51P§();
         this.§_-G2I§.x = 96;
         this.§_-G2I§.y = 270;
         addChild(this.§_-G2I§);
         this.§_-n8§ = new ImageClanBoard();
         this.§_-n8§.visible = false;
         this.§_-n8§.x = 110;
         this.§_-n8§.y = 295;
         addChild(this.§_-n8§);
         this.§_-A2p§ = new §_-22V§("",163,365,new TextFormat(§_-22V§.§_-F2z§,12,16711680,true,null,null,null,null,"center"));
         addChild(this.§_-A2p§);
         var _loc2_:ButtonClanDonate = new ButtonClanDonate();
         _loc2_.x = this.view.x + 462;
         _loc2_.y = this.view.y + 36;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-O2V§);
         this.view.addChild(_loc2_);
         new §_-Hb§(_loc2_,gls("Пополнить бюджет клана"));
         var _loc3_:ImageIconNut = new ImageIconNut();
         _loc3_.x = this.view.x + 507;
         _loc3_.y = this.view.y + 42;
         this.view.addChild(_loc3_);
         this.§_-21B§ = new §_-22V§("",this.view.x + 528,this.view.y + 39,this.style);
         this.view.addChild(this.§_-21B§);
         this.§_-FU§ = 0;
         var _loc4_:ImageIconCoins = new ImageIconCoins();
         _loc4_.x = this.view.x + 649;
         _loc4_.y = this.view.y + 41;
         this.view.addChild(_loc4_);
         this.§_-d1O§ = new §_-22V§("",this.view.x + 669,this.view.y + 39,this.style);
         this.view.addChild(this.§_-d1O§);
         this.§_-83c§ = 0;
         this.§_-33P§ = new §_-m1§();
         this.§_-227§ = new §_-X2h§();
         this.§_-227§.x = 25;
         this.§_-227§.y = 25;
         this.§_-227§.setData(this.§_-33P§);
         (this.view as ClanRoomView).privateRooms.addChild(this.§_-227§);
         this.§_-2c§ = new §_-22V§(gls("У клана ещё нет своих районов.\nВы можете купить их."),35,40,new TextFormat(§_-22V§.§_-F2z§,14,6700045,true));
         (this.view as ClanRoomView).privateRooms.addChild(this.§_-2c§);
         (this.view as ClanRoomView).privateRooms.roomRefreshButton.addEventListener(MouseEvent.CLICK,this.§_-BT§);
         new §_-Hb§((this.view as ClanRoomView).privateRooms.roomRefreshButton,gls("Обновить список частных районов"));
         (this.view as ClanRoomView).privateRooms.roomBuyButton.addEventListener(MouseEvent.CLICK,this.§_-a8§);
         new §_-Hb§((this.view as ClanRoomView).privateRooms.roomBuyButton,gls("Купить частный район"));
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,0);
         this.§_-93N§ = new §_-w2j§("",0,0,290,195,_loc5_,_loc5_,339);
         this.§_-93N§.type = TextFieldType.DYNAMIC;
         this.§_-93N§.selectable = true;
         this.§_-93N§.background = false;
         this.§_-93N§.border = false;
         this.§_-93N§.multiline = true;
         this.§_-93N§.wordWrap = true;
         this.§_-93N§.maxChars = 1024;
         var _loc6_:§_-j18§ = new §_-j18§(gls("Отправить"));
         _loc6_.x = this.view.x + 768;
         _loc6_.y = this.view.y + 458;
         _loc6_.scaleX = _loc6_.scaleY = 0.7;
         addChild(_loc6_);
         var _loc7_:TextField = new TextField();
         _loc7_.x = 540;
         _loc7_.y = 458;
         _loc7_.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,13,0);
         _loc7_.selectable = true;
         _loc7_.type = TextFieldType.INPUT;
         _loc7_.width = 215;
         _loc7_.height = 18;
         this.view.addChild(_loc7_);
         this.§_-T3§ = new §_-E1R§(_loc7_,this.view.chatInputBG,_loc6_,new Rectangle(603,340,305,155),this.view.ChatBG,this.§_-93N§);
         (this.§_-T3§ as §_-E1R§).add(new §_-11X§());
         (this.§_-T3§ as §_-E1R§).add(new §_-Yr§());
         addChild(this.§_-T3§);
      }
      
      private function §_-23n§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.§_-913§)
         {
            return;
         }
         this.§_-e1O§ = _loc2_;
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.§_-a1R§)
         {
            return;
         }
         this.§_-81t§ = _loc2_;
         this.§_-R2z§ = this.§_-81t§.§_-R2z§;
         this.§_-O1X§ = this.§_-81t§.state;
         this.§_-FU§ = this.§_-81t§.acorns;
         this.§_-83c§ = this.§_-81t§.coins;
         this.§_-ll§(Game.selfId == this.§_-R2z§);
         this.§_-oa§.load(param1.§_-81t§.§_-cy§);
         §_-vo§.§_-A2B§(this.§_-A2L§,_loc2_.name,204,false,true,_loc2_.id);
         §_-vo§.§_-A2B§(this.§_-z1s§,"<body><a class=\'blackSmall\' href=\'event:" + _loc2_.id + "\'>ID: " + String(_loc2_.id) + "</a></body>",150,true,true,_loc2_.id);
         if(this.§_-81t§.exp >= this.§_-81t§.§_-F2k§ && (this.§_-81t§.exp != 0 && this.§_-81t§.§_-F2k§ != 0) && this.§_-81t§.state != §_-h2B§.§_-cc§ && this.§_-81t§.level != §_-F§.MAX_LEVEL)
         {
            §_-e2W§.request(this.§_-81t§.id,§_-Oy§.§_-819§ | §_-Oy§.§_-X13§,true);
         }
         (this.§_-pD§ as §_-n1t§).setData(_loc2_.exp,_loc2_.level,_loc2_.§_-F2k§,_loc2_.§_-K2A§,§_-F§.§_-B2W§(_loc2_.level));
         this.§_-m1Y§(_loc2_.size,§_-F§.§_-O1f§(_loc2_.level) + _loc2_.places);
         (this.§_-7x§ as §_-I2I§).§_-e20§(_loc2_.places);
         (this.§_-G2I§ as §_-51P§).§_-Ra§(_loc2_);
         this.§_-BT§();
         if(this.§_-93N§.type == TextFieldType.DYNAMIC)
         {
            this.§_-93N§.text = _loc2_.news;
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Vector.<Object> = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-g1W§:
               _loc2_ = new Vector.<Object>();
               _loc3_ = 0;
               while(_loc3_ < param1[0].length)
               {
                  _loc2_.push({
                     "id":param1[0][_loc3_],
                     "type":param1[0][_loc3_ + 1],
                     "sub_type":param1[0][_loc3_ + 2],
                     "count":param1[0][_loc3_ + 3],
                     "modes":param1[0][_loc3_ + 4]
                  });
                  _loc3_ += 5;
               }
               (this.§_-33P§ as §_-m1§).§_-U1w§(_loc2_);
               (this.§_-227§ as §_-X2h§).§_-Fr§();
               this.§_-2c§.visible = (this.§_-33P§ as §_-m1§).§_-Z23§.length < 1;
               break;
            case §_-S2I§.BUY:
               switch(param1[2])
               {
                  case §_-h2B§.§_-w2e§:
                     if(param1[0] != §_-S2I§.§_-k2l§)
                     {
                        break;
                     }
                     (this.§_-33P§ as §_-m1§).§_-k1§({
                        "id":param1[6],
                        "type":param1[5] >> 8,
                        "count":0,
                        "modes":0
                     });
                     (this.§_-227§ as §_-X2h§).§_-Fr§();
                     this.§_-2c§.visible = (this.§_-33P§ as §_-m1§).§_-Z23§.length < 1;
                     if(param1[1] == Game.selfId && Boolean(this.§_-qn§))
                     {
                        this.§_-qn§.hide();
                     }
                     this.§_-BT§();
                     break;
                  case §_-h2B§.§_-j2s§:
                     if(param1[0] != §_-S2I§.§_-k2l§)
                     {
                        break;
                     }
                     this.§_-81t§.places += §_-I2I§.§_-D13§;
                     this.§_-m1Y§(this.§_-81t§.size,§_-F§.§_-O1f§(this.§_-81t§.level) + this.§_-81t§.places);
                     (this.§_-7x§ as §_-I2I§).§_-e20§(this.§_-81t§.places);
               }
               break;
            case §_-S2I§.§_-o1Y§:
               if(!this.§_-A10§(param1[1]))
               {
                  return;
               }
               switch(param1[0])
               {
                  case §_-S2I§.§_-J1m§:
                     new §_-Q13§(gls("Частный район"),gls("Время комнаты истекло."),false,null,180).show();
                  case §_-S2I§.§_-M1Q§:
                     this.§_-E26§(param1[1]);
                     break;
                  case §_-S2I§.§_-03w§:
                     new §_-Q13§(gls("Частный район"),gls("В комнате нет мест."),false,null,150).show();
                     this.§_-BT§();
                     break;
                  case §_-S2I§.§_-r2z§:
               }
         }
      }
      
      private function set §_-O1X§(param1:int) : void
      {
         (this.view as ClanRoomView).requestButton.enabled = (this.view as ClanRoomView).requestButton.mouseEnabled = param1 != §_-S2I§.§_-F2Q§;
         this.§_-G2I§.visible = param1 == §_-S2I§.§_-Wr§;
         this.§_-A2p§.text = "";
         if(param1 == §_-S2I§.§_-13l§ && this.§_-81t§.size > §_-F§.§_-O1f§(this.§_-81t§.level) + this.§_-81t§.places)
         {
            this.§_-A2p§.text = gls("Лимит на размер\nклана превышен.\nКлану заблокирован\nдоступ к тотемам\nи получению опыта.");
         }
         if(param1 == §_-S2I§.§_-13l§ && this.§_-81t§.acorns < 0)
         {
            this.§_-A2p§.text = gls("ВНИМАНИЕ!\nВаш клан заблокирован за\nнеуплату. Погасите долг,\nчтобы разблокировать клан.\n\n\n\t\t\t\t\tАдминистрация");
         }
         if(param1 == §_-S2I§.§_-F2Q§)
         {
            this.§_-A2p§.text = gls("ВНИМАНИЕ!\nВаш клан заблокирован за\nнарушение правил поведения.\n\t\t\tАдминистрация");
         }
         this.§_-n8§.visible = this.§_-A2p§.text != "";
         this.§_-227§.mouseEnabled = this.§_-227§.mouseChildren = param1 != §_-S2I§.§_-F2Q§;
         this.§_-227§.filters = (this.view as ClanRoomView).requestButton.filters = param1 != §_-S2I§.§_-F2Q§ ? [] : §_-x1Z§.§_-c2G§;
         (this.view as ClanRoomView).privateRooms.mouseEnabled = (this.view as ClanRoomView).privateRooms.mouseChildren = param1 != §_-S2I§.§_-F2Q§;
         (this.view as ClanRoomView).privateRooms.filters = param1 != §_-S2I§.§_-F2Q§ ? [] : §_-x1Z§.§_-c2G§;
      }
      
      private function §_-O2V§(param1:Event) : void
      {
         new §_-53k§().show();
      }
      
      private function §_-ll§(param1:Boolean) : void
      {
         if(this.§_-qn§ == null)
         {
            this.§_-qn§ = new §_-93l§();
         }
         (this.§_-T3§ as §_-E1R§).§_-p29§ = param1;
         (this.view as ClanRoomView).requestButton.visible = param1 || Game.self["clan_duty"] == Clan.§_-jY§;
         (this.view as ClanRoomView).closeClanButton.visible = param1;
         (this.view as ClanRoomView).retireButton.visible = !param1;
         (this.view as ClanRoomView).buttonInfo.visible = param1 || Game.self["clan_duty"] == Clan.§_-jY§;
         (this.§_-T3§ as §_-E1R§).§_-334§(param1 || Game.self["clan_duty"] == Clan.§_-jY§);
         (this.§_-T3§ as §_-E1R§).§_-z2w§(param1 || Game.self["clan_duty"] == Clan.§_-jY§);
         this.§_-81I§.visible = param1;
         this.§_-z1s§.visible = param1 || Game.self["clan_duty"] == Clan.§_-jY§;
         (this.view as ClanRoomView).clanEmblem.mouseEnabled = param1;
         (this.§_-G2I§ as §_-51P§).§_-ll§(param1 || Game.self["clan_duty"] == Clan.§_-jY§);
         if(param1)
         {
            (this.view as ClanRoomView).clanEmblem.addEventListener(MouseEvent.CLICK,this.§_-92u§);
            new §_-Hb§((this.view as ClanRoomView).clanEmblem,gls("Изменить данные"));
         }
         this.§_-93N§.text = StringUtil.§_-22O§(this.§_-93N§.text);
         this.§_-93N§.text = StringUtil.§_-T2i§(this.§_-93N§.text);
         if(§_-e2W§.§_-Rg§ == null || §_-e2W§.§_-Rg§ == this.§_-93N§.text)
         {
            return;
         }
         if(Game.self["clan_duty"] != Clan.§_-k1P§ && Game.self["clan_duty"] != Clan.§_-jY§)
         {
            this.§_-93N§.text = §_-e2W§.§_-Rg§;
         }
         else if(this.§_-93N§.textHeight > 148)
         {
            this.§_-93N§.text = §_-e2W§.§_-Rg§;
         }
      }
      
      private function §_-B1j§(param1:MouseEvent) : void
      {
         if(Game.self["clan_duty"] != Clan.§_-k1P§ && Game.self["clan_duty"] != Clan.§_-jY§)
         {
            return;
         }
         this.§_-7x§.show();
      }
      
      private function §_-53r§(param1:§_-T25§) : void
      {
         (this.§_-1H§ as §_-C1Q§).§_-M2W§ = param1.count;
         this.§_-1H§.visible = (this.§_-1H§ as §_-C1Q§).§_-M2W§ > 0;
         this.§_-13o§ = param1.count;
      }
      
      private function §_-q2q§(param1:MouseEvent) : void
      {
         this.§_-Z2y§.show();
      }
      
      private function §_-a8§(param1:MouseEvent = null) : void
      {
         if(this.§_-qn§ == null)
         {
            return;
         }
         this.§_-qn§.show();
      }
      
      private function §_-v2J§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-cc§);
      }
      
      private function §_-W1l§(param1:MouseEvent) : void
      {
         this.§_-Ju§.show();
      }
      
      private function §_-w2J§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-J2A§);
      }
      
      private function §_-92u§(param1:MouseEvent) : void
      {
         (this.§_-eZ§ as §_-01x§).id = this.clanId;
         this.§_-eZ§.show();
      }
      
      private function §_-BT§(param1:MouseEvent = null) : void
      {
         var _loc2_:Number = new Date().getTime();
         if((this.§_-33P§ as §_-m1§).§_-Z23§ == null)
         {
            this.§_-B3q§ = _loc2_;
            Connection.§_-Li§(§_-h2B§.§_-H2B§);
         }
         if(this.clanId == 0 || !(§_-71o§.active is §_-F2y§) || Game.self["clan_id"] == 0)
         {
            return;
         }
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).state != §_-S2I§.§_-Wr§)
         {
            return;
         }
         if(Math.abs(_loc2_ - this.§_-B3q§) < §_-q10§)
         {
            return;
         }
         this.§_-B3q§ = _loc2_;
         Connection.§_-Li§(§_-h2B§.§_-H2B§);
      }
      
      private function §_-A10§(param1:int) : Boolean
      {
         return (this.§_-33P§ as §_-m1§).§_-F2R§(param1);
      }
      
      private function §_-E26§(param1:int) : void
      {
         (this.§_-33P§ as §_-m1§).§_-D15§(param1);
         this.§_-2c§.visible = (this.§_-33P§ as §_-m1§).§_-Z23§.length < 1;
      }
      
      private function §_-T2U§(param1:MouseEvent) : void
      {
         this.§_-l1r§.show();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         this.§_-33I§.visible = param1;
      }
   }
}


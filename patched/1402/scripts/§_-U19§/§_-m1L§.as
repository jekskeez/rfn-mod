package §_-U19§
{
   import §_-I18§.§_-A3N§;
   import §_-I18§.§_-A3w§;
   import §_-I18§.§_-hC§;
   import §_-I18§.§_-l4§;
   import §_-I18§.§_-v2R§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-82O§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-7y§;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-P1w§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-K2G§;
   import chat.§_-1t§;
   import chat.§_-A2e§;
   import chat.§_-E1S§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.§_-a1V§;
   import events.§_-s1d§;
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
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import tape.§_-G2V§;
   import tape.§_-J2Y§;
   import tape.§_-L2v§;
   import tape.§_-h2f§;
   import utils.StringUtil;
   import utils.§_-72U§;
   import utils.§_-L2J§;
   import utils.§_-y1l§;
   import views.§_-236§;
   import views.§_-63U§;
   import views.§_-A3c§;
   import views.§_-q2z§;
   
   public class §_-m1L§ extends Sprite
   {
      
      private static const §_-3a§:int = 5000;
      
      private static const §_-C1n§:int = 60000;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #363636;","}","a {","text-decoration: underline;","margin-right: 0px;","}","a:hover {","text-decoration: underline;","color: #FF1B00;","}",".blackSmall {","color: #0B0B0A;","font-size: 10px;","}",".whiteSmall {","color: #FFFFFF;","font-size: 10px;","}",".red {","color: #FF0909;","font-size: 11px;","font-weight: bold","}",".black {","color: #000000;","font-size: 11px;","font-weight: bold","}"].join("\n");
      
      private static const CSS2:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 15px;","color: #FFFFFF;","font-weight: bold;","text-align: center;","}","a {","margin-right: 0px;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private static var _instance:§_-m1L§ = null;
      
      private var §_-Y1c§:§_-236§ = null;
      
      private var §_-x2F§:Number = 0;
      
      private var §_-hl§:Number = -1;
      
      private var view:MovieClip;
      
      private var §_-I2t§:§_-63U§;
      
      private var §_-dK§:Player = null;
      
      private var §_-b19§:Clan = null;
      
      private var §_-Jx§:int = 0;
      
      private var §_-31V§:int = -1;
      
      private var §_-G1j§:int = 0;
      
      private var §_-z1q§:int;
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-RZ§:§_-kr§ = null;
      
      private var §_-G2b§:§_-kr§ = null;
      
      private var §_-02m§:§_-i5§ = null;
      
      private var §_-G2I§:§_-i5§ = null;
      
      private var §_-E2W§:§_-i5§ = null;
      
      private var §_-p2Q§:§_-i5§ = null;
      
      private var §_-i1E§:§_-i5§ = null;
      
      private var §_-9t§:§_-i5§ = null;
      
      private var §_-ZI§:§_-i5§ = null;
      
      private var §_-YA§:§_-72U§ = null;
      
      private var §_-v2b§:Dialog = null;
      
      private var §_-Ri§:Sprite;
      
      private var §_-8a§:§_-7y§ = null;
      
      private var §_-L17§:§_-7y§ = null;
      
      private var §_-c1k§:Dialog = null;
      
      private var §_-E2F§:Dialog = null;
      
      private var §_-t13§:Dialog = null;
      
      private var §_-H1D§:Boolean = false;
      
      private var §_-v1s§:§_-L2v§ = null;
      
      private var §_-Sl§:§_-h2f§ = null;
      
      private var §_-11§:Sprite = null;
      
      private var §_-73V§:MovieClip = null;
      
      private var §_-Af§:Sprite = null;
      
      private var §_-h2y§:Sprite = null;
      
      private var §_-T1H§:§_-i5§ = null;
      
      public function §_-m1L§()
      {
         super();
         this.init();
         _instance = this;
         Game.listen(this.§_-Y16§);
         §_-B2U§.listen(this.onClanLoaded);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-P2m§,§_-s2l§.BUY,§_-s2l§.§_-vf§]);
      }
      
      public static function get §_-u21§() : Boolean
      {
         return _instance != null;
      }
      
      public static function set §_-12V§(param1:int) : void
      {
         _instance.§_-12V§ = param1;
      }
      
      public static function set §_-K1W§(param1:Boolean) : void
      {
         _instance.§_-H1D§ = param1;
      }
      
      public static function get §_-K1W§() : Boolean
      {
         return _instance.§_-H1D§;
      }
      
      public static function §_-13l§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in (_instance.§_-Sl§ as §_-G2V§).§_-s2k§)
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
         return this.§_-Jx§;
      }
      
      public function set clanId(param1:int) : void
      {
         if(this.clanId == param1)
         {
            return;
         }
         this.§_-Jx§ = param1;
         if(this.§_-hl§ == -1)
         {
            this.§_-hl§ = setInterval(this.§_-L1E§,§_-C1n§);
         }
         (this.§_-t13§ as §_-A3w§).clanId = this.clanId;
      }
      
      public function get §_-W2t§() : int
      {
         return this.§_-31V§;
      }
      
      public function set §_-W2t§(param1:int) : void
      {
         if(this.§_-31V§ == param1)
         {
            return;
         }
         this.§_-31V§ = param1;
         Game.request(this.§_-31V§,§_-Y2E§.§_-n2H§ | §_-Y2E§.§_-s10§);
      }
      
      public function §_-s2W§() : void
      {
         (this.§_-Ri§ as §_-A2e§).§_-s2W§();
      }
      
      public function §_-51k§() : void
      {
         this.§_-Jx§ = 0;
         this.§_-12V§ = 0;
         (this.§_-h2y§ as §_-A3c§).§_-B1K§ = 0;
         this.§_-Sl§.clear();
         this.§_-T1H§.visible = true;
         (this.§_-Af§ as §_-x1R§).§_-h2E§();
         this.§_-W2m§ = "";
         if(this.§_-v2b§ != null)
         {
            (this.§_-v2b§ as §_-v2R§).clear();
            this.§_-c1k§ = null;
            §_-B2U§.§_-32F§ = [];
            this.§_-H1D§ = false;
         }
         (this.§_-Ri§ as §_-A2e§).§_-s2W§();
         if(this.§_-hl§ == -1)
         {
            return;
         }
         clearInterval(this.§_-hl§);
         this.§_-hl§ = -1;
      }
      
      public function set §_-12V§(param1:int) : void
      {
         if(!Game.self)
         {
            return;
         }
         this.view.requestButton.visible = Game.selfId == this.§_-W2t§ || Game.self["clan_duty"] == Clan.§_-HJ§;
         this.view.buttonInfo.visible = Game.selfId == this.§_-W2t§ || Game.self["clan_duty"] == Clan.§_-HJ§;
         this.§_-G1j§ = param1;
      }
      
      public function §_-nD§(param1:int, param2:int) : void
      {
         this.§_-z1q§ = param1;
         this.§_-p2Q§.text = gls("Участники: {0}/{1}",param1,param2);
      }
      
      public function set §_-Ev§(param1:int) : void
      {
         var _loc3_:int = 0;
         if(this.§_-G2b§ != null)
         {
            this.§_-G2b§.remove();
            this.§_-G2b§ = null;
         }
         var _loc2_:String = param1.toString();
         if(param1 < -99999 || param1 > 999999)
         {
            _loc3_ = param1 / 1000;
            _loc2_ = _loc3_.toString() + "к";
            this.§_-G2b§ = new §_-kr§(this.§_-i1E§,param1.toString(),true);
         }
         this.§_-i1E§.htmlText = "<P ALIGN=\"RIGHT\"><FONT FACE=\"a_PlakatTitul\" SIZE=\"19\" COLOR=\"" + (param1 >= 0 ? "#FFFFFF" : "#FF0000") + "\" LETTERSPACING=\"6\" KERNING=\"1\"><B>" + _loc2_ + "</B></FONT></P>";
         this.§_-i1E§.x = this.view.x + 669 + 110 - this.§_-i1E§.textWidth;
      }
      
      public function set §_-931§(param1:int) : void
      {
         var _loc3_:int = 0;
         if(this.§_-RZ§ != null)
         {
            this.§_-RZ§.remove();
            this.§_-RZ§ = null;
         }
         var _loc2_:String = param1.toString();
         if(param1 < -99999 || param1 > 999999)
         {
            _loc3_ = param1 / 1000;
            _loc2_ = _loc3_.toString() + "к";
            this.§_-RZ§ = new §_-kr§(this.§_-9t§,param1.toString(),true);
         }
         this.§_-9t§.htmlText = "<P ALIGN=\"RIGHT\"><FONT FACE=\"a_PlakatTitul\" SIZE=\"19\" COLOR=\"" + (param1 >= 0 ? "#FFFFFF" : "#FF8080") + "\" LETTERSPACING=\"5.8\" KERNING=\"1\"><B>" + _loc2_ + "</B></FONT></P>";
         this.§_-9t§.x = this.view.x + 528 + 110 - this.§_-9t§.textWidth;
      }
      
      public function set §_-W2m§(param1:String) : void
      {
         this.§_-YA§.text = param1;
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-aD§);
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(CSS2);
         this.§_-8a§ = new §_-7y§(gls("Покинуть клан"),gls("Ты точно хочешь\nвыйти из клана?"),this.§_-Df§,170);
         this.§_-L17§ = new §_-7y§(gls("Распустить клан"),gls("Ты точно хочешь распустить клан?\nВесь бюджет будет потерян!"),this.§_-A3Q§);
         this.§_-E2F§ = new §_-A3N§();
         this.§_-v2b§ = new §_-v2R§();
         this.§_-v2b§.addEventListener(§_-s1d§.§_-n2H§,this.§_-13D§);
         this.§_-t13§ = new §_-A3w§(this.clanId);
         this.view = new ClanRoomView();
         this.view.x = 70;
         this.view.y = 50;
         addChild(this.view);
         this.§_-Y1c§ = new §_-236§("",39,105);
         this.§_-Y1c§.mouseEnabled = false;
         this.§_-Y1c§.mouseChildren = false;
         this.view.addChild(this.§_-Y1c§);
         this.view.addChild(new §_-i5§(gls("Клан"),this.view.x + 135,this.view.y + 23,new TextFormat(§_-i5§.§_-p1s§,23,16763904))).filters = Dialog.§_-q2I§;
         (this.view as ClanRoomView).closeClanButton.addEventListener(MouseEvent.CLICK,this.§_-tp§);
         new §_-kr§((this.view as ClanRoomView).closeClanButton,gls("Распустить клан"));
         (this.view as ClanRoomView).retireButton.addEventListener(MouseEvent.CLICK,this.§_-Fn§);
         new §_-kr§((this.view as ClanRoomView).retireButton,gls("Выйти из клана"));
         this.§_-E2W§ = new §_-i5§("",this.view.x + 68,this.view.y + 62,new TextFormat(§_-i5§.§_-c10§,17,14372634,true,null,null,null,null,"center"),210);
         this.view.addChild(this.§_-E2W§);
         this.§_-02m§ = new §_-i5§(gls("<body><a class=\'blackSmall\' href=\'event:#\'>Изменить данные</a></body>"),255,138,this.style);
         this.§_-02m§.addEventListener(MouseEvent.CLICK,this.§_-82s§);
         this.§_-02m§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.view.addChild(this.§_-02m§);
         this.§_-G2I§ = new §_-i5§("",135,138,this.style);
         this.§_-G2I§.addEventListener(MouseEvent.CLICK,Game.§_-036§);
         this.§_-G2I§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         this.view.addChild(this.§_-G2I§);
         new §_-kr§(this.§_-G2I§,gls("Нажми, чтобы скопировать в буфер обмена."));
         this.§_-p2Q§ = new §_-i5§(gls("Участники: {0}/{1}",999,999),this.view.x + 68,this.view.y + 135,new TextFormat(§_-i5§.§_-c10§,16,16777215,true,null,null,null,null,"center"),204);
         this.§_-p2Q§.mouseEnabled = false;
         this.view.addChild(this.§_-p2Q§);
         this.§_-11§ = new §_-q2z§();
         this.§_-11§.x = this.view.x + 62;
         this.§_-11§.y = this.view.y + 104;
         this.view.addChild(this.§_-11§);
         (this.view as ClanRoomView).requestButton.addEventListener(MouseEvent.CLICK,this.§_-H1§);
         new §_-kr§((this.view as ClanRoomView).requestButton,gls("Заявки в клан"));
         this.§_-12V§ = 0;
         this.§_-h2y§ = new §_-A3c§();
         this.§_-h2y§.x = (this.view as ClanRoomView).requestButton.x + 50;
         this.§_-h2y§.y = (this.view as ClanRoomView).requestButton.y + 60;
         addChild(this.§_-h2y§);
         (this.§_-h2y§ as §_-A3c§).§_-B1K§ = 0;
         (this.view as ClanRoomView).buttonInfo.visible = false;
         (this.view as ClanRoomView).buttonInfo.addEventListener(MouseEvent.CLICK,this.§_-81z§);
         (this.view as ClanRoomView).buttonInfo.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-31U§);
         new §_-kr§((this.view as ClanRoomView).buttonInfo,gls("Статистика клана"));
         this.§_-I2t§ = new §_-63U§(§_-82O§.CLAN_TYPE);
         this.§_-I2t§.x = this.view.x + 139;
         this.§_-I2t§.y = this.view.y + 163;
         this.view.addChild(this.§_-I2t§);
         this.§_-Af§ = new §_-x1R§();
         this.§_-Af§.x = 96;
         this.§_-Af§.y = 270;
         addChild(this.§_-Af§);
         this.§_-73V§ = new ImageClanBoard();
         this.§_-73V§.visible = false;
         this.§_-73V§.x = 110;
         this.§_-73V§.y = 295;
         addChild(this.§_-73V§);
         this.§_-ZI§ = new §_-i5§("",163,365,new TextFormat(§_-i5§.§_-c10§,12,16711680,true,null,null,null,null,"center"));
         addChild(this.§_-ZI§);
         var _loc2_:ButtonClanDonate = new ButtonClanDonate();
         _loc2_.x = this.view.x + 462;
         _loc2_.y = this.view.y + 36;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-m1M§);
         this.view.addChild(_loc2_);
         new §_-kr§(_loc2_,gls("Пополнить бюджет клана"));
         var _loc3_:ImageIconNut = new ImageIconNut();
         _loc3_.x = this.view.x + 507;
         _loc3_.y = this.view.y + 42;
         this.view.addChild(_loc3_);
         this.§_-9t§ = new §_-i5§("",this.view.x + 528,this.view.y + 39,this.style);
         this.view.addChild(this.§_-9t§);
         this.§_-931§ = 0;
         var _loc4_:ImageIconCoins = new ImageIconCoins();
         _loc4_.x = this.view.x + 649;
         _loc4_.y = this.view.y + 41;
         this.view.addChild(_loc4_);
         this.§_-i1E§ = new §_-i5§("",this.view.x + 669,this.view.y + 39,this.style);
         this.view.addChild(this.§_-i1E§);
         this.§_-Ev§ = 0;
         this.§_-Sl§ = new §_-G2V§();
         this.§_-v1s§ = new §_-J2Y§();
         this.§_-v1s§.x = 25;
         this.§_-v1s§.y = 25;
         this.§_-v1s§.setData(this.§_-Sl§);
         (this.view as ClanRoomView).privateRooms.addChild(this.§_-v1s§);
         this.§_-T1H§ = new §_-i5§(gls("У клана ещё нет своих районов.\nВы можете купить их."),35,40,new TextFormat(§_-i5§.§_-c10§,14,6700045,true));
         (this.view as ClanRoomView).privateRooms.addChild(this.§_-T1H§);
         (this.view as ClanRoomView).privateRooms.roomRefreshButton.addEventListener(MouseEvent.CLICK,this.§_-L1E§);
         new §_-kr§((this.view as ClanRoomView).privateRooms.roomRefreshButton,gls("Обновить список частных районов"));
         (this.view as ClanRoomView).privateRooms.roomBuyButton.addEventListener(MouseEvent.CLICK,this.§_-l2Q§);
         new §_-kr§((this.view as ClanRoomView).privateRooms.roomBuyButton,gls("Купить частный район"));
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,0);
         this.§_-YA§ = new §_-72U§("",0,0,290,195,_loc5_,_loc5_,339);
         this.§_-YA§.type = TextFieldType.DYNAMIC;
         this.§_-YA§.selectable = true;
         this.§_-YA§.background = false;
         this.§_-YA§.border = false;
         this.§_-YA§.multiline = true;
         this.§_-YA§.wordWrap = true;
         this.§_-YA§.maxChars = 1024;
         var _loc6_:§_-K2G§ = new §_-K2G§(gls("Отправить"));
         _loc6_.x = this.view.x + 768;
         _loc6_.y = this.view.y + 458;
         _loc6_.scaleX = _loc6_.scaleY = 0.7;
         addChild(_loc6_);
         var _loc7_:TextField = new TextField();
         _loc7_.x = 540;
         _loc7_.y = 458;
         _loc7_.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,13,0);
         _loc7_.selectable = true;
         _loc7_.type = TextFieldType.INPUT;
         _loc7_.width = 215;
         _loc7_.height = 18;
         this.view.addChild(_loc7_);
         this.§_-Ri§ = new §_-A2e§(_loc7_,this.view.chatInputBG,_loc6_,new Rectangle(603,340,305,155),this.view.ChatBG,this.§_-YA§);
         (this.§_-Ri§ as §_-A2e§).add(new §_-E1S§());
         (this.§_-Ri§ as §_-A2e§).add(new §_-1t§());
         addChild(this.§_-Ri§);
      }
      
      private function §_-31U§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_.id != this.§_-31V§)
         {
            return;
         }
         this.§_-dK§ = _loc2_;
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.§_-Jx§)
         {
            return;
         }
         this.§_-b19§ = _loc2_;
         this.§_-W2t§ = this.§_-b19§.§_-W2t§;
         this.§_-62Z§ = this.§_-b19§.state;
         this.§_-931§ = this.§_-b19§.acorns;
         this.§_-Ev§ = this.§_-b19§.coins;
         this.§_-l13§(Game.selfId == this.§_-W2t§);
         this.§_-Y1c§.load(param1.§_-b19§.§_-51L§);
         §_-L2J§.§_-CS§(this.§_-E2W§,_loc2_.name,204,false,true,_loc2_.id);
         §_-L2J§.§_-CS§(this.§_-G2I§,"<body><a class=\'blackSmall\' href=\'event:" + _loc2_.id + "\'>ID: " + String(_loc2_.id) + "</a></body>",150,true,true,_loc2_.id);
         if(this.§_-b19§.exp >= this.§_-b19§.§_-034§ && (this.§_-b19§.exp != 0 && this.§_-b19§.§_-034§ != 0) && this.§_-b19§.state != §_-u1O§.§_-W1d§ && this.§_-b19§.level != §_-F2Y§.MAX_LEVEL)
         {
            §_-B2U§.request(this.§_-b19§.id,§_-eT§.§_-03H§ | §_-eT§.§_-LS§,true);
         }
         (this.§_-11§ as §_-q2z§).setData(_loc2_.exp,_loc2_.level,_loc2_.§_-034§,_loc2_.§_-q1B§,§_-F2Y§.§_-L2C§(_loc2_.level));
         this.§_-nD§(_loc2_.size,§_-F2Y§.§_-UZ§(_loc2_.level) + _loc2_.places);
         (this.§_-v2b§ as §_-v2R§).§_-75§(_loc2_.places);
         (this.§_-Af§ as §_-x1R§).§_-4j§(_loc2_);
         this.§_-L1E§();
         if(this.§_-YA§.type == TextFieldType.DYNAMIC)
         {
            this.§_-YA§.text = _loc2_.news;
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Vector.<Object> = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-P2m§:
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
               (this.§_-Sl§ as §_-G2V§).§_-j1a§(_loc2_);
               (this.§_-v1s§ as §_-J2Y§).§_-M28§();
               this.§_-T1H§.visible = (this.§_-Sl§ as §_-G2V§).§_-s2k§.length < 1;
               break;
            case §_-s2l§.BUY:
               switch(param1[2])
               {
                  case §_-u1O§.§_-Y2X§:
                     if(param1[0] != §_-s2l§.§_-v1E§)
                     {
                        break;
                     }
                     (this.§_-Sl§ as §_-G2V§).§_-p2O§({
                        "id":param1[6],
                        "type":param1[5] >> 8,
                        "count":0,
                        "modes":0
                     });
                     (this.§_-v1s§ as §_-J2Y§).§_-M28§();
                     this.§_-T1H§.visible = (this.§_-Sl§ as §_-G2V§).§_-s2k§.length < 1;
                     if(param1[1] == Game.selfId && Boolean(this.§_-c1k§))
                     {
                        this.§_-c1k§.hide();
                     }
                     this.§_-L1E§();
                     break;
                  case §_-u1O§.§_-S5§:
                     if(param1[0] != §_-s2l§.§_-v1E§)
                     {
                        break;
                     }
                     this.§_-b19§.places += §_-v2R§.§_-K2§;
                     this.§_-nD§(this.§_-b19§.size,§_-F2Y§.§_-UZ§(this.§_-b19§.level) + this.§_-b19§.places);
                     (this.§_-v2b§ as §_-v2R§).§_-75§(this.§_-b19§.places);
               }
               break;
            case §_-s2l§.§_-vf§:
               if(!this.§_-L2§(param1[1]))
               {
                  return;
               }
               switch(param1[0])
               {
                  case §_-s2l§.§_-i27§:
                     new §_-Fk§(gls("Частный район"),gls("Время комнаты истекло."),false,null,180).show();
                  case §_-s2l§.§_-O1d§:
                     this.§_-g2R§(param1[1]);
                     break;
                  case §_-s2l§.§_-c2q§:
                     new §_-Fk§(gls("Частный район"),gls("В комнате нет мест."),false,null,150).show();
                     this.§_-L1E§();
                     break;
                  case §_-s2l§.§_-n2q§:
               }
         }
      }
      
      private function set §_-62Z§(param1:int) : void
      {
         (this.view as ClanRoomView).requestButton.enabled = (this.view as ClanRoomView).requestButton.mouseEnabled = param1 != §_-s2l§.§_-F2E§;
         this.§_-Af§.visible = param1 == §_-s2l§.§_-YU§;
         this.§_-ZI§.text = "";
         if(param1 == §_-s2l§.§_-M3§ && this.§_-b19§.size > §_-F2Y§.§_-UZ§(this.§_-b19§.level) + this.§_-b19§.places)
         {
            this.§_-ZI§.text = gls("Лимит на размер\nклана превышен.\nКлану заблокирован\nдоступ к тотемам\nи получению опыта.");
         }
         if(param1 == §_-s2l§.§_-M3§ && this.§_-b19§.acorns < 0)
         {
            this.§_-ZI§.text = gls("ВНИМАНИЕ!\nВаш клан заблокирован за\nнеуплату. Погасите долг,\nчтобы разблокировать клан.\n\n\n\t\t\t\t\tАдминистрация");
         }
         if(param1 == §_-s2l§.§_-F2E§)
         {
            this.§_-ZI§.text = gls("ВНИМАНИЕ!\nВаш клан заблокирован за\nнарушение правил поведения.\n\t\t\tАдминистрация");
         }
         this.§_-73V§.visible = this.§_-ZI§.text != "";
         this.§_-v1s§.mouseEnabled = this.§_-v1s§.mouseChildren = param1 != §_-s2l§.§_-F2E§;
         this.§_-v1s§.filters = (this.view as ClanRoomView).requestButton.filters = param1 != §_-s2l§.§_-F2E§ ? [] : §_-y1l§.§_-Tk§;
         (this.view as ClanRoomView).privateRooms.mouseEnabled = (this.view as ClanRoomView).privateRooms.mouseChildren = param1 != §_-s2l§.§_-F2E§;
         (this.view as ClanRoomView).privateRooms.filters = param1 != §_-s2l§.§_-F2E§ ? [] : §_-y1l§.§_-Tk§;
      }
      
      private function §_-m1M§(param1:Event) : void
      {
         new §_-hC§().show();
      }
      
      private function §_-l13§(param1:Boolean) : void
      {
         if(this.§_-c1k§ == null)
         {
            this.§_-c1k§ = new §_-l4§();
         }
         (this.§_-Ri§ as §_-A2e§).§_-a2s§ = param1;
         (this.view as ClanRoomView).requestButton.visible = param1 || Game.self["clan_duty"] == Clan.§_-HJ§;
         (this.view as ClanRoomView).closeClanButton.visible = param1;
         (this.view as ClanRoomView).retireButton.visible = !param1;
         (this.view as ClanRoomView).buttonInfo.visible = param1 || Game.self["clan_duty"] == Clan.§_-HJ§;
         (this.§_-Ri§ as §_-A2e§).§_-330§(param1 || Game.self["clan_duty"] == Clan.§_-HJ§);
         (this.§_-Ri§ as §_-A2e§).§_-Yq§(param1 || Game.self["clan_duty"] == Clan.§_-HJ§);
         this.§_-02m§.visible = param1;
         this.§_-G2I§.visible = param1 || Game.self["clan_duty"] == Clan.§_-HJ§;
         (this.view as ClanRoomView).clanEmblem.mouseEnabled = param1;
         (this.§_-Af§ as §_-x1R§).§_-l13§(param1 || Game.self["clan_duty"] == Clan.§_-HJ§);
         if(param1)
         {
            (this.view as ClanRoomView).clanEmblem.addEventListener(MouseEvent.CLICK,this.§_-82s§);
            new §_-kr§((this.view as ClanRoomView).clanEmblem,gls("Изменить данные"));
         }
         this.§_-YA§.text = StringUtil.§_-Sv§(this.§_-YA§.text);
         this.§_-YA§.text = StringUtil.§_-U2s§(this.§_-YA§.text);
         if(§_-B2U§.§_-Z2Y§ == null || §_-B2U§.§_-Z2Y§ == this.§_-YA§.text)
         {
            return;
         }
         if(Game.self["clan_duty"] != Clan.§_-01X§ && Game.self["clan_duty"] != Clan.§_-HJ§)
         {
            this.§_-YA§.text = §_-B2U§.§_-Z2Y§;
         }
         else if(this.§_-YA§.textHeight > 148)
         {
            this.§_-YA§.text = §_-B2U§.§_-Z2Y§;
         }
      }
      
      private function §_-H1§(param1:MouseEvent) : void
      {
         if(Game.self["clan_duty"] != Clan.§_-01X§ && Game.self["clan_duty"] != Clan.§_-HJ§)
         {
            return;
         }
         this.§_-v2b§.show();
      }
      
      private function §_-13D§(param1:§_-s1d§) : void
      {
         (this.§_-h2y§ as §_-A3c§).§_-B1K§ = param1.count;
         this.§_-h2y§.visible = (this.§_-h2y§ as §_-A3c§).§_-B1K§ > 0;
         this.§_-12V§ = param1.count;
      }
      
      private function §_-tp§(param1:MouseEvent) : void
      {
         this.§_-L17§.show();
      }
      
      private function §_-l2Q§(param1:MouseEvent = null) : void
      {
         if(this.§_-c1k§ == null)
         {
            return;
         }
         this.§_-c1k§.show();
      }
      
      private function §_-A3Q§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-W1d§);
      }
      
      private function §_-Fn§(param1:MouseEvent) : void
      {
         this.§_-8a§.show();
      }
      
      private function §_-Df§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-A1p§);
      }
      
      private function §_-82s§(param1:MouseEvent) : void
      {
         (this.§_-E2F§ as §_-A3N§).id = this.clanId;
         this.§_-E2F§.show();
      }
      
      private function §_-L1E§(param1:MouseEvent = null) : void
      {
         var _loc2_:Number = new Date().getTime();
         if((this.§_-Sl§ as §_-G2V§).§_-s2k§ == null)
         {
            this.§_-x2F§ = _loc2_;
            Connection.§_-e2T§(§_-u1O§.§_-41a§);
         }
         if(this.clanId == 0 || !(§_-t2c§.active is §_-P1w§) || Game.self["clan_id"] == 0)
         {
            return;
         }
         if(§_-B2U§.§_-Q2g§(Game.self["clan_id"]).state != §_-s2l§.§_-YU§)
         {
            return;
         }
         if(Math.abs(_loc2_ - this.§_-x2F§) < §_-3a§)
         {
            return;
         }
         this.§_-x2F§ = _loc2_;
         Connection.§_-e2T§(§_-u1O§.§_-41a§);
      }
      
      private function §_-L2§(param1:int) : Boolean
      {
         return (this.§_-Sl§ as §_-G2V§).§_-435§(param1);
      }
      
      private function §_-g2R§(param1:int) : void
      {
         (this.§_-Sl§ as §_-G2V§).§_-A33§(param1);
         this.§_-T1H§.visible = (this.§_-Sl§ as §_-G2V§).§_-s2k§.length < 1;
      }
      
      private function §_-81z§(param1:MouseEvent) : void
      {
         this.§_-t13§.show();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         this.§_-I2t§.visible = param1;
      }
   }
}


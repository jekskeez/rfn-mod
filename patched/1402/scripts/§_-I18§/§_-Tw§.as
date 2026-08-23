package §_-I18§
{
   import §_-E1v§.§_-31Y§;
   import §_-S1n§.§_-kr§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-XW§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import buttons.§_-K2G§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.§_-a1V§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   import utils.§_-33I§;
   import utils.§_-L2J§;
   import utils.§_-S1m§;
   import views.§_-236§;
   import views.§_-j1o§;
   
   public class §_-Tw§ extends Dialog
   {
      
      private static const WIDTH:int = 210;
      
      private static const §_-t2B§:int = 220;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","}","a {","color: #017ACC;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}",".a2 {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 11px;","color: #000000;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","text-align: center;","}",".a2:hover {","text-decoration: underline;","}",".black {","color: #000000;","text-align: center;","font-weight: regular;","}"].join("\n");
      
      private static var _instance:§_-Tw§ = null;
      
      private var §_-hK§:§_-Fk§ = null;
      
      private var §_-21w§:§_-Fk§ = null;
      
      private var §_-8a§:§_-Fk§ = null;
      
      private var §_-EC§:§_-i5§ = null;
      
      private var §_-Y1S§:§_-i5§ = null;
      
      private var §_-c2x§:§_-i5§ = null;
      
      private var §_-r2l§:§_-i5§ = null;
      
      private var §_-Rf§:§_-i5§ = null;
      
      private var §_-IR§:§_-i5§ = null;
      
      private var §_-w§:§_-i5§ = null;
      
      private var clanId:int = 0;
      
      private var §_-W2t§:int = 0;
      
      private var photo:§_-236§ = null;
      
      private var §_-62q§:§_-j1o§ = null;
      
      private var §_-LM§:§_-kr§ = null;
      
      private var §_-I25§:§_-K2G§ = null;
      
      private var §_-f2S§:§_-K2G§ = null;
      
      private var §_-b24§:§_-K2G§ = null;
      
      private var §_-y2H§:Sprite;
      
      public function §_-Tw§()
      {
         super();
         this.init();
         §_-B2U§.listen(this.onClanLoaded);
         Game.listen(this.§_-Y16§);
      }
      
      public static function show(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new §_-Tw§();
         }
         var _loc2_:Boolean = §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§;
         var _loc3_:Boolean = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§);
         var _loc4_:Boolean = !_loc2_ || Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-01X§;
         if(_loc3_)
         {
            _instance.height = §_-t2B§;
         }
         else
         {
            _instance.height = _loc4_ ? 171 : 211;
         }
         _instance.clear();
         _instance.place();
         _instance.clanId = param1;
         §_-B2U§.request(param1,§_-eT§.ALL,true);
         _instance.show();
      }
      
      override public function clear() : void
      {
         super.clear();
         this.photo.reset();
         this.§_-EC§.text = "";
         this.§_-Y1S§.text = "";
         this.§_-c2x§.text = "";
         this.§_-r2l§.htmlText = "";
         this.§_-Rf§.htmlText = "";
         this.§_-W2t§ = 0;
         this.§_-I25§.visible = false;
         this.§_-f2S§.visible = false;
         this.§_-b24§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-hK§ = new §_-Fk§(gls("Ты уже в клане"),gls("Чтобы подать заявку в этот клан, ты должен выйти из своего."));
         this.§_-21w§ = new §_-Fk§(gls("Попроситься в клан"),gls("Ты уверен, что хочешь\nподать заявку на вступление в клан?"),true,this.§_-11e§);
         this.§_-8a§ = new §_-Fk§(gls("Покинуть клан"),gls("Ты уверен, что хочешь\nвыйти из клана?"),true,this.§_-Df§);
         this.clanId = -1;
         this.photo = new §_-236§("",0,56);
         this.photo.x = int((WIDTH - 50) * 0.5);
         this.photo.mouseEnabled = false;
         this.photo.mouseChildren = false;
         addChild(this.photo);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,6700045,true);
         _loc2_.align = TextFormatAlign.CENTER;
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,0,true);
         _loc3_.align = TextFormatAlign.CENTER;
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,0,true);
         _loc4_.align = TextFormatAlign.CENTER;
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,1538859,true);
         _loc5_.align = TextFormatAlign.CENTER;
         this.§_-EC§ = new §_-i5§("",0,3,_loc2_);
         this.§_-EC§.width = WIDTH;
         this.§_-EC§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-EC§);
         this.§_-Y1S§ = new §_-i5§("",0,19,_loc1_);
         this.§_-Y1S§.width = WIDTH;
         this.§_-Y1S§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-Y1S§.addEventListener(MouseEvent.CLICK,Game.§_-036§);
         addChild(this.§_-Y1S§);
         new §_-kr§(this.§_-Y1S§,gls("Нажми, чтобы скопировать в буфер обмена."));
         this.§_-c2x§ = new §_-i5§("",0,38,_loc5_);
         this.§_-c2x§.width = WIDTH;
         this.§_-c2x§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-c2x§);
         this.§_-y2H§ = new Sprite();
         this.§_-y2H§.y = 109;
         addChild(this.§_-y2H§);
         this.§_-y2H§.addChild(new §_-i5§(gls("<body><span class=\'black\'><b>Вождь:</b></body>"),0,0,_loc1_));
         this.§_-r2l§ = new §_-i5§("",54,0,_loc1_);
         this.§_-r2l§.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         this.§_-y2H§.addChild(this.§_-r2l§);
         this.§_-y2H§.x = int((WIDTH - this.§_-y2H§.width) * 0.5);
         this.§_-Rf§ = new §_-i5§("",0,125,_loc1_);
         this.§_-Rf§.width = WIDTH;
         this.§_-Rf§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-Rf§);
         this.§_-IR§ = new §_-i5§(gls("Заявка отправлена"),0,171,_loc3_);
         this.§_-IR§.width = WIDTH;
         this.§_-IR§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-IR§);
         this.§_-w§ = new §_-i5§(gls("Чтобы вступить в этот клан, ты должен выйти из своего."),0,156,_loc4_);
         this.§_-w§.width = WIDTH;
         this.§_-w§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-w§.multiline = true;
         this.§_-w§.wordWrap = true;
         addChild(this.§_-w§);
         this.§_-I25§ = new §_-K2G§(gls("Подать заявку"));
         this.§_-I25§.x = int((WIDTH - this.§_-I25§.width) * 0.5);
         this.§_-I25§.y = 151;
         this.§_-I25§.addEventListener(MouseEvent.CLICK,this.§_-fT§);
         addChild(this.§_-I25§);
         this.§_-f2S§ = new §_-K2G§(gls("Выйти из клана"));
         this.§_-f2S§.x = 6 + (WIDTH - this.§_-f2S§.width) * 0.5;
         this.§_-f2S§.y = 149;
         this.§_-f2S§.addEventListener(MouseEvent.CLICK,this.§_-i1Z§);
         addChild(this.§_-f2S§);
         this.§_-b24§ = new §_-K2G§(gls("Редактировать"));
         this.§_-b24§.x = 6 + (WIDTH - this.§_-b24§.width) * 0.5;
         this.§_-b24§.y = 175;
         this.§_-b24§.addEventListener(MouseEvent.CLICK,this.§_-61A§);
         this.§_-b24§.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§);
         addChild(this.§_-b24§);
         place();
      }
      
      private function §_-i1Z§(param1:MouseEvent) : void
      {
         this.§_-8a§.show();
      }
      
      private function §_-61A§(param1:MouseEvent) : void
      {
         if(!§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§))
         {
            return;
         }
         if(this.clanId <= 0)
         {
            return;
         }
         §_-31Y§.§_-f2C§(this.clanId);
      }
      
      private function §_-fT§(param1:MouseEvent) : void
      {
         this.§_-21w§.show();
      }
      
      private function §_-11e§() : void
      {
         if(Game.self["clan_id"] != 0)
         {
            this.§_-hK§.show();
            return;
         }
         Game.§_-KO§ = this.clanId;
         this.§_-I25§.visible = false;
         §_-B2U§.request(this.clanId,§_-eT§.ALL,true);
         Connection.§_-e2T§(§_-u1O§.§_-nH§,this.clanId);
      }
      
      private function §_-Df§() : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-A1p§);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(param1.target.name);
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         var _loc7_:String = null;
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         this.photo.load(_loc2_.§_-51L§);
         var _loc3_:Boolean = §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§;
         var _loc4_:Boolean = _loc2_.blacklist.indexOf(Game.selfId) != -1;
         var _loc5_:Boolean = §_-LZ§.§_-mA§ < _loc2_.§_-B1D§;
         this.§_-I25§.visible = !_loc4_ && !_loc5_ && _loc3_ && Game.§_-KO§ != this.clanId && Game.self["clan_id"] == 0 && (_loc2_.state == §_-s2l§.§_-YU§ || _loc2_.state == §_-s2l§.§_-M3§);
         this.§_-f2S§.visible = _loc3_ && _loc2_.id == Game.self["clan_id"] && Game.self["clan_duty"] != Clan.§_-01X§;
         this.§_-IR§.visible = _loc3_ && !this.§_-f2S§.visible && Game.self["clan_duty"] != Clan.§_-01X§ && (_loc4_ || _loc5_ || _loc2_.state != §_-s2l§.§_-YU§ && _loc2_.state != §_-s2l§.§_-M3§) || Game.§_-KO§ == this.clanId && Game.self["clan_id"] == 0;
         if(this.§_-IR§.visible)
         {
            this.height = this.§_-b24§.visible ? 260 : 251;
            _loc7_ = "";
            if(_loc2_.state == §_-s2l§.§_-s2b§)
            {
               _loc7_ = gls("Клан закрыт");
            }
            else if(_loc2_.state == §_-s2l§.§_-F2E§)
            {
               _loc7_ = gls("Клан заблокирован");
            }
            else
            {
               _loc7_ = gls("Заявка отправлена");
            }
            if(_loc4_)
            {
               this.§_-IR§.text = gls("Вы не можете подать заявку в\nданный клан, так как вы\nв черном списке этого клана");
            }
            else if(_loc5_)
            {
               this.§_-IR§.text = gls("Для вступления в клан\nнеобходим {0} уровень",_loc2_.§_-B1D§);
            }
            else
            {
               this.§_-IR§.text = _loc7_;
            }
         }
         else if(this.§_-b24§.visible && this.height < §_-t2B§)
         {
            this.height = §_-t2B§;
         }
         this.§_-w§.visible = !this.§_-IR§.visible && (_loc3_ && _loc2_.id != Game.self["clan_id"] && Game.self["clan_id"] != 0 && Game.self["clan_duty"] != Clan.§_-01X§ && _loc2_.state != §_-s2l§.§_-s2b§ && _loc2_.state == §_-s2l§.§_-YU§);
         §_-L2J§.§_-CS§(this.§_-EC§,_loc2_.name,208,false,true,this.§_-W2t§);
         §_-L2J§.§_-CS§(this.§_-Y1S§,"<body><a class=\'a2\'>ID: " + String(_loc2_.id) + "</a><body>",208,true,true,_loc2_.id);
         this.§_-Y1S§.visible = Boolean(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) || _loc2_.id == Game.self["clan_id"] && Game.self["clan_duty"] >= Clan.§_-01X§);
         if(this.clanId == Game.self["clan_id"])
         {
            this.league = §_-82O§.§_-a15§(§_-82O§.CLAN_TYPE);
         }
         else
         {
            this.league = §_-82O§.§_-h1C§(_loc2_.§_-u2q§,§_-82O§.CLAN_TYPE);
         }
         var _loc6_:int = §_-82O§.§_-3S§(this.clanId,§_-82O§.CLAN_TYPE);
         if(_loc6_ != -1)
         {
            this.§_-c2x§.text = gls("{0}{1} место в ТОП-100",_loc6_,_loc6_ % 10 == 3 ? gls("-e") : gls("-ое"));
         }
         this.§_-Rf§.htmlText = gls("<body><span class=\'black\'>В клане <b>{0}</b> {1}</span><body>",_loc2_.size,StringUtil.word("белка",_loc2_.size));
         if(this.§_-W2t§ == _loc2_.§_-W2t§)
         {
            return;
         }
         this.§_-W2t§ = _loc2_.§_-W2t§;
         Game.request(this.§_-W2t§,§_-Y2E§.§_-n2H§ | §_-Y2E§.§_-rC§ | §_-Y2E§.§_-L1b§);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_["id"] != this.§_-W2t§)
         {
            return;
         }
         this.§_-r2l§.name = this.§_-W2t§.toString();
         §_-S1m§.§_-hB§(this.§_-r2l§,_loc2_,240,true,this.§_-W2t§ != Game.selfId);
         this.§_-y2H§.x = int((WIDTH - this.§_-y2H§.width) * 0.5);
      }
      
      private function set league(param1:int) : void
      {
         if(!this.§_-62q§)
         {
            this.§_-62q§ = new §_-j1o§(this.clanId,§_-82O§.CLAN_TYPE,1,true,true);
            addChild(this.§_-62q§);
         }
         this.§_-62q§.league = param1;
         this.§_-62q§.x = 6 + (this.width - this.§_-62q§.width) * 0.5;
         this.§_-62q§.y = (this.§_-EC§.y - this.§_-62q§.height - 5) * 0.5;
         this.§_-LM§ = new §_-kr§(this.§_-62q§,gls("Лига: ") + §_-93H§.§_-XY§(Math.max(0,param1),§_-82O§.CLAN_TYPE));
      }
   }
}


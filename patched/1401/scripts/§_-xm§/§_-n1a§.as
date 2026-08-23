package §_-xm§
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-d2x§;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import §_-l26§.§_-MZ§;
   import buttons.§_-j18§;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.§_-n13§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.StringUtil;
   import utils.§_-Y1S§;
   import utils.§_-c10§;
   import utils.§_-vo§;
   import views.§_-914§;
   import views.§_-F1z§;
   
   public class §_-n1a§ extends Dialog
   {
      
      private static const WIDTH:int = 210;
      
      private static const §_-62i§:int = 220;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","}","a {","color: #017ACC;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}",".a2 {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 11px;","color: #000000;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","text-align: center;","}",".a2:hover {","text-decoration: underline;","}",".black {","color: #000000;","text-align: center;","font-weight: regular;","}"].join("\n");
      
      private static var _instance:§_-n1a§ = null;
      
      private var §_-u2V§:§_-Q13§ = null;
      
      private var §_-o2I§:§_-Q13§ = null;
      
      private var §_-Ju§:§_-Q13§ = null;
      
      private var §_-V2v§:§_-22V§ = null;
      
      private var §_-O1H§:§_-22V§ = null;
      
      private var §_-p2r§:§_-22V§ = null;
      
      private var §_-P2P§:§_-22V§ = null;
      
      private var §_-P1§:§_-22V§ = null;
      
      private var §_-r1B§:§_-22V§ = null;
      
      private var §_-N1S§:§_-22V§ = null;
      
      private var clanId:int = 0;
      
      private var §_-R2z§:int = 0;
      
      private var photo:§_-F1z§ = null;
      
      private var §_-Z25§:§_-914§ = null;
      
      private var §_-32m§:§_-Hb§ = null;
      
      private var §_-T2H§:§_-j18§ = null;
      
      private var §_-LS§:§_-j18§ = null;
      
      private var §_-jV§:§_-j18§ = null;
      
      private var §_-o1C§:Sprite;
      
      public function §_-n1a§()
      {
         super();
         this.init();
         §_-e2W§.listen(this.onClanLoaded);
         Game.listen(this.§_-P9§);
      }
      
      public static function show(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new §_-n1a§();
         }
         var _loc2_:Boolean = §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§;
         var _loc3_:Boolean = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§);
         var _loc4_:Boolean = !_loc2_ || Game.self["clan_id"] != 0 && Game.self["clan_duty"] == Clan.§_-k1P§;
         if(_loc3_)
         {
            _instance.height = §_-62i§;
         }
         else
         {
            _instance.height = _loc4_ ? 171 : 211;
         }
         _instance.clear();
         _instance.place();
         _instance.clanId = param1;
         §_-e2W§.request(param1,§_-Oy§.ALL,true);
         _instance.show();
      }
      
      override public function clear() : void
      {
         super.clear();
         this.photo.reset();
         this.§_-V2v§.text = "";
         this.§_-O1H§.text = "";
         this.§_-p2r§.text = "";
         this.§_-P2P§.htmlText = "";
         this.§_-P1§.htmlText = "";
         this.§_-R2z§ = 0;
         this.§_-T2H§.visible = false;
         this.§_-LS§.visible = false;
         this.§_-jV§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-u2V§ = new §_-Q13§(gls("Ты уже в клане"),gls("Чтобы подать заявку в этот клан, ты должен выйти из своего."));
         this.§_-o2I§ = new §_-Q13§(gls("Попроситься в клан"),gls("Ты уверен, что хочешь\nподать заявку на вступление в клан?"),true,this.§_-d1a§);
         this.§_-Ju§ = new §_-Q13§(gls("Покинуть клан"),gls("Ты уверен, что хочешь\nвыйти из клана?"),true,this.§_-w2J§);
         this.clanId = -1;
         this.photo = new §_-F1z§("",0,56);
         this.photo.x = int((WIDTH - 50) * 0.5);
         this.photo.mouseEnabled = false;
         this.photo.mouseChildren = false;
         addChild(this.photo);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,6700045,true);
         _loc2_.align = TextFormatAlign.CENTER;
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,0,true);
         _loc3_.align = TextFormatAlign.CENTER;
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,0,true);
         _loc4_.align = TextFormatAlign.CENTER;
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,1538859,true);
         _loc5_.align = TextFormatAlign.CENTER;
         this.§_-V2v§ = new §_-22V§("",0,3,_loc2_);
         this.§_-V2v§.width = WIDTH;
         this.§_-V2v§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-V2v§);
         this.§_-O1H§ = new §_-22V§("",0,19,_loc1_);
         this.§_-O1H§.width = WIDTH;
         this.§_-O1H§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-O1H§.addEventListener(MouseEvent.CLICK,Game.§_-S1F§);
         addChild(this.§_-O1H§);
         new §_-Hb§(this.§_-O1H§,gls("Нажми, чтобы скопировать в буфер обмена."));
         this.§_-p2r§ = new §_-22V§("",0,38,_loc5_);
         this.§_-p2r§.width = WIDTH;
         this.§_-p2r§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-p2r§);
         this.§_-o1C§ = new Sprite();
         this.§_-o1C§.y = 109;
         addChild(this.§_-o1C§);
         this.§_-o1C§.addChild(new §_-22V§(gls("<body><span class=\'black\'><b>Вождь:</b></body>"),0,0,_loc1_));
         this.§_-P2P§ = new §_-22V§("",54,0,_loc1_);
         this.§_-P2P§.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         this.§_-o1C§.addChild(this.§_-P2P§);
         this.§_-o1C§.x = int((WIDTH - this.§_-o1C§.width) * 0.5);
         this.§_-P1§ = new §_-22V§("",0,125,_loc1_);
         this.§_-P1§.width = WIDTH;
         this.§_-P1§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-P1§);
         this.§_-r1B§ = new §_-22V§(gls("Заявка отправлена"),0,171,_loc3_);
         this.§_-r1B§.width = WIDTH;
         this.§_-r1B§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-r1B§);
         this.§_-N1S§ = new §_-22V§(gls("Чтобы вступить в этот клан, ты должен выйти из своего."),0,156,_loc4_);
         this.§_-N1S§.width = WIDTH;
         this.§_-N1S§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-N1S§.multiline = true;
         this.§_-N1S§.wordWrap = true;
         addChild(this.§_-N1S§);
         this.§_-T2H§ = new §_-j18§(gls("Подать заявку"));
         this.§_-T2H§.x = int((WIDTH - this.§_-T2H§.width) * 0.5);
         this.§_-T2H§.y = 151;
         this.§_-T2H§.addEventListener(MouseEvent.CLICK,this.§_-Ug§);
         addChild(this.§_-T2H§);
         this.§_-LS§ = new §_-j18§(gls("Выйти из клана"));
         this.§_-LS§.x = 6 + (WIDTH - this.§_-LS§.width) * 0.5;
         this.§_-LS§.y = 149;
         this.§_-LS§.addEventListener(MouseEvent.CLICK,this.§_-92P§);
         addChild(this.§_-LS§);
         this.§_-jV§ = new §_-j18§(gls("Редактировать"));
         this.§_-jV§.x = 6 + (WIDTH - this.§_-jV§.width) * 0.5;
         this.§_-jV§.y = 175;
         this.§_-jV§.addEventListener(MouseEvent.CLICK,this.§_-V2z§);
         this.§_-jV§.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§);
         addChild(this.§_-jV§);
         place();
      }
      
      private function §_-92P§(param1:MouseEvent) : void
      {
         this.§_-Ju§.show();
      }
      
      private function §_-V2z§(param1:MouseEvent) : void
      {
         if(!§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§))
         {
            return;
         }
         if(this.clanId <= 0)
         {
            return;
         }
         §_-MZ§.§_-b2§(this.clanId);
      }
      
      private function §_-Ug§(param1:MouseEvent) : void
      {
         this.§_-o2I§.show();
      }
      
      private function §_-d1a§() : void
      {
         if(Game.self["clan_id"] != 0)
         {
            this.§_-u2V§.show();
            return;
         }
         Game.§_-qZ§ = this.clanId;
         this.§_-T2H§.visible = false;
         §_-e2W§.request(this.clanId,§_-Oy§.ALL,true);
         Connection.§_-Li§(§_-h2B§.§_-t2k§,this.clanId);
      }
      
      private function §_-w2J§() : void
      {
         Connection.§_-Li§(§_-h2B§.§_-J2A§);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(param1.target.name);
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         var _loc7_:String = null;
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         this.photo.load(_loc2_.§_-cy§);
         var _loc3_:Boolean = §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§;
         var _loc4_:Boolean = _loc2_.blacklist.indexOf(Game.selfId) != -1;
         var _loc5_:Boolean = §_-d2x§.§_-z2o§ < _loc2_.§_-xy§;
         this.§_-T2H§.visible = !_loc4_ && !_loc5_ && _loc3_ && Game.§_-qZ§ != this.clanId && Game.self["clan_id"] == 0 && (_loc2_.state == §_-S2I§.§_-Wr§ || _loc2_.state == §_-S2I§.§_-13l§);
         this.§_-LS§.visible = _loc3_ && _loc2_.id == Game.self["clan_id"] && Game.self["clan_duty"] != Clan.§_-k1P§;
         this.§_-r1B§.visible = _loc3_ && !this.§_-LS§.visible && Game.self["clan_duty"] != Clan.§_-k1P§ && (_loc4_ || _loc5_ || _loc2_.state != §_-S2I§.§_-Wr§ && _loc2_.state != §_-S2I§.§_-13l§) || Game.§_-qZ§ == this.clanId && Game.self["clan_id"] == 0;
         if(this.§_-r1B§.visible)
         {
            this.height = this.§_-jV§.visible ? 260 : 251;
            _loc7_ = "";
            if(_loc2_.state == §_-S2I§.§_-N1b§)
            {
               _loc7_ = gls("Клан закрыт");
            }
            else if(_loc2_.state == §_-S2I§.§_-F2Q§)
            {
               _loc7_ = gls("Клан заблокирован");
            }
            else
            {
               _loc7_ = gls("Заявка отправлена");
            }
            if(_loc4_)
            {
               this.§_-r1B§.text = gls("Вы не можете подать заявку в\nданный клан, так как вы\nв черном списке этого клана");
            }
            else if(_loc5_)
            {
               this.§_-r1B§.text = gls("Для вступления в клан\nнеобходим {0} уровень",_loc2_.§_-xy§);
            }
            else
            {
               this.§_-r1B§.text = _loc7_;
            }
         }
         else if(this.§_-jV§.visible && this.height < §_-62i§)
         {
            this.height = §_-62i§;
         }
         this.§_-N1S§.visible = !this.§_-r1B§.visible && (_loc3_ && _loc2_.id != Game.self["clan_id"] && Game.self["clan_id"] != 0 && Game.self["clan_duty"] != Clan.§_-k1P§ && _loc2_.state != §_-S2I§.§_-N1b§ && _loc2_.state == §_-S2I§.§_-Wr§);
         §_-vo§.§_-A2B§(this.§_-V2v§,_loc2_.name,208,false,true,this.§_-R2z§);
         §_-vo§.§_-A2B§(this.§_-O1H§,"<body><a class=\'a2\'>ID: " + String(_loc2_.id) + "</a><body>",208,true,true,_loc2_.id);
         this.§_-O1H§.visible = Boolean(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) || _loc2_.id == Game.self["clan_id"] && Game.self["clan_duty"] >= Clan.§_-k1P§);
         if(this.clanId == Game.self["clan_id"])
         {
            this.league = §_-13r§.§_-DX§(§_-13r§.CLAN_TYPE);
         }
         else
         {
            this.league = §_-13r§.§_-K1M§(_loc2_.§_-t2n§,§_-13r§.CLAN_TYPE);
         }
         var _loc6_:int = §_-13r§.§_-B2w§(this.clanId,§_-13r§.CLAN_TYPE);
         if(_loc6_ != -1)
         {
            this.§_-p2r§.text = gls("{0}{1} место в ТОП-100",_loc6_,_loc6_ % 10 == 3 ? gls("-e") : gls("-ое"));
         }
         this.§_-P1§.htmlText = gls("<body><span class=\'black\'>В клане <b>{0}</b> {1}</span><body>",_loc2_.size,StringUtil.word("белка",_loc2_.size));
         if(this.§_-R2z§ == _loc2_.§_-R2z§)
         {
            return;
         }
         this.§_-R2z§ = _loc2_.§_-R2z§;
         Game.request(this.§_-R2z§,§_-hF§.§_-31q§ | §_-hF§.§_-k2y§ | §_-hF§.§_-329§);
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(_loc2_["id"] != this.§_-R2z§)
         {
            return;
         }
         this.§_-P2P§.name = this.§_-R2z§.toString();
         §_-Y1S§.§_-uc§(this.§_-P2P§,_loc2_,240,true,this.§_-R2z§ != Game.selfId);
         this.§_-o1C§.x = int((WIDTH - this.§_-o1C§.width) * 0.5);
      }
      
      private function set league(param1:int) : void
      {
         if(!this.§_-Z25§)
         {
            this.§_-Z25§ = new §_-914§(this.clanId,§_-13r§.CLAN_TYPE,1,true,true);
            addChild(this.§_-Z25§);
         }
         this.§_-Z25§.league = param1;
         this.§_-Z25§.x = 6 + (this.width - this.§_-Z25§.width) * 0.5;
         this.§_-Z25§.y = (this.§_-V2v§.y - this.§_-Z25§.height - 5) * 0.5;
         this.§_-32m§ = new §_-Hb§(this.§_-Z25§,gls("Лига: ") + §_-8S§.§_-11s§(Math.max(0,param1),§_-13r§.CLAN_TYPE));
      }
   }
}


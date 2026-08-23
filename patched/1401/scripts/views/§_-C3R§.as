package views
{
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-d2x§;
   import §_-T2y§.§_-92z§;
   import §_-Y22§.§_-Mi§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-7O§;
   import buttons.§_-wn§;
   import com.api.Services;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   import utils.§_-x1Z§;
   
   public class §_-C3R§ extends Sprite implements §_-Mi§
   {
      
      private static const §_-oY§:Number = -16;
      
      private static const BUTTON_POSITION_X2:Number = 47;
      
      private static const §_-e2d§:Number = 66;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","}","a {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","}","a:hover {","text-decoration: none;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private static const §_-k2S§:Point = new Point(-23,-80);
      
      private static const §_-Aw§:Point = new Point(56,150);
      
      private static const §_-q1x§:Point = new Point(56,270);
      
      private static const §_-n25§:Point = new Point(56,392);
      
      private static const §_-dF§:Point = new Point(-16,-58);
      
      private static const §_-Og§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,8280118,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private var style:StyleSheet;
      
      private var §_-H1Y§:§_-wn§ = null;
      
      private var §_-H2g§:§_-wn§ = null;
      
      private var §_-5k§:§_-wn§ = null;
      
      private var §_-uO§:§_-wn§ = null;
      
      private var §_-BQ§:§_-wn§ = null;
      
      private var §_-a1p§:§_-wn§ = null;
      
      private var §_-XW§:§_-22V§ = null;
      
      private var §_-i2e§:Number = 0;
      
      private var §_-t1S§:ImageShamanCharacterIcon;
      
      private var §_-M1X§:ImageHareCharacterIcon;
      
      private var §_-93c§:ImageDragonCharacterIcon;
      
      private var §_-Hg§:Sprite = null;
      
      private var §_-n15§:Sprite = null;
      
      private var §_-Ot§:Sprite = null;
      
      private var §_-w1m§:§_-Hb§ = null;
      
      private var §_-uG§:§_-Hb§ = null;
      
      private var §_-Qj§:§_-Hb§ = null;
      
      private var bg:MovieClip = null;
      
      private var modeId:int;
      
      public function §_-C3R§(param1:§_-22V§, param2:MovieClip)
      {
         super();
         this.§_-XW§ = param1;
         this.§_-i2e§ = this.§_-XW§.y;
         this.bg = param2;
         this.init();
         this.§_-33x§(false);
      }
      
      public function set §_-51Y§(param1:String) : void
      {
         this.§_-XW§.text = param1;
         this.§_-XW§.y = this.§_-i2e§ + 25 - this.§_-XW§.textHeight * 0.5;
      }
      
      public function §_-33x§(param1:Boolean) : void
      {
         if(param1)
         {
            Connection.forget(this.§_-o2C§,[§_-S2I§.§_-W1O§,§_-S2I§.BUY]);
         }
         else
         {
            Connection.listen(this.§_-o2C§,[§_-S2I§.§_-W1O§,§_-S2I§.BUY],2);
         }
      }
      
      public function dispose() : void
      {
         if(this.§_-w1m§)
         {
            this.§_-w1m§.remove();
         }
         if(this.§_-Qj§)
         {
            this.§_-Qj§.remove();
         }
         this.§_-33x§(true);
      }
      
      public function update() : void
      {
         this.bg.height = 172 + (this.§_-u21§ ? this.§_-Ot§.height : 0) + (this.§_-u21§ && this.§_-m2e§ ? this.§_-n15§.height : 0);
         this.§_-Hg§.y = §_-Aw§.y;
         this.§_-Ot§.y = this.§_-i1l§ ? §_-q1x§.y : §_-Aw§.y;
         this.§_-n15§.y = this.§_-i1l§ && this.§_-u21§ ? §_-n25§.y : (this.§_-u21§ ? §_-q1x§.y : §_-Aw§.y);
         this.§_-Hg§.visible = this.§_-i1l§;
         this.§_-Ot§.visible = this.§_-u21§;
         this.§_-n15§.visible = this.§_-m2e§;
      }
      
      public function get §_-53a§() : Boolean
      {
         return this.§_-i1l§ || this.§_-m2e§ || this.§_-u21§;
      }
      
      public function set hare(param1:Boolean) : void
      {
         this.§_-5k§.enabled = param1;
         this.§_-5k§.mouseEnabled = param1;
         this.§_-uO§.enabled = param1;
         this.§_-uO§.mouseEnabled = param1;
         this.§_-5k§.filters = this.§_-uO§.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
         this.§_-M1X§.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
      }
      
      public function get hare() : Boolean
      {
         return this.§_-5k§.enabled;
      }
      
      public function set dragon(param1:Boolean) : void
      {
         this.§_-BQ§.enabled = param1 && §_-d2x§.§_-z2o§ >= Game.§_-Z7§;
         this.§_-BQ§.mouseEnabled = param1 && §_-d2x§.§_-z2o§ >= Game.§_-Z7§;
         this.§_-a1p§.enabled = param1 && §_-d2x§.§_-z2o§ >= Game.§_-Z7§;
         this.§_-a1p§.mouseEnabled = param1 && §_-d2x§.§_-z2o§ >= Game.§_-Z7§;
         this.§_-BQ§.filters = this.§_-a1p§.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
         this.§_-93c§.filters = param1 && §_-d2x§.§_-z2o§ >= Game.§_-Z7§ ? [] : §_-x1Z§.§_-c2G§;
      }
      
      public function get dragon() : Boolean
      {
         return this.§_-BQ§.enabled;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         this.§_-H1Y§.enabled = param1;
         this.§_-H1Y§.mouseEnabled = param1;
         this.§_-H2g§.enabled = param1;
         this.§_-H2g§.mouseEnabled = param1;
         this.§_-H1Y§.filters = this.§_-H2g§.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
         this.§_-t1S§.filters = param1 ? [] : §_-x1Z§.§_-c2G§;
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-H1Y§.enabled;
      }
      
      private function §_-Q1v§(param1:Boolean) : void
      {
         this.§_-W1d§(param1 && §_-Bm§.§_-2S§(§_-T2o§.§_-m11§) && §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§);
         this.hare = param1;
         this.dragon = param1;
         if(this.§_-uG§ == null && §_-d2x§.§_-z2o§ < Game.§_-Z7§)
         {
            this.§_-uG§ = new §_-Hb§(this.§_-93c§,gls("<body><b>Недоступно</b><br/>Дракоша доступен с {0} уровня</body>",Game.§_-Z7§),false,true);
         }
         if(Boolean(this.§_-uG§) && §_-d2x§.§_-z2o§ >= Game.§_-Z7§)
         {
            this.§_-uG§.remove();
            this.§_-uG§ = null;
         }
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.§_-Hg§ = new Sprite();
         this.§_-n15§ = new Sprite();
         this.§_-Ot§ = new Sprite();
         this.§_-Ot§.scaleX = this.§_-Ot§.scaleY = 0.67;
         this.§_-n15§.scaleX = this.§_-n15§.scaleY = 0.67;
         this.§_-Hg§.scaleX = this.§_-Hg§.scaleY = 0.67;
         addChild(this.§_-Hg§);
         addChild(this.§_-n15§);
         addChild(this.§_-Ot§);
         this.§_-Hg§.y = §_-Aw§.y;
         this.§_-Hg§.x = §_-Aw§.x;
         this.§_-n15§.x = §_-n25§.x;
         this.§_-n15§.y = §_-n25§.y;
         this.§_-Ot§.x = §_-q1x§.x;
         this.§_-Ot§.y = §_-q1x§.y;
         var _loc1_:§_-22V§ = new §_-22V§(gls("Шаман"),§_-k2S§.x,§_-k2S§.y,§_-Og§,122);
         this.§_-Hg§.addChild(_loc1_);
         _loc1_ = new §_-22V§(gls("Дракоша"),§_-k2S§.x,§_-k2S§.y,§_-Og§,122);
         this.§_-Ot§.addChild(_loc1_);
         _loc1_ = new §_-22V§(gls("Заяц Несудьбы"),§_-k2S§.x,§_-k2S§.y,§_-Og§,122);
         this.§_-n15§.addChild(_loc1_);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,14614477,null,null,null,null,null,TextFormatAlign.CENTER);
         this.§_-H1Y§ = new §_-wn§(new ButtonBuySmall(),_loc2_,-13,1,60);
         this.§_-H1Y§.textField.text = Game.§_-pl§ + "  #";
         this.§_-H1Y§.back.width = 60;
         this.§_-H1Y§.back.height = 30;
         this.§_-H1Y§.§_-g2P§();
         this.§_-H1Y§.x = §_-oY§;
         this.§_-H1Y§.y = §_-e2d§;
         this.§_-H1Y§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-Hg§.addChild(this.§_-H1Y§);
         this.§_-t1S§ = new ImageShamanCharacterIcon();
         this.§_-t1S§.x = §_-dF§.x;
         this.§_-t1S§.y = §_-dF§.y;
         this.§_-Hg§.addChild(this.§_-t1S§);
         new §_-Hb§(this.§_-H1Y§,gls("Стать Шаманом"));
         §_-jB§.§_-fG§(this.§_-H1Y§.textField,"#",ImageIconNut,0.7,0.7,-this.§_-H1Y§.textField.x - 4,-this.§_-H1Y§.textField.y - 1,false,true);
         this.§_-H2g§ = new §_-wn§(new ButtonBuySmall(),_loc2_,-12,1,50);
         this.§_-H2g§.textField.text = Game.§_-X8§ + "  #";
         this.§_-H2g§.back.width = 50;
         this.§_-H2g§.back.height = 30;
         this.§_-H2g§.§_-g2P§();
         this.§_-H2g§.x = BUTTON_POSITION_X2;
         this.§_-H2g§.y = §_-e2d§;
         this.§_-H2g§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-Hg§.addChild(this.§_-H2g§);
         new §_-Hb§(this.§_-H2g§,gls("Стать Шаманом"));
         §_-jB§.§_-fG§(this.§_-H2g§.textField,"#",ImageIconCoins,0.8,0.8,-this.§_-H2g§.textField.x - 5,-this.§_-H2g§.textField.y,false,true);
         this.§_-BQ§ = new §_-wn§(new ButtonBuySmall(),_loc2_,-12,1,60);
         this.§_-BQ§.textField.text = Game.§_-Y1B§ + "  #";
         this.§_-BQ§.back.width = 60;
         this.§_-BQ§.back.height = 30;
         this.§_-BQ§.§_-g2P§();
         this.§_-BQ§.x = §_-oY§;
         this.§_-BQ§.y = §_-e2d§;
         this.§_-BQ§.addEventListener(MouseEvent.CLICK,this.click);
         new §_-Hb§(this.§_-BQ§,gls("Стать Дракошей"));
         this.§_-Ot§.addChild(this.§_-BQ§);
         §_-jB§.§_-fG§(this.§_-BQ§.textField,"#",ImageIconNut,0.7,0.7,-this.§_-BQ§.textField.x - 4,-this.§_-BQ§.textField.y - 1,false,true);
         this.§_-a1p§ = new §_-wn§(new ButtonBuySmall(),_loc2_,-12,1,50);
         this.§_-a1p§.textField.text = Game.§_-n2b§ + "  #";
         this.§_-a1p§.back.width = 50;
         this.§_-a1p§.back.height = 30;
         this.§_-a1p§.§_-g2P§();
         this.§_-a1p§.x = BUTTON_POSITION_X2;
         this.§_-a1p§.y = §_-e2d§;
         this.§_-a1p§.addEventListener(MouseEvent.CLICK,this.click);
         new §_-Hb§(this.§_-a1p§,gls("Стать Дракошей"));
         this.§_-Ot§.addChild(this.§_-a1p§);
         §_-jB§.§_-fG§(this.§_-a1p§.textField,"#",ImageIconCoins,0.7,0.7,-this.§_-a1p§.textField.x - 5,-this.§_-a1p§.textField.y,false,true);
         this.§_-93c§ = new ImageDragonCharacterIcon();
         this.§_-93c§.x = §_-dF§.x;
         this.§_-93c§.y = §_-dF§.y;
         this.§_-Ot§.addChild(this.§_-93c§);
         this.§_-5k§ = new §_-wn§(new ButtonBuySmall(),_loc2_,-12,1,60);
         this.§_-5k§.textField.text = Game.§_-Z1x§ + "  #";
         this.§_-5k§.back.width = 60;
         this.§_-5k§.back.height = 30;
         this.§_-5k§.§_-g2P§();
         this.§_-5k§.x = §_-oY§;
         this.§_-5k§.y = §_-e2d§;
         this.§_-5k§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-n15§.addChild(this.§_-5k§);
         new §_-Hb§(this.§_-5k§,gls("Стать Зайцем НеСудьбы"));
         §_-jB§.§_-fG§(this.§_-5k§.textField,"#",ImageIconNut,0.7,0.7,-this.§_-5k§.textField.x - 4,-this.§_-5k§.textField.y - 1,false,true);
         this.§_-uO§ = new §_-wn§(new ButtonBuySmall(),_loc2_,-12,1,50);
         this.§_-uO§.textField.text = Game.§_-71S§ + "  #";
         this.§_-uO§.back.width = 50;
         this.§_-uO§.back.height = 30;
         this.§_-uO§.§_-g2P§();
         this.§_-uO§.x = BUTTON_POSITION_X2;
         this.§_-uO§.y = §_-e2d§;
         this.§_-uO§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-n15§.addChild(this.§_-uO§);
         new §_-Hb§(this.§_-uO§,gls("Стать Зайцем НеСудьбы"));
         §_-jB§.§_-fG§(this.§_-uO§.textField,"#",ImageIconCoins,0.7,0.7,-this.§_-uO§.textField.x - 5,-this.§_-uO§.textField.y,false,true);
         this.§_-M1X§ = new ImageHareCharacterIcon();
         this.§_-M1X§.x = §_-dF§.x;
         this.§_-M1X§.y = §_-dF§.y;
         this.§_-n15§.addChild(this.§_-M1X§);
      }
      
      private function click(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.§_-uO§:
               if(Game.self.coins < Game.§_-71S§)
               {
                  Services.bank.open(§_-7O§.§_-s1Z§);
                  return;
               }
               this.§_-uO§.mouseEnabled = false;
               Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-l2Q§,Game.§_-71S§,0,Game.selfId);
               break;
            case this.§_-5k§:
               if(Game.self.nuts < Game.§_-Z1x§)
               {
                  Services.bank.open(§_-7O§.§_-K2P§);
                  return;
               }
               this.§_-5k§.mouseEnabled = false;
               Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-l2Q§,0,Game.§_-Z1x§,Game.selfId);
               break;
            case this.§_-a1p§:
               if(Game.self.coins < Game.§_-n2b§)
               {
                  Services.bank.open(§_-7O§.§_-s1Z§);
                  return;
               }
               this.§_-a1p§.mouseEnabled = false;
               Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-r1z§,Game.§_-n2b§,0,Game.selfId);
               break;
            case this.§_-BQ§:
               if(Game.self.nuts < Game.§_-Y1B§)
               {
                  Services.bank.open(§_-7O§.§_-K2P§);
                  return;
               }
               this.§_-BQ§.mouseEnabled = false;
               Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-r1z§,0,Game.§_-Y1B§,Game.selfId);
               break;
            case this.§_-H2g§:
               if(Game.self.coins < Game.§_-X8§)
               {
                  Services.bank.open(§_-7O§.§_-s1Z§);
                  return;
               }
               this.§_-H2g§.mouseEnabled = false;
               Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-cP§,Game.§_-X8§,0,Game.selfId);
               break;
            case this.§_-H1Y§:
               if(Game.self.nuts < Game.§_-pl§)
               {
                  Services.bank.open(§_-7O§.§_-K2P§);
                  return;
               }
               this.§_-H1Y§.mouseEnabled = false;
               Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-cP§,0,Game.§_-pl§,Game.selfId);
         }
      }
      
      private function get §_-i1l§() : Boolean
      {
         return §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§ && Boolean(§_-q1p§.§_-m15§[this.modeId]["shamanButton"]);
      }
      
      private function get §_-m2e§() : Boolean
      {
         return !§_-q1p§.§_-Vz§.nonHare && Boolean(§_-q1p§.§_-m15§[this.modeId]["hareButton"]);
      }
      
      private function get §_-u21§() : Boolean
      {
         return Boolean(§_-q1p§.§_-m15§[this.modeId]["dragonButton"]);
      }
      
      private function §_-W1d§(param1:Boolean) : void
      {
         if(!§_-Bm§.§_-2S§(§_-T2o§.§_-m11§) && !this.§_-w1m§)
         {
            this.§_-w1m§ = new §_-Hb§(this.§_-t1S§,gls("<body><b>Недоступно</b><br/>Сначала пройди «Школу Шаманов» - нельзя становиться Шаманом без должного обучения<br/>«Школа Шаманов» находится на экране Планеты</body>"),false,true);
         }
         else if(§_-Bm§.§_-2S§(§_-T2o§.§_-m11§) && Boolean(this.§_-w1m§))
         {
            this.§_-w1m§.remove();
            this.§_-w1m§ = null;
         }
         if(!this.§_-w1m§ && !this.§_-Qj§ && §_-d2x§.§_-z2o§ < §_-My§.§_-U1R§)
         {
            this.§_-Qj§ = new §_-Hb§(this.§_-t1S§,gls("<body><b>Недоступно</b><br/>На Солнечной Долине белки ниже {0} уровня не могут купить место Шамана</body>",§_-My§.§_-U1R§),false,true);
         }
         else if(this.§_-Qj§)
         {
            this.§_-Qj§.remove();
            this.§_-Qj§ = null;
         }
         this.shaman = param1;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         switch(param1.type)
         {
            case §_-S2I§.§_-W1O§:
               this.modeId = "3" in param1 ? int(param1[3]) : this.modeId;
               switch(param1[0])
               {
                  case §_-S2I§.ROUND_STARTING:
                     this.§_-51Y§ = gls("Кем ты будешь играть?");
                     this.§_-Q1v§(§_-92z§.§_-32S§ == 0);
                     break;
                  case §_-S2I§.ROUND_PLAYING:
                  case §_-S2I§.ROUND_START:
                  case §_-S2I§.§_-RO§:
                     this.§_-Q1v§(false);
               }
               break;
            case §_-S2I§.BUY:
               if(param1[2] != §_-h2B§.§_-cP§ && param1[2] != §_-h2B§.§_-l2Q§ && param1[2] != §_-h2B§.§_-r1z§)
               {
                  return;
               }
               if(!this.visible)
               {
                  return;
               }
               switch(param1[0])
               {
                  case §_-S2I§.§_-g1w§:
                     switch(param1[2])
                     {
                        case §_-h2B§.§_-cP§:
                           this.§_-51Y§ = gls("Место Шамана уже занято!");
                           break;
                        case §_-h2B§.§_-l2Q§:
                           this.§_-51Y§ = gls("Место Зайца НеСудьбы уже занято!");
                           break;
                        case §_-h2B§.§_-r1z§:
                           this.§_-51Y§ = gls("Место Дракоши уже занято!");
                     }
                     break;
                  case §_-S2I§.§_-k2l§:
                     switch(param1[2])
                     {
                        case §_-h2B§.§_-cP§:
                           this.§_-Q1v§(false);
                           this.§_-t1S§.filters = [];
                           this.§_-51Y§ = gls("Ты станешь Шаманом");
                           break;
                        case §_-h2B§.§_-l2Q§:
                           this.§_-Q1v§(false);
                           this.§_-M1X§.filters = [];
                           this.§_-51Y§ = gls("Ты станешь Зайцем НеСудьбы");
                           break;
                        case §_-h2B§.§_-r1z§:
                           this.§_-Q1v§(false);
                           this.§_-93c§.filters = [];
                           this.§_-51Y§ = gls("Ты станешь Дракошей");
                     }
               }
         }
      }
   }
}


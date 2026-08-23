package views
{
   import §_-I2Y§.§_-18§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-r12§;
   import §_-bN§.§_-Sg§;
   import §_-c2C§.§_-u24§;
   import buttons.§_-G15§;
   import com.api.Services;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   import utils.§_-y1l§;
   
   public class §_-428§ extends Sprite implements §_-18§
   {
      
      private static const §_-n1J§:Number = -16;
      
      private static const BUTTON_POSITION_X2:Number = 47;
      
      private static const §_-52J§:Number = 66;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","}","a {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","}","a:hover {","text-decoration: none;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private static const §_-73l§:Point = new Point(-23,-80);
      
      private static const §_-Ao§:Point = new Point(56,150);
      
      private static const §_-A1P§:Point = new Point(56,270);
      
      private static const §_-824§:Point = new Point(56,392);
      
      private static const §_-12P§:Point = new Point(-16,-58);
      
      private static const §_-L26§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,8280118,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private var style:StyleSheet;
      
      private var §_-s2I§:§_-G15§ = null;
      
      private var §_-82o§:§_-G15§ = null;
      
      private var §_-E2Q§:§_-G15§ = null;
      
      private var §_-u1A§:§_-G15§ = null;
      
      private var §_-q2O§:§_-G15§ = null;
      
      private var §_-x2w§:§_-G15§ = null;
      
      private var §_-oj§:§_-i5§ = null;
      
      private var §_-N1h§:Number = 0;
      
      private var §_-w15§:ImageShamanCharacterIcon;
      
      private var §_-X2J§:ImageHareCharacterIcon;
      
      private var §_-e2J§:ImageDragonCharacterIcon;
      
      private var §_-JH§:Sprite = null;
      
      private var §_-q2Y§:Sprite = null;
      
      private var §_-s2Z§:Sprite = null;
      
      private var §_-Y1W§:§_-kr§ = null;
      
      private var §_-42§:§_-kr§ = null;
      
      private var §_-h2i§:§_-kr§ = null;
      
      private var bg:MovieClip = null;
      
      private var modeId:int;
      
      public function §_-428§(param1:§_-i5§, param2:MovieClip)
      {
         super();
         this.§_-oj§ = param1;
         this.§_-N1h§ = this.§_-oj§.y;
         this.bg = param2;
         this.init();
         this.§_-Uk§(false);
      }
      
      public function set §_-P2L§(param1:String) : void
      {
         this.§_-oj§.text = param1;
         this.§_-oj§.y = this.§_-N1h§ + 25 - this.§_-oj§.textHeight * 0.5;
      }
      
      public function §_-Uk§(param1:Boolean) : void
      {
         if(param1)
         {
            Connection.forget(this.§_-x2f§,[§_-s2l§.§_-p1K§,§_-s2l§.BUY]);
         }
         else
         {
            Connection.listen(this.§_-x2f§,[§_-s2l§.§_-p1K§,§_-s2l§.BUY],2);
         }
      }
      
      public function dispose() : void
      {
         if(this.§_-Y1W§)
         {
            this.§_-Y1W§.remove();
         }
         if(this.§_-h2i§)
         {
            this.§_-h2i§.remove();
         }
         this.§_-Uk§(true);
      }
      
      public function update() : void
      {
         this.bg.height = 172 + (this.§_-93x§ ? this.§_-s2Z§.height : 0) + (this.§_-93x§ && this.§_-A2a§ ? this.§_-q2Y§.height : 0);
         this.§_-JH§.y = §_-Ao§.y;
         this.§_-s2Z§.y = this.§_-I2E§ ? §_-A1P§.y : §_-Ao§.y;
         this.§_-q2Y§.y = this.§_-I2E§ && this.§_-93x§ ? §_-824§.y : (this.§_-93x§ ? §_-A1P§.y : §_-Ao§.y);
         this.§_-JH§.visible = this.§_-I2E§;
         this.§_-s2Z§.visible = this.§_-93x§;
         this.§_-q2Y§.visible = this.§_-A2a§;
      }
      
      public function get §_-Qo§() : Boolean
      {
         return this.§_-I2E§ || this.§_-A2a§ || this.§_-93x§;
      }
      
      public function set hare(param1:Boolean) : void
      {
         this.§_-E2Q§.enabled = param1;
         this.§_-E2Q§.mouseEnabled = param1;
         this.§_-u1A§.enabled = param1;
         this.§_-u1A§.mouseEnabled = param1;
         this.§_-E2Q§.filters = this.§_-u1A§.filters = param1 ? [] : §_-y1l§.§_-Tk§;
         this.§_-X2J§.filters = param1 ? [] : §_-y1l§.§_-Tk§;
      }
      
      public function get hare() : Boolean
      {
         return this.§_-E2Q§.enabled;
      }
      
      public function set dragon(param1:Boolean) : void
      {
         this.§_-q2O§.enabled = param1 && §_-LZ§.§_-mA§ >= Game.§_-E2T§;
         this.§_-q2O§.mouseEnabled = param1 && §_-LZ§.§_-mA§ >= Game.§_-E2T§;
         this.§_-x2w§.enabled = param1 && §_-LZ§.§_-mA§ >= Game.§_-E2T§;
         this.§_-x2w§.mouseEnabled = param1 && §_-LZ§.§_-mA§ >= Game.§_-E2T§;
         this.§_-q2O§.filters = this.§_-x2w§.filters = param1 ? [] : §_-y1l§.§_-Tk§;
         this.§_-e2J§.filters = param1 && §_-LZ§.§_-mA§ >= Game.§_-E2T§ ? [] : §_-y1l§.§_-Tk§;
      }
      
      public function get dragon() : Boolean
      {
         return this.§_-q2O§.enabled;
      }
      
      public function set shaman(param1:Boolean) : void
      {
         this.§_-s2I§.enabled = param1;
         this.§_-s2I§.mouseEnabled = param1;
         this.§_-82o§.enabled = param1;
         this.§_-82o§.mouseEnabled = param1;
         this.§_-s2I§.filters = this.§_-82o§.filters = param1 ? [] : §_-y1l§.§_-Tk§;
         this.§_-w15§.filters = param1 ? [] : §_-y1l§.§_-Tk§;
      }
      
      public function get shaman() : Boolean
      {
         return this.§_-s2I§.enabled;
      }
      
      private function §_-83E§(param1:Boolean) : void
      {
         this.§_-LH§(param1 && §_-r12§.§_-FS§(§_-n2E§.§_-X1A§) && §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§);
         this.hare = param1;
         this.dragon = param1;
         if(this.§_-42§ == null && §_-LZ§.§_-mA§ < Game.§_-E2T§)
         {
            this.§_-42§ = new §_-kr§(this.§_-e2J§,gls("<body><b>Недоступно</b><br/>Дракоша доступен с {0} уровня</body>",Game.§_-E2T§),false,true);
         }
         if(Boolean(this.§_-42§) && §_-LZ§.§_-mA§ >= Game.§_-E2T§)
         {
            this.§_-42§.remove();
            this.§_-42§ = null;
         }
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.§_-JH§ = new Sprite();
         this.§_-q2Y§ = new Sprite();
         this.§_-s2Z§ = new Sprite();
         this.§_-s2Z§.scaleX = this.§_-s2Z§.scaleY = 0.67;
         this.§_-q2Y§.scaleX = this.§_-q2Y§.scaleY = 0.67;
         this.§_-JH§.scaleX = this.§_-JH§.scaleY = 0.67;
         addChild(this.§_-JH§);
         addChild(this.§_-q2Y§);
         addChild(this.§_-s2Z§);
         this.§_-JH§.y = §_-Ao§.y;
         this.§_-JH§.x = §_-Ao§.x;
         this.§_-q2Y§.x = §_-824§.x;
         this.§_-q2Y§.y = §_-824§.y;
         this.§_-s2Z§.x = §_-A1P§.x;
         this.§_-s2Z§.y = §_-A1P§.y;
         var _loc1_:§_-i5§ = new §_-i5§(gls("Шаман"),§_-73l§.x,§_-73l§.y,§_-L26§,122);
         this.§_-JH§.addChild(_loc1_);
         _loc1_ = new §_-i5§(gls("Дракоша"),§_-73l§.x,§_-73l§.y,§_-L26§,122);
         this.§_-s2Z§.addChild(_loc1_);
         _loc1_ = new §_-i5§(gls("Заяц Несудьбы"),§_-73l§.x,§_-73l§.y,§_-L26§,122);
         this.§_-q2Y§.addChild(_loc1_);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,14614477,null,null,null,null,null,TextFormatAlign.CENTER);
         this.§_-s2I§ = new §_-G15§(new ButtonBuySmall(),_loc2_,-13,1,60);
         this.§_-s2I§.textField.text = Game.§_-q7§ + "  #";
         this.§_-s2I§.back.width = 60;
         this.§_-s2I§.back.height = 30;
         this.§_-s2I§.§_-m1J§();
         this.§_-s2I§.x = §_-n1J§;
         this.§_-s2I§.y = §_-52J§;
         this.§_-s2I§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-JH§.addChild(this.§_-s2I§);
         this.§_-w15§ = new ImageShamanCharacterIcon();
         this.§_-w15§.x = §_-12P§.x;
         this.§_-w15§.y = §_-12P§.y;
         this.§_-JH§.addChild(this.§_-w15§);
         new §_-kr§(this.§_-s2I§,gls("Стать Шаманом"));
         §_-K1Y§.§_-P2W§(this.§_-s2I§.textField,"#",ImageIconNut,0.7,0.7,-this.§_-s2I§.textField.x - 4,-this.§_-s2I§.textField.y - 1,false,true);
         this.§_-82o§ = new §_-G15§(new ButtonBuySmall(),_loc2_,-12,1,50);
         this.§_-82o§.textField.text = Game.§_-Tz§ + "  #";
         this.§_-82o§.back.width = 50;
         this.§_-82o§.back.height = 30;
         this.§_-82o§.§_-m1J§();
         this.§_-82o§.x = BUTTON_POSITION_X2;
         this.§_-82o§.y = §_-52J§;
         this.§_-82o§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-JH§.addChild(this.§_-82o§);
         new §_-kr§(this.§_-82o§,gls("Стать Шаманом"));
         §_-K1Y§.§_-P2W§(this.§_-82o§.textField,"#",ImageIconCoins,0.8,0.8,-this.§_-82o§.textField.x - 5,-this.§_-82o§.textField.y,false,true);
         this.§_-q2O§ = new §_-G15§(new ButtonBuySmall(),_loc2_,-12,1,60);
         this.§_-q2O§.textField.text = Game.§_-f2J§ + "  #";
         this.§_-q2O§.back.width = 60;
         this.§_-q2O§.back.height = 30;
         this.§_-q2O§.§_-m1J§();
         this.§_-q2O§.x = §_-n1J§;
         this.§_-q2O§.y = §_-52J§;
         this.§_-q2O§.addEventListener(MouseEvent.CLICK,this.click);
         new §_-kr§(this.§_-q2O§,gls("Стать Дракошей"));
         this.§_-s2Z§.addChild(this.§_-q2O§);
         §_-K1Y§.§_-P2W§(this.§_-q2O§.textField,"#",ImageIconNut,0.7,0.7,-this.§_-q2O§.textField.x - 4,-this.§_-q2O§.textField.y - 1,false,true);
         this.§_-x2w§ = new §_-G15§(new ButtonBuySmall(),_loc2_,-12,1,50);
         this.§_-x2w§.textField.text = Game.§_-w2P§ + "  #";
         this.§_-x2w§.back.width = 50;
         this.§_-x2w§.back.height = 30;
         this.§_-x2w§.§_-m1J§();
         this.§_-x2w§.x = BUTTON_POSITION_X2;
         this.§_-x2w§.y = §_-52J§;
         this.§_-x2w§.addEventListener(MouseEvent.CLICK,this.click);
         new §_-kr§(this.§_-x2w§,gls("Стать Дракошей"));
         this.§_-s2Z§.addChild(this.§_-x2w§);
         §_-K1Y§.§_-P2W§(this.§_-x2w§.textField,"#",ImageIconCoins,0.7,0.7,-this.§_-x2w§.textField.x - 5,-this.§_-x2w§.textField.y,false,true);
         this.§_-e2J§ = new ImageDragonCharacterIcon();
         this.§_-e2J§.x = §_-12P§.x;
         this.§_-e2J§.y = §_-12P§.y;
         this.§_-s2Z§.addChild(this.§_-e2J§);
         this.§_-E2Q§ = new §_-G15§(new ButtonBuySmall(),_loc2_,-12,1,60);
         this.§_-E2Q§.textField.text = Game.§_-z19§ + "  #";
         this.§_-E2Q§.back.width = 60;
         this.§_-E2Q§.back.height = 30;
         this.§_-E2Q§.§_-m1J§();
         this.§_-E2Q§.x = §_-n1J§;
         this.§_-E2Q§.y = §_-52J§;
         this.§_-E2Q§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-q2Y§.addChild(this.§_-E2Q§);
         new §_-kr§(this.§_-E2Q§,gls("Стать Зайцем НеСудьбы"));
         §_-K1Y§.§_-P2W§(this.§_-E2Q§.textField,"#",ImageIconNut,0.7,0.7,-this.§_-E2Q§.textField.x - 4,-this.§_-E2Q§.textField.y - 1,false,true);
         this.§_-u1A§ = new §_-G15§(new ButtonBuySmall(),_loc2_,-12,1,50);
         this.§_-u1A§.textField.text = Game.§_-jn§ + "  #";
         this.§_-u1A§.back.width = 50;
         this.§_-u1A§.back.height = 30;
         this.§_-u1A§.§_-m1J§();
         this.§_-u1A§.x = BUTTON_POSITION_X2;
         this.§_-u1A§.y = §_-52J§;
         this.§_-u1A§.addEventListener(MouseEvent.CLICK,this.click);
         this.§_-q2Y§.addChild(this.§_-u1A§);
         new §_-kr§(this.§_-u1A§,gls("Стать Зайцем НеСудьбы"));
         §_-K1Y§.§_-P2W§(this.§_-u1A§.textField,"#",ImageIconCoins,0.7,0.7,-this.§_-u1A§.textField.x - 5,-this.§_-u1A§.textField.y,false,true);
         this.§_-X2J§ = new ImageHareCharacterIcon();
         this.§_-X2J§.x = §_-12P§.x;
         this.§_-X2J§.y = §_-12P§.y;
         this.§_-q2Y§.addChild(this.§_-X2J§);
      }
      
      private function click(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.§_-u1A§:
               if(Game.self.coins < Game.§_-jn§)
               {
                  Services.bank.open(§_-Sg§.§_-7G§);
                  return;
               }
               this.§_-u1A§.mouseEnabled = false;
               Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-z2C§,Game.§_-jn§,0,Game.selfId);
               break;
            case this.§_-E2Q§:
               if(Game.self.nuts < Game.§_-z19§)
               {
                  Services.bank.open(§_-Sg§.§_-23U§);
                  return;
               }
               this.§_-E2Q§.mouseEnabled = false;
               Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-z2C§,0,Game.§_-z19§,Game.selfId);
               break;
            case this.§_-x2w§:
               if(Game.self.coins < Game.§_-w2P§)
               {
                  Services.bank.open(§_-Sg§.§_-7G§);
                  return;
               }
               this.§_-x2w§.mouseEnabled = false;
               Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-q2H§,Game.§_-w2P§,0,Game.selfId);
               break;
            case this.§_-q2O§:
               if(Game.self.nuts < Game.§_-f2J§)
               {
                  Services.bank.open(§_-Sg§.§_-23U§);
                  return;
               }
               this.§_-q2O§.mouseEnabled = false;
               Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-q2H§,0,Game.§_-f2J§,Game.selfId);
               break;
            case this.§_-82o§:
               if(Game.self.coins < Game.§_-Tz§)
               {
                  Services.bank.open(§_-Sg§.§_-7G§);
                  return;
               }
               this.§_-82o§.mouseEnabled = false;
               Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-PU§,Game.§_-Tz§,0,Game.selfId);
               break;
            case this.§_-s2I§:
               if(Game.self.nuts < Game.§_-q7§)
               {
                  Services.bank.open(§_-Sg§.§_-23U§);
                  return;
               }
               this.§_-s2I§.mouseEnabled = false;
               Connection.§_-e2T§(§_-u1O§.BUY,§_-u1O§.§_-PU§,0,Game.§_-q7§,Game.selfId);
         }
      }
      
      private function get §_-I2E§() : Boolean
      {
         return §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§ && Boolean(§_-at§.§_-02X§[this.modeId]["shamanButton"]);
      }
      
      private function get §_-A2a§() : Boolean
      {
         return !§_-at§.§_-F2u§.nonHare && Boolean(§_-at§.§_-02X§[this.modeId]["hareButton"]);
      }
      
      private function get §_-93x§() : Boolean
      {
         return Boolean(§_-at§.§_-02X§[this.modeId]["dragonButton"]);
      }
      
      private function §_-LH§(param1:Boolean) : void
      {
         if(!§_-r12§.§_-FS§(§_-n2E§.§_-X1A§) && !this.§_-Y1W§)
         {
            this.§_-Y1W§ = new §_-kr§(this.§_-w15§,gls("<body><b>Недоступно</b><br/>Сначала пройди «Школу Шаманов» - нельзя становиться Шаманом без должного обучения<br/>«Школа Шаманов» находится на экране Планеты</body>"),false,true);
         }
         else if(§_-r12§.§_-FS§(§_-n2E§.§_-X1A§) && Boolean(this.§_-Y1W§))
         {
            this.§_-Y1W§.remove();
            this.§_-Y1W§ = null;
         }
         if(!this.§_-Y1W§ && !this.§_-h2i§ && §_-LZ§.§_-mA§ < §_-XW§.§_-I1V§)
         {
            this.§_-h2i§ = new §_-kr§(this.§_-w15§,gls("<body><b>Недоступно</b><br/>На Солнечной Долине белки ниже {0} уровня не могут купить место Шамана</body>",§_-XW§.§_-I1V§),false,true);
         }
         else if(this.§_-h2i§)
         {
            this.§_-h2i§.remove();
            this.§_-h2i§ = null;
         }
         this.shaman = param1;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         switch(param1.type)
         {
            case §_-s2l§.§_-p1K§:
               this.modeId = "3" in param1 ? int(param1[3]) : this.modeId;
               switch(param1[0])
               {
                  case §_-s2l§.ROUND_STARTING:
                     this.§_-P2L§ = gls("Кем ты будешь играть?");
                     this.§_-83E§(§_-u24§.§_-j2T§ == 0);
                     break;
                  case §_-s2l§.ROUND_PLAYING:
                  case §_-s2l§.ROUND_START:
                  case §_-s2l§.§_-02x§:
                     this.§_-83E§(false);
               }
               break;
            case §_-s2l§.BUY:
               if(param1[2] != §_-u1O§.§_-PU§ && param1[2] != §_-u1O§.§_-z2C§ && param1[2] != §_-u1O§.§_-q2H§)
               {
                  return;
               }
               if(!this.visible)
               {
                  return;
               }
               switch(param1[0])
               {
                  case §_-s2l§.§_-l1C§:
                     switch(param1[2])
                     {
                        case §_-u1O§.§_-PU§:
                           this.§_-P2L§ = gls("Место Шамана уже занято!");
                           break;
                        case §_-u1O§.§_-z2C§:
                           this.§_-P2L§ = gls("Место Зайца НеСудьбы уже занято!");
                           break;
                        case §_-u1O§.§_-q2H§:
                           this.§_-P2L§ = gls("Место Дракоши уже занято!");
                     }
                     break;
                  case §_-s2l§.§_-v1E§:
                     switch(param1[2])
                     {
                        case §_-u1O§.§_-PU§:
                           this.§_-83E§(false);
                           this.§_-w15§.filters = [];
                           this.§_-P2L§ = gls("Ты станешь Шаманом");
                           break;
                        case §_-u1O§.§_-z2C§:
                           this.§_-83E§(false);
                           this.§_-X2J§.filters = [];
                           this.§_-P2L§ = gls("Ты станешь Зайцем НеСудьбы");
                           break;
                        case §_-u1O§.§_-q2H§:
                           this.§_-83E§(false);
                           this.§_-e2J§.filters = [];
                           this.§_-P2L§ = gls("Ты станешь Дракошей");
                     }
               }
         }
      }
   }
}


package §_-xm§
{
   import §_-D25§.MultipartURLLoader;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-j18§;
   import by.blooddy.crypto.image.PNGEncoder;
   import events.§_-n13§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.FileReference;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.StringUtil;
   import utils.§_-2Y§;
   import utils.§_-93C§;
   import utils.§_-Y1S§;
   import utils.§_-vo§;
   import views.§_-F1z§;
   import views.§_-Z2N§;
   
   public class §_-01x§ extends Dialog
   {
      
      private static const §_-83P§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #573E11;","}","a {","text-decoration: none;","margin-right: 0px;","}","a:hover {","text-decoration: underline;","color: #0641EC;","}",".blue {","font-size: 18px;","color: #0641EC;","}"].join("\n");
      
      private static const §_-71k§:String = gls("Название");
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,5717521);
      
      private static const §_-91K§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,5717521,true);
      
      private static const §_-B1G§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,5783050,null,null,null,null,null,null,null,null,null,2);
      
      private static const §_-W1x§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,16,10917501,null,null,null,null,null,null,null,null,null,2);
      
      private var §_-oa§:§_-F1z§ = null;
      
      private var §_-El§:§_-Z2N§ = null;
      
      private var clanId:int = 0;
      
      private var browse:Boolean = false;
      
      private var §_-H2C§:FileReference = new FileReference();
      
      private var §_-51w§:String = "";
      
      private var §_-y2E§:String = "";
      
      private var §_-u2b§:Boolean = false;
      
      private var §_-f27§:Boolean = false;
      
      private var §_-81t§:Clan = null;
      
      private var §_-w2i§:§_-Q13§ = null;
      
      private var §_-zU§:§_-Q13§ = null;
      
      private var §_-T1y§:§_-Q13§ = null;
      
      private var §_-Uk§:TextField = null;
      
      private var §_-y2V§:§_-Z2N§ = null;
      
      private var §_-dV§:§_-22V§ = null;
      
      public function §_-01x§()
      {
         super(gls("Редактирование"));
         this.init();
         §_-e2W§.listen(this.onClanLoaded);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-M1P§]);
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-81t§)
         {
            return;
         }
         this.§_-Uk§.defaultTextFormat = §_-B1G§;
         this.§_-Uk§.text = this.§_-81t§.name;
         this.§_-V1a§();
      }
      
      public function set id(param1:int) : void
      {
         this.clanId = param1;
         if(§_-e2W§.§_-W2X§(this.clanId).isLoaded())
         {
            this.onClanLoaded(new §_-n13§(§_-e2W§.§_-W2X§(this.clanId),false));
            return;
         }
         §_-e2W§.request(this.clanId,§_-Oy§.ALL);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-w2i§ = new §_-Q13§(gls("Смена имени"),gls("Клан с таким именем уже существует!\n "));
         this.§_-zU§ = new §_-Q13§(gls("Смена имени"),gls("Не удалось сменить имя клана!"));
         this.§_-T1y§ = new §_-Q13§(gls("Смена имени"),gls("Введите имя клана!"));
         var _loc2_:§_-22V§ = new §_-22V§(gls("<body>Изменение названия клана стоит <b>{0}</b></body>",§_-83P§),2,10,_loc1_);
         addChild(_loc2_);
         var _loc3_:ImageIconCoins = new ImageIconCoins();
         _loc3_.scaleX = _loc3_.scaleY = 0.6;
         _loc3_.x = _loc2_.x + _loc2_.textWidth + 5;
         _loc3_.y = _loc2_.y;
         addChild(_loc3_);
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(16777215);
         _loc4_.graphics.drawRoundRectComplex(2,28,224,30,5,5,5,5);
         _loc4_.graphics.endFill();
         addChild(_loc4_);
         this.§_-Uk§ = new TextField();
         this.§_-Uk§.x = 7;
         this.§_-Uk§.y = 31;
         this.§_-Uk§.width = 220;
         this.§_-Uk§.height = 30;
         this.§_-Uk§.type = TextFieldType.INPUT;
         this.§_-Uk§.defaultTextFormat = §_-B1G§;
         this.§_-Uk§.maxChars = §_-a9§.§_-y1i§;
         this.§_-Uk§.addEventListener(FocusEvent.FOCUS_IN,this.§_-B1C§);
         this.§_-Uk§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-V1a§);
         this.§_-Uk§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         addChild(this.§_-Uk§);
         §_-vo§.embedFonts(this.§_-Uk§);
         var _loc5_:§_-22V§ = new §_-22V§(gls("Добавьте изображения:"),44,65,§_-i2c§);
         addChild(_loc5_);
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.beginFill(15524553);
         _loc6_.graphics.drawRoundRectComplex(2,85,110,90,5,5,5,5);
         _loc6_.graphics.endFill();
         addChild(_loc6_);
         var _loc7_:Sprite = new Sprite();
         _loc7_.graphics.beginFill(5717521,0.1);
         _loc7_.graphics.drawRoundRectComplex(72,85,40,16,0,5,0,0);
         _loc7_.graphics.endFill();
         addChild(_loc7_);
         var _loc8_:§_-22V§ = new §_-22V§("50x50",74,84,§_-i2c§);
         addChild(_loc8_);
         this.§_-oa§ = new §_-F1z§("",32,105);
         addChild(this.§_-oa§);
         var _loc9_:ButtonSelectAvatar = new ButtonSelectAvatar();
         _loc9_.x = 82;
         _loc9_.y = 145;
         _loc9_.addEventListener(MouseEvent.CLICK,this.§_-w1N§);
         addChild(_loc9_);
         var _loc10_:Sprite = new Sprite();
         _loc10_.graphics.beginFill(15524553);
         _loc10_.graphics.drawRoundRectComplex(117,85,110,90,5,5,5,5);
         _loc10_.graphics.endFill();
         addChild(_loc10_);
         var _loc11_:Sprite = new Sprite();
         _loc11_.graphics.beginFill(5717521,0.1);
         _loc11_.graphics.drawRoundRectComplex(187,85,40,16,0,5,0,0);
         _loc11_.graphics.endFill();
         addChild(_loc11_);
         var _loc12_:§_-22V§ = new §_-22V§("10x10",188,84,§_-i2c§);
         addChild(_loc12_);
         this.§_-El§ = new §_-Z2N§("",167,125);
         addChild(this.§_-El§);
         var _loc13_:ButtonSelectAvatar = new ButtonSelectAvatar();
         _loc13_.x = 197;
         _loc13_.y = 145;
         _loc13_.addEventListener(MouseEvent.CLICK,this.§_-O1W§);
         addChild(_loc13_);
         var _loc14_:Sprite = new Sprite();
         _loc14_.graphics.beginFill(15524553);
         _loc14_.graphics.drawRoundRectComplex(2,185,224,30,5,5,5,5);
         _loc14_.graphics.endFill();
         addChild(_loc14_);
         this.§_-y2V§ = new §_-Z2N§("",13,194);
         addChild(this.§_-y2V§);
         this.§_-dV§ = new §_-22V§("",28,190,§_-91K§);
         addChild(this.§_-dV§);
         var _loc15_:§_-j18§ = new §_-j18§(gls("Сохранить"),124,14,this.§_-D1w§);
         _loc15_.x = 2;
         _loc15_.y = 230;
         addChild(_loc15_);
         var _loc16_:§_-j18§ = new §_-j18§(gls("Отмена"),96,14,this.§_-b2v§);
         _loc16_.§_-52e§();
         _loc16_.x = 130;
         _loc16_.y = 230;
         addChild(_loc16_);
         place();
         this.height += 53;
      }
      
      private function §_-B1C§(param1:FocusEvent) : void
      {
         this.§_-Uk§.defaultTextFormat = §_-B1G§;
         this.§_-Uk§.text = this.§_-Uk§.text == §_-71k§ ? "" : this.§_-Uk§.text;
      }
      
      private function §_-V1a§(param1:FocusEvent = null) : void
      {
         if(this.§_-Uk§.text != "" && this.§_-Uk§.text != §_-71k§)
         {
            return;
         }
         this.§_-Uk§.defaultTextFormat = §_-W1x§;
         this.§_-Uk§.text = §_-71k§;
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         if(this.clanId != param1.§_-81t§.id || param1.§_-414§)
         {
            return;
         }
         this.§_-81t§ = param1.§_-81t§;
         this.§_-Uk§.text = param1.§_-81t§.name;
         this.§_-El§.load(param1.§_-81t§.§_-M24§);
         this.§_-oa§.load(param1.§_-81t§.§_-cy§);
         this.§_-k1A§();
         this.§_-m13§();
      }
      
      private function §_-O1W§(param1:Event) : void
      {
         if(this.browse)
         {
            return;
         }
         this.browse = true;
         this.§_-H2C§.addEventListener(Event.SELECT,this.§_-k2F§);
         this.§_-H2C§.addEventListener(Event.CANCEL,this.§_-w2b§);
         this.§_-H2C§.browse();
      }
      
      private function §_-w1N§(param1:Event) : void
      {
         if(this.browse)
         {
            return;
         }
         this.browse = true;
         this.§_-H2C§.addEventListener(Event.SELECT,this.§_-f1Q§);
         this.§_-H2C§.addEventListener(Event.CANCEL,this.§_-w2b§);
         this.§_-H2C§.browse();
      }
      
      private function §_-k2F§(param1:Event) : void
      {
         var onLoaded:Function = null;
         var e:Event = param1;
         this.browse = false;
         onLoaded = function(param1:Event):void
         {
            §_-H2C§.removeEventListener(Event.COMPLETE,onLoaded);
            §_-El§.loadBytes(§_-H2C§.data);
            §_-f27§ = true;
            §_-m13§(§_-H2C§.data);
         };
         this.§_-H2C§.addEventListener(Event.COMPLETE,onLoaded);
         this.§_-H2C§.removeEventListener(Event.SELECT,this.§_-k2F§);
         this.§_-H2C§.removeEventListener(Event.CANCEL,this.§_-w2b§);
         this.§_-H2C§.load();
      }
      
      private function §_-f1Q§(param1:Event) : void
      {
         var onLoaded:Function = null;
         var e:Event = param1;
         this.browse = false;
         onLoaded = function(param1:Event):void
         {
            §_-H2C§.removeEventListener(Event.COMPLETE,onLoaded);
            §_-oa§.loadBytes(§_-H2C§.data);
            §_-u2b§ = true;
         };
         this.§_-H2C§.addEventListener(Event.COMPLETE,onLoaded);
         this.§_-H2C§.removeEventListener(Event.SELECT,this.§_-f1Q§);
         this.§_-H2C§.removeEventListener(Event.CANCEL,this.§_-w2b§);
         this.§_-H2C§.load();
      }
      
      private function §_-w2b§(param1:Event) : void
      {
         this.browse = false;
         this.§_-H2C§.removeEventListener(Event.SELECT,this.§_-f1Q§);
         this.§_-H2C§.removeEventListener(Event.SELECT,this.§_-k2F§);
         this.§_-H2C§.removeEventListener(Event.CANCEL,this.§_-w2b§);
      }
      
      private function get §_-E2b§() : Boolean
      {
         return this.§_-Uk§.text != this.§_-81t§.name;
      }
      
      private function §_-b2v§(param1:MouseEvent) : void
      {
         close();
      }
      
      private function §_-D1w§(param1:MouseEvent) : void
      {
         if(this.§_-E2b§)
         {
            if(this.§_-Uk§.text == "" || this.§_-Uk§.text == §_-01x§.§_-71k§)
            {
               this.§_-T1y§.show();
               return;
            }
            if(!§_-019§.§_-B2p§(name))
            {
               new §_-Q13§(gls("Ошибка"),gls("Имя должно быть цензурным")).show();
               return;
            }
            if(this.§_-81t§.coins < §_-83P§)
            {
               new §_-53k§(gls("У твоего клана недостаточно денег для изменения имени.\nПополни бюджет клана.")).show();
            }
            else
            {
               Connection.§_-Li§(§_-h2B§.§_-u1A§,§_-Y1S§.§_-9K§(this.§_-Uk§.text));
            }
         }
         if(this.§_-f27§)
         {
            if(this.§_-El§.width == 10 || this.§_-El§.height == 10)
            {
               if(this.§_-El§.width > this.§_-El§.height)
               {
                  this.§_-El§.scaleX = 1 + (10 - this.§_-El§.height) / this.§_-El§.height;
                  this.§_-El§.scaleY = 1 + (10 - this.§_-El§.height) / this.§_-El§.height;
                  this.§_-El§.y = -(this.§_-El§.width - this.§_-El§.height) * 0.5;
                  this.§_-El§.x = -(this.§_-El§.width * 0.5 - 5);
               }
               else
               {
                  this.§_-El§.scaleY = 1 + (10 - this.§_-El§.width) / this.§_-El§.width;
                  this.§_-El§.scaleX = 1 + (10 - this.§_-El§.width) / this.§_-El§.width;
                  this.§_-El§.x = -(this.§_-El§.height - this.§_-El§.width) * 0.5;
                  this.§_-El§.y = -(this.§_-El§.height * 0.5 - 5);
               }
            }
            §_-2Y§.§_-QR§(§_-a9§.§_-i2Y§,PNGEncoder.encode(§_-93C§.getBitmapData(this.§_-El§,new Point(10,10))),{
               "clanid":this.clanId,
               "type":0
            },this.§_-53c§,this.§_-P14§);
            this.§_-El§.scaleX = 1;
            this.§_-El§.scaleY = 1;
            this.§_-El§.x = 167;
            this.§_-El§.y = 125;
            addChild(this.§_-El§);
         }
         if(this.§_-u2b§)
         {
            this.§_-oa§.x = 0;
            this.§_-oa§.y = 0;
            if(this.§_-oa§.width == 50 || this.§_-oa§.height == 50)
            {
               if(this.§_-oa§.width > this.§_-oa§.height)
               {
                  this.§_-oa§.scaleX = 1 + (50 - this.§_-oa§.height) / this.§_-oa§.height;
                  this.§_-oa§.scaleY = 1 + (50 - this.§_-oa§.height) / this.§_-oa§.height;
                  this.§_-oa§.y = -(this.§_-oa§.width - this.§_-oa§.height) * 0.5;
                  this.§_-oa§.x = -(this.§_-oa§.width * 0.5 - 25);
               }
               else
               {
                  this.§_-oa§.scaleY = 1 + (50 - this.§_-oa§.width) / this.§_-oa§.width;
                  this.§_-oa§.scaleX = 1 + (50 - this.§_-oa§.width) / this.§_-oa§.width;
                  this.§_-oa§.x = -(this.§_-oa§.height - this.§_-oa§.width) * 0.5;
                  this.§_-oa§.y = -(this.§_-oa§.height * 0.5 - 25);
               }
            }
            §_-2Y§.§_-QR§(§_-a9§.§_-i2Y§,PNGEncoder.encode(§_-93C§.getBitmapData(this.§_-oa§,new Point(50,50))),{
               "clanid":this.clanId,
               "type":1
            },this.§_-q1g§,this.§_-P14§);
            this.§_-oa§.x = 32;
            this.§_-oa§.y = 105;
            this.§_-oa§.scaleX = 1;
            this.§_-oa§.scaleY = 1;
            addChild(this.§_-oa§);
         }
         hide();
      }
      
      private function §_-53c§(param1:Event) : void
      {
         this.§_-y2E§ = (param1.currentTarget as MultipartURLLoader).loader.data;
         this.§_-Ct§();
      }
      
      private function §_-q1g§(param1:Event) : void
      {
         this.§_-51w§ = (param1.currentTarget as MultipartURLLoader).loader.data;
         this.§_-Ct§();
      }
      
      private function §_-Ct§() : void
      {
         if(this.§_-y2E§ == "" && this.§_-f27§ || this.§_-51w§ == "" && this.§_-u2b§)
         {
            return;
         }
         this.§_-81t§.§_-M24§ = this.§_-f27§ ? this.§_-y2E§ : this.§_-81t§.§_-M24§;
         this.§_-81t§.§_-cy§ = this.§_-u2b§ ? this.§_-51w§ : this.§_-81t§.§_-cy§;
         this.§_-81t§.save();
         this.§_-f27§ = false;
         this.§_-u2b§ = false;
         §_-e2W§.request(this.clanId,§_-Oy§.ALL);
      }
      
      private function §_-P14§(param1:Event) : void
      {
      }
      
      private function §_-k1A§(param1:Event = null) : void
      {
         this.§_-dV§.text = StringUtil.§_-uc§(Game.self["name"],150);
      }
      
      private function §_-m13§(param1:ByteArray = null) : void
      {
         if(param1)
         {
            this.§_-y2V§.loadBytes(param1);
         }
         else
         {
            this.§_-y2V§.load(this.§_-81t§.§_-M24§);
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(Game.self["clan_id"] == 0 || Game.self["clan_duty"] != Clan.§_-k1P§)
         {
            return;
         }
         switch(param1[0])
         {
            case §_-S2I§.§_-Wr§:
               §_-e2W§.request(this.clanId,§_-Oy§.ALL,true);
               break;
            case §_-S2I§.§_-f1Z§:
               this.§_-w2i§.show();
               break;
            case §_-S2I§.§_-43A§:
               this.§_-zU§.show();
         }
      }
   }
}


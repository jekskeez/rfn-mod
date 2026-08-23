package §_-I18§
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-bN§.Dialog;
   import §_-bN§.§_-Fk§;
   import §_-q2r§.MultipartURLLoader;
   import buttons.§_-K2G§;
   import by.blooddy.crypto.image.PNGEncoder;
   import events.§_-a1V§;
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
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   import utils.§_-L2J§;
   import utils.§_-O1T§;
   import utils.§_-S1m§;
   import utils.§_-fE§;
   import views.§_-236§;
   import views.§_-SZ§;
   
   public class §_-A3N§ extends Dialog
   {
      
      private static const §_-Q2D§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #573E11;","}","a {","text-decoration: none;","margin-right: 0px;","}","a:hover {","text-decoration: underline;","color: #0641EC;","}",".blue {","font-size: 18px;","color: #0641EC;","}"].join("\n");
      
      private static const §_-51p§:String = gls("Название");
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,5717521);
      
      private static const §_-d20§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,5717521,true);
      
      private static const §_-23W§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,5783050,null,null,null,null,null,null,null,null,null,2);
      
      private static const §_-xh§:TextFormat = new TextFormat(§_-i5§.§_-c10§,16,10917501,null,null,null,null,null,null,null,null,null,2);
      
      private var §_-Y1c§:§_-236§ = null;
      
      private var §_-d2q§:§_-SZ§ = null;
      
      private var clanId:int = 0;
      
      private var browse:Boolean = false;
      
      private var §_-H10§:FileReference = new FileReference();
      
      private var §_-B23§:String = "";
      
      private var §_-82l§:String = "";
      
      private var §_-SI§:Boolean = false;
      
      private var §_-C1r§:Boolean = false;
      
      private var §_-b19§:Clan = null;
      
      private var §_-BU§:§_-Fk§ = null;
      
      private var §_-Fa§:§_-Fk§ = null;
      
      private var §_-PY§:§_-Fk§ = null;
      
      private var §_-N2m§:TextField = null;
      
      private var §_-12Y§:§_-SZ§ = null;
      
      private var §_-d2F§:§_-i5§ = null;
      
      public function §_-A3N§()
      {
         super(gls("Редактирование"));
         this.init();
         §_-B2U§.listen(this.onClanLoaded);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-R1X§]);
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-b19§)
         {
            return;
         }
         this.§_-N2m§.defaultTextFormat = §_-23W§;
         this.§_-N2m§.text = this.§_-b19§.name;
         this.§_-A2A§();
      }
      
      public function set id(param1:int) : void
      {
         this.clanId = param1;
         if(§_-B2U§.§_-Q2g§(this.clanId).isLoaded())
         {
            this.onClanLoaded(new §_-a1V§(§_-B2U§.§_-Q2g§(this.clanId),false));
            return;
         }
         §_-B2U§.request(this.clanId,§_-eT§.ALL);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-BU§ = new §_-Fk§(gls("Смена имени"),gls("Клан с таким именем уже существует!\n "));
         this.§_-Fa§ = new §_-Fk§(gls("Смена имени"),gls("Не удалось сменить имя клана!"));
         this.§_-PY§ = new §_-Fk§(gls("Смена имени"),gls("Введите имя клана!"));
         var _loc2_:§_-i5§ = new §_-i5§(gls("<body>Изменение названия клана стоит <b>{0}</b></body>",§_-Q2D§),2,10,_loc1_);
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
         this.§_-N2m§ = new TextField();
         this.§_-N2m§.x = 7;
         this.§_-N2m§.y = 31;
         this.§_-N2m§.width = 220;
         this.§_-N2m§.height = 30;
         this.§_-N2m§.type = TextFieldType.INPUT;
         this.§_-N2m§.defaultTextFormat = §_-23W§;
         this.§_-N2m§.maxChars = §_-Zy§.§_-u2H§;
         this.§_-N2m§.addEventListener(FocusEvent.FOCUS_IN,this.§_-i17§);
         this.§_-N2m§.addEventListener(FocusEvent.FOCUS_OUT,this.§_-A2A§);
         this.§_-N2m§.restrict = "a-zA-Z а-яёА-ЯЁ[0-9]-";
         addChild(this.§_-N2m§);
         §_-L2J§.embedFonts(this.§_-N2m§);
         var _loc5_:§_-i5§ = new §_-i5§(gls("Добавьте изображения:"),44,65,§_-W2P§);
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
         var _loc8_:§_-i5§ = new §_-i5§("50x50",74,84,§_-W2P§);
         addChild(_loc8_);
         this.§_-Y1c§ = new §_-236§("",32,105);
         addChild(this.§_-Y1c§);
         var _loc9_:ButtonSelectAvatar = new ButtonSelectAvatar();
         _loc9_.x = 82;
         _loc9_.y = 145;
         _loc9_.addEventListener(MouseEvent.CLICK,this.§_-M4§);
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
         var _loc12_:§_-i5§ = new §_-i5§("10x10",188,84,§_-W2P§);
         addChild(_loc12_);
         this.§_-d2q§ = new §_-SZ§("",167,125);
         addChild(this.§_-d2q§);
         var _loc13_:ButtonSelectAvatar = new ButtonSelectAvatar();
         _loc13_.x = 197;
         _loc13_.y = 145;
         _loc13_.addEventListener(MouseEvent.CLICK,this.§_-i1B§);
         addChild(_loc13_);
         var _loc14_:Sprite = new Sprite();
         _loc14_.graphics.beginFill(15524553);
         _loc14_.graphics.drawRoundRectComplex(2,185,224,30,5,5,5,5);
         _loc14_.graphics.endFill();
         addChild(_loc14_);
         this.§_-12Y§ = new §_-SZ§("",13,194);
         addChild(this.§_-12Y§);
         this.§_-d2F§ = new §_-i5§("",28,190,§_-d20§);
         addChild(this.§_-d2F§);
         var _loc15_:§_-K2G§ = new §_-K2G§(gls("Сохранить"),124,14,this.§_-HQ§);
         _loc15_.x = 2;
         _loc15_.y = 230;
         addChild(_loc15_);
         var _loc16_:§_-K2G§ = new §_-K2G§(gls("Отмена"),96,14,this.§_-m1O§);
         _loc16_.§_-I29§();
         _loc16_.x = 130;
         _loc16_.y = 230;
         addChild(_loc16_);
         place();
         this.height += 53;
      }
      
      private function §_-i17§(param1:FocusEvent) : void
      {
         this.§_-N2m§.defaultTextFormat = §_-23W§;
         this.§_-N2m§.text = this.§_-N2m§.text == §_-51p§ ? "" : this.§_-N2m§.text;
      }
      
      private function §_-A2A§(param1:FocusEvent = null) : void
      {
         if(this.§_-N2m§.text != "" && this.§_-N2m§.text != §_-51p§)
         {
            return;
         }
         this.§_-N2m§.defaultTextFormat = §_-xh§;
         this.§_-N2m§.text = §_-51p§;
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         if(this.clanId != param1.§_-b19§.id || param1.§_-03C§)
         {
            return;
         }
         this.§_-b19§ = param1.§_-b19§;
         this.§_-N2m§.text = param1.§_-b19§.name;
         this.§_-d2q§.load(param1.§_-b19§.§_-o1p§);
         this.§_-Y1c§.load(param1.§_-b19§.§_-51L§);
         this.§_-16§();
         this.§_-v2w§();
      }
      
      private function §_-i1B§(param1:Event) : void
      {
         if(this.browse)
         {
            return;
         }
         this.browse = true;
         this.§_-H10§.addEventListener(Event.SELECT,this.§_-K1Z§);
         this.§_-H10§.addEventListener(Event.CANCEL,this.§_-2v§);
         this.§_-H10§.browse();
      }
      
      private function §_-M4§(param1:Event) : void
      {
         if(this.browse)
         {
            return;
         }
         this.browse = true;
         this.§_-H10§.addEventListener(Event.SELECT,this.§_-n2N§);
         this.§_-H10§.addEventListener(Event.CANCEL,this.§_-2v§);
         this.§_-H10§.browse();
      }
      
      private function §_-K1Z§(param1:Event) : void
      {
         var onLoaded:Function = null;
         var e:Event = param1;
         this.browse = false;
         onLoaded = function(param1:Event):void
         {
            §_-H10§.removeEventListener(Event.COMPLETE,onLoaded);
            §_-d2q§.loadBytes(§_-H10§.data);
            §_-C1r§ = true;
            §_-v2w§(§_-H10§.data);
         };
         this.§_-H10§.addEventListener(Event.COMPLETE,onLoaded);
         this.§_-H10§.removeEventListener(Event.SELECT,this.§_-K1Z§);
         this.§_-H10§.removeEventListener(Event.CANCEL,this.§_-2v§);
         this.§_-H10§.load();
      }
      
      private function §_-n2N§(param1:Event) : void
      {
         var onLoaded:Function = null;
         var e:Event = param1;
         this.browse = false;
         onLoaded = function(param1:Event):void
         {
            §_-H10§.removeEventListener(Event.COMPLETE,onLoaded);
            §_-Y1c§.loadBytes(§_-H10§.data);
            §_-SI§ = true;
         };
         this.§_-H10§.addEventListener(Event.COMPLETE,onLoaded);
         this.§_-H10§.removeEventListener(Event.SELECT,this.§_-n2N§);
         this.§_-H10§.removeEventListener(Event.CANCEL,this.§_-2v§);
         this.§_-H10§.load();
      }
      
      private function §_-2v§(param1:Event) : void
      {
         this.browse = false;
         this.§_-H10§.removeEventListener(Event.SELECT,this.§_-n2N§);
         this.§_-H10§.removeEventListener(Event.SELECT,this.§_-K1Z§);
         this.§_-H10§.removeEventListener(Event.CANCEL,this.§_-2v§);
      }
      
      private function get §_-H19§() : Boolean
      {
         return this.§_-N2m§.text != this.§_-b19§.name;
      }
      
      private function §_-m1O§(param1:MouseEvent) : void
      {
         close();
      }
      
      private function §_-HQ§(param1:MouseEvent) : void
      {
         if(this.§_-H19§)
         {
            if(this.§_-N2m§.text == "" || this.§_-N2m§.text == §_-A3N§.§_-51p§)
            {
               this.§_-PY§.show();
               return;
            }
            if(!§_-Qw§.§_-L16§(name))
            {
               new §_-Fk§(gls("Ошибка"),gls("Имя должно быть цензурным")).show();
               return;
            }
            if(this.§_-b19§.coins < §_-Q2D§)
            {
               new §_-hC§(gls("У твоего клана недостаточно денег для изменения имени.\nПополни бюджет клана.")).show();
            }
            else
            {
               Connection.§_-e2T§(§_-u1O§.§_-512§,§_-S1m§.§_-o15§(this.§_-N2m§.text));
            }
         }
         if(this.§_-C1r§)
         {
            if(this.§_-d2q§.width == 10 || this.§_-d2q§.height == 10)
            {
               if(this.§_-d2q§.width > this.§_-d2q§.height)
               {
                  this.§_-d2q§.scaleX = 1 + (10 - this.§_-d2q§.height) / this.§_-d2q§.height;
                  this.§_-d2q§.scaleY = 1 + (10 - this.§_-d2q§.height) / this.§_-d2q§.height;
                  this.§_-d2q§.y = -(this.§_-d2q§.width - this.§_-d2q§.height) * 0.5;
                  this.§_-d2q§.x = -(this.§_-d2q§.width * 0.5 - 5);
               }
               else
               {
                  this.§_-d2q§.scaleY = 1 + (10 - this.§_-d2q§.width) / this.§_-d2q§.width;
                  this.§_-d2q§.scaleX = 1 + (10 - this.§_-d2q§.width) / this.§_-d2q§.width;
                  this.§_-d2q§.x = -(this.§_-d2q§.height - this.§_-d2q§.width) * 0.5;
                  this.§_-d2q§.y = -(this.§_-d2q§.height * 0.5 - 5);
               }
            }
            §_-fE§.§_-U1r§(§_-Zy§.§_-y2I§,PNGEncoder.encode(§_-O1T§.getBitmapData(this.§_-d2q§,new Point(10,10))),{
               "clanid":this.clanId,
               "type":0
            },this.§_-o1T§,this.§_-EN§);
            this.§_-d2q§.scaleX = 1;
            this.§_-d2q§.scaleY = 1;
            this.§_-d2q§.x = 167;
            this.§_-d2q§.y = 125;
            addChild(this.§_-d2q§);
         }
         if(this.§_-SI§)
         {
            this.§_-Y1c§.x = 0;
            this.§_-Y1c§.y = 0;
            if(this.§_-Y1c§.width == 50 || this.§_-Y1c§.height == 50)
            {
               if(this.§_-Y1c§.width > this.§_-Y1c§.height)
               {
                  this.§_-Y1c§.scaleX = 1 + (50 - this.§_-Y1c§.height) / this.§_-Y1c§.height;
                  this.§_-Y1c§.scaleY = 1 + (50 - this.§_-Y1c§.height) / this.§_-Y1c§.height;
                  this.§_-Y1c§.y = -(this.§_-Y1c§.width - this.§_-Y1c§.height) * 0.5;
                  this.§_-Y1c§.x = -(this.§_-Y1c§.width * 0.5 - 25);
               }
               else
               {
                  this.§_-Y1c§.scaleY = 1 + (50 - this.§_-Y1c§.width) / this.§_-Y1c§.width;
                  this.§_-Y1c§.scaleX = 1 + (50 - this.§_-Y1c§.width) / this.§_-Y1c§.width;
                  this.§_-Y1c§.x = -(this.§_-Y1c§.height - this.§_-Y1c§.width) * 0.5;
                  this.§_-Y1c§.y = -(this.§_-Y1c§.height * 0.5 - 25);
               }
            }
            §_-fE§.§_-U1r§(§_-Zy§.§_-y2I§,PNGEncoder.encode(§_-O1T§.getBitmapData(this.§_-Y1c§,new Point(50,50))),{
               "clanid":this.clanId,
               "type":1
            },this.§_-43T§,this.§_-EN§);
            this.§_-Y1c§.x = 32;
            this.§_-Y1c§.y = 105;
            this.§_-Y1c§.scaleX = 1;
            this.§_-Y1c§.scaleY = 1;
            addChild(this.§_-Y1c§);
         }
         hide();
      }
      
      private function §_-o1T§(param1:Event) : void
      {
         this.§_-82l§ = (param1.currentTarget as MultipartURLLoader).loader.data;
         this.§_-i1m§();
      }
      
      private function §_-43T§(param1:Event) : void
      {
         this.§_-B23§ = (param1.currentTarget as MultipartURLLoader).loader.data;
         this.§_-i1m§();
      }
      
      private function §_-i1m§() : void
      {
         if(this.§_-82l§ == "" && this.§_-C1r§ || this.§_-B23§ == "" && this.§_-SI§)
         {
            return;
         }
         this.§_-b19§.§_-o1p§ = this.§_-C1r§ ? this.§_-82l§ : this.§_-b19§.§_-o1p§;
         this.§_-b19§.§_-51L§ = this.§_-SI§ ? this.§_-B23§ : this.§_-b19§.§_-51L§;
         this.§_-b19§.save();
         this.§_-C1r§ = false;
         this.§_-SI§ = false;
         §_-B2U§.request(this.clanId,§_-eT§.ALL);
      }
      
      private function §_-EN§(param1:Event) : void
      {
      }
      
      private function §_-16§(param1:Event = null) : void
      {
         this.§_-d2F§.text = StringUtil.§_-hB§(Game.self["name"],150);
      }
      
      private function §_-v2w§(param1:ByteArray = null) : void
      {
         if(param1)
         {
            this.§_-12Y§.loadBytes(param1);
         }
         else
         {
            this.§_-12Y§.load(this.§_-b19§.§_-o1p§);
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(Game.self["clan_id"] == 0 || Game.self["clan_duty"] != Clan.§_-01X§)
         {
            return;
         }
         switch(param1[0])
         {
            case §_-s2l§.§_-YU§:
               §_-B2U§.request(this.clanId,§_-eT§.ALL,true);
               break;
            case §_-s2l§.§_-K1O§:
               this.§_-BU§.show();
               break;
            case §_-s2l§.§_-h2L§:
               this.§_-Fa§.show();
         }
      }
   }
}


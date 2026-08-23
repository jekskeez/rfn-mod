package §_-bN§
{
   import §_-01t§.§_-62c§;
   import §_-01t§.§_-p1O§;
   import §_-01t§.§_-u1B§;
   import §_-X1k§.§_-5E§;
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-HZ§;
   import §_-c2C§.§_-j2f§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import com.IBank;
   import com.api.Services;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.StringUtil;
   import utils.§_-K1Y§;
   import utils.§_-p1r§;
   import utils.§_-r1G§;
   
   public class §_-Sg§ extends Dialog implements IBank
   {
      
      public static const §_-7G§:int = 0;
      
      public static const §_-23U§:int = 1;
      
      private static var _instance:§_-Sg§;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 17px;","color: #000000;","font-weight: bold;","}",".red {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","color: #FF7E3F;","font-size: 25px;","}",".small {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","color: #FF7E3F;","font-size: 10px;","}",".brown","{","font-size: 15px;","color: #62411A;","}",".brownBig","{","text-align: center;","font-size: 18px;","color: #62411A;","font-weight: bold;","}"].join("\n");
      
      public static const §_-13A§:Array = [new BevelFilter(1,45,16777062,1,13369344,1,1,1),new GlowFilter(6697728,1,3,3,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private var style:StyleSheet = null;
      
      private var §_-Mg§:Sprite = null;
      
      private var §_-o23§:§_-p1O§ = null;
      
      private var §_-S8§:§_-Hg§ = null;
      
      private var §_-y1H§:§_-62c§ = null;
      
      private var §_-NQ§:§_-62c§ = null;
      
      private var §_-C3D§:Array = [];
      
      private var §_-q2R§:Array = [];
      
      private var §_-u21§:Boolean = false;
      
      public function §_-Sg§()
      {
         super(gls("Банк"),true,true,null,false);
         _instance = this;
         this.sound = "bank";
      }
      
      public static function get instance() : §_-Sg§
      {
         if(_instance == null)
         {
            _instance = new §_-Sg§();
         }
         return _instance;
      }
      
      override public function show() : void
      {
         if(!this.§_-u21§)
         {
            this.init();
         }
         super.show();
         this.§_-o23§.visible = true;
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-aU§);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         if(this.§_-o23§)
         {
            this.§_-o23§.visible = false;
         }
      }
      
      public function open(param1:int = -1) : void
      {
         var tab:int = param1;
         tab = tab == -1 ? §_-7G§ : tab;
         §_-U2d§.load(function():void
         {
            show();
            §_-Sg§.instance.§_-S8§.§_-n10§(tab);
         });
      }
      
      public function buy(param1:int) : void
      {
         var _loc2_:Object = null;
         §_-73Q§.§_-R1R§ = false;
         for each(_loc2_ in this.§_-C3D§)
         {
            if(_loc2_.offer_id == param1)
            {
               Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-na§);
               break;
            }
         }
         if(!Game.§_-sl§)
         {
            this.hide();
         }
      }
      
      public function buyNuts(param1:int) : void
      {
         this.hide();
         Game.buy(§_-u1O§.§_-q2g§,param1,0,Game.selfId);
      }
      
      public function getPriceString(param1:Number) : String
      {
         var _loc2_:Number = this.getPayment(param1);
         return !§_-Zy§.§_-BI§ ? "$" + _loc2_ : _loc2_ + " " + StringUtil.word(this.currencyName,int(_loc2_));
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,29,16763904,null,null,null,null,null,"center");
      }
      
      override protected function effectOpen() : void
      {
      }
      
      protected function get currencyName() : String
      {
         return "₽";
      }
      
      protected function getPayment(param1:Number) : Number
      {
         return param1;
      }
      
      private function init() : void
      {
         this.§_-u21§ = true;
         this.§_-C3D§ = this.buildCoinsOffers();
         this.§_-q2R§ = §_-HZ§.bank.nuts_exchange;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.§_-Mg§ = new Sprite();
         addChild(this.§_-Mg§);
         this.§_-S8§ = new §_-Hg§();
         var _loc1_:Class = ButtonBankTabDouble;
         var _loc2_:int = 0;
         this.§_-y1H§ = this.createTab(gls("Монеты"),ImageIconCoins,this.§_-C3D§,this.buy,_loc1_,1.1);
         this.§_-y1H§.x = _loc2_;
         this.§_-Mg§.addChild(this.§_-y1H§);
         _loc2_ = this.insertTab(§_-7G§,_loc2_);
         this.§_-NQ§ = this.createTab(gls("Орехи"),ImageIconNut,this.§_-q2R§,this.buyNuts,_loc1_,1.1);
         this.§_-NQ§.x = _loc2_;
         this.§_-Mg§.addChild(this.§_-NQ§);
         _loc2_ = this.insertTab(§_-23U§,_loc2_);
         this.§_-Mg§.addChild(this.§_-S8§);
         this.§_-S8§.§_-n10§(0);
         this.tabBoxPosition(new Point(16,0));
         this.§_-o23§ = new §_-p1O§(this.buy);
         this.§_-o23§.x = 435;
         this.§_-o23§.y = 10;
         this.§_-o23§.visible = false;
         this.§_-Mg§.addChild(this.§_-o23§);
         var _loc3_:§_-i5§ = new §_-i5§("<body>" + §_-r1G§.span(gls("Заходи каждый день, чтобы цепочка бонусов не прервалась!"),"brown") + "</body>",0,360,this.style);
         _loc3_.x = int((865 - _loc3_.textWidth) * 0.5);
         addChild(_loc3_);
         var _loc4_:§_-u1B§ = new §_-u1B§();
         _loc4_.y = 445;
         addChild(_loc4_);
         place();
         this.width = 885;
         this.height = 600;
         this.updateButtons();
         this.addButtonOffer();
      }
      
      private function addButtonOffer() : void
      {
         var buttonOffer:Sprite;
         var bg:ButtonBankItem;
         var colorMatrix:§_-p1r§;
         var field:§_-i5§;
         if(!Game.§_-Z9§)
         {
            return;
         }
         buttonOffer = new Sprite();
         bg = new ButtonBankItem();
         colorMatrix = new §_-p1r§();
         colorMatrix.§_-xC§(0,0,100,9);
         bg.filters = [new ColorMatrixFilter(colorMatrix)];
         buttonOffer.addChild(bg);
         bg.width = 389;
         bg.height = 45;
         buttonOffer.x = 25;
         buttonOffer.y = 299;
         buttonOffer.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            Services.showOffers("squirrels",Game.selfId);
         });
         this.§_-Mg§.addChild(buttonOffer);
         field = new §_-i5§("<body>" + §_-r1G§.span(gls("Получи -  бесплатно!"),"brownBig") + "</body>",0,10,this.style,387);
         field.mouseEnabled = false;
         buttonOffer.addChild(field);
         §_-K1Y§.§_-P2W§(field,"-",ImageIconCoins,0.9,0.9,field.x + 5,-10,true);
      }
      
      private function tabBoxPosition(param1:Point) : void
      {
         this.§_-Mg§.graphics.clear();
         this.§_-Mg§.graphics.lineStyle(3,15522236);
         this.§_-Mg§.graphics.beginFill(16774885,1);
         this.§_-Mg§.graphics.drawRect(param1.x + 4,param1.y + 50,400,298);
         this.§_-Mg§.graphics.endFill();
         this.§_-S8§.y = param1.y + 9;
         this.§_-S8§.x = param1.x;
         this.§_-y1H§.x = param1.x + 9;
         this.§_-y1H§.y = param1.y + 79 - (Game.§_-Z9§ ? 24 : 0);
         this.§_-NQ§.x = param1.x + 9;
         this.§_-NQ§.y = param1.y + 79 - (Game.§_-Z9§ ? 24 : 0);
      }
      
      private function addButton(param1:int, param2:int) : void
      {
         switch(param2)
         {
            case §_-7G§:
               this.§_-y1H§.add(param1,true);
               break;
            case §_-23U§:
               this.§_-NQ§.add(param1,true);
         }
      }
      
      private function createTab(param1:String, param2:Class, param3:Array, param4:Function, param5:Class, param6:Number = 1) : §_-62c§
      {
         var _loc7_:§_-uH§ = new §_-uH§(new §_-Q1W§(param1,§_-j2f§.§_-D12§,param5,11,14));
         var _loc8_:Sprite = new param2();
         _loc8_.scaleX = _loc8_.scaleY = param6;
         _loc8_.x = 18;
         _loc8_.y = 10;
         _loc8_.mouseEnabled = false;
         _loc7_.addChild(_loc8_);
         var _loc9_:§_-62c§ = new §_-62c§(param3,param2,param4,param4 == this.buyNuts);
         this.§_-S8§.insert(_loc7_,_loc9_);
         return _loc9_;
      }
      
      private function insertTab(param1:int, param2:int) : int
      {
         var _loc3_:DisplayObject = this.§_-S8§.§_-a3§[param1];
         _loc3_.x = param2;
         return _loc3_.x + _loc3_.width + 3;
      }
      
      private function updateButtons() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-C3D§.length)
         {
            this.addButton(_loc1_,§_-7G§);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§_-q2R§.length)
         {
            this.addButton(_loc1_,§_-23U§);
            _loc1_++;
         }
      }
      
      private function buildCoinsOffers() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc1_:Array = [];
         for each(_loc2_ in §_-HZ§.bank.coins_offers)
         {
            _loc3_ = §_-5E§.§_-W2r§(_loc2_);
            _loc4_ = §_-A3y§.§_-B3F§(_loc3_.reward_id);
            _loc1_.push({
               "offer_id":_loc2_,
               "price":(§_-Zy§.§_-BI§ ? _loc3_.price_rub : _loc3_.price_usd),
               "count":_loc4_.content.coins,
               "bonus":_loc3_.benefit || 0
            });
         }
         return _loc1_;
      }
   }
}


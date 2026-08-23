package §_-k1c§
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-428§;
   import §_-I10§.§_-B2§;
   import §_-I10§.§_-t2V§;
   import §_-T2y§.§_-J2n§;
   import §_-Z24§.§_-3§;
   import §_-Z24§.§_-Gy§;
   import §_-Z24§.§_-L1d§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
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
   import protocol.§_-h2B§;
   import utils.StringUtil;
   import utils.§_-jB§;
   import utils.§_-nO§;
   import utils.§_-xb§;
   
   public class §_-7O§ extends Dialog implements IBank
   {
      
      public static const §_-s1Z§:int = 0;
      
      public static const §_-K2P§:int = 1;
      
      private static var _instance:§_-7O§;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 17px;","color: #000000;","font-weight: bold;","}",".red {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","color: #FF7E3F;","font-size: 25px;","}",".small {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","color: #FF7E3F;","font-size: 10px;","}",".brown","{","font-size: 15px;","color: #62411A;","}",".brownBig","{","text-align: center;","font-size: 18px;","color: #62411A;","font-weight: bold;","}"].join("\n");
      
      public static const §_-w1P§:Array = [new BevelFilter(1,45,16777062,1,13369344,1,1,1),new GlowFilter(6697728,1,3,3,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private var style:StyleSheet = null;
      
      private var §_-T2X§:Sprite = null;
      
      private var §_-s14§:§_-L1d§ = null;
      
      private var §_-EE§:§_-G2L§ = null;
      
      private var §_-f1j§:§_-Gy§ = null;
      
      private var §_-y2O§:§_-Gy§ = null;
      
      private var §_-o1Q§:Array = [];
      
      private var §_-12p§:Array = [];
      
      private var §_-P20§:Boolean = false;
      
      public function §_-7O§()
      {
         super(gls("Банк"),true,true,null,false);
         _instance = this;
         this.sound = "bank";
      }
      
      public static function get instance() : §_-7O§
      {
         if(_instance == null)
         {
            _instance = new §_-7O§();
         }
         return _instance;
      }
      
      override public function show() : void
      {
         if(!this.§_-P20§)
         {
            this.init();
         }
         super.show();
         this.§_-s14§.visible = true;
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-Q§);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         if(this.§_-s14§)
         {
            this.§_-s14§.visible = false;
         }
      }
      
      public function open(param1:int = -1) : void
      {
         var tab:int = param1;
         tab = tab == -1 ? §_-s1Z§ : tab;
         §_-EI§.load(function():void
         {
            show();
            §_-7O§.instance.§_-EE§.§_-vC§(tab);
         });
      }
      
      public function buy(param1:int) : void
      {
         var _loc2_:Object = null;
         §_-K1r§.§_-O1P§ = false;
         for each(_loc2_ in this.§_-o1Q§)
         {
            if(_loc2_.offer_id == param1)
            {
               Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-tQ§);
               break;
            }
         }
         if(!Game.§_-m1n§)
         {
            this.hide();
         }
      }
      
      public function buyNuts(param1:int) : void
      {
         this.hide();
         Game.buy(§_-h2B§.§_-fp§,param1,0,Game.selfId);
      }
      
      public function getPriceString(param1:Number) : String
      {
         var _loc2_:Number = this.getPayment(param1);
         return !§_-a9§.§_-sc§ ? "$" + _loc2_ : _loc2_ + " " + StringUtil.word(this.currencyName,int(_loc2_));
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,29,16763904,null,null,null,null,null,"center");
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
         this.§_-P20§ = true;
         this.§_-o1Q§ = this.buildCoinsOffers();
         this.§_-12p§ = §_-t2V§.bank.nuts_exchange;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.§_-T2X§ = new Sprite();
         addChild(this.§_-T2X§);
         this.§_-EE§ = new §_-G2L§();
         var _loc1_:Class = ButtonBankTabDouble;
         var _loc2_:int = 0;
         this.§_-f1j§ = this.createTab(gls("Монеты"),ImageIconCoins,this.§_-o1Q§,this.buy,_loc1_,1.1);
         this.§_-f1j§.x = _loc2_;
         this.§_-T2X§.addChild(this.§_-f1j§);
         _loc2_ = this.insertTab(§_-s1Z§,_loc2_);
         this.§_-y2O§ = this.createTab(gls("Орехи"),ImageIconNut,this.§_-12p§,this.buyNuts,_loc1_,1.1);
         this.§_-y2O§.x = _loc2_;
         this.§_-T2X§.addChild(this.§_-y2O§);
         _loc2_ = this.insertTab(§_-K2P§,_loc2_);
         this.§_-T2X§.addChild(this.§_-EE§);
         this.§_-EE§.§_-vC§(0);
         this.tabBoxPosition(new Point(16,0));
         this.§_-s14§ = new §_-L1d§(this.buy);
         this.§_-s14§.x = 435;
         this.§_-s14§.y = 10;
         this.§_-s14§.visible = false;
         this.§_-T2X§.addChild(this.§_-s14§);
         var _loc3_:§_-22V§ = new §_-22V§("<body>" + §_-xb§.span(gls("Заходи каждый день, чтобы цепочка бонусов не прервалась!"),"brown") + "</body>",0,360,this.style);
         _loc3_.x = int((865 - _loc3_.textWidth) * 0.5);
         addChild(_loc3_);
         var _loc4_:§_-3§ = new §_-3§();
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
         var colorMatrix:§_-nO§;
         var field:§_-22V§;
         if(!Game.§_-S2k§)
         {
            return;
         }
         buttonOffer = new Sprite();
         bg = new ButtonBankItem();
         colorMatrix = new §_-nO§();
         colorMatrix.§_-bb§(0,0,100,9);
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
         this.§_-T2X§.addChild(buttonOffer);
         field = new §_-22V§("<body>" + §_-xb§.span(gls("Получи -  бесплатно!"),"brownBig") + "</body>",0,10,this.style,387);
         field.mouseEnabled = false;
         buttonOffer.addChild(field);
         §_-jB§.§_-fG§(field,"-",ImageIconCoins,0.9,0.9,field.x + 5,-10,true);
      }
      
      private function tabBoxPosition(param1:Point) : void
      {
         this.§_-T2X§.graphics.clear();
         this.§_-T2X§.graphics.lineStyle(3,15522236);
         this.§_-T2X§.graphics.beginFill(16774885,1);
         this.§_-T2X§.graphics.drawRect(param1.x + 4,param1.y + 50,400,298);
         this.§_-T2X§.graphics.endFill();
         this.§_-EE§.y = param1.y + 9;
         this.§_-EE§.x = param1.x;
         this.§_-f1j§.x = param1.x + 9;
         this.§_-f1j§.y = param1.y + 79 - (Game.§_-S2k§ ? 24 : 0);
         this.§_-y2O§.x = param1.x + 9;
         this.§_-y2O§.y = param1.y + 79 - (Game.§_-S2k§ ? 24 : 0);
      }
      
      private function addButton(param1:int, param2:int) : void
      {
         switch(param2)
         {
            case §_-s1Z§:
               this.§_-f1j§.add(param1,true);
               break;
            case §_-K2P§:
               this.§_-y2O§.add(param1,true);
         }
      }
      
      private function createTab(param1:String, param2:Class, param3:Array, param4:Function, param5:Class, param6:Number = 1) : §_-Gy§
      {
         var _loc7_:§_-F1F§ = new §_-F1F§(new §_-T2z§(param1,§_-J2n§.§_-HM§,param5,11,14));
         var _loc8_:Sprite = new param2();
         _loc8_.scaleX = _loc8_.scaleY = param6;
         _loc8_.x = 18;
         _loc8_.y = 10;
         _loc8_.mouseEnabled = false;
         _loc7_.addChild(_loc8_);
         var _loc9_:§_-Gy§ = new §_-Gy§(param3,param2,param4,param4 == this.buyNuts);
         this.§_-EE§.insert(_loc7_,_loc9_);
         return _loc9_;
      }
      
      private function insertTab(param1:int, param2:int) : int
      {
         var _loc3_:DisplayObject = this.§_-EE§.§_-Y2N§[param1];
         _loc3_.x = param2;
         return _loc3_.x + _loc3_.width + 3;
      }
      
      private function updateButtons() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-o1Q§.length)
         {
            this.addButton(_loc1_,§_-s1Z§);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.§_-12p§.length)
         {
            this.addButton(_loc1_,§_-K2P§);
            _loc1_++;
         }
      }
      
      private function buildCoinsOffers() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc1_:Array = [];
         for each(_loc2_ in §_-t2V§.bank.coins_offers)
         {
            _loc3_ = §_-B2§.§_-P2D§(_loc2_);
            _loc4_ = §_-428§.§_-d1u§(_loc3_.reward_id);
            _loc1_.push({
               "offer_id":_loc2_,
               "price":(§_-a9§.§_-sc§ ? _loc3_.price_rub : _loc3_.price_usd),
               "count":_loc4_.content.coins,
               "bonus":_loc3_.benefit || 0
            });
         }
         return _loc1_;
      }
   }
}


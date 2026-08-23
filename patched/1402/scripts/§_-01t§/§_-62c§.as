package §_-01t§
{
   import §_-X1k§.§_-Wd§;
   import §_-bN§.§_-Sg§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.StyleSheet;
   import utils.§_-K1Y§;
   import utils.§_-r1G§;
   
   public class §_-62c§ extends Sprite
   {
      
      private static const §_-Qm§:int = 5;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 17px;","color: #64431C;","font-weight: bold;","}",".red {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","color: #FF7E3F;","font-size: 24px;","}",".small {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","color: #FF7E3F;","font-size: 9px;","}",".brown","{","font-size: 15px;","color: #62411A;","font-weight: bold;","}",".def","{","font-size: 17px;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var buttonsArray:Array = null;
      
      private var §_-p2f§:Function = null;
      
      private var data:Array = null;
      
      private var image:Class = null;
      
      private var §_-I2c§:Boolean = false;
      
      public function §_-62c§(param1:Array, param2:Class, param3:Function, param4:Boolean = false)
      {
         super();
         this.data = param1;
         this.image = param2;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.buttonsArray = [];
         this.§_-p2f§ = param3;
         this.§_-I2c§ = param4;
      }
      
      public function button(param1:int) : DisplayObject
      {
         return this.buttonsArray[param1];
      }
      
      public function add(param1:int, param2:Boolean) : void
      {
         var _loc13_:DiscountImage = null;
         var _loc14_:§_-i5§ = null;
         var _loc3_:int = int(this.data[param1].count);
         var _loc4_:Number = Number(this.data[param1].price);
         var _loc5_:Boolean = false;
         var _loc6_:Sprite = new Sprite();
         _loc6_.x = int(param1 / §_-Qm§) * 420;
         _loc6_.y = param1 % §_-Qm§ * (Game.§_-Z9§ ? 48.6 : 53);
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-A16§);
         addChild(_loc6_);
         var _loc7_:ButtonBankItem = new ButtonBankItem();
         _loc6_.addChild(_loc7_);
         _loc7_.width = 389;
         _loc7_.height = 47;
         var _loc8_:String = int(_loc3_).toString();
         var _loc9_:§_-i5§ = new §_-i5§("<body>" + §_-r1G§.span(_loc8_,"def") + "</body>",15,12,this.style);
         _loc9_.mouseEnabled = false;
         _loc6_.addChild(_loc9_);
         if(_loc5_)
         {
            _loc13_ = new DiscountImage();
            _loc13_.mouseEnabled = false;
            _loc13_.x = _loc9_.x + _loc9_.textWidth + 10;
            _loc13_.y = _loc9_.y + int((_loc9_.textHeight - _loc13_.height) * 0.5);
            _loc6_.addChild(_loc13_);
            _loc9_ = new §_-i5§("<body>" + §_-r1G§.span(int(_loc3_ * 2).toString(),"def") + "</body>",0,12,this.style);
            _loc9_.mouseEnabled = false;
            _loc9_.x = _loc13_.x + int((_loc13_.width - _loc9_.textWidth) * 0.5) - 3;
            _loc9_.filters = [new DropShadowFilter(0,0,16777215,1,4,4,4)];
            _loc6_.addChild(_loc9_);
         }
         var _loc10_:DisplayObjectContainer = new this.image();
         _loc10_.mouseEnabled = false;
         _loc10_.x = _loc5_ ? _loc13_.x + _loc13_.width : _loc9_.x + _loc9_.textWidth + 10;
         _loc10_.y = 11;
         _loc6_.addChild(_loc10_);
         if(!_loc5_ && this.§_-41I§(param1) > 0 && param2)
         {
            _loc9_ = new §_-i5§("<body>" + §_-r1G§.span("+" + this.§_-41I§(param1),"red") + "</body>",_loc10_.x + _loc10_.width + 10,2,this.style);
            _loc9_.mouseEnabled = false;
            _loc9_.filters = §_-Sg§.§_-13A§;
            _loc6_.addChild(_loc9_);
            _loc10_ = new this.image();
            _loc10_.mouseEnabled = false;
            _loc10_.x = _loc9_.x + _loc9_.textWidth + 5;
            _loc10_.y = 5;
            _loc6_.addChild(_loc10_);
            _loc14_ = new §_-i5§("<body>" + §_-r1G§.span(gls("В подарок!"),"small") + "</body>",0,_loc9_.y + _loc9_.textHeight - 7,this.style);
            _loc14_.x = _loc9_.x + int((_loc9_.textWidth + _loc10_.width + 5 - _loc14_.textWidth) * 0.5);
            _loc14_.mouseEnabled = false;
            _loc14_.filters = §_-Sg§.§_-13A§;
            _loc6_.addChild(_loc14_);
         }
         var _loc11_:String = this.§_-I2c§ ? _loc4_ + " -  " : §_-Sg§.instance.getPriceString(_loc4_);
         _loc9_ = new §_-i5§("<body>" + _loc11_ + "</body>",0,12,this.style);
         _loc9_.mouseEnabled = false;
         _loc9_.x = 284 - _loc9_.textWidth;
         _loc6_.addChild(_loc9_);
         §_-K1Y§.§_-P2W§(_loc9_,"-",ImageIconCoins,0.6,0.6,-_loc9_.x,-15,false,false);
         var _loc12_:§_-K2G§ = new §_-K2G§(gls("купить"));
         _loc12_.x = 293;
         _loc12_.y = 9;
         _loc6_.addChild(_loc12_);
         this.buttonsArray.push(_loc6_);
      }
      
      private function §_-41I§(param1:int) : int
      {
         return this.data[param1].count * this.data[param1].bonus / 100;
      }
      
      private function §_-A16§(param1:MouseEvent) : void
      {
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            if(param1.currentTarget == this.buttonsArray[_loc2_])
            {
               this.§_-p2f§(this.data[_loc2_].offer_id);
               break;
            }
            _loc2_++;
         }
      }
   }
}


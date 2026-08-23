package §_-Z24§
{
   import §_-I10§.§_-S16§;
   import §_-k1c§.§_-7O§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.StyleSheet;
   import utils.§_-jB§;
   import utils.§_-xb§;
   
   public class §_-Gy§ extends Sprite
   {
      
      private static const §_-A3J§:int = 5;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 17px;","color: #64431C;","font-weight: bold;","}",".red {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","color: #FF7E3F;","font-size: 24px;","}",".small {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","color: #FF7E3F;","font-size: 9px;","}",".brown","{","font-size: 15px;","color: #62411A;","font-weight: bold;","}",".def","{","font-size: 17px;","}"].join("\n");
      
      private var style:StyleSheet = null;
      
      private var buttonsArray:Array = null;
      
      private var §_-d2a§:Function = null;
      
      private var data:Array = null;
      
      private var image:Class = null;
      
      private var §_-S2X§:Boolean = false;
      
      public function §_-Gy§(param1:Array, param2:Class, param3:Function, param4:Boolean = false)
      {
         super();
         this.data = param1;
         this.image = param2;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.buttonsArray = [];
         this.§_-d2a§ = param3;
         this.§_-S2X§ = param4;
      }
      
      public function button(param1:int) : DisplayObject
      {
         return this.buttonsArray[param1];
      }
      
      public function add(param1:int, param2:Boolean) : void
      {
         var _loc13_:DiscountImage = null;
         var _loc14_:§_-22V§ = null;
         var _loc3_:int = int(this.data[param1].count);
         var _loc4_:Number = Number(this.data[param1].price);
         var _loc5_:Boolean = false;
         var _loc6_:Sprite = new Sprite();
         _loc6_.x = int(param1 / §_-A3J§) * 420;
         _loc6_.y = param1 % §_-A3J§ * (Game.§_-S2k§ ? 48.6 : 53);
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-42c§);
         addChild(_loc6_);
         var _loc7_:ButtonBankItem = new ButtonBankItem();
         _loc6_.addChild(_loc7_);
         _loc7_.width = 389;
         _loc7_.height = 47;
         var _loc8_:String = int(_loc3_).toString();
         var _loc9_:§_-22V§ = new §_-22V§("<body>" + §_-xb§.span(_loc8_,"def") + "</body>",15,12,this.style);
         _loc9_.mouseEnabled = false;
         _loc6_.addChild(_loc9_);
         if(_loc5_)
         {
            _loc13_ = new DiscountImage();
            _loc13_.mouseEnabled = false;
            _loc13_.x = _loc9_.x + _loc9_.textWidth + 10;
            _loc13_.y = _loc9_.y + int((_loc9_.textHeight - _loc13_.height) * 0.5);
            _loc6_.addChild(_loc13_);
            _loc9_ = new §_-22V§("<body>" + §_-xb§.span(int(_loc3_ * 2).toString(),"def") + "</body>",0,12,this.style);
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
         if(!_loc5_ && this.§_-f1n§(param1) > 0 && param2)
         {
            _loc9_ = new §_-22V§("<body>" + §_-xb§.span("+" + this.§_-f1n§(param1),"red") + "</body>",_loc10_.x + _loc10_.width + 10,2,this.style);
            _loc9_.mouseEnabled = false;
            _loc9_.filters = §_-7O§.§_-w1P§;
            _loc6_.addChild(_loc9_);
            _loc10_ = new this.image();
            _loc10_.mouseEnabled = false;
            _loc10_.x = _loc9_.x + _loc9_.textWidth + 5;
            _loc10_.y = 5;
            _loc6_.addChild(_loc10_);
            _loc14_ = new §_-22V§("<body>" + §_-xb§.span(gls("В подарок!"),"small") + "</body>",0,_loc9_.y + _loc9_.textHeight - 7,this.style);
            _loc14_.x = _loc9_.x + int((_loc9_.textWidth + _loc10_.width + 5 - _loc14_.textWidth) * 0.5);
            _loc14_.mouseEnabled = false;
            _loc14_.filters = §_-7O§.§_-w1P§;
            _loc6_.addChild(_loc14_);
         }
         var _loc11_:String = this.§_-S2X§ ? _loc4_ + " -  " : §_-7O§.instance.getPriceString(_loc4_);
         _loc9_ = new §_-22V§("<body>" + _loc11_ + "</body>",0,12,this.style);
         _loc9_.mouseEnabled = false;
         _loc9_.x = 284 - _loc9_.textWidth;
         _loc6_.addChild(_loc9_);
         §_-jB§.§_-fG§(_loc9_,"-",ImageIconCoins,0.6,0.6,-_loc9_.x,-15,false,false);
         var _loc12_:§_-j18§ = new §_-j18§(gls("купить"));
         _loc12_.x = 293;
         _loc12_.y = 9;
         _loc6_.addChild(_loc12_);
         this.buttonsArray.push(_loc6_);
      }
      
      private function §_-f1n§(param1:int) : int
      {
         return this.data[param1].count * this.data[param1].bonus / 100;
      }
      
      private function §_-42c§(param1:MouseEvent) : void
      {
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            if(param1.currentTarget == this.buttonsArray[_loc2_])
            {
               this.§_-d2a§(this.data[_loc2_].offer_id);
               break;
            }
            _loc2_++;
         }
      }
   }
}


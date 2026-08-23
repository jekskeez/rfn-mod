package §_-bN§
{
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-F1Z§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   
   public class §_-TB§ extends Dialog
   {
      
      private static var _instance:§_-TB§;
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private static const §_-m2n§:TextFormat = new TextFormat(null,12,6763521,true,null,null,null,null,"center");
      
      private static const §_-X2R§:Array = [gls("VIP на сутки за "),gls("VIP на неделю за "),gls("VIP на месяц за ")];
      
      private static var locationId:int = 0;
      
      private var textField:§_-i5§ = null;
      
      private var §_-lI§:Sprite = new Sprite();
      
      private var §_-AH§:Sprite = new Sprite();
      
      private var §_-Kn§:Vector.<§_-K2G§> = new Vector.<§_-K2G§>();
      
      public function §_-TB§()
      {
         super(gls("Белка истощена"),true,true,null,false);
         this.textField = new §_-i5§("",0,0,§_-m2n§);
         this.textField.width = 625;
         this.textField.wordWrap = true;
         addChild(this.textField);
         this.§_-Bb§();
         this.§_-82A§();
         place();
         this.height += 30;
         this.§_-x2T§.x -= 25;
      }
      
      public static function show(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new §_-TB§();
         }
         locationId = param1;
         _instance.show();
      }
      
      override public function show() : void
      {
         this.textField.text = gls("Для начала игры на локации «{0}» нужно хотя бы {1} энергии\nТы можешь пополнить запас энергии, купив:",§_-at§.§_-13l§(locationId).name,§_-at§.§_-13l§(locationId).cost);
         super.show();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 15;
         this.§_-7N§ = -5;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      private function §_-Bb§() : void
      {
         var _loc6_:Sprite = null;
         var _loc7_:§_-i5§ = null;
         var _loc8_:§_-K2G§ = null;
         this.§_-lI§ = new Sprite();
         this.§_-lI§.y = 30;
         addChild(this.§_-lI§);
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-lI§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.§_-lI§.graphics.drawRect(-10,0,650,240);
         this.§_-lI§.graphics.beginFill(16250092);
         this.§_-lI§.graphics.lineStyle(2,16049098);
         this.§_-lI§.graphics.drawRoundRect(0,30,145,135,3);
         var _loc2_:DisplayObject = new VIPShopSmallImage();
         _loc2_.scaleX = _loc2_.scaleY = 1.5;
         _loc2_.x = 8;
         _loc2_.y = 40;
         this.§_-lI§.addChild(_loc2_);
         this.§_-lI§.addChild(new §_-i5§(gls("VIP статус"),150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-q2I§;
         var _loc3_:Array = [gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("Восстановление энергии\nдо максимума"),gls("+100 маны ежедневно"),gls("Одно бесплатное воскрешение на раунде"),gls("х2 скорость получения опыта белкой и шаманом"),gls("И многое другое!")];
         var _loc4_:Array = [ImageGetEnergy300Max,ImageGetEnergyRefill,ImageGetMana100Regen,ImageGetReborn,ImageGetDoubleExp,ImageGetVipTotal];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = new Sprite();
            _loc2_ = new _loc4_[_loc5_]();
            _loc6_.addChild(_loc2_);
            _loc7_ = new §_-i5§(_loc3_[_loc5_],_loc2_.width + 10,0,§_-W2P§);
            _loc7_.wordWrap = true;
            _loc7_.width = 140;
            _loc7_.y = (_loc2_.height - _loc7_.textHeight) * 0.5 - 2;
            _loc6_.addChild(_loc7_);
            _loc6_.x = 150 + _loc5_ % 2 * 240;
            _loc6_.y = 25 + int(_loc5_ * 0.5) * 60;
            this.§_-lI§.addChild(_loc6_);
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < §_-X2R§.length)
         {
            _loc8_ = new §_-K2G§(§_-X2R§[_loc5_] + "  -   " + §_-93H§.§_-z1K§(_loc5_),200);
            _loc8_.x = 5 + _loc5_ * 210;
            _loc8_.y = 200;
            _loc8_.name = _loc5_.toString();
            _loc8_.addEventListener(MouseEvent.CLICK,this.§_-G1Q§);
            this.§_-lI§.addChild(_loc8_);
            §_-K1Y§.§_-P2W§(_loc8_.field,"-",ImageIconCoins,0.7,0.7,-_loc8_.field.x + 5,-3,false,false);
            this.§_-Kn§.push(_loc8_);
            _loc5_++;
         }
      }
      
      private function §_-82A§() : void
      {
         var matrix:Matrix;
         var image:EnergyGlassBigImage;
         var field:§_-i5§;
         var button:§_-K2G§;
         var item:Object = §_-sL§.DATA[§_-sL§.§_-522§];
         this.§_-AH§ = new Sprite();
         this.§_-AH§.y = 270;
         addChild(this.§_-AH§);
         matrix = new Matrix();
         matrix.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-AH§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],matrix);
         this.§_-AH§.graphics.drawRect(-10,0,650,240);
         this.§_-AH§.graphics.beginFill(16250092);
         this.§_-AH§.graphics.lineStyle(2,16049098);
         this.§_-AH§.graphics.drawRoundRect(0,30,145,135,3);
         image = new EnergyGlassBigImage();
         image.x = 22;
         image.y = 31;
         this.§_-AH§.addChild(image);
         this.§_-AH§.addChild(new §_-i5§(item["title"],150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-q2I§;
         field = new §_-i5§(item["description"],150,25,§_-W2P§);
         field.wordWrap = true;
         field.width = 460;
         this.§_-AH§.addChild(field);
         button = new §_-K2G§(gls("Купить за") + "   -   " + §_-93H§.§_-p2p§(),200);
         button.x = 215;
         button.y = 200;
         button.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(Game.§_-u2z§(§_-u1O§.§_-A27§,§_-93H§.§_-p2p§(),0,Game.selfId))
            {
               hide();
            }
         });
         this.§_-AH§.addChild(button);
         §_-K1Y§.§_-P2W§(button.field,"-",ImageIconCoins,0.7,0.7,-button.field.x + 5,-3,false,false);
      }
      
      private function §_-G1Q§(param1:MouseEvent) : void
      {
         if(§_-F1Z§.buy(int(param1.currentTarget.name)))
         {
            hide();
         }
      }
   }
}


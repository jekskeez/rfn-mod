package §_-k1c§
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-Br§;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   
   public class §_-t1I§ extends Dialog
   {
      
      private static var _instance:§_-t1I§;
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private static const §_-h2m§:TextFormat = new TextFormat(null,12,6763521,true,null,null,null,null,"center");
      
      private static const §_-ZC§:Array = [gls("VIP на сутки за "),gls("VIP на неделю за "),gls("VIP на месяц за ")];
      
      private static var locationId:int = 0;
      
      private var textField:§_-22V§ = null;
      
      private var §_-4W§:Sprite = new Sprite();
      
      private var §_-72l§:Sprite = new Sprite();
      
      private var §_-u1N§:Vector.<§_-j18§> = new Vector.<§_-j18§>();
      
      public function §_-t1I§()
      {
         super(gls("Белка истощена"),true,true,null,false);
         this.textField = new §_-22V§("",0,0,§_-h2m§);
         this.textField.width = 625;
         this.textField.wordWrap = true;
         addChild(this.textField);
         this.§_-Q1j§();
         this.§_-k1F§();
         place();
         this.height += 30;
         this.§_-O2e§.x -= 25;
      }
      
      public static function show(param1:int) : void
      {
         if(_instance == null)
         {
            _instance = new §_-t1I§();
         }
         locationId = param1;
         _instance.show();
      }
      
      override public function show() : void
      {
         this.textField.text = gls("Для начала игры на локации «{0}» нужно хотя бы {1} энергии\nТы можешь пополнить запас энергии, купив:",§_-q1p§.§_-l29§(locationId).name,§_-q1p§.§_-l29§(locationId).cost);
         super.show();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 15;
         this.§_-4n§ = -5;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      private function §_-Q1j§() : void
      {
         var _loc6_:Sprite = null;
         var _loc7_:§_-22V§ = null;
         var _loc8_:§_-j18§ = null;
         this.§_-4W§ = new Sprite();
         this.§_-4W§.y = 30;
         addChild(this.§_-4W§);
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-4W§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.§_-4W§.graphics.drawRect(-10,0,650,240);
         this.§_-4W§.graphics.beginFill(16250092);
         this.§_-4W§.graphics.lineStyle(2,16049098);
         this.§_-4W§.graphics.drawRoundRect(0,30,145,135,3);
         var _loc2_:DisplayObject = new VIPShopSmallImage();
         _loc2_.scaleX = _loc2_.scaleY = 1.5;
         _loc2_.x = 8;
         _loc2_.y = 40;
         this.§_-4W§.addChild(_loc2_);
         this.§_-4W§.addChild(new §_-22V§(gls("VIP статус"),150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-m2A§;
         var _loc3_:Array = [gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("Восстановление энергии\nдо максимума"),gls("+100 маны ежедневно"),gls("Одно бесплатное воскрешение на раунде"),gls("х2 скорость получения опыта белкой и шаманом"),gls("И многое другое!")];
         var _loc4_:Array = [ImageGetEnergy300Max,ImageGetEnergyRefill,ImageGetMana100Regen,ImageGetReborn,ImageGetDoubleExp,ImageGetVipTotal];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = new Sprite();
            _loc2_ = new _loc4_[_loc5_]();
            _loc6_.addChild(_loc2_);
            _loc7_ = new §_-22V§(_loc3_[_loc5_],_loc2_.width + 10,0,§_-i2c§);
            _loc7_.wordWrap = true;
            _loc7_.width = 140;
            _loc7_.y = (_loc2_.height - _loc7_.textHeight) * 0.5 - 2;
            _loc6_.addChild(_loc7_);
            _loc6_.x = 150 + _loc5_ % 2 * 240;
            _loc6_.y = 25 + int(_loc5_ * 0.5) * 60;
            this.§_-4W§.addChild(_loc6_);
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < §_-ZC§.length)
         {
            _loc8_ = new §_-j18§(§_-ZC§[_loc5_] + "  -   " + §_-8S§.§_-7h§(_loc5_),200);
            _loc8_.x = 5 + _loc5_ * 210;
            _loc8_.y = 200;
            _loc8_.name = _loc5_.toString();
            _loc8_.addEventListener(MouseEvent.CLICK,this.§_-j24§);
            this.§_-4W§.addChild(_loc8_);
            §_-jB§.§_-fG§(_loc8_.field,"-",ImageIconCoins,0.7,0.7,-_loc8_.field.x + 5,-3,false,false);
            this.§_-u1N§.push(_loc8_);
            _loc5_++;
         }
      }
      
      private function §_-k1F§() : void
      {
         var matrix:Matrix;
         var image:EnergyGlassBigImage;
         var field:§_-22V§;
         var button:§_-j18§;
         var item:Object = §_-y1§.DATA[§_-y1§.§_-93q§];
         this.§_-72l§ = new Sprite();
         this.§_-72l§.y = 270;
         addChild(this.§_-72l§);
         matrix = new Matrix();
         matrix.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-72l§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],matrix);
         this.§_-72l§.graphics.drawRect(-10,0,650,240);
         this.§_-72l§.graphics.beginFill(16250092);
         this.§_-72l§.graphics.lineStyle(2,16049098);
         this.§_-72l§.graphics.drawRoundRect(0,30,145,135,3);
         image = new EnergyGlassBigImage();
         image.x = 22;
         image.y = 31;
         this.§_-72l§.addChild(image);
         this.§_-72l§.addChild(new §_-22V§(item["title"],150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-m2A§;
         field = new §_-22V§(item["description"],150,25,§_-i2c§);
         field.wordWrap = true;
         field.width = 460;
         this.§_-72l§.addChild(field);
         button = new §_-j18§(gls("Купить за") + "   -   " + §_-8S§.§_-1E§(),200);
         button.x = 215;
         button.y = 200;
         button.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(Game.§_-K2t§(§_-h2B§.§_-138§,§_-8S§.§_-1E§(),0,Game.selfId))
            {
               hide();
            }
         });
         this.§_-72l§.addChild(button);
         §_-jB§.§_-fG§(button.field,"-",ImageIconCoins,0.7,0.7,-button.field.x + 5,-3,false,false);
      }
      
      private function §_-j24§(param1:MouseEvent) : void
      {
         if(§_-Br§.buy(int(param1.currentTarget.name)))
         {
            hide();
         }
      }
   }
}


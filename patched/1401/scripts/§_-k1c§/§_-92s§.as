package §_-k1c§
{
   import §_-I10§.§_-8S§;
   import buttons.§_-j18§;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   
   public class §_-92s§ extends Dialog
   {
      
      private static var _instance:§_-92s§;
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private static const §_-h2m§:TextFormat = new TextFormat(null,12,6763521,true,null,null,null,null,"center");
      
      private static const §_-ZC§:Array = [gls("Купить на сутки за "),gls("Купить на неделю за ")];
      
      private var textField:§_-22V§ = null;
      
      private var §_-d1G§:Sprite = new Sprite();
      
      private var §_-y2F§:Sprite = new Sprite();
      
      private var §_-Y4§:Vector.<§_-j18§> = new Vector.<§_-j18§>();
      
      public function §_-92s§()
      {
         super(gls("Недостаточно маны"),true,true,null,false);
         this.textField = new §_-22V§("",0,0,§_-h2m§);
         this.textField.width = 625;
         this.textField.wordWrap = true;
         addChild(this.textField);
         this.§_-xY§();
         this.§_-yY§();
         place();
         this.height += 30;
         this.§_-O2e§.x -= 25;
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-92s§();
         }
         _instance.show();
      }
      
      override public function show() : void
      {
         this.textField.text = gls("Чтобы воспользоваться магией, тебе не хватает маны.\nТы можешь пополнить запас маны, купив:");
         super.show();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 15;
         this.§_-4n§ = -5;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      private function §_-xY§() : void
      {
         var _loc6_:§_-j18§ = null;
         var _loc1_:Object = §_-y1§.DATA[§_-y1§.§_-8J§];
         this.§_-d1G§ = new Sprite();
         this.§_-d1G§.y = 30;
         addChild(this.§_-d1G§);
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-d1G§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc2_);
         this.§_-d1G§.graphics.drawRect(-10,0,650,240);
         this.§_-d1G§.graphics.beginFill(16250092);
         this.§_-d1G§.graphics.lineStyle(2,16049098);
         this.§_-d1G§.graphics.drawRoundRect(0,30,145,135,3);
         var _loc3_:ManaRegenerationImage = new ManaRegenerationImage();
         _loc3_.scaleX = _loc3_.scaleY = 0.9;
         _loc3_.x = 10;
         _loc3_.y = 35;
         this.§_-d1G§.addChild(_loc3_);
         this.§_-d1G§.addChild(new §_-22V§(_loc1_["title"],150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-m2A§;
         var _loc4_:§_-22V§ = new §_-22V§(_loc1_["description"],150,25,§_-i2c§);
         _loc4_.wordWrap = true;
         _loc4_.width = 460;
         this.§_-d1G§.addChild(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < §_-ZC§.length)
         {
            _loc6_ = new §_-j18§(§_-ZC§[_loc5_] + "  -   " + §_-8S§.§_-Ln§(_loc5_),230);
            _loc6_.x = 80 + _loc5_ * 240;
            _loc6_.y = 200;
            _loc6_.name = _loc5_.toString();
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-hE§);
            this.§_-d1G§.addChild(_loc6_);
            §_-jB§.§_-fG§(_loc6_.field,"-",ImageIconCoins,0.7,0.7,-_loc6_.field.x + 5,-3,false,false);
            this.§_-Y4§.push(_loc6_);
            _loc5_++;
         }
      }
      
      private function §_-yY§() : void
      {
         var matrix:Matrix;
         var image:ManaGlassBigImage;
         var field:§_-22V§;
         var button:§_-j18§;
         var item:Object = §_-y1§.DATA[§_-y1§.§_-m2R§];
         this.§_-y2F§ = new Sprite();
         this.§_-y2F§.y = 270;
         addChild(this.§_-y2F§);
         matrix = new Matrix();
         matrix.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-y2F§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],matrix);
         this.§_-y2F§.graphics.drawRect(-10,0,650,240);
         this.§_-y2F§.graphics.beginFill(16250092);
         this.§_-y2F§.graphics.lineStyle(2,16049098);
         this.§_-y2F§.graphics.drawRoundRect(0,30,145,135,3);
         image = new ManaGlassBigImage();
         image.x = 22;
         image.y = 31;
         this.§_-y2F§.addChild(image);
         this.§_-y2F§.addChild(new §_-22V§(item["title"],150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-m2A§;
         field = new §_-22V§(item["description"],150,25,§_-i2c§);
         field.wordWrap = true;
         field.width = 460;
         this.§_-y2F§.addChild(field);
         button = new §_-j18§(gls("Купить за") + "   -   " + §_-8S§.§_-TA§(),230);
         button.x = 200;
         button.y = 200;
         button.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(Game.§_-K2t§(§_-h2B§.§_-W2d§,§_-8S§.§_-TA§(),0,Game.selfId))
            {
               hide();
            }
         });
         this.§_-y2F§.addChild(button);
         §_-jB§.§_-fG§(button.field,"-",ImageIconCoins,0.7,0.7,-button.field.x + 5,-3,false,false);
      }
      
      private function §_-hE§(param1:MouseEvent) : void
      {
         if(Game.§_-K2t§(§_-y1§.§_-eC§(§_-y1§.§_-8J§),§_-8S§.§_-Ln§(int(param1.currentTarget.name)),0,Game.selfId))
         {
            hide();
         }
      }
   }
}


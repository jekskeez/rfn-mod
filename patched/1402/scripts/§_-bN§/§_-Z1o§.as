package §_-bN§
{
   import §_-X1k§.§_-93H§;
   import buttons.§_-K2G§;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import utils.§_-K1Y§;
   
   public class §_-Z1o§ extends Dialog
   {
      
      private static var _instance:§_-Z1o§;
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private static const §_-m2n§:TextFormat = new TextFormat(null,12,6763521,true,null,null,null,null,"center");
      
      private static const §_-X2R§:Array = [gls("Купить на сутки за "),gls("Купить на неделю за ")];
      
      private var textField:§_-i5§ = null;
      
      private var §_-22I§:Sprite = new Sprite();
      
      private var §_-O1I§:Sprite = new Sprite();
      
      private var §_-2l§:Vector.<§_-K2G§> = new Vector.<§_-K2G§>();
      
      public function §_-Z1o§()
      {
         super(gls("Недостаточно маны"),true,true,null,false);
         this.textField = new §_-i5§("",0,0,§_-m2n§);
         this.textField.width = 625;
         this.textField.wordWrap = true;
         addChild(this.textField);
         this.§_-1Y§();
         this.§_-934§();
         place();
         this.height += 30;
         this.§_-x2T§.x -= 25;
      }
      
      public static function show() : void
      {
         if(_instance == null)
         {
            _instance = new §_-Z1o§();
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
         this.§_-01q§ = 15;
         this.§_-7N§ = -5;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      private function §_-1Y§() : void
      {
         var _loc6_:§_-K2G§ = null;
         var _loc1_:Object = §_-sL§.DATA[§_-sL§.§_-v1J§];
         this.§_-22I§ = new Sprite();
         this.§_-22I§.y = 30;
         addChild(this.§_-22I§);
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-22I§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc2_);
         this.§_-22I§.graphics.drawRect(-10,0,650,240);
         this.§_-22I§.graphics.beginFill(16250092);
         this.§_-22I§.graphics.lineStyle(2,16049098);
         this.§_-22I§.graphics.drawRoundRect(0,30,145,135,3);
         var _loc3_:ManaRegenerationImage = new ManaRegenerationImage();
         _loc3_.scaleX = _loc3_.scaleY = 0.9;
         _loc3_.x = 10;
         _loc3_.y = 35;
         this.§_-22I§.addChild(_loc3_);
         this.§_-22I§.addChild(new §_-i5§(_loc1_["title"],150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-q2I§;
         var _loc4_:§_-i5§ = new §_-i5§(_loc1_["description"],150,25,§_-W2P§);
         _loc4_.wordWrap = true;
         _loc4_.width = 460;
         this.§_-22I§.addChild(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < §_-X2R§.length)
         {
            _loc6_ = new §_-K2G§(§_-X2R§[_loc5_] + "  -   " + §_-93H§.§_-63a§(_loc5_),230);
            _loc6_.x = 80 + _loc5_ * 240;
            _loc6_.y = 200;
            _loc6_.name = _loc5_.toString();
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-v2h§);
            this.§_-22I§.addChild(_loc6_);
            §_-K1Y§.§_-P2W§(_loc6_.field,"-",ImageIconCoins,0.7,0.7,-_loc6_.field.x + 5,-3,false,false);
            this.§_-2l§.push(_loc6_);
            _loc5_++;
         }
      }
      
      private function §_-934§() : void
      {
         var matrix:Matrix;
         var image:ManaGlassBigImage;
         var field:§_-i5§;
         var button:§_-K2G§;
         var item:Object = §_-sL§.DATA[§_-sL§.§_-t25§];
         this.§_-O1I§ = new Sprite();
         this.§_-O1I§.y = 270;
         addChild(this.§_-O1I§);
         matrix = new Matrix();
         matrix.createGradientBox(650,240,Math.PI * 0.5,0,0);
         this.§_-O1I§.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],matrix);
         this.§_-O1I§.graphics.drawRect(-10,0,650,240);
         this.§_-O1I§.graphics.beginFill(16250092);
         this.§_-O1I§.graphics.lineStyle(2,16049098);
         this.§_-O1I§.graphics.drawRoundRect(0,30,145,135,3);
         image = new ManaGlassBigImage();
         image.x = 22;
         image.y = 31;
         this.§_-O1I§.addChild(image);
         this.§_-O1I§.addChild(new §_-i5§(item["title"],150,0,Dialog.FORMAT_CAPTION_16)).filters = Dialog.§_-q2I§;
         field = new §_-i5§(item["description"],150,25,§_-W2P§);
         field.wordWrap = true;
         field.width = 460;
         this.§_-O1I§.addChild(field);
         button = new §_-K2G§(gls("Купить за") + "   -   " + §_-93H§.§_-te§(),230);
         button.x = 200;
         button.y = 200;
         button.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(Game.§_-u2z§(§_-u1O§.§_-gh§,§_-93H§.§_-te§(),0,Game.selfId))
            {
               hide();
            }
         });
         this.§_-O1I§.addChild(button);
         §_-K1Y§.§_-P2W§(button.field,"-",ImageIconCoins,0.7,0.7,-button.field.x + 5,-3,false,false);
      }
      
      private function §_-v2h§(param1:MouseEvent) : void
      {
         if(Game.§_-u2z§(§_-sL§.§_-iM§(§_-sL§.§_-v1J§),§_-93H§.§_-63a§(int(param1.currentTarget.name)),0,Game.selfId))
         {
            hide();
         }
      }
   }
}


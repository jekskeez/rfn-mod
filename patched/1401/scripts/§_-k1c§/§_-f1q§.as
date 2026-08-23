package §_-k1c§
{
   import §_-I10§.§_-My§;
   import buttons.§_-j18§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-73l§;
   import utils.§_-y2L§;
   
   public class §_-f1q§ extends Dialog
   {
      
      private static const WIDTH:int = 440;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 13px;","color: #000000;","font-weight: bold;","text-align: center;","letter-spacing: -1;","}",".redText {","color: #D95F00;","}",".blue {","font-size: 16px;","color: #008DED;","}",".green {","font-size: 16px;","color: #38CC00;","}"].join("\n");
      
      private static var §_-E1A§:Array = null;
      
      private static var §_-K1z§:Array = [1,0.75,0.6];
      
      private var §_-w1l§:String = "";
      
      private var title:String = "";
      
      private var level:int = 0;
      
      private var §_-J2v§:Sprite = null;
      
      private var §_-82m§:Array = null;
      
      public function §_-f1q§(param1:int)
      {
         super(gls("Поздравляем!"));
         this.level = param1;
         this.title = §_-My§.§_-bh§(this.level);
         this.§_-w1l§ = §_-q1p§.§_-Cc§(this.level);
         this.sound = "level_up";
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-z2t§,Game.self["type"]);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,29,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 1;
         this.§_-4n§ = 0;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      private function init() : void
      {
         var _loc10_:Object = null;
         var _loc11_:§_-j18§ = null;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         this.§_-J2v§ = new Sprite();
         this.§_-J2v§.mouseChildren = false;
         this.§_-J2v§.mouseEnabled = false;
         this.§_-82m§ = [];
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(this.§_-1b§(new ImageGetCoins(),gls("1 золотая монета")));
         _loc2_.addChild(this.§_-1b§(new ImageGetPowers(),gls("Мана и энергия\nвосстановлены")));
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.numChildren)
         {
            _loc2_.getChildAt(_loc3_).x = _loc3_ % 2 * 190 + (_loc3_ == _loc2_.numChildren - 1 && _loc3_ % 2 == 0 ? 95 : 0);
            _loc2_.getChildAt(_loc3_).y = int(_loc3_ * 0.5) * 50;
            _loc3_++;
         }
         this.§_-42P§(_loc2_);
         if(this.§_-w1l§ != "")
         {
            this.§_-42P§(gls("<body>Открыта локация <span class = \'redText\'>«{0}»</span></body>",this.§_-w1l§));
         }
         if(this.level == §_-My§.§_-U1R§)
         {
            this.§_-42P§(gls("<body>Теперь тебе доступны <span class = \'redText\'>Кланы</span></body>"));
         }
         var _loc4_:§_-22V§ = new §_-22V§(gls("Ты достиг нового уровня"),0,0,new TextFormat(null,18,6700045,true));
         _loc4_.x = int((WIDTH - _loc4_.textWidth) * 0.5);
         addChild(_loc4_);
         var _loc5_:Sprite = new Sprite();
         _loc5_.y = _loc4_.y + _loc4_.height;
         var _loc6_:ImageLevelUpBack = new ImageLevelUpBack();
         _loc5_.addChild(_loc6_);
         var _loc7_:Sprite = this.§_-M1b§(this.level);
         _loc7_.x = int((_loc6_.width - _loc7_.width) * 0.5);
         _loc7_.y = 77;
         _loc5_.addChild(_loc7_);
         _loc5_.x = int((WIDTH - _loc5_.width) * 0.5);
         addChild(_loc5_);
         var _loc8_:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,9200957);
         _loc8_.align = TextFormatAlign.CENTER;
         var _loc9_:§_-22V§ = new §_-22V§(gls("Твоя награда:"),0,0,_loc8_);
         _loc9_.y = _loc5_.y + _loc5_.height - 20;
         _loc9_.mouseEnabled = false;
         _loc9_.wordWrap = true;
         _loc9_.width = WIDTH;
         _loc9_.visible = this.§_-82m§.length > 0;
         addChild(_loc9_);
         this.§_-J2v§.y = _loc9_.y + _loc9_.height + 5;
         this.§_-J2v§.x = (WIDTH - this.§_-J2v§.width) * 0.5 - 4;
         addChild(this.§_-J2v§);
         if(§_-73l§.§_-01o§ && this.level < 200)
         {
            _loc11_ = new §_-j18§(gls("Получить и рассказать всем"));
            _loc11_.addEventListener(MouseEvent.CLICK,this.§_-93t§);
            _loc11_.x = int((WIDTH - _loc11_.width) * 0.5) + 15;
            _loc11_.y = this.§_-J2v§.y + this.§_-J2v§.height + 5;
            addChild(_loc11_);
         }
         for each(_loc10_ in this.§_-82m§)
         {
            _loc10_.x = int((this.§_-J2v§.width - _loc10_.width) * 0.5);
         }
         place();
         this.height += 55;
         this.§_-O2e§.x -= 20;
      }
      
      private function §_-42P§(param1:Object) : void
      {
         var _loc2_:StyleSheet = null;
         var _loc3_:§_-22V§ = null;
         if(param1 is String)
         {
            _loc2_ = new StyleSheet();
            _loc2_.parseCSS(§_-I2U§);
            _loc3_ = new §_-22V§(param1 as String,0,0,_loc2_);
            _loc3_.y = this.§_-82m§.length ? this.§_-J2v§.height : 0;
            this.§_-J2v§.addChild(_loc3_);
            this.§_-82m§.push(_loc3_);
         }
         else if(param1 is DisplayObject)
         {
            param1.y = this.§_-82m§.length ? this.§_-J2v§.height : 0;
            this.§_-J2v§.addChild(param1 as DisplayObject);
            this.§_-82m§.push(param1);
         }
      }
      
      private function §_-1b§(param1:DisplayObject, param2:String) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         param1.scaleX = param1.scaleY = 0.75;
         _loc3_.addChild(param1);
         var _loc4_:§_-22V§ = new §_-22V§(param2,45,0,new TextFormat(null,12,6763521,true));
         _loc4_.y = 20 - int(_loc4_.textHeight * 0.5) - 2;
         _loc3_.addChild(_loc4_);
         return _loc3_;
      }
      
      private function §_-93t§(param1:MouseEvent) : void
      {
         var _loc2_:String = Game.stage.quality;
         §_-y2L§.§_-af§(StageQuality.HIGH);
         var _loc3_:Sprite = new Sprite();
         var _loc4_:ImageLevelUpBack = new ImageLevelUpBack();
         _loc4_.x = -84;
         _loc4_.y = -22;
         _loc3_.addChild(_loc4_);
         var _loc5_:Sprite = this.§_-M1b§(this.level);
         _loc5_.x = 130 - int(_loc5_.width * 0.5);
         _loc5_.y = 53;
         _loc3_.addChild(_loc5_);
         var _loc6_:DisplayObject = §_-k2X§.§_-81z§();
         _loc6_.scaleX = _loc6_.scaleY = §_-a9§.§_-sc§ ? 1 : 0.5;
         _loc6_.x = int((280 - _loc6_.width) * 0.5);
         _loc6_.y = 275 - _loc6_.height;
         _loc3_.addChild(_loc6_);
         var _loc7_:BitmapData = new BitmapData(280,280);
         _loc7_.draw(_loc3_);
         §_-E1s§.save(_loc7_,this.level.toString(),false);
         §_-73l§.place(Game.self,§_-73l§.WALL_EXP,this.level,new Bitmap(_loc7_),gls("У меня уже {0} уровень «{1}» в игре Трагедия Белок ",this.level,this.title));
         §_-y2L§.§_-af§(_loc2_);
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-A1J§,0);
         hide();
      }
      
      private function get §_-Pp§() : Array
      {
         if(!§_-E1A§)
         {
            §_-E1A§ = [ImageLevelUp0,ImageLevelUp1,ImageLevelUp2,ImageLevelUp3,ImageLevelUp4,ImageLevelUp5,ImageLevelUp6,ImageLevelUp7,ImageLevelUp8,ImageLevelUp9];
         }
         return §_-E1A§;
      }
      
      private function §_-M1b§(param1:int) : Sprite
      {
         var _loc3_:int = 0;
         var _loc2_:Sprite = new Sprite();
         if(param1 == 0)
         {
            _loc2_.addChild(new ImageLevelUp0());
         }
         else
         {
            while(param1 > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.numChildren)
               {
                  _loc2_.getChildAt(_loc3_).x = _loc2_.getChildAt(_loc3_).x + 35;
                  _loc3_++;
               }
               _loc2_.addChildAt(new this.§_-Pp§[param1 % 10](),0).x = 15;
               param1 = int(param1 / 10);
            }
         }
         _loc2_.scaleX = _loc2_.scaleY = §_-K1z§[_loc2_.numChildren - 1];
         return _loc2_;
      }
   }
}


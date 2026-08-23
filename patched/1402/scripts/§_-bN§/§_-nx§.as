package §_-bN§
{
   import §_-X1k§.§_-XW§;
   import buttons.§_-K2G§;
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
   import protocol.§_-u1O§;
   import utils.§_-j2O§;
   import utils.§_-xD§;
   
   public class §_-nx§ extends Dialog
   {
      
      private static const WIDTH:int = 440;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 13px;","color: #000000;","font-weight: bold;","text-align: center;","letter-spacing: -1;","}",".redText {","color: #D95F00;","}",".blue {","font-size: 16px;","color: #008DED;","}",".green {","font-size: 16px;","color: #38CC00;","}"].join("\n");
      
      private static var §_-oB§:Array = null;
      
      private static var §_-P1z§:Array = [1,0.75,0.6];
      
      private var §_-S2W§:String = "";
      
      private var title:String = "";
      
      private var level:int = 0;
      
      private var §_-r1S§:Sprite = null;
      
      private var §_-q2J§:Array = null;
      
      public function §_-nx§(param1:int)
      {
         super(gls("Поздравляем!"));
         this.level = param1;
         this.title = §_-XW§.§_-3f§(this.level);
         this.§_-S2W§ = §_-at§.§_-h1b§(this.level);
         this.sound = "level_up";
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-C3A§,Game.self["type"]);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,29,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 1;
         this.§_-7N§ = 0;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      private function init() : void
      {
         var _loc10_:Object = null;
         var _loc11_:§_-K2G§ = null;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         this.§_-r1S§ = new Sprite();
         this.§_-r1S§.mouseChildren = false;
         this.§_-r1S§.mouseEnabled = false;
         this.§_-q2J§ = [];
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(this.§_-A2f§(new ImageGetCoins(),gls("1 золотая монета")));
         _loc2_.addChild(this.§_-A2f§(new ImageGetPowers(),gls("Мана и энергия\nвосстановлены")));
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.numChildren)
         {
            _loc2_.getChildAt(_loc3_).x = _loc3_ % 2 * 190 + (_loc3_ == _loc2_.numChildren - 1 && _loc3_ % 2 == 0 ? 95 : 0);
            _loc2_.getChildAt(_loc3_).y = int(_loc3_ * 0.5) * 50;
            _loc3_++;
         }
         this.§_-2c§(_loc2_);
         if(this.§_-S2W§ != "")
         {
            this.§_-2c§(gls("<body>Открыта локация <span class = \'redText\'>«{0}»</span></body>",this.§_-S2W§));
         }
         if(this.level == §_-XW§.§_-I1V§)
         {
            this.§_-2c§(gls("<body>Теперь тебе доступны <span class = \'redText\'>Кланы</span></body>"));
         }
         var _loc4_:§_-i5§ = new §_-i5§(gls("Ты достиг нового уровня"),0,0,new TextFormat(null,18,6700045,true));
         _loc4_.x = int((WIDTH - _loc4_.textWidth) * 0.5);
         addChild(_loc4_);
         var _loc5_:Sprite = new Sprite();
         _loc5_.y = _loc4_.y + _loc4_.height;
         var _loc6_:ImageLevelUpBack = new ImageLevelUpBack();
         _loc5_.addChild(_loc6_);
         var _loc7_:Sprite = this.§_-O1t§(this.level);
         _loc7_.x = int((_loc6_.width - _loc7_.width) * 0.5);
         _loc7_.y = 77;
         _loc5_.addChild(_loc7_);
         _loc5_.x = int((WIDTH - _loc5_.width) * 0.5);
         addChild(_loc5_);
         var _loc8_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,9200957);
         _loc8_.align = TextFormatAlign.CENTER;
         var _loc9_:§_-i5§ = new §_-i5§(gls("Твоя награда:"),0,0,_loc8_);
         _loc9_.y = _loc5_.y + _loc5_.height - 20;
         _loc9_.mouseEnabled = false;
         _loc9_.wordWrap = true;
         _loc9_.width = WIDTH;
         _loc9_.visible = this.§_-q2J§.length > 0;
         addChild(_loc9_);
         this.§_-r1S§.y = _loc9_.y + _loc9_.height + 5;
         this.§_-r1S§.x = (WIDTH - this.§_-r1S§.width) * 0.5 - 4;
         addChild(this.§_-r1S§);
         if(§_-j2O§.§_-Ik§ && this.level < 200)
         {
            _loc11_ = new §_-K2G§(gls("Получить и рассказать всем"));
            _loc11_.addEventListener(MouseEvent.CLICK,this.§_-C3O§);
            _loc11_.x = int((WIDTH - _loc11_.width) * 0.5) + 15;
            _loc11_.y = this.§_-r1S§.y + this.§_-r1S§.height + 5;
            addChild(_loc11_);
         }
         for each(_loc10_ in this.§_-q2J§)
         {
            _loc10_.x = int((this.§_-r1S§.width - _loc10_.width) * 0.5);
         }
         place();
         this.height += 55;
         this.§_-x2T§.x -= 20;
      }
      
      private function §_-2c§(param1:Object) : void
      {
         var _loc2_:StyleSheet = null;
         var _loc3_:§_-i5§ = null;
         if(param1 is String)
         {
            _loc2_ = new StyleSheet();
            _loc2_.parseCSS(§_-aD§);
            _loc3_ = new §_-i5§(param1 as String,0,0,_loc2_);
            _loc3_.y = this.§_-q2J§.length ? this.§_-r1S§.height : 0;
            this.§_-r1S§.addChild(_loc3_);
            this.§_-q2J§.push(_loc3_);
         }
         else if(param1 is DisplayObject)
         {
            param1.y = this.§_-q2J§.length ? this.§_-r1S§.height : 0;
            this.§_-r1S§.addChild(param1 as DisplayObject);
            this.§_-q2J§.push(param1);
         }
      }
      
      private function §_-A2f§(param1:DisplayObject, param2:String) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         param1.scaleX = param1.scaleY = 0.75;
         _loc3_.addChild(param1);
         var _loc4_:§_-i5§ = new §_-i5§(param2,45,0,new TextFormat(null,12,6763521,true));
         _loc4_.y = 20 - int(_loc4_.textHeight * 0.5) - 2;
         _loc3_.addChild(_loc4_);
         return _loc3_;
      }
      
      private function §_-C3O§(param1:MouseEvent) : void
      {
         var _loc2_:String = Game.stage.quality;
         §_-xD§.§_-Z1c§(StageQuality.HIGH);
         var _loc3_:Sprite = new Sprite();
         var _loc4_:ImageLevelUpBack = new ImageLevelUpBack();
         _loc4_.x = -84;
         _loc4_.y = -22;
         _loc3_.addChild(_loc4_);
         var _loc5_:Sprite = this.§_-O1t§(this.level);
         _loc5_.x = 130 - int(_loc5_.width * 0.5);
         _loc5_.y = 53;
         _loc3_.addChild(_loc5_);
         var _loc6_:DisplayObject = §_-uR§.§_-t2O§();
         _loc6_.scaleX = _loc6_.scaleY = §_-Zy§.§_-BI§ ? 1 : 0.5;
         _loc6_.x = int((280 - _loc6_.width) * 0.5);
         _loc6_.y = 275 - _loc6_.height;
         _loc3_.addChild(_loc6_);
         var _loc7_:BitmapData = new BitmapData(280,280);
         _loc7_.draw(_loc3_);
         §_-m2d§.save(_loc7_,this.level.toString(),false);
         §_-j2O§.place(Game.self,§_-j2O§.WALL_EXP,this.level,new Bitmap(_loc7_),gls("У меня уже {0} уровень «{1}» в игре Трагедия Белок ",this.level,this.title));
         §_-xD§.§_-Z1c§(_loc2_);
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-l2e§,0);
         hide();
      }
      
      private function get §_-53x§() : Array
      {
         if(!§_-oB§)
         {
            §_-oB§ = [ImageLevelUp0,ImageLevelUp1,ImageLevelUp2,ImageLevelUp3,ImageLevelUp4,ImageLevelUp5,ImageLevelUp6,ImageLevelUp7,ImageLevelUp8,ImageLevelUp9];
         }
         return §_-oB§;
      }
      
      private function §_-O1t§(param1:int) : Sprite
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
               _loc2_.addChildAt(new this.§_-53x§[param1 % 10](),0).x = 15;
               param1 = int(param1 / 10);
            }
         }
         _loc2_.scaleX = _loc2_.scaleY = §_-P1z§[_loc2_.numChildren - 1];
         return _loc2_;
      }
   }
}


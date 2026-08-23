package §_-bN§
{
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-K0§;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-y10§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-K2G§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-j2O§;
   import views.§_-Y2D§;
   
   public class DialogRepost extends Dialog
   {
      
      private static var §_-oB§:Array = null;
      
      private var type:String;
      
      private var id:int;
      
      public function DialogRepost(param1:String, param2:int = 0)
      {
         super();
         §_-p2U§.add("DialogRepost.show()",param1,param2);
         this.type = param1;
         this.id = param2;
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-C3A§,Game.self["type"]);
      }
      
      private function init() : void
      {
         addChild(this.image);
         var _loc1_:§_-K2G§ = new §_-K2G§(gls("Поделиться"));
         _loc1_.x = 165 - int(_loc1_.width * 0.5);
         _loc1_.y = 315;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-a2n§);
         addChild(_loc1_);
         place();
         this.width = 360;
         this.height = 370;
      }
      
      private function get image() : Sprite
      {
         var _loc3_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:Class = null;
         var _loc1_:Sprite = new Sprite();
         _loc1_.x = -25;
         _loc1_.y = -25;
         var _loc2_:§_-i5§ = new §_-i5§("",0,0,Dialog.FORMAT_CAPTION_18_CENTER);
         _loc2_.filters = Dialog.§_-q2I§;
         var _loc4_:Sprite = new Sprite();
         switch(this.type)
         {
            case §_-j2O§.WALL_AWARD:
               _loc2_.text = gls("Я получил\nновое достижение!");
               _loc2_.x = 187;
               _loc2_.y = 71;
               _loc3_ = new RepostAwardImage();
               _loc3_.x = 60;
               _loc3_.y = 92;
               _loc5_ = §_-K0§.§_-e14§(this.id);
               _loc5_.addEventListener(MouseEvent.CLICK,this.§_-C1o§);
               _loc5_.width = _loc5_.height = 156;
               _loc4_.addChild(_loc5_);
               _loc4_.x = 114;
               _loc4_.y = 131;
               break;
            case §_-j2O§.WALL_COLLECTION_REGULAR:
               break;
            case §_-j2O§.WALL_COLLECTION_UNIQUE:
               _loc2_.text = gls("Я получил новый\nэлемент коллекции");
               _loc2_.x = 188;
               _loc2_.y = 70;
               _loc3_ = new RepostCollectionElementImage();
               _loc3_.x = 82;
               _loc3_.y = 110;
               _loc6_ = §_-42H§.§_-uI§(this.id);
               _loc4_.addChild(new _loc6_());
               _loc4_.scaleX = _loc4_.scaleY = 1.8;
               _loc4_.x = 185 - int(_loc4_.width * 0.5);
               _loc4_.y = 210 - int(_loc4_.height * 0.5);
               break;
            case §_-j2O§.WALL_COLLECTION_AWARD:
               _loc2_.text = gls("Я обменял коллекции\nна костюм скрэта!");
               _loc2_.x = 188;
               _loc2_.y = 68;
               _loc3_ = new RepostCollectionScratImage();
               _loc3_.x = 16;
               _loc3_.y = 96;
               _loc4_.addChild(new §_-Y2D§(§_-42H§.§_-Z1a§(this.id)));
               _loc4_.scaleX = _loc4_.scaleY = 2.3;
               _loc4_.x = 185 - int(_loc4_.width * 0.5);
               _loc4_.y = 240 - int(_loc4_.height * 0.5);
               break;
            case §_-j2O§.WALL_COLLECTION_EXCHANGE:
               break;
            case §_-j2O§.WALL_SHAMAN_EXP:
               _loc2_.text = gls("Я получил новый\nуровень шамана!");
               _loc2_.x = 190;
               _loc2_.y = 69;
               _loc3_ = new RepostShamanLevelImage();
               _loc3_.x = 50;
               _loc3_.y = 106;
               _loc4_.addChild(this.§_-O1t§(this.id));
               _loc4_.x = 187 - int(_loc4_.width * 0.5);
               _loc4_.y = 130 - int(_loc4_.height * 0.5);
         }
         _loc1_.addChild(_loc3_);
         _loc1_.addChild(_loc2_);
         _loc1_.addChild(_loc4_);
         _loc2_.x -= int(_loc2_.textWidth * 0.5);
         _loc2_.y -= int(_loc2_.textHeight * 0.5);
         return _loc1_;
      }
      
      private function §_-C1o§(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         §_-51A§.§_-h2w§(Game.selfId);
         §_-U2d§.load(function():void
         {
            §_-t2c§.show(§_-y10§.instance);
         });
      }
      
      private function §_-O1t§(param1:int) : Sprite
      {
         var _loc3_:int = 0;
         var _loc2_:Sprite = new Sprite();
         if(param1 == 0)
         {
            _loc2_.addChild(new RepostNumber0());
         }
         else
         {
            while(param1 > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.numChildren)
               {
                  _loc2_.getChildAt(_loc3_).x = _loc2_.getChildAt(_loc3_).x + 20;
                  _loc3_++;
               }
               _loc2_.addChildAt(new this.§_-53x§[param1 % 10](),0);
               param1 = int(param1 / 10);
            }
         }
         return _loc2_;
      }
      
      private function get §_-53x§() : Array
      {
         if(!§_-oB§)
         {
            §_-oB§ = [RepostNumber0,RepostNumber1,RepostNumber2,RepostNumber3,RepostNumber4,RepostNumber5,RepostNumber6,RepostNumber7,RepostNumber8,RepostNumber9];
         }
         return §_-oB§;
      }
      
      private function get bitmapData() : BitmapData
      {
         var _loc4_:DisplayObject = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:Class = null;
         var _loc1_:BitmapData = new BitmapData(280,280);
         var _loc2_:Sprite = new Sprite();
         var _loc3_:§_-i5§ = new §_-i5§("",0,0,Dialog.FORMAT_CAPTION_18_CENTER);
         _loc3_.filters = Dialog.§_-q2I§;
         var _loc5_:Sprite = new Sprite();
         switch(this.type)
         {
            case §_-j2O§.WALL_AWARD:
               _loc3_.text = gls("Я получил\nновое достижение!");
               _loc3_.x = 140;
               _loc3_.y = 28;
               _loc3_.width = 276;
               _loc3_.height = 50;
               _loc4_ = new RepostAwardImage();
               _loc4_.x = 7;
               _loc4_.y = 23;
               _loc7_ = §_-K0§.§_-e14§(this.id);
               _loc7_.width = _loc7_.height = 156;
               _loc5_.addChild(_loc7_);
               _loc5_.x = 61;
               _loc5_.y = 62;
               break;
            case §_-j2O§.WALL_COLLECTION_REGULAR:
               break;
            case §_-j2O§.WALL_COLLECTION_UNIQUE:
               _loc3_.text = gls("Я получил новый\nэлемент коллекции");
               _loc3_.x = 140;
               _loc3_.y = 30;
               _loc4_ = new RepostCollectionElementImage();
               _loc4_.x = 25;
               _loc4_.y = 50;
               _loc8_ = §_-42H§.§_-uI§(this.id);
               _loc5_.addChild(new _loc8_());
               _loc5_.scaleX = _loc5_.scaleY = 1.8;
               _loc5_.x = 130 - int(_loc5_.width * 0.5);
               _loc5_.y = 150 - int(_loc5_.height * 0.5);
               break;
            case §_-j2O§.WALL_COLLECTION_AWARD:
               _loc3_.text = gls("Я обменял коллекции\nна костюм скрэта!");
               _loc3_.x = 140;
               _loc3_.y = 26;
               _loc4_ = new RepostCollectionScratImage();
               _loc4_.scaleX = _loc4_.scaleY = 0.83;
               _loc4_.y = 14;
               _loc5_.addChild(new §_-Y2D§(§_-42H§.§_-Z1a§(this.id)));
               _loc5_.scaleX = _loc5_.scaleY = 1.9;
               _loc5_.x = 145 - int(_loc5_.width * 0.5);
               _loc5_.y = 130 - int(_loc5_.height * 0.5);
               break;
            case §_-j2O§.WALL_COLLECTION_EXCHANGE:
               break;
            case §_-j2O§.WALL_SHAMAN_EXP:
               _loc3_.text = gls("Я получил новый\nуровень шамана!");
               _loc3_.scaleX = _loc3_.scaleY = 0.87;
               _loc3_.x = 140;
               _loc3_.y = 28;
               _loc4_ = new RepostShamanLevelImage();
               _loc4_.scaleX = _loc4_.scaleY = 0.93;
               _loc4_.y = 52;
               _loc5_.addChild(this.§_-O1t§(this.id));
               _loc5_.x = 128 - int(_loc5_.width * 0.5);
               _loc5_.y = 75 - int(_loc5_.height * 0.5);
         }
         var _loc6_:DisplayObject = §_-uR§.§_-t2O§();
         _loc6_.scaleX = _loc6_.scaleY = §_-Zy§.§_-BI§ ? 1 : 0.5;
         _loc6_.x = int((280 - _loc6_.width) * 0.5);
         _loc6_.y = 275 - _loc6_.height;
         _loc2_.addChild(_loc4_);
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(_loc5_);
         _loc2_.addChild(_loc6_);
         _loc3_.x -= int(_loc3_.textWidth * 0.5);
         _loc3_.y -= int(_loc3_.textHeight * 0.5);
         _loc1_.draw(_loc2_);
         return _loc1_;
      }
      
      private function get text() : String
      {
         switch(this.type)
         {
            case §_-j2O§.WALL_AWARD:
               return §_-K0§.DATA[this.id]["awardText"];
            case §_-j2O§.WALL_COLLECTION_REGULAR:
               return gls("Я готов обменять «{0}» в игре Трагедия Белок",§_-42H§.§_-U13§[this.id]["tittle"]);
            case §_-j2O§.WALL_COLLECTION_UNIQUE:
               return gls("Мною собрана коллекция «{0}» в игре Трагедия Белок!",§_-42H§.§_-V10§[this.id]["collectionName"]);
            case §_-j2O§.WALL_COLLECTION_AWARD:
               return gls("Я получил награду за собранную коллекцию уникальных предметов в игре Трагедия Белок");
            case §_-j2O§.WALL_COLLECTION_EXCHANGE:
               return gls("Я обменялся в игре Трагедия Белок");
            case §_-j2O§.WALL_SHAMAN_EXP:
               return gls("Я получил новый уровень шамана! Играй в Трагедию белок вместе со мной.");
            default:
               return "";
         }
      }
      
      private function §_-a2n§(param1:MouseEvent) : void
      {
         var _loc2_:String = "";
         if(Game.stage.quality != StageQuality.HIGH)
         {
            _loc2_ = Game.stage.quality;
            Game.stage.quality = StageQuality.HIGH;
         }
         if(this.type == §_-j2O§.WALL_SHAMAN_EXP)
         {
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-T2n§);
         }
         §_-m2d§.save(this.bitmapData,"Package_" + this.id,false);
         §_-j2O§.place(Game.self,this.type,this.id,new Bitmap(this.bitmapData),this.text);
         if(_loc2_ != "")
         {
            Game.stage.quality = _loc2_;
         }
         Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-N2L§,1);
         hide();
      }
   }
}


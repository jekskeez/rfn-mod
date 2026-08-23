package §_-k1c§
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-O1T§;
   import §_-I10§.§_-vy§;
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-J29§;
   import buttons.§_-j18§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-73l§;
   import views.§_-W1y§;
   
   public class DialogRepost extends Dialog
   {
      
      private static var §_-E1A§:Array = null;
      
      private var type:String;
      
      private var id:int;
      
      public function DialogRepost(param1:String, param2:int = 0)
      {
         super();
         §_-TQ§.add("DialogRepost.show()",param1,param2);
         this.type = param1;
         this.id = param2;
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-z2t§,Game.self["type"]);
      }
      
      private function init() : void
      {
         addChild(this.image);
         var _loc1_:§_-j18§ = new §_-j18§(gls("Поделиться"));
         _loc1_.x = 165 - int(_loc1_.width * 0.5);
         _loc1_.y = 315;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-s§);
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
         var _loc2_:§_-22V§ = new §_-22V§("",0,0,Dialog.FORMAT_CAPTION_18_CENTER);
         _loc2_.filters = Dialog.§_-m2A§;
         var _loc4_:Sprite = new Sprite();
         switch(this.type)
         {
            case §_-73l§.WALL_AWARD:
               _loc2_.text = gls("Я получил\nновое достижение!");
               _loc2_.x = 187;
               _loc2_.y = 71;
               _loc3_ = new RepostAwardImage();
               _loc3_.x = 60;
               _loc3_.y = 92;
               _loc5_ = §_-O1T§.§_-81e§(this.id);
               _loc5_.addEventListener(MouseEvent.CLICK,this.§_-w1e§);
               _loc5_.width = _loc5_.height = 156;
               _loc4_.addChild(_loc5_);
               _loc4_.x = 114;
               _loc4_.y = 131;
               break;
            case §_-73l§.WALL_COLLECTION_REGULAR:
               break;
            case §_-73l§.WALL_COLLECTION_UNIQUE:
               _loc2_.text = gls("Я получил новый\nэлемент коллекции");
               _loc2_.x = 188;
               _loc2_.y = 70;
               _loc3_ = new RepostCollectionElementImage();
               _loc3_.x = 82;
               _loc3_.y = 110;
               _loc6_ = §_-vy§.§_-R2S§(this.id);
               _loc4_.addChild(new _loc6_());
               _loc4_.scaleX = _loc4_.scaleY = 1.8;
               _loc4_.x = 185 - int(_loc4_.width * 0.5);
               _loc4_.y = 210 - int(_loc4_.height * 0.5);
               break;
            case §_-73l§.WALL_COLLECTION_AWARD:
               _loc2_.text = gls("Я обменял коллекции\nна костюм скрэта!");
               _loc2_.x = 188;
               _loc2_.y = 68;
               _loc3_ = new RepostCollectionScratImage();
               _loc3_.x = 16;
               _loc3_.y = 96;
               _loc4_.addChild(new §_-W1y§(§_-vy§.§_-53T§(this.id)));
               _loc4_.scaleX = _loc4_.scaleY = 2.3;
               _loc4_.x = 185 - int(_loc4_.width * 0.5);
               _loc4_.y = 240 - int(_loc4_.height * 0.5);
               break;
            case §_-73l§.WALL_COLLECTION_EXCHANGE:
               break;
            case §_-73l§.WALL_SHAMAN_EXP:
               _loc2_.text = gls("Я получил новый\nуровень шамана!");
               _loc2_.x = 190;
               _loc2_.y = 69;
               _loc3_ = new RepostShamanLevelImage();
               _loc3_.x = 50;
               _loc3_.y = 106;
               _loc4_.addChild(this.§_-M1b§(this.id));
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
      
      private function §_-w1e§(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         §_-5B§.§_-R1G§(Game.selfId);
         §_-EI§.load(function():void
         {
            §_-71o§.show(§_-J29§.instance);
         });
      }
      
      private function §_-M1b§(param1:int) : Sprite
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
               _loc2_.addChildAt(new this.§_-Pp§[param1 % 10](),0);
               param1 = int(param1 / 10);
            }
         }
         return _loc2_;
      }
      
      private function get §_-Pp§() : Array
      {
         if(!§_-E1A§)
         {
            §_-E1A§ = [RepostNumber0,RepostNumber1,RepostNumber2,RepostNumber3,RepostNumber4,RepostNumber5,RepostNumber6,RepostNumber7,RepostNumber8,RepostNumber9];
         }
         return §_-E1A§;
      }
      
      private function get bitmapData() : BitmapData
      {
         var _loc4_:DisplayObject = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:Class = null;
         var _loc1_:BitmapData = new BitmapData(280,280);
         var _loc2_:Sprite = new Sprite();
         var _loc3_:§_-22V§ = new §_-22V§("",0,0,Dialog.FORMAT_CAPTION_18_CENTER);
         _loc3_.filters = Dialog.§_-m2A§;
         var _loc5_:Sprite = new Sprite();
         switch(this.type)
         {
            case §_-73l§.WALL_AWARD:
               _loc3_.text = gls("Я получил\nновое достижение!");
               _loc3_.x = 140;
               _loc3_.y = 28;
               _loc3_.width = 276;
               _loc3_.height = 50;
               _loc4_ = new RepostAwardImage();
               _loc4_.x = 7;
               _loc4_.y = 23;
               _loc7_ = §_-O1T§.§_-81e§(this.id);
               _loc7_.width = _loc7_.height = 156;
               _loc5_.addChild(_loc7_);
               _loc5_.x = 61;
               _loc5_.y = 62;
               break;
            case §_-73l§.WALL_COLLECTION_REGULAR:
               break;
            case §_-73l§.WALL_COLLECTION_UNIQUE:
               _loc3_.text = gls("Я получил новый\nэлемент коллекции");
               _loc3_.x = 140;
               _loc3_.y = 30;
               _loc4_ = new RepostCollectionElementImage();
               _loc4_.x = 25;
               _loc4_.y = 50;
               _loc8_ = §_-vy§.§_-R2S§(this.id);
               _loc5_.addChild(new _loc8_());
               _loc5_.scaleX = _loc5_.scaleY = 1.8;
               _loc5_.x = 130 - int(_loc5_.width * 0.5);
               _loc5_.y = 150 - int(_loc5_.height * 0.5);
               break;
            case §_-73l§.WALL_COLLECTION_AWARD:
               _loc3_.text = gls("Я обменял коллекции\nна костюм скрэта!");
               _loc3_.x = 140;
               _loc3_.y = 26;
               _loc4_ = new RepostCollectionScratImage();
               _loc4_.scaleX = _loc4_.scaleY = 0.83;
               _loc4_.y = 14;
               _loc5_.addChild(new §_-W1y§(§_-vy§.§_-53T§(this.id)));
               _loc5_.scaleX = _loc5_.scaleY = 1.9;
               _loc5_.x = 145 - int(_loc5_.width * 0.5);
               _loc5_.y = 130 - int(_loc5_.height * 0.5);
               break;
            case §_-73l§.WALL_COLLECTION_EXCHANGE:
               break;
            case §_-73l§.WALL_SHAMAN_EXP:
               _loc3_.text = gls("Я получил новый\nуровень шамана!");
               _loc3_.scaleX = _loc3_.scaleY = 0.87;
               _loc3_.x = 140;
               _loc3_.y = 28;
               _loc4_ = new RepostShamanLevelImage();
               _loc4_.scaleX = _loc4_.scaleY = 0.93;
               _loc4_.y = 52;
               _loc5_.addChild(this.§_-M1b§(this.id));
               _loc5_.x = 128 - int(_loc5_.width * 0.5);
               _loc5_.y = 75 - int(_loc5_.height * 0.5);
         }
         var _loc6_:DisplayObject = §_-k2X§.§_-81z§();
         _loc6_.scaleX = _loc6_.scaleY = §_-a9§.§_-sc§ ? 1 : 0.5;
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
            case §_-73l§.WALL_AWARD:
               return §_-O1T§.DATA[this.id]["awardText"];
            case §_-73l§.WALL_COLLECTION_REGULAR:
               return gls("Я готов обменять «{0}» в игре Трагедия Белок",§_-vy§.§_-U2M§[this.id]["tittle"]);
            case §_-73l§.WALL_COLLECTION_UNIQUE:
               return gls("Мною собрана коллекция «{0}» в игре Трагедия Белок!",§_-vy§.§_-C3T§[this.id]["collectionName"]);
            case §_-73l§.WALL_COLLECTION_AWARD:
               return gls("Я получил награду за собранную коллекцию уникальных предметов в игре Трагедия Белок");
            case §_-73l§.WALL_COLLECTION_EXCHANGE:
               return gls("Я обменялся в игре Трагедия Белок");
            case §_-73l§.WALL_SHAMAN_EXP:
               return gls("Я получил новый уровень шамана! Играй в Трагедию белок вместе со мной.");
            default:
               return "";
         }
      }
      
      private function §_-s§(param1:MouseEvent) : void
      {
         var _loc2_:String = "";
         if(Game.stage.quality != StageQuality.HIGH)
         {
            _loc2_ = Game.stage.quality;
            Game.stage.quality = StageQuality.HIGH;
         }
         if(this.type == §_-73l§.WALL_SHAMAN_EXP)
         {
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-i2W§);
         }
         §_-E1s§.save(this.bitmapData,"Package_" + this.id,false);
         §_-73l§.place(Game.self,this.type,this.id,new Bitmap(this.bitmapData),this.text);
         if(_loc2_ != "")
         {
            Game.stage.quality = _loc2_;
         }
         Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-S2C§,1);
         hide();
      }
   }
}


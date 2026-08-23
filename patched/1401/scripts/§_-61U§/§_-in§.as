package §_-61U§
{
   import §_-D25§.MultipartURLLoader;
   import §_-I10§.§_-vy§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import by.blooddy.crypto.image.PNGEncoder;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import utils.§_-2Y§;
   import utils.§_-73l§;
   import utils.§_-y2L§;
   
   public class §_-in§ extends Dialog
   {
      
      private static const §_-t2d§:int = 102;
      
      private static const §_-F22§:int = 68;
      
      private static const §_-V0§:int = 15;
      
      private var itemId1:int = -1;
      
      private var itemId2:int = -1;
      
      private var bitmapData:BitmapData;
      
      public function §_-in§(param1:int, param2:int, param3:Boolean)
      {
         super(param3 ? gls("Обмен совершён успешно") : gls("При обмене возникла ошибка"));
         this.itemId1 = param1;
         this.itemId2 = param2;
         this.init(param3);
      }
      
      private function init(param1:Boolean) : void
      {
         var _loc5_:ExchangeSuccessView = null;
         var _loc6_:§_-j18§ = null;
         var _loc7_:ExchangeFailImage = null;
         var _loc2_:ElementSlotBack = new ElementSlotBack();
         _loc2_.x = §_-V0§;
         _loc2_.y = 17;
         _loc2_.width = _loc2_.height = 102;
         addChild(_loc2_);
         _loc2_ = new ElementSlotBack();
         _loc2_.x = §_-V0§ + 166;
         _loc2_.y = 17;
         _loc2_.width = _loc2_.height = 102;
         addChild(_loc2_);
         var _loc3_:Class = §_-vy§.§_-z2p§(this.itemId1);
         var _loc4_:DisplayObject = new _loc3_();
         _loc4_.x = §_-V0§ + int((§_-t2d§ - _loc4_.width) * 0.5);
         _loc4_.y = 17 + int((§_-t2d§ - _loc4_.height) * 0.5);
         addChild(_loc4_);
         _loc3_ = §_-vy§.§_-z2p§(this.itemId2);
         _loc4_ = new _loc3_();
         _loc4_.x = §_-V0§ + 166 + int((§_-t2d§ - _loc4_.width) * 0.5);
         _loc4_.y = 17 + int((§_-t2d§ - _loc4_.height) * 0.5);
         addChild(_loc4_);
         if(param1)
         {
            _loc5_ = new ExchangeSuccessView();
            _loc5_.x = §_-V0§ + 116;
            _loc5_.y = 44;
            addChild(_loc5_);
            if(Game.self.type != §_-a9§.§_-3n§)
            {
               _loc6_ = new §_-j18§(gls("Поделиться"));
               _loc6_.x = _loc5_.x + int((_loc5_.width - _loc6_.width) * 0.5);
               _loc6_.y = 130;
               _loc6_.addEventListener(MouseEvent.CLICK,this.§_-h2L§);
               addChild(_loc6_);
            }
         }
         else
         {
            _loc7_ = new ExchangeFailImage();
            _loc7_.x = §_-V0§ + 116;
            _loc7_.y = 44;
            addChild(_loc7_);
         }
         place();
         this.width = 335;
         this.height = param1 && Game.self.type != §_-a9§.§_-3n§ ? 210 : 200;
      }
      
      private function §_-h2L§(param1:MouseEvent) : void
      {
         var _loc2_:DialogBaseBackground = new DialogBaseBackground();
         _loc2_.width = 270;
         _loc2_.height = 215;
         _loc2_.addChild(new ExchangePostView());
         var _loc3_:§_-22V§ = new §_-22V§(gls("Я обменялся!"),0,20,new TextFormat(§_-22V§.§_-pJ§,20,5257238));
         _loc3_.x = int((_loc2_.width - _loc3_.textWidth) * 0.5);
         _loc3_.filters = [new DropShadowFilter(1,45,16777215,1,2,2,8)];
         _loc2_.addChild(_loc3_);
         var _loc4_:Class = §_-vy§.§_-z2p§(this.itemId1);
         var _loc5_:DisplayObject = new _loc4_();
         _loc5_.scaleX = _loc5_.scaleY = 0.75;
         _loc5_.x = 31 + int((§_-F22§ - _loc5_.width) * 0.5);
         _loc5_.y = 105 + int((§_-F22§ - _loc5_.height) * 0.5);
         _loc2_.addChild(_loc5_);
         _loc4_ = §_-vy§.§_-z2p§(this.itemId2);
         var _loc6_:DisplayObject = new _loc4_();
         _loc6_.scaleX = _loc6_.scaleY = 0.75;
         _loc6_.x = 172 + int((§_-F22§ - _loc6_.width) * 0.5);
         _loc6_.y = 105 + int((§_-F22§ - _loc6_.height) * 0.5);
         _loc2_.addChild(_loc6_);
         var _loc7_:String = Game.stage.quality;
         §_-y2L§.§_-af§(StageQuality.HIGH);
         if(this.bitmapData != null)
         {
            this.bitmapData.dispose();
         }
         this.bitmapData = new BitmapData(_loc2_.width,_loc2_.height);
         this.bitmapData.draw(_loc2_);
         if(Game.self.type == §_-a9§.§_-JO§)
         {
            §_-73l§.place(Game.self,§_-73l§.WALL_COLLECTION_EXCHANGE,0,new Bitmap(this.bitmapData),gls("Я обменялся в игре Трагедия Белок"));
         }
         else
         {
            §_-2Y§.§_-QR§(§_-a9§.§_-ru§,PNGEncoder.encode(this.bitmapData),{},this.§_-Y2H§,this.§_-P14§);
         }
         §_-y2L§.§_-af§(_loc7_);
         hide();
      }
      
      private function §_-Y2H§(param1:Event) : void
      {
         var _loc2_:String = (param1.currentTarget as MultipartURLLoader).loader.data;
         §_-73l§.place(Game.self,§_-73l§.WALL_COLLECTION_EXCHANGE,10,new Bitmap(this.bitmapData),gls("Я обменялся в игре Трагедия Белок"),_loc2_);
      }
      
      private function §_-P14§(param1:Event) : void
      {
         §_-TQ§.add("Error on upload game results!");
      }
   }
}


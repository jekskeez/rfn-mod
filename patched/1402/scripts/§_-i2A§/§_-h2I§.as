package §_-i2A§
{
   import §_-X1k§.§_-42H§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-j2O§;
   import utils.§_-xD§;
   import views.§_-l2D§;
   
   public class §_-h2I§ extends Dialog
   {
      
      private static const §_-Q1t§:int = 111;
      
      private var elementId:int = -1;
      
      private var icon:DisplayObject = null;
      
      private var §_-e1C§:§_-i5§ = null;
      
      public function §_-h2I§()
      {
         super(gls("Я готов обменять"));
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-C3A§,Game.self["type"]);
      }
      
      public function set §_-p2N§(param1:int) : void
      {
         this.elementId = param1;
         if(this.icon != null)
         {
            removeChild(this.icon);
         }
         this.§_-e1C§.wordWrap = false;
         this.§_-e1C§.text = §_-42H§.§_-U13§[this.elementId]["tittle"];
         this.§_-e1C§.y = 13;
         if(this.§_-e1C§.textWidth > 220)
         {
            this.§_-e1C§.wordWrap = true;
            this.§_-e1C§.y = -4;
         }
         var _loc2_:Class = §_-42H§.§_-D1U§(this.elementId);
         this.icon = new _loc2_();
         this.icon.scaleX = this.icon.scaleY = 1.3;
         this.icon.x = 49 + 24 + int((§_-Q1t§ - this.icon.width) * 0.5);
         this.icon.y = 43 + 23 + int((§_-Q1t§ - this.icon.height) * 0.5);
         addChild(this.icon);
      }
      
      private function init() : void
      {
         var _loc1_:TextFormat = new TextFormat(null,18,6199852,true);
         _loc1_.align = TextFormatAlign.CENTER;
         this.§_-e1C§ = new §_-i5§("",20,13,_loc1_);
         this.§_-e1C§.width = 220;
         this.§_-e1C§.multiline = true;
         this.§_-e1C§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-e1C§);
         var _loc2_:CollectionFrameImage = new CollectionFrameImage();
         _loc2_.x = 49;
         _loc2_.y = 43;
         addChild(_loc2_);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Поделиться"));
         _loc3_.x = 70;
         _loc3_.y = 230;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-5q§);
         place(_loc3_);
         this.width = 290;
         this.height = 290;
      }
      
      private function §_-5q§(param1:MouseEvent) : void
      {
         if(!§_-j2O§.§_-Ik§)
         {
            return;
         }
         var _loc2_:§_-l2D§ = new §_-l2D§(§_-42H§.§_-R2h§,this.elementId);
         var _loc3_:String = Game.stage.quality;
         §_-xD§.§_-Z1c§(StageQuality.HIGH);
         var _loc4_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height);
         _loc4_.draw(_loc2_);
         var _loc5_:Bitmap = new Bitmap(_loc4_);
         §_-j2O§.place(Game.self,§_-j2O§.WALL_COLLECTION_REGULAR,this.elementId,_loc5_,gls("Я готов обменять «{0}» в игре Трагедия Белок",§_-42H§.§_-U13§[this.elementId]["tittle"]));
         §_-xD§.§_-Z1c§(_loc3_);
         close();
      }
   }
}


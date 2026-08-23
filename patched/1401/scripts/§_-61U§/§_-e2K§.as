package §_-61U§
{
   import §_-I10§.§_-vy§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-73l§;
   import utils.§_-y2L§;
   import views.§_-93h§;
   
   public class §_-e2K§ extends Dialog
   {
      
      private static const §_-l1k§:int = 111;
      
      private var elementId:int = -1;
      
      private var icon:DisplayObject = null;
      
      private var §_-12Z§:§_-22V§ = null;
      
      public function §_-e2K§()
      {
         super(gls("Я готов обменять"));
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-z2t§,Game.self["type"]);
      }
      
      public function set §_-ju§(param1:int) : void
      {
         this.elementId = param1;
         if(this.icon != null)
         {
            removeChild(this.icon);
         }
         this.§_-12Z§.wordWrap = false;
         this.§_-12Z§.text = §_-vy§.§_-U2M§[this.elementId]["tittle"];
         this.§_-12Z§.y = 13;
         if(this.§_-12Z§.textWidth > 220)
         {
            this.§_-12Z§.wordWrap = true;
            this.§_-12Z§.y = -4;
         }
         var _loc2_:Class = §_-vy§.§_-z2p§(this.elementId);
         this.icon = new _loc2_();
         this.icon.scaleX = this.icon.scaleY = 1.3;
         this.icon.x = 49 + 24 + int((§_-l1k§ - this.icon.width) * 0.5);
         this.icon.y = 43 + 23 + int((§_-l1k§ - this.icon.height) * 0.5);
         addChild(this.icon);
      }
      
      private function init() : void
      {
         var _loc1_:TextFormat = new TextFormat(null,18,6199852,true);
         _loc1_.align = TextFormatAlign.CENTER;
         this.§_-12Z§ = new §_-22V§("",20,13,_loc1_);
         this.§_-12Z§.width = 220;
         this.§_-12Z§.multiline = true;
         this.§_-12Z§.autoSize = TextFieldAutoSize.CENTER;
         addChild(this.§_-12Z§);
         var _loc2_:CollectionFrameImage = new CollectionFrameImage();
         _loc2_.x = 49;
         _loc2_.y = 43;
         addChild(_loc2_);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Поделиться"));
         _loc3_.x = 70;
         _loc3_.y = 230;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-h2L§);
         place(_loc3_);
         this.width = 290;
         this.height = 290;
      }
      
      private function §_-h2L§(param1:MouseEvent) : void
      {
         if(!§_-73l§.§_-01o§)
         {
            return;
         }
         var _loc2_:§_-93h§ = new §_-93h§(§_-vy§.§_-13q§,this.elementId);
         var _loc3_:String = Game.stage.quality;
         §_-y2L§.§_-af§(StageQuality.HIGH);
         var _loc4_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height);
         _loc4_.draw(_loc2_);
         var _loc5_:Bitmap = new Bitmap(_loc4_);
         §_-73l§.place(Game.self,§_-73l§.WALL_COLLECTION_REGULAR,this.elementId,_loc5_,gls("Я готов обменять «{0}» в игре Трагедия Белок",§_-vy§.§_-U2M§[this.elementId]["tittle"]));
         §_-y2L§.§_-af§(_loc3_);
         close();
      }
   }
}


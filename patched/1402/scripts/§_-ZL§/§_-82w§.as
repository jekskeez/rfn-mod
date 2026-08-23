package §_-ZL§
{
   import §_-bN§.Dialog;
   import §_-c2C§.§_-51A§;
   import §_-c2C§.§_-si§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-K2G§;
   import events.ScreenEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import utils.StringUtil;
   import utils.§_-j2O§;
   import utils.§_-xD§;
   
   public class §_-82w§ extends Dialog
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 15px;","color: #432906;","text-align: center;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var text:§_-i5§ = null;
      
      private var map:int;
      
      private var location:int;
      
      public function §_-82w§(param1:int)
      {
         super();
         this.map = param1 & 0xFFFFFF;
         this.location = param1 >>> 24 & 0xFF;
         this.init();
      }
      
      override public function showDialog() : void
      {
         if(§_-t2c§.active is §_-si§ || §_-t2c§.active is §_-51A§)
         {
            super.showDialog();
            return;
         }
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-43K§);
      }
      
      private function init() : void
      {
         var _loc3_:§_-K2G§ = null;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         addChild(new MapApprovedBackground());
         place();
         this.width = 432;
         this.height = 426;
         this.§_-x2T§.y += 10;
         var _loc2_:§_-i5§ = new §_-i5§(gls("Поздравляем!"),0,17,Dialog.FORMAT_CAPTION_29);
         _loc2_.filters = Dialog.§_-q2I§;
         _loc2_.x = int((this.width - _loc2_.textWidth) * 0.5);
         addChild(_loc2_);
         this.text = new §_-i5§("",0,300,_loc1_,260);
         this.text.wordWrap = true;
         this.text.multiline = true;
         this.text.htmlText = gls("<body><textformat leading = \'4\'>Твоя карта <span class = \'bold\'>№ {0}</span> одобрена в локацию <span class = \'bold\'>{1}</span>.<br/>",this.map,§_-at§.§_-13l§(this.location).name);
         this.text.htmlText += gls("Ты получаешь <span class = \'bold\'>{0} {1}</span>!</textformat></body>",§_-at§.§_-13l§(this.location).award,StringUtil.word("орехов",§_-at§.§_-13l§(this.location).award));
         this.text.x = (this.width - this.text.width) * 0.5;
         addChild(this.text);
         switch(Game.self.type)
         {
            case §_-Zy§.§_-Q1M§:
            case §_-Zy§.§_-zE§:
            case §_-Zy§.§_-s12§:
            case §_-Zy§.§_-32G§:
               _loc3_ = new §_-K2G§(gls("Поделиться"));
               _loc3_.x = (this.width - _loc3_.width) * 0.5;
               _loc3_.y = 380;
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-5q§);
               addChild(_loc3_);
         }
      }
      
      private function §_-43K§(param1:ScreenEvent) : void
      {
         if(param1 != null && !(§_-t2c§.active is §_-si§) && !(§_-t2c§.active is §_-51A§))
         {
            return;
         }
         §_-t2c§.instance.removeEventListener(ScreenEvent.SHOW,this.§_-43K§);
         super.showDialog();
      }
      
      private function §_-5q§(param1:MouseEvent) : void
      {
         var _loc2_:String = Game.stage.quality;
         §_-xD§.§_-Z1c§(StageQuality.HIGH);
         var _loc3_:MapApprovedPost = new MapApprovedPost();
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height);
         _loc4_.draw(_loc3_);
         §_-j2O§.place(Game.self,§_-j2O§.MAP_APPROVED,0,new Bitmap(_loc4_),gls("Мою карту одобрили и я получил награду!"));
         §_-xD§.§_-Z1c§(_loc2_);
         hide();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 0;
         this.§_-7N§ = 20;
         this.topOffset = 0;
         this.§_-f2d§ = 0;
      }
   }
}


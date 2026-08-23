package §_-Q1P§
{
   import §_-T2y§.§_-5B§;
   import §_-T2y§.§_-5K§;
   import §_-T2y§.§_-71o§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import events.ScreenEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import utils.StringUtil;
   import utils.§_-73l§;
   import utils.§_-y2L§;
   
   public class §_-f1t§ extends Dialog
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 15px;","color: #432906;","text-align: center;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var text:§_-22V§ = null;
      
      private var map:int;
      
      private var location:int;
      
      public function §_-f1t§(param1:int)
      {
         super();
         this.map = param1 & 0xFFFFFF;
         this.location = param1 >>> 24 & 0xFF;
         this.init();
      }
      
      override public function showDialog() : void
      {
         if(§_-71o§.active is §_-5K§ || §_-71o§.active is §_-5B§)
         {
            super.showDialog();
            return;
         }
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-C2D§);
      }
      
      private function init() : void
      {
         var _loc3_:§_-j18§ = null;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         addChild(new MapApprovedBackground());
         place();
         this.width = 432;
         this.height = 426;
         this.§_-O2e§.y += 10;
         var _loc2_:§_-22V§ = new §_-22V§(gls("Поздравляем!"),0,17,Dialog.FORMAT_CAPTION_29);
         _loc2_.filters = Dialog.§_-m2A§;
         _loc2_.x = int((this.width - _loc2_.textWidth) * 0.5);
         addChild(_loc2_);
         this.text = new §_-22V§("",0,300,_loc1_,260);
         this.text.wordWrap = true;
         this.text.multiline = true;
         this.text.htmlText = gls("<body><textformat leading = \'4\'>Твоя карта <span class = \'bold\'>№ {0}</span> одобрена в локацию <span class = \'bold\'>{1}</span>.<br/>",this.map,§_-q1p§.§_-l29§(this.location).name);
         this.text.htmlText += gls("Ты получаешь <span class = \'bold\'>{0} {1}</span>!</textformat></body>",§_-q1p§.§_-l29§(this.location).award,StringUtil.word("орехов",§_-q1p§.§_-l29§(this.location).award));
         this.text.x = (this.width - this.text.width) * 0.5;
         addChild(this.text);
         switch(Game.self.type)
         {
            case §_-a9§.§_-JO§:
            case §_-a9§.§_-y1q§:
            case §_-a9§.§_-f15§:
            case §_-a9§.§_-C3f§:
               _loc3_ = new §_-j18§(gls("Поделиться"));
               _loc3_.x = (this.width - _loc3_.width) * 0.5;
               _loc3_.y = 380;
               _loc3_.addEventListener(MouseEvent.CLICK,this.§_-h2L§);
               addChild(_loc3_);
         }
      }
      
      private function §_-C2D§(param1:ScreenEvent) : void
      {
         if(param1 != null && !(§_-71o§.active is §_-5K§) && !(§_-71o§.active is §_-5B§))
         {
            return;
         }
         §_-71o§.instance.removeEventListener(ScreenEvent.SHOW,this.§_-C2D§);
         super.showDialog();
      }
      
      private function §_-h2L§(param1:MouseEvent) : void
      {
         var _loc2_:String = Game.stage.quality;
         §_-y2L§.§_-af§(StageQuality.HIGH);
         var _loc3_:MapApprovedPost = new MapApprovedPost();
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height);
         _loc4_.draw(_loc3_);
         §_-73l§.place(Game.self,§_-73l§.MAP_APPROVED,0,new Bitmap(_loc4_),gls("Мою карту одобрили и я получил награду!"));
         §_-y2L§.§_-af§(_loc2_);
         hide();
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 0;
         this.§_-4n§ = 20;
         this.topOffset = 0;
         this.§_-JZ§ = 0;
      }
   }
}


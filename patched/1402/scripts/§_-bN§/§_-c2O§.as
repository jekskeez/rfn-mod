package §_-bN§
{
   import §_-X1k§.§_-r12§;
   import buttons.§_-K2G§;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.§_-n2E§;
   import utils.§_-L2J§;
   
   public class §_-c2O§ extends Dialog
   {
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-c10§,18,7487780,true);
      
      private static const §_-f2I§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,7487780);
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","color: #724124;","text-align: center;","font-size: 15px;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private var §_-HP§:CheckBox;
      
      private var §_-v1g§:§_-K2G§;
      
      public function §_-c2O§()
      {
         super(gls("Важная информация"),true,false,null,false);
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         this.redrawModalBackdrop();
      }
      
      override protected function redrawModalBackdrop() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(0,0.5);
         this.graphics.drawRect(-this.x,-this.y,Game.starling.stage.stageWidth,Game.starling.stage.stageHeight);
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         if(this.§_-HP§.selected)
         {
            §_-r12§.set(§_-n2E§.§_-33J§);
         }
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_21_CENTER;
      }
      
      private function init() : void
      {
         var _loc1_:§_-i5§ = new §_-i5§(gls("Перед началом игры вам нужно:"),0,5,§_-W2U§,350);
         addChild(_loc1_);
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-aD§);
         var _loc3_:§_-i5§ = new §_-i5§(gls("<body>Ознакомиться с <a href=\'{0}\' target=\'_blank\'>Соглашением</a> и <a href=\'{1}\' target=\'_blank\'>Политикой конфиденциальности</a></body>",§_-Zy§.§_-Bv§[§_-Zy§.§_-73r§].eula,§_-Zy§.§_-Bv§[§_-Zy§.§_-73r§].privacy),0,35,_loc2_,350);
         addChild(_loc3_);
         this.§_-HP§ = new CheckBox();
         §_-L2J§.§_-61Q§(this.§_-HP§,§_-f2I§);
         this.§_-HP§.selected = false;
         this.§_-HP§.y = 90;
         this.§_-HP§.label = gls("Я ознакомлен, согласен с условиями Соглашения\nи Политикой конфиденциальности.");
         this.§_-HP§.width = 350;
         this.§_-HP§.addEventListener(MouseEvent.CLICK,this.§_-kM§);
         addChild(this.§_-HP§);
         this.§_-v1g§ = new §_-K2G§("Принять");
         this.§_-v1g§.enabled = false;
         this.§_-v1g§.addEventListener(MouseEvent.CLICK,this.hide);
         place(this.§_-v1g§);
         _loc1_.x = (this.width - _loc1_.width + 15) * 0.5;
         _loc3_.x = (this.width - _loc3_.width - 35) * 0.5;
         this.§_-HP§.x = (this.width - this.§_-HP§.width + 7.5) * 0.5;
      }
      
      private function §_-kM§(param1:MouseEvent) : void
      {
         var _loc2_:CheckBox = param1.currentTarget as CheckBox;
         this.§_-v1g§.enabled = _loc2_.selected;
      }
   }
}


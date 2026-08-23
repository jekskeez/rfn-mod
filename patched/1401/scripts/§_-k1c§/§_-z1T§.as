package §_-k1c§
{
   import §_-I10§.§_-Bm§;
   import buttons.§_-j18§;
   import fl.controls.CheckBox;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.§_-T2o§;
   import utils.§_-vo§;
   
   public class §_-z1T§ extends Dialog
   {
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,18,7487780,true);
      
      private static const §_-1o§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,7487780);
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","color: #724124;","text-align: center;","font-size: 15px;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private var §_-F2o§:CheckBox;
      
      private var §_-91u§:§_-j18§;
      
      public function §_-z1T§()
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
         if(this.§_-F2o§.selected)
         {
            §_-Bm§.set(§_-T2o§.§_-g1f§);
         }
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_21_CENTER;
      }
      
      private function init() : void
      {
         var _loc1_:§_-22V§ = new §_-22V§(gls("Перед началом игры вам нужно:"),0,5,§_-a1Y§,350);
         addChild(_loc1_);
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-I2U§);
         var _loc3_:§_-22V§ = new §_-22V§(gls("<body>Ознакомиться с <a href=\'{0}\' target=\'_blank\'>Соглашением</a> и <a href=\'{1}\' target=\'_blank\'>Политикой конфиденциальности</a></body>",§_-a9§.§_-v1U§[§_-a9§.§_-L2p§].eula,§_-a9§.§_-v1U§[§_-a9§.§_-L2p§].privacy),0,35,_loc2_,350);
         addChild(_loc3_);
         this.§_-F2o§ = new CheckBox();
         §_-vo§.§_-l1V§(this.§_-F2o§,§_-1o§);
         this.§_-F2o§.selected = false;
         this.§_-F2o§.y = 90;
         this.§_-F2o§.label = gls("Я ознакомлен, согласен с условиями Соглашения\nи Политикой конфиденциальности.");
         this.§_-F2o§.width = 350;
         this.§_-F2o§.addEventListener(MouseEvent.CLICK,this.§_-PO§);
         addChild(this.§_-F2o§);
         this.§_-91u§ = new §_-j18§("Принять");
         this.§_-91u§.enabled = false;
         this.§_-91u§.addEventListener(MouseEvent.CLICK,this.hide);
         place(this.§_-91u§);
         _loc1_.x = (this.width - _loc1_.width + 15) * 0.5;
         _loc3_.x = (this.width - _loc3_.width - 35) * 0.5;
         this.§_-F2o§.x = (this.width - this.§_-F2o§.width + 7.5) * 0.5;
      }
      
      private function §_-PO§(param1:MouseEvent) : void
      {
         var _loc2_:CheckBox = param1.currentTarget as CheckBox;
         this.§_-91u§.enabled = _loc2_.selected;
      }
   }
}


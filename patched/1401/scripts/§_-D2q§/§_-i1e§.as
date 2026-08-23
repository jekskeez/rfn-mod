package §_-D2q§
{
   import §_-I1s§.§_-rt§;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   
   public class §_-i1e§ extends §_-rt§
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #7E5836;","text-align: center;","}"].join("\n");
      
      public function §_-i1e§()
      {
         super(DialogShopNotifyHeader,gls("Поздравляем!"),gls("Ты приобрёл смайлы"),true,false,null,false,[1,32,4,-43],null,null,[-10,5,100,15]);
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         var _loc2_:Sprite = new ImageSmilePack0();
         _loc2_.x = -(_loc2_.width * 0.5);
         _loc2_.y = -(_loc2_.height + _loc2_.height * 0.5 + 5);
         this.§_-l1I§.addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§("<body>" + gls("Ты можешь отображать свои эмоции в игре,\nнажав на кнопку в нижней части экрана.") + "</body>",0,this.§_-hd§.textHeight - 32,_loc1_,this.header.bg.width - this.§_-4n§);
         addChild(_loc3_);
         var _loc4_:§_-j18§ = new §_-j18§("Ок");
         _loc4_.x = (this.header.bg.width - _loc4_.width) * 0.5 - this.§_-R1Y§;
         _loc4_.y = _loc3_.y + _loc3_.height + 14;
         _loc4_.addEventListener(MouseEvent.CLICK,hide);
         addChild(_loc4_);
         this.height = 160;
      }
   }
}


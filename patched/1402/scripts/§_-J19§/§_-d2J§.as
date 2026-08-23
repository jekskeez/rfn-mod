package §_-J19§
{
   import §_-i2r§.§_-e2O§;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   
   public class §_-d2J§ extends §_-e2O§
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #7E5836;","text-align: center;","}"].join("\n");
      
      public function §_-d2J§()
      {
         super(DialogShopNotifyHeader,gls("Поздравляем!"),gls("Ты приобрёл смайлы"),true,false,null,false,[1,32,4,-43],null,null,[-10,5,100,15]);
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         var _loc2_:Sprite = new ImageSmilePack0();
         _loc2_.x = -(_loc2_.width * 0.5);
         _loc2_.y = -(_loc2_.height + _loc2_.height * 0.5 + 5);
         this.§_-rU§.addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§("<body>" + gls("Ты можешь отображать свои эмоции в игре,\nнажав на кнопку в нижней части экрана.") + "</body>",0,this.§_-n2m§.textHeight - 32,_loc1_,this.header.bg.width - this.§_-7N§);
         addChild(_loc3_);
         var _loc4_:§_-K2G§ = new §_-K2G§("Ок");
         _loc4_.x = (this.header.bg.width - _loc4_.width) * 0.5 - this.§_-01q§;
         _loc4_.y = _loc3_.y + _loc3_.height + 14;
         _loc4_.addEventListener(MouseEvent.CLICK,hide);
         addChild(_loc4_);
         this.height = 160;
      }
   }
}


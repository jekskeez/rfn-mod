package §_-62p§
{
   import §_-I10§.§_-g1R§;
   import §_-I10§.§_-g2W§;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import utils.§_-x1Z§;
   
   public class §_-BZ§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","font-size: 24px;","color: #ffffff;","}",".red {","color: #F3FF8C;","font-size: 34px;","}"].join("\n");
      
      public static const §_-m2A§:Array = [new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private var items:Array = [];
      
      private var §_-o2E§:§_-22V§ = null;
      
      private var §_-s14§:§_-A2b§ = null;
      
      public function §_-BZ§()
      {
         super();
         this.y = 55;
         var _loc1_:ImageShopCloseoutCaption = new ImageShopCloseoutCaption();
         _loc1_.x = 445;
         _loc1_.y = 36;
         addChild(_loc1_);
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-I2U§);
         var _loc3_:§_-22V§ = new §_-22V§(gls("<body>Купи костюм со скидкой <span class=\'red\'>{0}%</span>!</body>",§_-g1R§.§_-j1h§),65,-2,_loc2_);
         _loc3_.filters = §_-m2A§;
         addChild(_loc3_);
         addChild(new §_-22V§(gls("*Весь ассортимент костюмов в каталоге."),65,35,new TextFormat(null,14,16777215)));
         addChild(new §_-22V§(gls("Новые предложения через:"),660,10,new TextFormat(null,14,8746579,true)));
         this.§_-o2E§ = new §_-22V§("",660,28,new TextFormat(§_-22V§.§_-pJ§,20,16777215));
         this.§_-o2E§.filters = §_-m2A§;
         addChild(this.§_-o2E§);
         this.§_-s14§ = new §_-A2b§();
         this.§_-s14§.x = 657.5;
         this.§_-s14§.y = 70;
         this.§_-s14§.filters = §_-x1Z§.§_-c2G§;
         addChild(this.§_-s14§);
         §_-01Y§.§_-c9§(this.§_-H5§);
         this.§_-c1Z§();
      }
      
      private function §_-c1Z§() : void
      {
         var _loc2_:Sprite = null;
         while(this.items.length > 0)
         {
            removeChild(this.items.shift());
         }
         var _loc1_:int = 0;
         while(_loc1_ < §_-g1R§.ids.length)
         {
            _loc2_ = new §_-F18§(§_-g2W§.§_-X2e§(§_-g1R§.ids[_loc1_]));
            _loc2_.x = 12.5 + _loc1_ * 215;
            _loc2_.y = 70;
            addChild(_loc2_);
            this.items.push(_loc2_);
            _loc1_++;
         }
      }
      
      private function §_-H5§() : void
      {
         this.§_-o2E§.text = §_-g1R§.timeString;
         this.§_-o2E§.x = 750 - int(this.§_-o2E§.textWidth * 0.5);
      }
   }
}


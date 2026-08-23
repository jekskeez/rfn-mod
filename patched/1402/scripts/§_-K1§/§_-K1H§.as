package §_-K1§
{
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-y2L§;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import utils.§_-y1l§;
   
   public class §_-K1H§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","font-size: 24px;","color: #ffffff;","}",".red {","color: #F3FF8C;","font-size: 34px;","}"].join("\n");
      
      public static const §_-q2I§:Array = [new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private var items:Array = [];
      
      private var §_-L1t§:§_-i5§ = null;
      
      private var §_-o23§:§_-J2P§ = null;
      
      public function §_-K1H§()
      {
         super();
         this.y = 55;
         var _loc1_:ImageShopCloseoutCaption = new ImageShopCloseoutCaption();
         _loc1_.x = 445;
         _loc1_.y = 36;
         addChild(_loc1_);
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(§_-aD§);
         var _loc3_:§_-i5§ = new §_-i5§(gls("<body>Купи костюм со скидкой <span class=\'red\'>{0}%</span>!</body>",§_-y2L§.§_-b2n§),65,-2,_loc2_);
         _loc3_.filters = §_-q2I§;
         addChild(_loc3_);
         addChild(new §_-i5§(gls("*Весь ассортимент костюмов в каталоге."),65,35,new TextFormat(null,14,16777215)));
         addChild(new §_-i5§(gls("Новые предложения через:"),660,10,new TextFormat(null,14,8746579,true)));
         this.§_-L1t§ = new §_-i5§("",660,28,new TextFormat(§_-i5§.§_-p1s§,20,16777215));
         this.§_-L1t§.filters = §_-q2I§;
         addChild(this.§_-L1t§);
         this.§_-o23§ = new §_-J2P§();
         this.§_-o23§.x = 657.5;
         this.§_-o23§.y = 70;
         this.§_-o23§.filters = §_-y1l§.§_-Tk§;
         addChild(this.§_-o23§);
         §_-p1V§.§_-63T§(this.§_-t29§);
         this.§_-K26§();
      }
      
      private function §_-K26§() : void
      {
         var _loc2_:Sprite = null;
         while(this.items.length > 0)
         {
            removeChild(this.items.shift());
         }
         var _loc1_:int = 0;
         while(_loc1_ < §_-y2L§.ids.length)
         {
            _loc2_ = new §_-P2I§(§_-P2x§.§_-b2c§(§_-y2L§.ids[_loc1_]));
            _loc2_.x = 12.5 + _loc1_ * 215;
            _loc2_.y = 70;
            addChild(_loc2_);
            this.items.push(_loc2_);
            _loc1_++;
         }
      }
      
      private function §_-t29§() : void
      {
         this.§_-L1t§.text = §_-y2L§.timeString;
         this.§_-L1t§.x = 750 - int(this.§_-L1t§.textWidth * 0.5);
      }
   }
}


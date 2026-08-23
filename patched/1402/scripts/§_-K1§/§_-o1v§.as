package §_-K1§
{
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-y1l§;
   
   public class §_-o1v§ extends Sprite
   {
      
      private static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579)];
      
      private var §_-S8§:§_-Hg§ = null;
      
      public function §_-o1v§()
      {
         super();
         addChild(new ImageShopPackageBack()).y = 65;
         this.§_-S8§ = new §_-Hg§();
         this.§_-S8§.x = 12.5;
         this.§_-S8§.y = 65;
         addChild(this.§_-S8§);
         this.§_-S8§.insert(new §_-uH§(new §_-Q1W§(gls("Белка"),§_-D12§,ButtonTabShopLarge,10)),addChild(new §_-tC§()));
         var _loc1_:§_-uH§ = new §_-uH§(new §_-Q1W§(gls("Шаман"),§_-D12§,ButtonTabShopLarge,10));
         _loc1_.x = 215;
         this.§_-S8§.insert(_loc1_,addChild(new §_-f2K§()));
         _loc1_ = new §_-uH§(new §_-Q1W§(gls("Дракоша"),§_-D12§,ButtonTabShopLarge,10));
         _loc1_.filters = §_-y1l§.§_-Tk§;
         _loc1_.block = true;
         _loc1_.x = 430;
         this.§_-S8§.insert(_loc1_);
         _loc1_ = new §_-uH§(new §_-Q1W§(gls("Заяц неСудьбы"),§_-D12§,ButtonTabShopLarge,10));
         _loc1_.filters = §_-y1l§.§_-Tk§;
         _loc1_.block = true;
         _loc1_.x = 645;
         this.§_-S8§.insert(_loc1_);
      }
   }
}


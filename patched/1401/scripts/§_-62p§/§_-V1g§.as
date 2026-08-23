package §_-62p§
{
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-x1Z§;
   
   public class §_-V1g§ extends Sprite
   {
      
      private static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579)];
      
      private var §_-EE§:§_-G2L§ = null;
      
      public function §_-V1g§()
      {
         super();
         addChild(new ImageShopPackageBack()).y = 65;
         this.§_-EE§ = new §_-G2L§();
         this.§_-EE§.x = 12.5;
         this.§_-EE§.y = 65;
         addChild(this.§_-EE§);
         this.§_-EE§.insert(new §_-F1F§(new §_-T2z§(gls("Белка"),§_-HM§,ButtonTabShopLarge,10)),addChild(new §_-i20§()));
         var _loc1_:§_-F1F§ = new §_-F1F§(new §_-T2z§(gls("Шаман"),§_-HM§,ButtonTabShopLarge,10));
         _loc1_.x = 215;
         this.§_-EE§.insert(_loc1_,addChild(new §_-f2i§()));
         _loc1_ = new §_-F1F§(new §_-T2z§(gls("Дракоша"),§_-HM§,ButtonTabShopLarge,10));
         _loc1_.filters = §_-x1Z§.§_-c2G§;
         _loc1_.block = true;
         _loc1_.x = 430;
         this.§_-EE§.insert(_loc1_);
         _loc1_ = new §_-F1F§(new §_-T2z§(gls("Заяц неСудьбы"),§_-HM§,ButtonTabShopLarge,10));
         _loc1_.filters = §_-x1Z§.§_-c2G§;
         _loc1_.block = true;
         _loc1_.x = 645;
         this.§_-EE§.insert(_loc1_);
      }
   }
}


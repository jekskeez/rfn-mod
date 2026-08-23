package §_-K1§
{
   import §_-X1k§.§_-n1C§;
   import §_-q24§.§_-23e§;
   import §_-q24§.§_-4m§;
   import §_-q24§.§_-510§;
   import §_-q24§.§_-Vp§;
   import §_-q24§.§_-u2X§;
   import §_-q24§.§_-w1e§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import tape.§_-o2N§;
   
   public class §_-42U§ extends Sprite
   {
      
      private static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579)];
      
      private var §_-S8§:§_-Hg§ = null;
      
      public function §_-42U§()
      {
         super();
         this.y = 65;
         this.§_-S8§ = new §_-Hg§();
         this.§_-S8§.x = 22.5;
         var _loc1_:§_-w1e§ = new §_-w1e§();
         var _loc2_:§_-o2N§ = new §_-o2N§(§_-Vp§);
         _loc2_.setData(§_-sL§.items);
         _loc1_.setData(_loc2_);
         addChild(_loc1_);
         this.§_-S8§.insert(new §_-uH§(new §_-Q1W§(gls("Эликсиры"),§_-D12§,ButtonTabShopLarge,10)),_loc1_);
         var _loc3_:§_-23e§ = new §_-23e§();
         _loc2_ = new §_-o2N§(§_-4m§);
         _loc2_.setData(§_-n1C§.items);
         _loc3_.setData(_loc2_);
         addChild(_loc3_);
         var _loc4_:§_-uH§ = new §_-uH§(new §_-Q1W§(gls("Предметы шамана"),§_-D12§,ButtonTabShopLarge,10));
         _loc4_.x = 220;
         this.§_-S8§.insert(_loc4_,_loc3_);
         addChild(this.§_-S8§);
         var _loc5_:§_-u2X§ = new §_-u2X§();
         _loc2_ = new §_-o2N§(§_-510§);
         _loc2_.setData([0]);
         _loc5_.setData(_loc2_);
         addChild(_loc5_);
         _loc4_ = new §_-uH§(new §_-Q1W§(gls("Эмоции"),§_-D12§,ButtonTabShopLarge,10));
         _loc4_.x = 440;
         this.§_-S8§.insert(_loc4_,_loc5_);
         addChild(this.§_-S8§);
      }
   }
}


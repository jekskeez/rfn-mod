package §_-62p§
{
   import §_-A2j§.§_-4b§;
   import §_-A2j§.§_-B1M§;
   import §_-A2j§.§_-FC§;
   import §_-A2j§.§_-NX§;
   import §_-A2j§.§_-c12§;
   import §_-A2j§.§_-d1X§;
   import §_-I10§.§_-X2T§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import tape.§_-91w§;
   
   public class §_-Vk§ extends Sprite
   {
      
      private static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579)];
      
      private var §_-EE§:§_-G2L§ = null;
      
      public function §_-Vk§()
      {
         super();
         this.y = 65;
         this.§_-EE§ = new §_-G2L§();
         this.§_-EE§.x = 22.5;
         var _loc1_:§_-4b§ = new §_-4b§();
         var _loc2_:§_-91w§ = new §_-91w§(§_-NX§);
         _loc2_.setData(§_-y1§.items);
         _loc1_.setData(_loc2_);
         addChild(_loc1_);
         this.§_-EE§.insert(new §_-F1F§(new §_-T2z§(gls("Эликсиры"),§_-HM§,ButtonTabShopLarge,10)),_loc1_);
         var _loc3_:§_-B1M§ = new §_-B1M§();
         _loc2_ = new §_-91w§(§_-FC§);
         _loc2_.setData(§_-X2T§.items);
         _loc3_.setData(_loc2_);
         addChild(_loc3_);
         var _loc4_:§_-F1F§ = new §_-F1F§(new §_-T2z§(gls("Предметы шамана"),§_-HM§,ButtonTabShopLarge,10));
         _loc4_.x = 220;
         this.§_-EE§.insert(_loc4_,_loc3_);
         addChild(this.§_-EE§);
         var _loc5_:§_-d1X§ = new §_-d1X§();
         _loc2_ = new §_-91w§(§_-c12§);
         _loc2_.setData([0]);
         _loc5_.setData(_loc2_);
         addChild(_loc5_);
         _loc4_ = new §_-F1F§(new §_-T2z§(gls("Эмоции"),§_-HM§,ButtonTabShopLarge,10));
         _loc4_.x = 440;
         this.§_-EE§.insert(_loc4_,_loc5_);
         addChild(this.§_-EE§);
      }
   }
}


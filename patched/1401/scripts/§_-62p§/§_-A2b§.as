package §_-62p§
{
   import §_-I10§.§_-S9§;
   import §_-d10§.§_-RA§;
   import §_-k1c§.§_-7O§;
   import com.api.Services;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class §_-A2b§ extends Sprite
   {
      
      public static const §_-m2A§:Array = [new GlowFilter(16777215,1,4,4,8),new GlowFilter(8812372,1,4,4,1)];
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","font-size: 16px;","color: #9A4C0F;","text-align: center;","}",".red {","color: #FF5515;","font-size: 30px;","}"].join("\n");
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,6697728,null,null,null,null,null,"center");
      
      public function §_-A2b§()
      {
         super();
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         var _loc2_:ElementPackageBack = new ElementPackageBack();
         _loc2_.height = 390;
         addChild(_loc2_);
         var _loc3_:§_-22V§ = new §_-22V§(gls("Испытай\nудачу!"),0,1,§_-a1Y§);
         _loc3_.x = int((_loc2_.width - _loc3_.textWidth) * 0.5);
         addChild(_loc3_);
         var _loc4_:ImageBundleOutfit = new ImageBundleOutfit();
         _loc4_.x = int((_loc2_.width - _loc4_.width) * 0.5);
         _loc4_.y = 85;
         addChild(_loc4_);
         var _loc5_:§_-RA§ = new §_-RA§();
         _loc5_.scaleX = _loc5_.scaleY = 0.8;
         _loc5_.§_-t2j§ = 250;
         _loc5_.x = 2;
         _loc5_.y = 45;
         addChild(_loc5_);
         var _loc6_:§_-22V§ = new §_-22V§(gls("<body>Получи\nслучайный или\n<span class=\'red\'>эпический</span>\nкостюм или образ</body>"),0,278,_loc1_);
         _loc6_.filters = §_-m2A§;
         _loc6_.x = (_loc2_.width - _loc6_.width) * 0.5;
         addChild(_loc6_);
      }
      
      private function §_-x1F§(param1:MouseEvent) : void
      {
         (Services.bank as §_-7O§).buy(§_-S9§.§_-PQ§);
      }
   }
}


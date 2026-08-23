package §_-K1§
{
   import §_-Qy§.§_-x2d§;
   import §_-X1k§.§_-C3E§;
   import §_-bN§.§_-Sg§;
   import com.api.Services;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class §_-J2P§ extends Sprite
   {
      
      public static const §_-q2I§:Array = [new GlowFilter(16777215,1,4,4,8),new GlowFilter(8812372,1,4,4,1)];
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","font-size: 16px;","color: #9A4C0F;","text-align: center;","}",".red {","color: #FF5515;","font-size: 30px;","}"].join("\n");
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,6697728,null,null,null,null,null,"center");
      
      public function §_-J2P§()
      {
         super();
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         var _loc2_:ElementPackageBack = new ElementPackageBack();
         _loc2_.height = 390;
         addChild(_loc2_);
         var _loc3_:§_-i5§ = new §_-i5§(gls("Испытай\nудачу!"),0,1,§_-W2U§);
         _loc3_.x = int((_loc2_.width - _loc3_.textWidth) * 0.5);
         addChild(_loc3_);
         var _loc4_:ImageBundleOutfit = new ImageBundleOutfit();
         _loc4_.x = int((_loc2_.width - _loc4_.width) * 0.5);
         _loc4_.y = 85;
         addChild(_loc4_);
         var _loc5_:§_-x2d§ = new §_-x2d§();
         _loc5_.scaleX = _loc5_.scaleY = 0.8;
         _loc5_.§_-52M§ = 250;
         _loc5_.x = 2;
         _loc5_.y = 45;
         addChild(_loc5_);
         var _loc6_:§_-i5§ = new §_-i5§(gls("<body>Получи\nслучайный или\n<span class=\'red\'>эпический</span>\nкостюм или образ</body>"),0,278,_loc1_);
         _loc6_.filters = §_-q2I§;
         _loc6_.x = (_loc2_.width - _loc6_.width) * 0.5;
         addChild(_loc6_);
      }
      
      private function §_-33n§(param1:MouseEvent) : void
      {
         (Services.bank as §_-Sg§).buy(§_-C3E§.§_-Lh§);
      }
   }
}


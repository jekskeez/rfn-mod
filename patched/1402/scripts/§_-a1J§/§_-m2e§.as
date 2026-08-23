package §_-a1J§
{
   import §_-bN§.Dialog;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-p1r§;
   import views.§_-428§;
   
   public class §_-m2e§ extends Dialog
   {
      
      private static const §_-h13§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private var §_-S2L§:§_-428§ = null;
      
      private var background:ImageDialogChoiceCharacter = null;
      
      private var §_-M1p§:§_-i5§ = null;
      
      public function §_-m2e§()
      {
         super(null,false,true,null,false);
         this.init();
         this.§_-x2T§.scaleX = this.§_-x2T§.scaleY = 0.7;
         this.§_-x2T§.x = 115;
         this.§_-x2T§.y = 25;
      }
      
      override public function show() : void
      {
         this.§_-S2L§.update();
         super.show();
         this.placeOnResize();
      }
      
      public function get available() : Boolean
      {
         return this.§_-S2L§.§_-Qo§;
      }
      
      override protected function placeOnResize() : void
      {
         this.x = Game.starling.stage.stageWidth - 163;
         this.y = 40;
      }
      
      private function init() : void
      {
         this.background = new ImageDialogChoiceCharacter();
         addChild(this.background);
         var _loc1_:§_-p1r§ = new §_-p1r§();
         var _loc2_:ImageRibborn = new ImageRibborn();
         _loc2_.stop();
         this.addChild(_loc2_);
         _loc2_.scaleX = 0.29;
         _loc2_.scaleY = 0.9;
         _loc2_.x = 22;
         _loc2_.y = 31;
         _loc1_.§_-xC§(-44,-3,14,-178);
         _loc2_.filters = [new ColorMatrixFilter(_loc1_)];
         this.§_-M1p§ = new §_-i5§(gls("Кем ты будешь играть?"),23,40,§_-h13§,117);
         this.§_-M1p§.filters = [new DropShadowFilter(0,0,532282,1,4,4,2)];
         addChild(this.§_-M1p§);
         this.§_-S2L§ = new §_-428§(this.§_-M1p§,this.background.bg);
         addChild(this.§_-S2L§);
         place();
         this.width = 245;
         this.height = 180;
      }
   }
}


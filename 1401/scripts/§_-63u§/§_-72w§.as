package §_-63u§
{
   import §_-k1c§.Dialog;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import utils.§_-nO§;
   import views.§_-C3R§;
   
   public class §_-72w§ extends Dialog
   {
      
      private static const §_-63x§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,16777215,null,null,null,null,null,TextFormatAlign.CENTER);
      
      private var §_-UA§:§_-C3R§ = null;
      
      private var background:ImageDialogChoiceCharacter = null;
      
      private var §_-h1X§:§_-22V§ = null;
      
      public function §_-72w§()
      {
         super(null,false,true,null,false);
         this.init();
         this.§_-O2e§.scaleX = this.§_-O2e§.scaleY = 0.7;
         this.§_-O2e§.x = 115;
         this.§_-O2e§.y = 25;
      }
      
      override public function show() : void
      {
         this.§_-UA§.update();
         super.show();
         this.placeOnResize();
      }
      
      public function get available() : Boolean
      {
         return this.§_-UA§.§_-53a§;
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
         var _loc1_:§_-nO§ = new §_-nO§();
         var _loc2_:ImageRibborn = new ImageRibborn();
         _loc2_.stop();
         this.addChild(_loc2_);
         _loc2_.scaleX = 0.29;
         _loc2_.scaleY = 0.9;
         _loc2_.x = 22;
         _loc2_.y = 31;
         _loc1_.§_-bb§(-44,-3,14,-178);
         _loc2_.filters = [new ColorMatrixFilter(_loc1_)];
         this.§_-h1X§ = new §_-22V§(gls("Кем ты будешь играть?"),23,40,§_-63x§,117);
         this.§_-h1X§.filters = [new DropShadowFilter(0,0,532282,1,4,4,2)];
         addChild(this.§_-h1X§);
         this.§_-UA§ = new §_-C3R§(this.§_-h1X§,this.background.bg);
         addChild(this.§_-UA§);
         place();
         this.width = 245;
         this.height = 180;
      }
   }
}


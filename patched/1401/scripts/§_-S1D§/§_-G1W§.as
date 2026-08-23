package §_-S1D§
{
   import flash.display.Sprite;
   
   public class §_-G1W§ extends Sprite
   {
      
      private static var _instance:§_-G1W§;
      
      public function §_-G1W§()
      {
         super();
         _instance = this;
         this.visible = false;
         this.init();
      }
      
      public static function show() : void
      {
         _instance.visible = true;
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      private function init() : void
      {
         var _loc1_:ImageFooterGame = new ImageFooterGame();
         _loc1_.y = §_-a9§.§_-31m§ - §_-3m§.§_-yL§ - _loc1_.height;
         addChild(_loc1_);
      }
   }
}


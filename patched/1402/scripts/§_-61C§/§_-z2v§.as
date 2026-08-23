package §_-61C§
{
   import flash.display.Sprite;
   
   public class §_-z2v§ extends Sprite
   {
      
      private static var _instance:§_-z2v§;
      
      public function §_-z2v§()
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
         _loc1_.y = §_-Zy§.§_-02T§ - §_-im§.§_-u2F§ - _loc1_.height;
         addChild(_loc1_);
      }
   }
}


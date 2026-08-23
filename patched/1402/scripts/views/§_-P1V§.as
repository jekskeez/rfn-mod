package views
{
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-B1d§;
   
   public class §_-P1V§ extends Sprite
   {
      
      private static const §_-C1Q§:TextFormat = new TextFormat(null,11,10316887,true);
      
      private static const §_-fC§:TextFormat = new TextFormat(null,14,16719635,true);
      
      private static var elements:Array = [];
      
      private var §_-y2h§:§_-i5§ = null;
      
      public function §_-P1V§()
      {
         super();
         elements.push(this);
         this.init();
         this.mouseEnabled = false;
      }
      
      public static function update(param1:int) : void
      {
         var _loc3_:§_-P1V§ = null;
         var _loc2_:String = §_-u1W§(param1);
         for each(_loc3_ in elements)
         {
            _loc3_.update(_loc2_);
         }
      }
      
      private static function §_-u1W§(param1:int) : String
      {
         return §_-B1d§.§_-g2n§(param1);
      }
      
      public function dispose() : void
      {
         var _loc1_:int = elements.indexOf(this);
         if(_loc1_ != -1)
         {
            elements.splice(_loc1_,1);
         }
      }
      
      private function init() : void
      {
         var _loc1_:§_-i5§ = new §_-i5§(gls("Акция действует:"),0,0,§_-C1Q§);
         addChild(_loc1_);
         this.§_-y2h§ = new §_-i5§("00:00:00",0,0,§_-fC§);
         this.§_-y2h§.x = _loc1_.width + 2;
         this.§_-y2h§.y = _loc1_.textHeight - this.§_-y2h§.textHeight;
         addChild(this.§_-y2h§);
         this.update("00:00:00");
      }
      
      private function update(param1:String) : void
      {
         this.§_-y2h§.text = param1;
         this.x = 105 - int(this.width * 0.5);
      }
   }
}


package views
{
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-ex§;
   
   public class §_-13U§ extends Sprite
   {
      
      private static const §_-CD§:TextFormat = new TextFormat(null,11,10316887,true);
      
      private static const §_-5i§:TextFormat = new TextFormat(null,14,16719635,true);
      
      private static var elements:Array = [];
      
      private var §_-P1v§:§_-22V§ = null;
      
      public function §_-13U§()
      {
         super();
         elements.push(this);
         this.init();
         this.mouseEnabled = false;
      }
      
      public static function update(param1:int) : void
      {
         var _loc3_:§_-13U§ = null;
         var _loc2_:String = §_-g25§(param1);
         for each(_loc3_ in elements)
         {
            _loc3_.update(_loc2_);
         }
      }
      
      private static function §_-g25§(param1:int) : String
      {
         return §_-ex§.§_-d2X§(param1);
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
         var _loc1_:§_-22V§ = new §_-22V§(gls("Акция действует:"),0,0,§_-CD§);
         addChild(_loc1_);
         this.§_-P1v§ = new §_-22V§("00:00:00",0,0,§_-5i§);
         this.§_-P1v§.x = _loc1_.width + 2;
         this.§_-P1v§.y = _loc1_.textHeight - this.§_-P1v§.textHeight;
         addChild(this.§_-P1v§);
         this.update("00:00:00");
      }
      
      private function update(param1:String) : void
      {
         this.§_-P1v§.text = param1;
         this.x = 105 - int(this.width * 0.5);
      }
   }
}


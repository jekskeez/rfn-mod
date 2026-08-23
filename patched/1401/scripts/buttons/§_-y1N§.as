package buttons
{
   import flash.display.Sprite;
   
   public class §_-y1N§ extends Sprite
   {
      
      protected var buttonsArray:Array = [];
      
      private var §_-z2P§:int;
      
      public function §_-y1N§(param1:Array, param2:int = 0)
      {
         super();
         this.buttonsArray = param1.slice();
         this.init(param2);
      }
      
      public function setState(param1:int) : void
      {
         this.buttonsArray[this.§_-z2P§].visible = false;
         this.buttonsArray[param1].visible = true;
         this.§_-z2P§ = param1;
      }
      
      private function init(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.buttonsArray.length)
         {
            this.buttonsArray[_loc2_].visible = false;
            this.buttonsArray[_loc2_].name = _loc2_.toString();
            addChild(this.buttonsArray[_loc2_]);
            _loc2_++;
         }
         this.setState(param1);
      }
   }
}


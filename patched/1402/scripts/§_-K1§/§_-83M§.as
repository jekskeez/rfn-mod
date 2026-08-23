package §_-K1§
{
   import §_-B1G§.§_-Pd§;
   import §_-X1k§.§_-P2x§;
   import flash.display.Sprite;
   
   public class §_-83M§ extends Sprite
   {
      
      private static const §_-f1j§:int = 4;
      
      protected var §_-k26§:§_-Pd§ = null;
      
      protected var items:Vector.<§_-P2I§>;
      
      public function §_-83M§()
      {
         var _loc3_:§_-P2I§ = null;
         this.items = new Vector.<§_-P2I§>(0);
         super();
         this.y = 55;
         var _loc1_:int = 0;
         while(_loc1_ < this.itemsIds.length)
         {
            _loc3_ = new §_-P2I§(this.itemsIds[_loc1_],false,false);
            _loc3_.x = 12.5 + _loc1_ * 215;
            _loc3_.y = 70;
            _loc3_.visible = _loc1_ < §_-f1j§;
            addChild(_loc3_);
            if(_loc3_.visible)
            {
               _loc3_.§_-O1s§();
            }
            this.items.push(_loc3_);
            _loc1_++;
         }
         if(this.items.length <= §_-f1j§)
         {
            return;
         }
         var _loc2_:int = (this.itemsIds.length - 1) / §_-f1j§ + 1;
         this.§_-k26§ = new §_-Pd§(_loc2_,_loc2_ * 30);
         this.§_-k26§.x = int((§_-Zy§.§_-21V§ - this.§_-k26§.width) * 0.5);
         this.§_-k26§.y = 480;
         this.§_-k26§.§_-E2B§(this.§_-w1T§);
         this.§_-k26§.§_-l1Y§(0);
         addChild(this.§_-k26§);
      }
      
      protected static function §_-ad§(param1:int, param2:int) : int
      {
         var _loc3_:Boolean = §_-P2x§.§_-rA§(param1);
         var _loc4_:Boolean = §_-P2x§.§_-rA§(param2);
         if(_loc3_ != _loc4_)
         {
            return _loc3_ ? -1 : 1;
         }
         return param1 > param2 ? 1 : -1;
      }
      
      protected function get itemsIds() : Array
      {
         return null;
      }
      
      private function §_-w1T§(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.items.length)
         {
            this.items[_loc3_].visible = param1 * §_-f1j§ <= _loc3_ && _loc3_ < param1 * §_-f1j§ + §_-f1j§;
            this.items[_loc3_].x = this.items[_loc3_].visible ? 12.5 + (_loc3_ - param1 * §_-f1j§) * 215 : 0;
            if(this.items[_loc3_].visible)
            {
               this.items[_loc3_].§_-O1s§();
            }
            _loc3_++;
         }
      }
   }
}


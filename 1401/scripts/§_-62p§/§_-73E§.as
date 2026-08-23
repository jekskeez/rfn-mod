package §_-62p§
{
   import §_-I10§.§_-g2W§;
   import §_-Kr§.§_-Q2o§;
   import flash.display.Sprite;
   
   public class §_-73E§ extends Sprite
   {
      
      private static const §_-e2Z§:int = 4;
      
      protected var §_-d1n§:§_-Q2o§ = null;
      
      protected var items:Vector.<§_-F18§>;
      
      public function §_-73E§()
      {
         var _loc3_:§_-F18§ = null;
         this.items = new Vector.<§_-F18§>(0);
         super();
         this.y = 55;
         var _loc1_:int = 0;
         while(_loc1_ < this.itemsIds.length)
         {
            _loc3_ = new §_-F18§(this.itemsIds[_loc1_],false,false);
            _loc3_.x = 12.5 + _loc1_ * 215;
            _loc3_.y = 70;
            _loc3_.visible = _loc1_ < §_-e2Z§;
            addChild(_loc3_);
            if(_loc3_.visible)
            {
               _loc3_.§_-027§();
            }
            this.items.push(_loc3_);
            _loc1_++;
         }
         if(this.items.length <= §_-e2Z§)
         {
            return;
         }
         var _loc2_:int = (this.itemsIds.length - 1) / §_-e2Z§ + 1;
         this.§_-d1n§ = new §_-Q2o§(_loc2_,_loc2_ * 30);
         this.§_-d1n§.x = int((§_-a9§.§_-9o§ - this.§_-d1n§.width) * 0.5);
         this.§_-d1n§.y = 480;
         this.§_-d1n§.§_-G0§(this.§_-Hp§);
         this.§_-d1n§.§_-32c§(0);
         addChild(this.§_-d1n§);
      }
      
      protected static function §_-bS§(param1:int, param2:int) : int
      {
         var _loc3_:Boolean = §_-g2W§.§_-bB§(param1);
         var _loc4_:Boolean = §_-g2W§.§_-bB§(param2);
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
      
      private function §_-Hp§(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.items.length)
         {
            this.items[_loc3_].visible = param1 * §_-e2Z§ <= _loc3_ && _loc3_ < param1 * §_-e2Z§ + §_-e2Z§;
            this.items[_loc3_].x = this.items[_loc3_].visible ? 12.5 + (_loc3_ - param1 * §_-e2Z§) * 215 : 0;
            if(this.items[_loc3_].visible)
            {
               this.items[_loc3_].§_-027§();
            }
            _loc3_++;
         }
      }
   }
}


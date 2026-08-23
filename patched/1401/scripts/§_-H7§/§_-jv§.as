package §_-H7§
{
   import §_-I10§.§_-X2T§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class §_-jv§ extends Sprite
   {
      
      private static const §_-23C§:int = 5;
      
      private static const §_-W1L§:Array = [2,0,11,18,9];
      
      public function §_-jv§()
      {
         super();
         this.build();
      }
      
      private function build() : void
      {
         var _loc5_:Class = null;
         var _loc6_:DisplayObject = null;
         var _loc1_:int = Math.min(§_-23C§,§_-W1L§.length);
         var _loc2_:Number = 20;
         var _loc3_:Number = _loc2_ * 0.55;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc5_ = §_-X2T§.§_-D2L§(§_-W1L§[_loc4_]);
            _loc6_ = new _loc5_();
            if(_loc6_ is MovieClip)
            {
               (_loc6_ as MovieClip).gotoAndStop(1);
            }
            _loc6_.scaleX = _loc6_.scaleY = _loc2_ / Math.max(_loc6_.width,_loc6_.height);
            _loc6_.x = _loc4_ * _loc3_;
            _loc6_.y = (_loc2_ - _loc6_.height) * 0.5;
            addChild(_loc6_);
            _loc4_++;
         }
      }
   }
}


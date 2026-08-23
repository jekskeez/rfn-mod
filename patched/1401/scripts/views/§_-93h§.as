package views
{
   import §_-I10§.§_-vy§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class §_-93h§ extends Sprite
   {
      
      private static const WIDTH:int = 126;
      
      private static const §_-xh§:Number = 312;
      
      public function §_-93h§(param1:int, param2:int)
      {
         var _loc6_:§_-W1y§ = null;
         super();
         addChild(new CollectionPostBackgroundImage());
         var _loc3_:Number = param1 == §_-vy§.§_-Ro§ ? 1.83 : 1.27;
         if(param1 == §_-vy§.§_-Ro§)
         {
            _loc6_ = new §_-W1y§(§_-vy§.§_-53T§(param2));
            _loc6_.scaleX = _loc6_.scaleY = _loc3_ * (WIDTH / §_-xh§);
            _loc6_.x = int((WIDTH - _loc6_.width) * 0.5);
            _loc6_.y = int((WIDTH - _loc6_.height) * 0.5);
            _loc6_.filters = [new GlowFilter(16777215,1,20,20,3)];
            addChild(_loc6_);
            return;
         }
         var _loc4_:Class = param1 == §_-vy§.§_-N§ ? §_-vy§.§_-R2S§(param2) : §_-vy§.§_-z2p§(param2);
         var _loc5_:DisplayObject = new _loc4_();
         _loc5_.scaleX = _loc5_.scaleY = _loc3_;
         _loc5_.x = int((WIDTH - _loc5_.width) * 0.5);
         _loc5_.y = int((WIDTH - _loc5_.height) * 0.5);
         _loc5_.filters = [new GlowFilter(16777215,1,20,20,3)];
         addChild(_loc5_);
      }
   }
}


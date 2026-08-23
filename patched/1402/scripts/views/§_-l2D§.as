package views
{
   import §_-X1k§.§_-42H§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class §_-l2D§ extends Sprite
   {
      
      private static const WIDTH:int = 126;
      
      private static const §_-G2a§:Number = 312;
      
      public function §_-l2D§(param1:int, param2:int)
      {
         var _loc6_:§_-Y2D§ = null;
         super();
         addChild(new CollectionPostBackgroundImage());
         var _loc3_:Number = param1 == §_-42H§.§_-R1m§ ? 1.83 : 1.27;
         if(param1 == §_-42H§.§_-R1m§)
         {
            _loc6_ = new §_-Y2D§(§_-42H§.§_-Z1a§(param2));
            _loc6_.scaleX = _loc6_.scaleY = _loc3_ * (WIDTH / §_-G2a§);
            _loc6_.x = int((WIDTH - _loc6_.width) * 0.5);
            _loc6_.y = int((WIDTH - _loc6_.height) * 0.5);
            _loc6_.filters = [new GlowFilter(16777215,1,20,20,3)];
            addChild(_loc6_);
            return;
         }
         var _loc4_:Class = param1 == §_-42H§.§_-zL§ ? §_-42H§.§_-uI§(param2) : §_-42H§.§_-D1U§(param2);
         var _loc5_:DisplayObject = new _loc4_();
         _loc5_.scaleX = _loc5_.scaleY = _loc3_;
         _loc5_.x = int((WIDTH - _loc5_.width) * 0.5);
         _loc5_.y = int((WIDTH - _loc5_.height) * 0.5);
         _loc5_.filters = [new GlowFilter(16777215,1,20,20,3)];
         addChild(_loc5_);
      }
   }
}


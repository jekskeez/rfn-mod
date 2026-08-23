package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2FixtureDef;
   import flash.display.DisplayObject;
   
   public class §_-g2M§ extends §_-a2Q§
   {
      
      private static const §_-D2R§:Number = 217.55 / Game.§_-12A§;
      
      private static const §_-W2o§:Number = 82 / Game.§_-12A§;
      
      private static const §_-W9§:Number = §_-W2o§ / §_-V2H§;
      
      public function §_-g2M§(param1:DisplayObject = null, param2:b2FixtureDef = null, param3:Number = NaN, param4:Number = NaN)
      {
         param1 = param1 ? param1 : new MountSlicedView();
         param3 = !isNaN(param3) ? param3 : §_-V2H§;
         param4 = !isNaN(param4) ? param4 : §_-D2R§;
         super(param1,param2,param3,param4);
      }
      
      override protected function get points() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-(size.x * §_-W9§) * 0.5,-size.y * 0.5));
         _loc1_.push(new b2Vec2(size.x * §_-W9§ * 0.5,-size.y * 0.5));
         _loc1_.push(new b2Vec2(size.x * 0.5,size.y * 0.5));
         _loc1_.push(new b2Vec2(-size.x * 0.5,size.y * 0.5));
         return _loc1_;
      }
   }
}


package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2FixtureDef;
   import flash.display.DisplayObject;
   
   public class §_-eX§ extends §_-O2a§
   {
      
      private static const §_-NB§:uint = 60 / Game.§_-x2P§;
      
      private static const §_-JB§:Number = 32 / Game.§_-x2P§;
      
      private static const §_-j15§:Number = §_-JB§ / §_-NB§;
      
      public function §_-eX§(param1:DisplayObject = null, param2:b2FixtureDef = null, param3:Number = NaN, param4:Number = NaN)
      {
         param1 = param1 ? param1 : new TrunkView();
         param3 = !isNaN(param3) ? param3 : §_-NB§;
         param4 = !isNaN(param4) ? param4 : §_-T2h§;
         super(param1,param2,param3,param4);
      }
      
      override public function get landSound() : String
      {
         return "land_wood";
      }
      
      override protected function get points() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-(size.x * §_-j15§) * 0.5,-size.y * 0.5));
         _loc1_.push(new b2Vec2(size.x * §_-j15§ * 0.5,-size.y * 0.5));
         _loc1_.push(new b2Vec2(size.x * 0.5,size.y * 0.5));
         _loc1_.push(new b2Vec2(-size.x * 0.5,size.y * 0.5));
         return _loc1_;
      }
   }
}


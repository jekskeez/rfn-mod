package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2FixtureDef;
   
   public class §_-N1U§ extends §_-SU§
   {
      
      private static const WIDTH:int = 153;
      
      private static const §_-kI§:int = 20;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(WIDTH / Game.§_-x2P§,§_-kI§ / Game.§_-x2P§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0,500,§_-SU§.§_-52X§,§_-SU§.§_-FN§,0);
      
      public function §_-N1U§()
      {
         super(WIDTH,§_-kI§,Island1,§_-03A§,§_-L1E§);
      }
   }
}


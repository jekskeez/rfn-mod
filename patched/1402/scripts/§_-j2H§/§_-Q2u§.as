package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2FixtureDef;
   
   public class §_-Q2u§ extends §_-I1S§
   {
      
      private static const WIDTH:int = 153;
      
      private static const §_-i2u§:int = 20;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(WIDTH / Game.§_-12A§,§_-i2u§ / Game.§_-12A§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0,500,§_-I1S§.§_-53X§,§_-I1S§.§_-C3c§,0);
      
      public function §_-Q2u§()
      {
         super(WIDTH,§_-i2u§,Island1,§_-ql§,§_-G2l§);
      }
   }
}


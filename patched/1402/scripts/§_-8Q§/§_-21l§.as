package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import game.mainGame.entity.§_-w1u§;
   
   public class §_-21l§ extends §_-f1e§ implements §_-e2t§, §_-w1u§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-O1n§:uint = 30 / Game.§_-12A§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-O1n§,§_-O1n§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-52v§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[-§_-O1n§,0],[0,0],[§_-O1n§,0]];
      
      public function §_-21l§()
      {
         super();
         this.view = new §_-aS§(new Box2());
         this.view.x = -30;
         this.view.y = -30;
         §_-J2J§(this.view);
      }
      
      public function get landSound() : String
      {
         return "land_wood";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-52v§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
   }
}


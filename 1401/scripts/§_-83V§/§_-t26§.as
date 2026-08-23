package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-YY§;
   import game.mainGame.entity.§_-f2A§;
   
   public class §_-t26§ extends §_-n1e§ implements §_-21e§, §_-YY§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-U1G§:uint = 30 / Game.§_-x2P§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-U1G§,§_-U1G§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-T18§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[-§_-U1G§,0],[0,0],[§_-U1G§,0]];
      
      public function §_-t26§()
      {
         super();
         this.view = new §_-h2I§(new Box2());
         this.view.x = -30;
         this.view.y = -30;
         §_-83v§(this.view);
      }
      
      public function get landSound() : String
      {
         return "land_wood";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-T18§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
   }
}


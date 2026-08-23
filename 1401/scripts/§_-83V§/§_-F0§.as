package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import flash.display.DisplayObject;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-YY§;
   import game.mainGame.entity.§_-f2A§;
   
   public class §_-F0§ extends §_-n1e§ implements §_-21e§, §_-YY§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-Y1b§:uint = 100 / Game.§_-x2P§;
      
      private static const §_-Ly§:Number = 5 / Game.§_-x2P§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-Y1b§,§_-Ly§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[-§_-Y1b§,0],[0,0],[§_-Y1b§,0]];
      
      public function §_-F0§()
      {
         super();
         this.view = new §_-h2I§(this.image);
         this.view.§_-x2x§();
         this.view.y = 1;
         §_-83v§(this.view);
      }
      
      public function get landSound() : String
      {
         return "land_wood";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
      
      protected function get image() : DisplayObject
      {
         return new Balk2();
      }
   }
}


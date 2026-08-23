package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import flash.display.DisplayObject;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-L1q§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   import game.mainGame.entity.§_-w1u§;
   import protocol.§_-u1O§;
   
   public class Balk extends §_-f1e§ implements §_-e2t§, §_-w1u§, §_-L1q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-P1l§:uint = 50 / Game.§_-12A§;
      
      private static const §_-a2K§:Number = 5 / Game.§_-12A§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-P1l§,§_-a2K§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[-§_-P1l§,0],[0,0],[§_-P1l§,0]];
      
      public function Balk()
      {
         super();
         this.view = new §_-aS§(this.image);
         this.view.§_-i18§();
         this.view.y = 2;
         §_-J2J§(this.view);
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1 && this.§_-t2F§ == §_-u1O§.§_-Ag§ && §_-t2c§.active is §_-u24§;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(this.§_-sP§(Game.selfId))
         {
            this.alpha = 0.2;
         }
      }
      
      public function get landSound() : String
      {
         return "land_wood";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
         if(this.§_-sP§(Game.selfId))
         {
            this.alpha = 0.2;
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
      
      protected function get image() : DisplayObject
      {
         return new Balk1();
      }
   }
}


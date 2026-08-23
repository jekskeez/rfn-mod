package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import flash.display.DisplayObject;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   
   public class §_-o25§ extends GameBody implements §_-e2t§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(13.5 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-t2E§:Array = [[0,0]];
      
      protected var view:§_-aS§;
      
      public function §_-o25§()
      {
         super();
         this.view = new §_-aS§(this.poiseIcon);
         this.view.x = -13.5;
         this.view.y = -13.5;
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         if(!param1)
         {
            return;
         }
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         this.body.SetBullet(true);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-200,0)));
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.body) && Boolean(this.body.IsBullet()) && this.body.GetLinearVelocity().Length() <= 100)
         {
            this.body.SetBullet(false);
         }
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
      
      protected function get poiseIcon() : DisplayObject
      {
         return new PoiseL();
      }
   }
}


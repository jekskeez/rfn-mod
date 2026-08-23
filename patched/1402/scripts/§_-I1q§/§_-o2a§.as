package §_-I1q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   
   public class §_-o2a§ extends GameBody
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(2,1);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0,200,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      public function §_-o2a§()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§(new LegoBlock());
         _loc1_.x = -20;
         _loc1_.y = -10;
         §_-J2J§(_loc1_);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
         this.fixed = true;
         setTimeout(this.§_-21H§.map.§_-Y1E§,5000,this,true);
      }
   }
}


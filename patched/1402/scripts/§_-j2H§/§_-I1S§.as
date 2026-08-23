package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import flash.geom.Point;
   import game.mainGame.§_-q2c§;
   
   public class §_-I1S§ extends §_-E2J§
   {
      
      protected static const §_-53X§:uint = 1;
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      protected static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private var §_-eY§:b2FixtureDef;
      
      private var shape:b2PolygonShape;
      
      private var §_-c14§:int;
      
      private var §_-s1T§:int;
      
      public function §_-I1S§(param1:int, param2:int, param3:Class, param4:b2FixtureDef, param5:b2PolygonShape)
      {
         super();
         this.§_-c14§ = param1;
         this.§_-s1T§ = param2;
         this.§_-eY§ = param4;
         this.shape = param5;
         var _loc6_:§_-aS§ = new §_-aS§(new param3());
         _loc6_.x = -this.§_-c14§;
         _loc6_.y = -this.§_-s1T§;
         §_-J2J§(_loc6_);
         this.fixed = true;
         this.§_-11D§ = "belka_land";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.§_-eY§);
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.§_-o1b§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(GameBody.§_-W1F§(param1))
         {
            if(3 in param1)
            {
               this.§_-o1b§ = param1[3];
               §_-z2z§(this.§_-c14§ * 2);
            }
         }
         else
         {
            this.§_-o1b§ = param1[1];
            §_-z2z§(this.§_-c14§ * 2);
         }
      }
      
      override protected function §_-b1G§() : Point
      {
         return new Point(-this.§_-c14§,-this.§_-s1T§);
      }
   }
}


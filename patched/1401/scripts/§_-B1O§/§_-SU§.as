package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   import game.mainGame.§_-V§;
   
   public class §_-SU§ extends §_-l2J§
   {
      
      protected static const §_-52X§:uint = 1;
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      protected static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private var §_-v28§:b2FixtureDef;
      
      private var shape:b2PolygonShape;
      
      private var §_-52q§:int;
      
      private var §_-Jx§:int;
      
      public function §_-SU§(param1:int, param2:int, param3:Class, param4:b2FixtureDef, param5:b2PolygonShape)
      {
         super();
         this.§_-52q§ = param1;
         this.§_-Jx§ = param2;
         this.§_-v28§ = param4;
         this.shape = param5;
         var _loc6_:§_-h2I§ = new §_-h2I§(new param3());
         _loc6_.x = -this.§_-52q§;
         _loc6_.y = -this.§_-Jx§;
         §_-83v§(_loc6_);
         this.fixed = true;
         this.§_-f2O§ = "belka_land";
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.§_-v28§);
         super.build(param1);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.§_-EA§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(GameBody.§_-u1P§(param1))
         {
            if(3 in param1)
            {
               this.§_-EA§ = param1[3];
               §_-2N§(this.§_-52q§ * 2);
            }
         }
         else
         {
            this.§_-EA§ = param1[1];
            §_-2N§(this.§_-52q§ * 2);
         }
      }
      
      override protected function §_-jG§() : Point
      {
         return new Point(-this.§_-52q§,-this.§_-Jx§);
      }
   }
}


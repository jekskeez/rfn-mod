package §_-d11§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-B1O§.Sensor;
   import §_-RI§.§_-h2I§;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-v1e§;
   
   public class §_-UT§ extends §_-33Z§
   {
      
      public static const §_-m2H§:int = 50;
      
      public static const §_-Op§:Number = 0.8;
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-R2y§:int = 8;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(5 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,0.1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public function §_-UT§()
      {
         super();
         this.view = new §_-h2I§(new GrenadePoiseImage());
         this.view.x = -15;
         this.view.y = -15;
         §_-83v§(this.view);
         this.§_-C2o§ = 1000;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
      }
      
      override public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:* = param1.GetFixtureA().GetBody().GetUserData();
         var _loc3_:* = param1.GetFixtureB().GetBody().GetUserData();
         if(_loc2_ is Sensor || _loc3_ is Sensor)
         {
            return;
         }
         §_-b16§();
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(param1.GetFixtureA().GetBody().GetUserData() is §_-v1e§ && param1.GetFixtureB().GetBody().GetUserData() is §_-v1e§)
         {
            param1.SetEnabled(false);
         }
      }
      
      override public function get maxVelocity() : Number
      {
         return §_-m2H§;
      }
      
      override public function get reloadTime() : Number
      {
         return §_-Op§;
      }
      
      override protected function death() : void
      {
         if(!this.body || !this.§_-H2D§)
         {
            return;
         }
         setTimeout(this.§_-P1f§,0,this.position.Copy(),this.body.GetAngle(),this.playerId);
      }
      
      private function §_-P1f§(param1:b2Vec2, param2:Number, param3:int) : void
      {
         var _loc6_:§_-932§ = null;
         if(!this.§_-H2D§ || !this.§_-H2D§.map)
         {
            return;
         }
         var _loc4_:GameMap = this.§_-H2D§.map;
         _loc4_.§_-Qc§(this,true);
         if(param3 != Hero.§_-74§)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < §_-R2y§)
         {
            _loc6_ = new §_-932§();
            _loc6_.playerId = param3;
            _loc6_.angle = param2 + Math.PI * _loc5_ / 4;
            _loc6_.position = param1;
            _loc4_.§_-nA§(_loc6_,true);
            _loc5_++;
         }
      }
   }
}


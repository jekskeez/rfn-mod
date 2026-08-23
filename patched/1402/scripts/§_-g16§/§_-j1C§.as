package §_-g16§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-j2H§.Sensor;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-f1§;
   
   public class §_-j1C§ extends §_-PP§
   {
      
      public static const §_-qU§:int = 50;
      
      public static const §_-93w§:Number = 0.8;
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-IF§:int = 8;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(5 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,0.1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public function §_-j1C§()
      {
         super();
         this.view = new §_-aS§(new GrenadePoiseImage());
         this.view.x = -15;
         this.view.y = -15;
         §_-J2J§(this.view);
         this.§_-Q26§ = 1000;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
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
         §_-th§();
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(param1.GetFixtureA().GetBody().GetUserData() is §_-f1§ && param1.GetFixtureB().GetBody().GetUserData() is §_-f1§)
         {
            param1.SetEnabled(false);
         }
      }
      
      override public function get maxVelocity() : Number
      {
         return §_-qU§;
      }
      
      override public function get reloadTime() : Number
      {
         return §_-93w§;
      }
      
      override protected function death() : void
      {
         if(!this.body || !this.§_-21H§)
         {
            return;
         }
         setTimeout(this.§_-E24§,0,this.position.Copy(),this.body.GetAngle(),this.playerId);
      }
      
      private function §_-E24§(param1:b2Vec2, param2:Number, param3:int) : void
      {
         var _loc6_:§_-A2P§ = null;
         if(!this.§_-21H§ || !this.§_-21H§.map)
         {
            return;
         }
         var _loc4_:GameMap = this.§_-21H§.map;
         _loc4_.§_-Y1E§(this,true);
         if(param3 != Hero.§_-M1O§)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < §_-IF§)
         {
            _loc6_ = new §_-A2P§();
            _loc6_.playerId = param3;
            _loc6_.angle = param2 + Math.PI * _loc5_ / 4;
            _loc6_.position = param1;
            _loc4_.§_-TP§(_loc6_,true);
            _loc5_++;
         }
      }
   }
}


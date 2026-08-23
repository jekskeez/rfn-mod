package §_-g16§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-cm§.§_-V1t§;
   import §_-j2H§.Sensor;
   import flash.utils.Dictionary;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-f1§;
   
   public class §_-w3§ extends §_-PP§
   {
      
      public static const §_-qU§:int = 90;
      
      public static const §_-93w§:Number = 0.4;
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(5 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,0.1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var targets:Dictionary = new Dictionary(true);
      
      public function §_-w3§()
      {
         super();
         this.view = new §_-aS§(new SpikePoiseImage());
         this.view.x = -15;
         this.view.y = -15;
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
      }
      
      override public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:* = param1.GetFixtureA().GetBody().GetUserData();
         var _loc3_:* = param1.GetFixtureB().GetBody().GetUserData();
         var _loc4_:§_-V1t§ = _loc2_ as §_-V1t§ || _loc3_ as §_-V1t§;
         if(!_loc4_)
         {
            if(_loc2_ is Sensor || _loc3_ is Sensor)
            {
               return;
            }
            §_-th§();
            return;
         }
         if(_loc4_.§_-91W§)
         {
            return;
         }
         if(this.targets[_loc4_])
         {
            return;
         }
         this.targets[_loc4_] = true;
         var _loc5_:§_-V1t§ = this.§_-21H§.squirrels.get(this.playerId) as §_-V1t§;
         if(Boolean(_loc5_) && _loc5_.team == _loc4_.team)
         {
            return;
         }
         §_-th§();
         var _loc6_:int = 2 * (Boolean(_loc5_) && _loc5_.§_-a1n§ ? 2 : 1);
         if(_loc5_)
         {
            _loc4_.§_-A1c§(this.playerId,_loc6_);
         }
         _loc4_.health -= _loc6_;
         if(_loc4_.health > 0)
         {
            return;
         }
         _loc4_.§_-b2d§ = Hero.§_-q§;
         _loc4_.§_-kl§(this.playerId);
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         var _loc4_:* = param1.GetFixtureB().GetBody().GetUserData();
         if(_loc3_ is §_-f1§ && _loc4_ is §_-f1§)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc5_:Hero = _loc3_ as Hero || _loc4_ as Hero;
         if(!_loc5_)
         {
            return;
         }
         if(§_-h16§(_loc5_))
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
   }
}


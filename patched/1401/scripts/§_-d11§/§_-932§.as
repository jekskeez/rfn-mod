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
   import §_-RI§.§_-h2I§;
   import §_-T1r§.§_-i1L§;
   import flash.utils.Dictionary;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-f2A§;
   import game.mainGame.entity.§_-v1e§;
   
   public class §_-932§ extends §_-33Z§ implements §_-21e§
   {
      
      public static const §_-m2H§:int = 80;
      
      public static const §_-Op§:Number = 0.2;
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(5 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,0.1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-u2I§:Array = [[0,0]];
      
      private var targets:Dictionary = new Dictionary(true);
      
      public function §_-932§()
      {
         super();
         this.view = new §_-h2I§(new SpikePoiseImage());
         this.view.x = -15;
         this.view.y = -15;
         §_-83v§(this.view);
         this.§_-C2o§ = 500;
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
         var _loc2_:§_-i1L§ = §_-m2N§(param1) as §_-i1L§;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.§_-47§)
         {
            return;
         }
         if(this.targets[_loc2_])
         {
            return;
         }
         this.targets[_loc2_] = true;
         var _loc3_:§_-i1L§ = this.§_-H2D§.squirrels.get(this.playerId) as §_-i1L§;
         if(Boolean(_loc3_) && _loc3_.team == _loc2_.team)
         {
            return;
         }
         var _loc4_:int = Boolean(_loc3_) && _loc3_.§_-R1o§ ? 2 : 1;
         if(_loc3_)
         {
            _loc2_.§_-61i§(this.playerId,_loc4_);
         }
         _loc2_.health -= _loc4_;
         if(_loc2_.health > 0)
         {
            return;
         }
         _loc2_.§_-L1A§ = Hero.§_-X2n§;
         _loc2_.§_-h2r§(this.playerId);
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         var _loc4_:* = param1.GetFixtureB().GetBody().GetUserData();
         if(_loc3_ is §_-v1e§ && _loc4_ is §_-v1e§)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc5_:Hero = _loc3_ as Hero || _loc4_ as Hero;
         if(!_loc5_)
         {
            return;
         }
         if(§_-wN§(_loc5_))
         {
            param1.SetEnabled(false);
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_[1].push(this.playerId);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
      }
      
      override public function get maxVelocity() : Number
      {
         return §_-m2H§;
      }
      
      override public function get reloadTime() : Number
      {
         return §_-Op§;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
   }
}


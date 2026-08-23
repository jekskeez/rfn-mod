package §_-d11§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-81N§.§_-92L§;
   import §_-RI§.§_-h2I§;
   import §_-T1r§.§_-i1L§;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-v1e§;
   
   public class §_-sS§ extends §_-33Z§
   {
      
      public static const §_-m2H§:int = 120;
      
      public static const §_-Op§:Number = 1.2;
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(12 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var targets:Dictionary = new Dictionary(true);
      
      private var controller:§_-92L§;
      
      public function §_-sS§()
      {
         super();
         this.view = new §_-h2I§(new GravityPoiseImage());
         this.view.x = -15;
         this.view.y = -15;
         §_-83v§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetBullet(true);
         this.controller = new §_-92L§();
         this.controller.body = this.body;
         this.controller.affectObjects = false;
         this.controller.affectHero = false;
         this.controller.G = 0;
         this.controller.maxDistance = 0;
         param1.AddController(this.controller);
         super.build(param1);
         setTimeout(this.activate,1000);
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
         var _loc4_:int = 3 * (Boolean(_loc3_) && _loc3_.§_-R1o§ ? 2 : 1);
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
         if(!_loc5_ || Boolean(this.controller) && Boolean(this.controller.affectHero))
         {
            return;
         }
         if(§_-wN§(_loc5_))
         {
            param1.SetEnabled(false);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.controller || !this.controller.GetWorld())
         {
            return;
         }
         this.controller.body = null;
         this.controller.GetWorld().RemoveController(this.controller);
      }
      
      override public function get maxVelocity() : Number
      {
         return §_-m2H§;
      }
      
      override public function get reloadTime() : Number
      {
         return §_-Op§;
      }
      
      private function activate() : void
      {
         if(!this.body)
         {
            return;
         }
         this.controller.affectHero = true;
         this.controller.G = 300;
         this.controller.maxDistance = 10;
      }
   }
}


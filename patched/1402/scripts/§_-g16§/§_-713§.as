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
   import flash.utils.Dictionary;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-f1§;
   
   public class §_-713§ extends §_-PP§
   {
      
      public static const §_-qU§:int = 120;
      
      public static const §_-93w§:int = 0;
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(10 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,1,0.3,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var targets:Dictionary = new Dictionary(true);
      
      public function §_-713§()
      {
         super();
         this.view = new §_-aS§(new BouncingPoiseImage());
         this.view.x = -15;
         this.view.y = -15;
         §_-J2J§(this.view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
      }
      
      override public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:§_-V1t§ = §_-cB§(param1) as §_-V1t§;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.§_-91W§)
         {
            return;
         }
         if(this.targets[_loc2_])
         {
            return;
         }
         this.targets[_loc2_] = true;
         var _loc3_:§_-V1t§ = this.§_-21H§.squirrels.get(this.playerId) as §_-V1t§;
         if(Boolean(_loc3_) && _loc3_.team == _loc2_.team)
         {
            return;
         }
         var _loc4_:int = 2 * (Boolean(_loc3_) && _loc3_.§_-a1n§ ? 2 : 1);
         if(_loc3_)
         {
            _loc2_.§_-A1c§(this.playerId,_loc4_);
         }
         _loc2_.health -= _loc4_;
         if(_loc2_.health > 0)
         {
            return;
         }
         _loc2_.§_-b2d§ = Hero.§_-q§;
         _loc2_.§_-kl§(this.playerId);
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


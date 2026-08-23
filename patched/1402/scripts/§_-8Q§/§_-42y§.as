package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import flash.utils.setTimeout;
   
   public class §_-42y§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 1;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(14 / Game.§_-12A§,4.5 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var controller:b2ConstantAccelController = null;
      
      private var §_-T28§:Boolean = false;
      
      public var bungeeLength:Number;
      
      public function §_-42y§()
      {
         super();
         var _loc1_:§_-aS§ = new §_-aS§(new BungeeBulletImage());
         _loc1_.x = -14;
         _loc1_.y = -5;
         §_-J2J§(_loc1_);
         this.fixedRotation = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(200,0)));
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
      }
      
      override public function dispose() : void
      {
         if(this.§_-21H§)
         {
            this.§_-21H§.world.DestroyController(this.controller);
         }
         this.controller = null;
         this.removeFromParent();
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push(this.bungeeLength);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.bungeeLength = param1[1];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc2_);
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(!(param1.GetFixtureA().GetBody().GetUserData() is §_-y1c§) && !this.§_-T28§);
         }
         else
         {
            param1.SetEnabled(!(param1.GetFixtureB().GetBody().GetUserData() is §_-y1c§) && !this.§_-T28§);
         }
         if(!param1.IsEnabled())
         {
            return;
         }
         this.fixed = true;
         this.§_-T28§ = true;
         setTimeout(this.§_-fj§,100);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-fj§() : void
      {
         if(!this.body || !this.§_-21H§ || !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:§_-43Y§ = new §_-43Y§();
         _loc1_.§_-wN§ = true;
         _loc1_.position = this.body.GetWorldPoint(new b2Vec2(0,this.bungeeLength));
         _loc1_.anchor0.position = this.position.Copy();
         this.§_-21H§.map.§_-TP§(_loc1_,true);
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


package §_-83V§
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
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import flash.utils.setTimeout;
   
   public class §_-81K§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(14 / Game.§_-x2P§,4.5 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,0.5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var controller:b2ConstantAccelController = null;
      
      private var §_-726§:Boolean = false;
      
      public var bungeeLength:Number;
      
      public function §_-81K§()
      {
         super();
         var _loc1_:§_-h2I§ = new §_-h2I§(new BungeeBulletImage());
         _loc1_.x = -14;
         _loc1_.y = -5;
         §_-83v§(_loc1_);
         this.fixedRotation = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
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
         if(this.§_-H2D§)
         {
            this.§_-H2D§.world.DestroyController(this.controller);
         }
         this.controller = null;
         this.removeFromParent();
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push(this.bungeeLength);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.bungeeLength = param1[1];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc2_);
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(!(param1.GetFixtureA().GetBody().GetUserData() is §_-q2y§) && !this.§_-726§);
         }
         else
         {
            param1.SetEnabled(!(param1.GetFixtureB().GetBody().GetUserData() is §_-q2y§) && !this.§_-726§);
         }
         if(!param1.IsEnabled())
         {
            return;
         }
         this.fixed = true;
         this.§_-726§ = true;
         setTimeout(this.§_-f2x§,100);
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
      
      private function §_-f2x§() : void
      {
         if(!this.body || !this.§_-H2D§ || !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:§_-v1r§ = new §_-v1r§();
         _loc1_.§_-g1K§ = true;
         _loc1_.position = this.body.GetWorldPoint(new b2Vec2(0,this.bungeeLength));
         _loc1_.anchor0.position = this.position.Copy();
         this.§_-H2D§.map.§_-nA§(_loc1_,true);
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


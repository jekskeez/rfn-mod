package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-51g§.§_-22J§;
   import §_-Rj§.§_-A32§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-X2v§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.1,0.1,0.1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      public var scale:Number = 1;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-39§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-k2P§:Boolean = true;
      
      private var §_-b1Y§:b2Fixture = null;
      
      private var §_-CG§:§_-93d§;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-X2v§()
      {
         super();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.SetBullet(true);
         this.§_-b1Y§ = this.body.CreateFixture(§_-03A§);
         this.§_-b1Y§.SetUserData(this);
         this.fixedRotation = true;
         super.build(param1);
         this.§_-63R§(this.scale);
         if(!this.§_-m1I§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-60,0)));
         }
         this.§_-CG§ = §_-93d§.instance;
         if(this.§_-A38§)
         {
            this.§_-CG§.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = this.§_-CG§.§_-23j§(§_-93d§.§_-811§);
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y;
         this.§_-A38§.view.§_-IA§ = 30;
         this.§_-A38§.start();
         this.§_-A38§.view.visible = true;
         Hero.self.getStarlingView().parent.addChild(this.§_-A38§.view);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         setTimeout(this.§_-u2o§,600,this);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y;
         this.body.SetBullet(this.body.GetLinearVelocity().Length() > 10);
         if(!this.§_-k2P§ || this.body.GetLinearVelocity().Length() < 10)
         {
            this.§_-cN§();
         }
      }
      
      override public function dispose() : void
      {
         this.§_-cN§();
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         if(!this.§_-A38§)
         {
            return;
         }
         this.§_-A38§.stop();
         this.§_-CG§.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.scale]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
         this.scale = param1[1][1];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         }
         else if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc2_ == null)
         {
            this.§_-b16§();
            return;
         }
         if(!_loc2_.isSelf || _loc2_.id == this.playerId)
         {
            return;
         }
         this.§_-n1m§(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         }
         else if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc3_ == null)
         {
            return;
         }
         TweenMax.to(this,1,{"alpha":0});
         param1.SetEnabled(_loc3_ != null && _loc3_.id != this.playerId);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         if(!this.body || !this.§_-H2D§ || !this.§_-H2D§.map)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
         this.§_-01O§ = true;
      }
      
      public function §_-63R§(param1:Number) : void
      {
         var _loc2_:b2CircleShape = new b2CircleShape(6 / Game.§_-x2P§ * param1);
         this.§_-b1Y§.GetShape().Set(_loc2_);
      }
      
      private function §_-u2o§(param1:§_-X2v§) : void
      {
         if(param1)
         {
            param1.§_-k2P§ = false;
         }
      }
      
      private function §_-n1m§(param1:Hero) : void
      {
         if(!this.§_-H2D§ || param1.§_-G5§)
         {
            this.§_-b16§();
            return;
         }
         if(!this.§_-39§)
         {
            if(this.§_-H2D§ is §_-A32§)
            {
               param1.§_-t25§(true,§_-93d§.§_-C2M§);
               this.alpha = 0;
               this.§_-39§ = true;
               this.§_-b16§();
               return;
            }
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"OnFire":[this.id,param1.id,this.playerId]}));
         }
         this.alpha = 0;
         this.§_-39§ = true;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc3_:Hero = null;
         var _loc2_:Object = param1[1];
         if(!("OnFire" in _loc2_))
         {
            return;
         }
         if(_loc2_["OnFire"][0] != this.id)
         {
            return;
         }
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.squirrels))
         {
            _loc3_ = this.§_-H2D§.squirrels.get(_loc2_["OnFire"][1]) as Hero;
            if(_loc3_)
            {
               _loc3_.§_-t25§(true,§_-93d§.§_-C2M§);
            }
         }
         this.§_-b16§();
      }
      
      private function §_-cN§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.§_-H2D§.world.RemoveController(this.controller);
         this.controller.Clear();
         this.controller = null;
      }
   }
}


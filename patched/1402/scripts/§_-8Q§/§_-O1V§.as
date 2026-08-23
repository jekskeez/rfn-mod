package §_-8Q§
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
   import §_-22D§.TweenMax;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-O1V§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.1,0.1,0.1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      public var scale:Number = 1;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-h12§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-52A§:Boolean = true;
      
      private var §_-s2i§:b2Fixture = null;
      
      private var §_-Mj§:§_-w10§;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-O1V§()
      {
         super();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.SetBullet(true);
         this.§_-s2i§ = this.body.CreateFixture(§_-ql§);
         this.§_-s2i§.SetUserData(this);
         this.fixedRotation = true;
         super.build(param1);
         this.§_-932§(this.scale);
         if(!this.§_-32u§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(-60,0)));
         }
         this.§_-Mj§ = §_-w10§.instance;
         if(this.§_-W1u§)
         {
            this.§_-Mj§.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = this.§_-Mj§.§_-d1y§(§_-w10§.§_-g4§);
         this.§_-W1u§.view.§_-L2Z§ = this.x;
         this.§_-W1u§.view.§_-2F§ = this.y;
         this.§_-W1u§.view.§_-xy§ = 30;
         this.§_-W1u§.start();
         this.§_-W1u§.view.visible = true;
         Hero.self.getStarlingView().parent.addChild(this.§_-W1u§.view);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         setTimeout(this.§_-e1b§,600,this);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         this.§_-W1u§.view.§_-L2Z§ = this.x;
         this.§_-W1u§.view.§_-2F§ = this.y;
         this.body.SetBullet(this.body.GetLinearVelocity().Length() > 10);
         if(!this.§_-52A§ || this.body.GetLinearVelocity().Length() < 10)
         {
            this.§_-oG§();
         }
      }
      
      override public function dispose() : void
      {
         this.§_-oG§();
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         if(!this.§_-W1u§)
         {
            return;
         }
         this.§_-W1u§.stop();
         this.§_-Mj§.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.scale]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
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
            this.§_-th§();
            return;
         }
         if(!_loc2_.isSelf || _loc2_.id == this.playerId)
         {
            return;
         }
         this.§_-y1u§(_loc2_);
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
      
      public function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         if(!this.body || !this.§_-21H§ || !this.§_-21H§.map)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
         this.§_-C1L§ = true;
      }
      
      public function §_-932§(param1:Number) : void
      {
         var _loc2_:b2CircleShape = new b2CircleShape(6 / Game.§_-12A§ * param1);
         this.§_-s2i§.GetShape().Set(_loc2_);
      }
      
      private function §_-e1b§(param1:§_-O1V§) : void
      {
         if(param1)
         {
            param1.§_-52A§ = false;
         }
      }
      
      private function §_-y1u§(param1:Hero) : void
      {
         if(!this.§_-21H§ || param1.§_-a1w§)
         {
            this.§_-th§();
            return;
         }
         if(!this.§_-h12§)
         {
            if(this.§_-21H§ is §_-62b§)
            {
               param1.§_-X1O§(true,§_-w10§.§_-h2G§);
               this.alpha = 0;
               this.§_-h12§ = true;
               this.§_-th§();
               return;
            }
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"OnFire":[this.id,param1.id,this.playerId]}));
         }
         this.alpha = 0;
         this.§_-h12§ = true;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
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
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.squirrels))
         {
            _loc3_ = this.§_-21H§.squirrels.get(_loc2_["OnFire"][1]) as Hero;
            if(_loc3_)
            {
               _loc3_.§_-X1O§(true,§_-w10§.§_-h2G§);
            }
         }
         this.§_-th§();
      }
      
      private function §_-oG§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.§_-21H§.world.RemoveController(this.controller);
         this.controller.Clear();
         this.controller = null;
      }
   }
}


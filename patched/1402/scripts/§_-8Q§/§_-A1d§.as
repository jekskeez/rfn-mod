package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
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
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-A1d§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-n2h§:Number = 26;
      
      private static const §_-9B§:Number = 0.7;
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-n2h§,§_-9B§,new b2Vec2(-§_-n2h§,-§_-9B§));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.1,0.1,0.1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-D27§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-s2i§:b2Fixture = null;
      
      public var scale:Number = 1;
      
      protected var §_-W1u§:§_-11u§;
      
      protected var §_-Mj§:§_-w10§;
      
      private var §_-x1N§:int = 0;
      
      private var §_-k1D§:Hero = null;
      
      public function §_-A1d§()
      {
         super();
         this.§_-Mj§ = §_-w10§.instance;
         if(this.§_-W1u§)
         {
            this.§_-Mj§.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = this.§_-Mj§.§_-d1y§(§_-w10§.§_-xG§);
         this.§_-W1u§.view.visible = false;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.§_-s2i§ = this.body.CreateFixture(§_-ql§);
         this.§_-s2i§.SetUserData(this);
         this.fixedRotation = true;
         super.build(param1);
         this.§_-932§(this.scale);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         if(this.§_-x1N§ != 0)
         {
            clearTimeout(this.§_-x1N§);
         }
         this.§_-x1N§ = setTimeout(this.dispose,1300);
         this.§_-k1D§ = this.§_-21H§.squirrels.get(this.playerId);
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:b2Vec2 = null;
         if(Boolean(this.§_-W1u§ && this.§_-W1u§.view) && Boolean(this.§_-k1D§) && Boolean(this.body))
         {
            _loc2_ = new b2Vec2(15 * (this.§_-k1D§.heroView.direction ? -1 : 1),-5 * this.scale);
            _loc3_ = new b2Vec2(this.§_-k1D§.x,this.§_-k1D§.y);
            _loc4_ = this.§_-v2§(_loc2_,this.§_-k1D§.angle);
            _loc5_ = new b2Vec2(_loc3_.x + _loc4_.x,_loc3_.y + _loc4_.y);
            this.§_-W1u§.view.§_-B1N§ = (this.§_-k1D§.heroView.direction ? Math.PI : 0) + this.§_-k1D§.angle;
            this.§_-W1u§.view.§_-2F§ = _loc5_.y;
            this.§_-W1u§.view.§_-L2Z§ = _loc5_.x;
            this.body.SetPosition(_loc5_);
            this.body.SetAngle((this.§_-k1D§.heroView.direction ? 0 : Math.PI) + this.§_-k1D§.angle);
            if(Boolean(!this.§_-W1u§.view.parent) && Boolean(this.§_-k1D§.getStarlingView()) && Boolean(this.§_-k1D§.getStarlingView().parent))
            {
               this.§_-W1u§.view.visible = true;
               this.§_-W1u§.start();
               this.§_-k1D§.getStarlingView().parent.addChild(this.§_-W1u§.view);
            }
            if(this.§_-k1D§.isDead)
            {
               this.§_-th§();
            }
         }
      }
      
      private function §_-v2§(param1:b2Vec2, param2:Number) : b2Vec2
      {
         var _loc3_:Number = Math.cos(param2);
         var _loc4_:Number = Math.sin(param2);
         return new b2Vec2(_loc3_ * param1.x - _loc4_ * param1.y,_loc4_ * param1.x + _loc3_ * param1.y);
      }
      
      override public function dispose() : void
      {
         this.§_-Mj§.§_-L1c§(this.§_-W1u§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.§_-oG§();
         super.dispose();
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
         if(_loc2_ == null || !_loc2_.isSelf || _loc2_.id == this.playerId)
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
         this.§_-C1L§ = true;
         TweenMax.to(this,0,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      public function §_-932§(param1:Number) : void
      {
         this.scale = param1;
      }
      
      private function §_-y1u§(param1:Hero) : void
      {
         if(!this.§_-21H§ || param1.§_-a1w§)
         {
            return;
         }
         if(!this.§_-D27§)
         {
            if(this.§_-21H§ is §_-62b§)
            {
               param1.§_-X1O§(true);
               return;
            }
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"OnFire":[this.id,param1.id,this.playerId]}));
            if(this.playerId == Game.selfId)
            {
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-x29§,1);
            }
         }
         this.alpha = 0;
         this.§_-D27§ = true;
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
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
               _loc3_.§_-X1O§(true,§_-w10§.§_-e2i§);
            }
            if(_loc2_["OnFire"][2] == Game.selfId)
            {
               Connection.§_-e2T§(§_-u1O§.§_-g2w§,§_-6v§.§_-x29§,1);
            }
         }
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
      
      private function death() : void
      {
         if(!this.body || !this.§_-21H§ || !this.§_-21H§.map)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


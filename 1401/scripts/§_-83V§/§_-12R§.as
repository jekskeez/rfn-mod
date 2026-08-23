package §_-83V§
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
   import §_-42B§.TweenMax;
   import §_-51g§.§_-22J§;
   import §_-Rj§.§_-A32§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-12R§ extends GameBody implements §_-22J§
   {
      
      private static const §_-e2S§:Number = 26;
      
      private static const §_-K28§:Number = 0.7;
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-e2S§,§_-K28§,new b2Vec2(-§_-e2S§,-§_-K28§));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.1,0.1,0.1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-01O§:Boolean = false;
      
      private var §_-42S§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-b1Y§:b2Fixture = null;
      
      public var scale:Number = 1;
      
      protected var §_-A38§:§_-f1G§;
      
      protected var §_-CG§:§_-93d§;
      
      private var §_-52r§:int = 0;
      
      private var §_-sB§:Hero = null;
      
      public function §_-12R§()
      {
         super();
         this.§_-CG§ = §_-93d§.instance;
         if(this.§_-A38§)
         {
            this.§_-CG§.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = this.§_-CG§.§_-23j§(§_-93d§.§_-w1g§);
         this.§_-A38§.view.visible = false;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.§_-b1Y§ = this.body.CreateFixture(§_-03A§);
         this.§_-b1Y§.SetUserData(this);
         this.fixedRotation = true;
         super.build(param1);
         this.§_-63R§(this.scale);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         if(this.§_-52r§ != 0)
         {
            clearTimeout(this.§_-52r§);
         }
         this.§_-52r§ = setTimeout(this.dispose,1300);
         this.§_-sB§ = this.§_-H2D§.squirrels.get(this.playerId);
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:b2Vec2 = null;
         if(Boolean(this.§_-A38§ && this.§_-A38§.view) && Boolean(this.§_-sB§) && Boolean(this.body))
         {
            _loc2_ = new b2Vec2(15 * (this.§_-sB§.heroView.direction ? -1 : 1),-5 * this.scale);
            _loc3_ = new b2Vec2(this.§_-sB§.x,this.§_-sB§.y);
            _loc4_ = this.§_-A3I§(_loc2_,this.§_-sB§.angle);
            _loc5_ = new b2Vec2(_loc3_.x + _loc4_.x,_loc3_.y + _loc4_.y);
            this.§_-A38§.view.§_-P26§ = (this.§_-sB§.heroView.direction ? Math.PI : 0) + this.§_-sB§.angle;
            this.§_-A38§.view.§_-Cg§ = _loc5_.y;
            this.§_-A38§.view.§_-M2F§ = _loc5_.x;
            this.body.SetPosition(_loc5_);
            this.body.SetAngle((this.§_-sB§.heroView.direction ? 0 : Math.PI) + this.§_-sB§.angle);
            if(Boolean(!this.§_-A38§.view.parent) && Boolean(this.§_-sB§.getStarlingView()) && Boolean(this.§_-sB§.getStarlingView().parent))
            {
               this.§_-A38§.view.visible = true;
               this.§_-A38§.start();
               this.§_-sB§.getStarlingView().parent.addChild(this.§_-A38§.view);
            }
            if(this.§_-sB§.isDead)
            {
               this.§_-b16§();
            }
         }
      }
      
      private function §_-A3I§(param1:b2Vec2, param2:Number) : b2Vec2
      {
         var _loc3_:Number = Math.cos(param2);
         var _loc4_:Number = Math.sin(param2);
         return new b2Vec2(_loc3_ * param1.x - _loc4_ * param1.y,_loc4_ * param1.x + _loc3_ * param1.y);
      }
      
      override public function dispose() : void
      {
         this.§_-CG§.§_-ms§(this.§_-A38§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.§_-cN§();
         super.dispose();
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
         if(_loc2_ == null || !_loc2_.isSelf || _loc2_.id == this.playerId)
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
         this.§_-01O§ = true;
         TweenMax.to(this,0,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      public function §_-63R§(param1:Number) : void
      {
         this.scale = param1;
      }
      
      private function §_-n1m§(param1:Hero) : void
      {
         if(!this.§_-H2D§ || param1.§_-G5§)
         {
            return;
         }
         if(!this.§_-42S§)
         {
            if(this.§_-H2D§ is §_-A32§)
            {
               param1.§_-t25§(true);
               return;
            }
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"OnFire":[this.id,param1.id,this.playerId]}));
            if(this.playerId == Game.selfId)
            {
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-P2W§,1);
            }
         }
         this.alpha = 0;
         this.§_-42S§ = true;
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
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
               _loc3_.§_-t25§(true,§_-93d§.§_-MA§);
            }
            if(_loc2_["OnFire"][2] == Game.selfId)
            {
               Connection.§_-Li§(§_-h2B§.§_-41H§,§_-J2r§.§_-P2W§,1);
            }
         }
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
      
      private function death() : void
      {
         if(!this.body || !this.§_-H2D§ || !this.§_-H2D§.map)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


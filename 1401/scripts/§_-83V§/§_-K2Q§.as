package §_-83V§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-B1O§.Branch;
   import §_-RI§.§_-h2I§;
   import §_-u2r§.§_-zP§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-FD§;
   
   public class §_-K2Q§ extends Branch implements §_-FD§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,0.1,§_-52X§,§_-FN§,0);
      
      private var lifeTime:Number = 7.5;
      
      private var §_-01O§:Boolean = false;
      
      protected var §_-Y6§:Boolean = false;
      
      public var §_-b2R§:Boolean = true;
      
      public function §_-K2Q§()
      {
         super();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-Y6§)
         {
            this.body.GetFixtureList().SetDensity(200);
            this.body.ResetMassData();
            this.§_-Y6§ = false;
         }
         this.lifeTime -= param1;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         §_-81u§.getStarlingView().scaleX = this.§_-b2R§ ? -1 : 1;
         this.§_-81u§.pivotX = §_-81u§.scaleX >= 0 ? this.§_-81u§.width * 0.5 - 15 : 0;
         this.§_-o2q§();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.§_-b2R§,this.lifeTime]);
         return _loc1_;
      }
      
      override protected function §_-o2q§() : void
      {
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:int = GameBody.§_-u1P§(param1) ? 4 : 2;
         this.playerId = param1[_loc2_][0];
         this.§_-b2R§ = Boolean(param1[_loc2_][1]);
         this.lifeTime = param1[_loc2_][2];
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.§_-b2R§ ? -100 : 100,-25)));
      }
      
      override public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         if(!param2)
         {
         }
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc3_ == this)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ is §_-zP§)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc4_:Hero = _loc3_ as Hero;
         if(!_loc4_)
         {
            if(!this.fixed)
            {
               this.fixed = true;
               this.§_-81u§.visible = true;
               this.§_-Y6§ = true;
            }
         }
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(!param2)
         {
         }
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc4_ == this)
         {
            _loc4_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         var _loc5_:Hero = _loc4_ as Hero;
         if(!_loc5_)
         {
            if(this.fixed)
            {
               param1.SetEnabled(false);
            }
            return;
         }
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(_loc3_.m_normal.y >= 0);
         }
         else
         {
            param1.SetEnabled(_loc3_.m_normal.y < 0);
         }
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override protected function get fixture() : b2FixtureDef
      {
         return §_-03A§;
      }
      
      override protected function init() : void
      {
         this.§_-81u§ = new §_-h2I§(§_-z1L§);
         this.§_-83v§(§_-81u§);
         size = new b2Vec2(§_-81u§.width / Game.§_-x2P§,0);
         this.fixedRotation = true;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


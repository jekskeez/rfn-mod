package §_-8Q§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-I1q§.§_-m25§;
   import §_-TK§.§_-aS§;
   import §_-j2H§.Branch;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-L1q§;
   
   public class §_-P1H§ extends Branch implements §_-L1q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,0.1,§_-53X§,§_-C3c§,0);
      
      private var lifeTime:Number = 7.5;
      
      private var §_-C1L§:Boolean = false;
      
      protected var §_-h14§:Boolean = false;
      
      public var §_-t1e§:Boolean = true;
      
      public function §_-P1H§()
      {
         super();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-h14§)
         {
            this.body.GetFixtureList().SetDensity(200);
            this.body.ResetMassData();
            this.§_-h14§ = false;
         }
         this.lifeTime -= param1;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         §_-V2l§.getStarlingView().scaleX = this.§_-t1e§ ? -1 : 1;
         this.§_-V2l§.pivotX = §_-V2l§.scaleX >= 0 ? this.§_-V2l§.width * 0.5 - 15 : 0;
         this.§_-Qx§();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.§_-t1e§,this.lifeTime]);
         return _loc1_;
      }
      
      override protected function §_-Qx§() : void
      {
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:int = GameBody.§_-W1F§(param1) ? 4 : 2;
         this.playerId = param1[_loc2_][0];
         this.§_-t1e§ = Boolean(param1[_loc2_][1]);
         this.lifeTime = param1[_loc2_][2];
      }
      
      override public function build(param1:b2World) : void
      {
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.§_-t1e§ ? -100 : 100,-25)));
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
         if(_loc3_ is §_-m25§)
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
               this.§_-V2l§.visible = true;
               this.§_-h14§ = true;
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
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override protected function get fixture() : b2FixtureDef
      {
         return §_-ql§;
      }
      
      override protected function init() : void
      {
         this.§_-V2l§ = new §_-aS§(§_-uY§);
         this.§_-J2J§(§_-V2l§);
         size = new b2Vec2(§_-V2l§.width / Game.§_-12A§,0);
         this.fixedRotation = true;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


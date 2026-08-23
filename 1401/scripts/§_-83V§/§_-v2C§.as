package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   
   public class §_-v2C§ extends §_-73P§ implements §_-22J§
   {
      
      private static const §_-G1T§:int = 0;
      
      private static const §_-n2y§:int = 1;
      
      private static const §_-JU§:int = 2;
      
      private var §_-m2J§:§_-h2I§ = null;
      
      private var §_-Z2a§:b2Fixture = null;
      
      private var §_-a2B§:§_-73P§ = null;
      
      private var §_-g22§:Array = null;
      
      private var §_-71n§:int = 0;
      
      private var §_-91m§:Number = 0;
      
      private var §_-ZK§:Boolean = false;
      
      private var receiverId:int = -1;
      
      private var §_-Gt§:Number = 0;
      
      public var workTime:Number = 5000;
      
      public var blinkTime:Number = 2000;
      
      private var §_-k1p§:int = 0;
      
      public function §_-v2C§()
      {
         super();
         this.§_-k1p§ = this.width;
         this.§_-m2J§ = new §_-h2I§(new Beam());
         this.§_-Gt§ = this.§_-m2J§.width;
         this.§_-m2J§.x = this.§_-m2J§.width * 0.5;
         this.§_-m2J§.mouseEnabled = false;
         this.§_-m2J§.mouseChildren = false;
         this.§_-m2J§.visible = false;
         this.§_-m2J§.rotation = 90;
         this.§_-m2J§.pivotY = this.§_-m2J§.width;
         §_-d2R§(this.§_-m2J§,0);
      }
      
      override public function dispose() : void
      {
         if(this.§_-m2J§)
         {
            this.§_-m2J§.removeFromParent(true);
         }
         this.§_-m2J§ = null;
         this.§_-g22§ = null;
         this.§_-a2B§ = null;
         this.§_-Z2a§ = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         var _loc2_:Array = [this.workTime,this.blinkTime,this.§_-91m§];
         if(this.§_-th§)
         {
            _loc2_.push([this.state,this.§_-th§.id]);
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.workTime = param1[1][0];
         this.blinkTime = param1[1][1];
         this.§_-91m§ = param1[1][2];
         if(!(3 in param1[1]))
         {
            return;
         }
         this.§_-71n§ = param1[1][3][0];
         this.receiverId = param1[1][3][1];
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:* = 0;
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(this.§_-g22§ == null)
         {
            this.§_-g22§ = this.§_-H2D§.map.get(§_-73P§);
         }
         if(this.§_-th§ == null)
         {
            if(this.receiverId != -1)
            {
               this.§_-th§ = this.§_-H2D§.map.getObject(this.receiverId) as §_-73P§;
               this.state = this.state;
               this.receiverId = -1;
               return;
            }
            _loc2_ = int(this.§_-g22§.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.§_-j1T§(this.§_-g22§[_loc2_]))
               {
                  this.§_-th§ = this.§_-g22§[_loc2_];
                  this.state = §_-G1T§;
                  return;
               }
               _loc2_--;
            }
         }
         else if(!this.§_-j1T§(this.§_-th§))
         {
            this.§_-th§ = null;
         }
         else
         {
            if(this.§_-91m§ <= 0)
            {
               this.state = this.state == §_-JU§ ? §_-G1T§ : §_-JU§;
               this.§_-91m§ = this.state == §_-JU§ ? this.blinkTime : this.workTime;
            }
            else
            {
               this.§_-91m§ -= param1 * 1000;
            }
            if(this.state == §_-G1T§ && this.§_-91m§ < 1.5 * 1000 && this.blinkTime > 0)
            {
               this.state = §_-n2y§;
            }
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(this.state != §_-JU§)
         {
            return;
         }
         if(param1.GetFixtureA() != this.§_-Z2a§ && param1.GetFixtureB() != this.§_-Z2a§)
         {
            return;
         }
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function set §_-th§(param1:§_-73P§) : void
      {
         if(this.§_-a2B§ == param1)
         {
            return;
         }
         this.§_-a2B§ = param1;
         if(this.§_-Z2a§)
         {
            this.body.DestroyFixture(this.§_-Z2a§);
         }
         this.§_-Z2a§ = null;
         this.§_-m2J§.visible = param1 != null;
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = Number(b2Math.SubtractVV(this.position,param1.position).Length());
         this.§_-m2J§.scaleX = _loc2_ * Game.§_-x2P§ / this.§_-Gt§;
         this.§_-m2J§.x = this.§_-k1p§ * 0.5;
         this.§_-m2J§.y = -this.§_-m2J§.height + 5;
         var _loc3_:b2FixtureDef = new b2FixtureDef(b2PolygonShape.AsOrientedBox(2 / Game.§_-x2P§,_loc2_ * 0.5,new b2Vec2(0,-_loc2_ * 0.5)),this,0.8,0.1,0.1,§_-V§.§_-j1I§,§_-V§.§_-qV§);
         this.§_-Z2a§ = this.body.CreateFixture(_loc3_);
         this.§_-Z2a§.SetUserData(this);
      }
      
      private function get §_-th§() : §_-73P§
      {
         return this.§_-a2B§;
      }
      
      private function set state(param1:int) : void
      {
         switch(param1)
         {
            case §_-G1T§:
               this.§_-91m§ = this.workTime;
               this.§_-e24§(§_-V§.§_-j1I§);
               this.§_-m2J§.visible = true;
               break;
            case §_-n2y§:
               break;
            case §_-JU§:
               if(this.blinkTime == 0)
               {
                  return;
               }
               this.§_-m2J§.visible = false;
               this.§_-91m§ = this.blinkTime;
               this.§_-e24§(§_-V§.§_-eh§);
         }
         this.§_-71n§ = param1;
      }
      
      private function get state() : int
      {
         return this.§_-71n§;
      }
      
      private function §_-e24§(param1:uint) : void
      {
         if(!this.§_-Z2a§)
         {
            return;
         }
         var _loc2_:b2FilterData = this.§_-Z2a§.GetFilterData();
         _loc2_.categoryBits = param1;
         this.§_-Z2a§.SetFilterData(_loc2_);
      }
      
      private function §_-j1T§(param1:§_-73P§) : Boolean
      {
         var _loc2_:b2Vec2 = b2Math.SubtractVV(param1.position,this.position);
         var _loc3_:b2Vec2 = _loc2_.Copy();
         _loc3_.Normalize();
         if(Math.abs(b2Math.Dot(_loc3_,this.body.GetWorldVector(new b2Vec2(1,0)))) >= 0.05 || Math.abs(b2Math.Dot(_loc3_,param1.body.GetWorldVector(new b2Vec2(1,0)))) >= 0.05 || b2Math.AddVV(this.body.GetWorldVector(new b2Vec2(0,-1)),_loc2_).Length() < _loc2_.Length() || b2Math.AddVV(param1.body.GetWorldVector(new b2Vec2(0,-1)),_loc2_).Length() > _loc2_.Length())
         {
            return false;
         }
         this.§_-ZK§ = false;
         this.§_-H2D§.world.RayCast(this.§_-k27§,param1.position,this.position);
         return !this.§_-ZK§;
      }
      
      private function §_-k27§(param1:b2Fixture, param2:b2Vec2, param3:b2Vec2, param4:Number) : Number
      {
         var _loc5_:b2Body = param1.GetBody();
         if(_loc5_ != this.body && !(_loc5_.GetUserData() is Hero) && !(_loc5_.GetUserData() is §_-r1o§) && param1.GetUserData() != this)
         {
            this.§_-ZK§ = true;
            return 0;
         }
         return 1;
      }
   }
}


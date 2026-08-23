package §_-8Q§
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
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   
   public class §_-v1O§ extends §_-X2N§ implements §_-Pn§
   {
      
      private static const §_-12t§:int = 0;
      
      private static const §_-z1x§:int = 1;
      
      private static const §_-Vw§:int = 2;
      
      private var §_-w1N§:§_-aS§ = null;
      
      private var §_-43d§:b2Fixture = null;
      
      private var §_-b1w§:§_-X2N§ = null;
      
      private var §_-T2z§:Array = null;
      
      private var §_-D2k§:int = 0;
      
      private var §_-422§:Number = 0;
      
      private var §_-Db§:Boolean = false;
      
      private var receiverId:int = -1;
      
      private var §_-610§:Number = 0;
      
      public var workTime:Number = 5000;
      
      public var blinkTime:Number = 2000;
      
      private var §_-jL§:int = 0;
      
      public function §_-v1O§()
      {
         super();
         this.§_-jL§ = this.width;
         this.§_-w1N§ = new §_-aS§(new Beam());
         this.§_-610§ = this.§_-w1N§.width;
         this.§_-w1N§.x = this.§_-w1N§.width * 0.5;
         this.§_-w1N§.mouseEnabled = false;
         this.§_-w1N§.mouseChildren = false;
         this.§_-w1N§.visible = false;
         this.§_-w1N§.rotation = 90;
         this.§_-w1N§.pivotY = this.§_-w1N§.width;
         §_-D2f§(this.§_-w1N§,0);
      }
      
      override public function dispose() : void
      {
         if(this.§_-w1N§)
         {
            this.§_-w1N§.removeFromParent(true);
         }
         this.§_-w1N§ = null;
         this.§_-T2z§ = null;
         this.§_-b1w§ = null;
         this.§_-43d§ = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         var _loc2_:Array = [this.workTime,this.blinkTime,this.§_-422§];
         if(this.§_-AF§)
         {
            _loc2_.push([this.state,this.§_-AF§.id]);
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.workTime = param1[1][0];
         this.blinkTime = param1[1][1];
         this.§_-422§ = param1[1][2];
         if(!(3 in param1[1]))
         {
            return;
         }
         this.§_-D2k§ = param1[1][3][0];
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
         if(this.§_-T2z§ == null)
         {
            this.§_-T2z§ = this.§_-21H§.map.get(§_-X2N§);
         }
         if(this.§_-AF§ == null)
         {
            if(this.receiverId != -1)
            {
               this.§_-AF§ = this.§_-21H§.map.getObject(this.receiverId) as §_-X2N§;
               this.state = this.state;
               this.receiverId = -1;
               return;
            }
            _loc2_ = int(this.§_-T2z§.length - 1);
            while(_loc2_ >= 0)
            {
               if(this.§_-aI§(this.§_-T2z§[_loc2_]))
               {
                  this.§_-AF§ = this.§_-T2z§[_loc2_];
                  this.state = §_-12t§;
                  return;
               }
               _loc2_--;
            }
         }
         else if(!this.§_-aI§(this.§_-AF§))
         {
            this.§_-AF§ = null;
         }
         else
         {
            if(this.§_-422§ <= 0)
            {
               this.state = this.state == §_-Vw§ ? §_-12t§ : §_-Vw§;
               this.§_-422§ = this.state == §_-Vw§ ? this.blinkTime : this.workTime;
            }
            else
            {
               this.§_-422§ -= param1 * 1000;
            }
            if(this.state == §_-12t§ && this.§_-422§ < 1.5 * 1000 && this.blinkTime > 0)
            {
               this.state = §_-z1x§;
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
         if(this.state != §_-Vw§)
         {
            return;
         }
         if(param1.GetFixtureA() != this.§_-43d§ && param1.GetFixtureB() != this.§_-43d§)
         {
            return;
         }
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function set §_-AF§(param1:§_-X2N§) : void
      {
         if(this.§_-b1w§ == param1)
         {
            return;
         }
         this.§_-b1w§ = param1;
         if(this.§_-43d§)
         {
            this.body.DestroyFixture(this.§_-43d§);
         }
         this.§_-43d§ = null;
         this.§_-w1N§.visible = param1 != null;
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = Number(b2Math.SubtractVV(this.position,param1.position).Length());
         this.§_-w1N§.scaleX = _loc2_ * Game.§_-12A§ / this.§_-610§;
         this.§_-w1N§.x = this.§_-jL§ * 0.5;
         this.§_-w1N§.y = -this.§_-w1N§.height + 5;
         var _loc3_:b2FixtureDef = new b2FixtureDef(b2PolygonShape.AsOrientedBox(2 / Game.§_-12A§,_loc2_ * 0.5,new b2Vec2(0,-_loc2_ * 0.5)),this,0.8,0.1,0.1,§_-q2c§.§_-wI§,§_-q2c§.§_-rT§);
         this.§_-43d§ = this.body.CreateFixture(_loc3_);
         this.§_-43d§.SetUserData(this);
      }
      
      private function get §_-AF§() : §_-X2N§
      {
         return this.§_-b1w§;
      }
      
      private function set state(param1:int) : void
      {
         switch(param1)
         {
            case §_-12t§:
               this.§_-422§ = this.workTime;
               this.§_-R2J§(§_-q2c§.§_-wI§);
               this.§_-w1N§.visible = true;
               break;
            case §_-z1x§:
               break;
            case §_-Vw§:
               if(this.blinkTime == 0)
               {
                  return;
               }
               this.§_-w1N§.visible = false;
               this.§_-422§ = this.blinkTime;
               this.§_-R2J§(§_-q2c§.§_-o2l§);
         }
         this.§_-D2k§ = param1;
      }
      
      private function get state() : int
      {
         return this.§_-D2k§;
      }
      
      private function §_-R2J§(param1:uint) : void
      {
         if(!this.§_-43d§)
         {
            return;
         }
         var _loc2_:b2FilterData = this.§_-43d§.GetFilterData();
         _loc2_.categoryBits = param1;
         this.§_-43d§.SetFilterData(_loc2_);
      }
      
      private function §_-aI§(param1:§_-X2N§) : Boolean
      {
         var _loc2_:b2Vec2 = b2Math.SubtractVV(param1.position,this.position);
         var _loc3_:b2Vec2 = _loc2_.Copy();
         _loc3_.Normalize();
         if(Math.abs(b2Math.Dot(_loc3_,this.body.GetWorldVector(new b2Vec2(1,0)))) >= 0.05 || Math.abs(b2Math.Dot(_loc3_,param1.body.GetWorldVector(new b2Vec2(1,0)))) >= 0.05 || b2Math.AddVV(this.body.GetWorldVector(new b2Vec2(0,-1)),_loc2_).Length() < _loc2_.Length() || b2Math.AddVV(param1.body.GetWorldVector(new b2Vec2(0,-1)),_loc2_).Length() > _loc2_.Length())
         {
            return false;
         }
         this.§_-Db§ = false;
         this.§_-21H§.world.RayCast(this.§_-f2O§,param1.position,this.position);
         return !this.§_-Db§;
      }
      
      private function §_-f2O§(param1:b2Fixture, param2:b2Vec2, param3:b2Vec2, param4:Number) : Number
      {
         var _loc5_:b2Body = param1.GetBody();
         if(_loc5_ != this.body && !(_loc5_.GetUserData() is Hero) && !(_loc5_.GetUserData() is §_-r2M§) && param1.GetUserData() != this)
         {
            this.§_-Db§ = true;
            return 0;
         }
         return 1;
      }
   }
}


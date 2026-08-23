package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-f1u§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-NA§;
   
   public class §_-82W§ extends GameBody implements §_-NA§, §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-63w§:Number = 0;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsVector(§_-M1z§,0);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-U1j§:Number = -Math.PI;
      
      public var delayTime:Number = 2000;
      
      public var workTime:Number = 5000;
      
      private var view:§_-f1u§ = null;
      
      private var §_-422§:Number = 0;
      
      private var §_-w1E§:Boolean = false;
      
      private var §_-Y1B§:Array = [];
      
      private var §_-J1H§:Number = -5;
      
      public function §_-82W§()
      {
         super();
         this.view = new §_-f1u§(new ConveyorView());
         this.view.loop = true;
         this.view.stop();
         this.view.x = 0;
         this.view.y = 0;
         §_-J2J§(this.view);
         this.fixed = true;
      }
      
      private static function get §_-M1z§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-7,-1.25));
         _loc1_.push(new b2Vec2(7,-1.25));
         _loc1_.push(new b2Vec2(7.9,0));
         _loc1_.push(new b2Vec2(7,1.25));
         _loc1_.push(new b2Vec2(-7,1.25));
         _loc1_.push(new b2Vec2(-7.9,0));
         return _loc1_;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         this.§_-Y1B§ = null;
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-422§ <= 0)
         {
            this.§_-C1D§ = !this.§_-C1D§;
            this.§_-422§ = this.§_-C1D§ ? this.workTime : this.delayTime;
         }
         else
         {
            this.§_-422§ -= param1 * 1000;
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.velocity,this.workTime,this.delayTime,this.§_-C1D§,this.§_-422§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.velocity = param1[1][0];
         this.workTime = param1[1][1];
         this.delayTime = param1[1][2];
         this.§_-C1D§ = Boolean(param1[1][3]);
         this.§_-422§ = param1[1][4];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:b2Body = null;
         if(param1.GetFixtureA().GetUserData() == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody();
         }
         else
         {
            _loc2_ = param1.GetFixtureA().GetBody();
         }
         this.§_-Y1B§.push(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         var _loc2_:b2Body = null;
         if(param1.GetFixtureA().GetUserData() == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody();
         }
         else
         {
            _loc2_ = param1.GetFixtureA().GetBody();
         }
         var _loc3_:int = this.§_-Y1B§.indexOf(_loc2_);
         if(_loc3_ == -1)
         {
            return;
         }
         this.§_-Y1B§.push(_loc2_);
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(!this.§_-C1D§)
         {
            return;
         }
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:b2Vec2 = this.body.GetLocalPoint(_loc3_.m_points[0]);
         var _loc5_:Number = Math.atan2(_loc4_.y,_loc4_.x);
         if(§_-U1j§ > _loc5_ || §_-63w§ < _loc5_)
         {
            return;
         }
         param1.SetTangentSpeed(this.velocity);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function get velocity() : Number
      {
         return this.§_-J1H§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-J1H§ = param1;
      }
      
      private function set §_-C1D§(param1:Boolean) : void
      {
         if(this.§_-w1E§ == param1)
         {
            return;
         }
         if(!param1 && this.delayTime == 0)
         {
            return;
         }
         this.§_-w1E§ = param1;
         if(param1)
         {
            this.view.play();
         }
         else
         {
            this.view.stop();
         }
         if(!param1)
         {
            return;
         }
         var _loc2_:* = int(this.§_-Y1B§.length - 1);
         while(_loc2_ >= 0)
         {
            (this.§_-Y1B§[_loc2_] as b2Body).ApplyImpulse(this.body.GetWorldVector(new b2Vec2(0,0.1)),(this.§_-Y1B§[_loc2_] as b2Body).GetWorldCenter());
            _loc2_--;
         }
      }
      
      private function get §_-C1D§() : Boolean
      {
         return this.§_-w1E§;
      }
   }
}


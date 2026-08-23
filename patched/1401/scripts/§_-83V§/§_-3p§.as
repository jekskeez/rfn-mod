package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import §_-Rj§.§_-A32§;
   import §_-T1r§.§_-03i§;
   import §_-f17§.§_-Gn§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import game.mainGame.§_-V§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-3p§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-h2o§:int = 70;
      
      private static const §_-21I§:int = 5000;
      
      private static const §_-s2W§:int = 50;
      
      private static const §_-e7§:int = 0;
      
      private static const §_-y2X§:int = 1;
      
      private static const §_-Z1P§:int = 2;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(33 / Game.§_-x2P§,5 / Game.§_-x2P§,new b2Vec2(0,-4 / Game.§_-x2P§));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var §_-71n§:int = 0;
      
      private var hero:Hero = null;
      
      private var §_-i2J§:b2Joint = null;
      
      private var §_-d2z§:b2Joint = null;
      
      private var §_-J1A§:b2DistanceJointDef = null;
      
      private var §_-w1T§:§_-Gn§ = null;
      
      private var §_-yP§:int = 0;
      
      private var buff:§_-03i§ = null;
      
      private var timer:Timer = new Timer(50,100);
      
      private var §_-U1X§:Number = 0;
      
      private var §_-PU§:§_-h2I§ = null;
      
      private var §_-Xr§:Array = null;
      
      public var ropeLength:int = 7;
      
      public function §_-3p§()
      {
         super();
         this.view = new §_-d2d§(new TrapView());
         this.view.x = 0;
         this.view.y = 0;
         this.view.loop = false;
         this.view.gotoAndStop(0);
         §_-83v§(this.view);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function get angle() : Number
      {
         return 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function get rotation() : Number
      {
         return 0;
      }
      
      override public function set rotation(param1:Number) : void
      {
      }
      
      override public function §_-B2M§(param1:Point) : Boolean
      {
         return this.view.§_-B2M§(param1);
      }
      
      override public function set filters(param1:Array) : void
      {
         this.view.filters = param1;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.ropeLength]);
         if(this.hero)
         {
            _loc1_[_loc1_.length - 1].push([this.hero.id,this.state,[this.§_-J1A§.localAnchorA.x,this.§_-J1A§.localAnchorA.y]]);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1.pop();
         this.ropeLength = _loc2_[0];
         if(_loc2_.length < 2)
         {
            return;
         }
         this.§_-Xr§ = _loc2_[1];
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetUserData(this);
         super.build(param1);
         this.§_-J1A§ = new b2DistanceJointDef();
         this.§_-J1A§.bodyA = this.body.GetWorld().GetGroundBody();
         this.§_-J1A§.bodyB = this.body;
         this.§_-J1A§.localAnchorB = new b2Vec2();
         this.§_-J1A§.frequencyHz = 3;
         this.§_-J1A§.rope = true;
         this.§_-J1A§.length = this.ropeLength;
         this.§_-w1T§ = new §_-Gn§();
         this.§_-w1T§.visible = false;
         this.§_-w1T§.start = new Point(0,0);
         §_-83v§(this.§_-w1T§);
         this.§_-PU§ = new §_-h2I§(new RopeToTrapEnd());
         this.§_-PU§.visible = false;
         §_-83v§(this.§_-PU§);
         if(!this.§_-Xr§)
         {
            return;
         }
         this.position = new b2Vec2(this.§_-Xr§[2][0],this.§_-Xr§[2][1]);
         if(this.§_-Xr§[1] == §_-y2X§)
         {
            this.§_-K5§(this.§_-Xr§[0]);
         }
         this.§_-J1A§.localAnchorA = new b2Vec2(this.§_-Xr§[2][0],this.§_-Xr§[2][1]);
         if(this.§_-Xr§[1] != §_-Z1P§)
         {
            return;
         }
         this.hero = this.§_-H2D§.squirrels.get(this.§_-Xr§[0]);
         this.state = §_-y2X§;
         this.§_-WU§();
      }
      
      override public function dispose() : void
      {
         this.§_-L1Z§(true);
         if(this.§_-d2z§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-d2z§);
         }
         this.§_-d2z§ = null;
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         this.view.removeEventListener(Event.COMPLETE,this.§_-Eh§);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.§_-d2z§) && this.§_-w1T§.length > this.ropeLength * Game.§_-x2P§ + 4)
         {
            this.§_-yP§ += param1 * 1000;
            if(this.§_-yP§ >= §_-21I§)
            {
               this.§_-x26§();
            }
         }
         else
         {
            this.§_-yP§ = 0;
         }
         if(!this.§_-d2z§)
         {
            return;
         }
         var _loc2_:b2Vec2 = b2Math.SubtractVV(this.§_-d2z§.GetAnchorA(),this.position);
         _loc2_.Multiply(Game.§_-x2P§);
         this.§_-PU§.x = _loc2_.x;
         this.§_-PU§.y = _loc2_.y;
         this.§_-w1T§.end = new Point(_loc2_.x,_loc2_.y);
      }
      
      public function get §_-31k§() : Boolean
      {
         return this.hero == null;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.ghost || this.state != §_-e7§)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc2_:Hero = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         if(!_loc2_)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:b2Vec2 = _loc3_.m_normal.Copy();
         if(param1.GetFixtureB().GetUserData() == this)
         {
            _loc4_ = _loc4_.GetNegative();
         }
         var _loc5_:b2Vec2 = this.body != null ? new b2Vec2(Math.cos(this.body.GetAngle() - Math.PI * 0.5),Math.sin(this.body.GetAngle() - Math.PI * 0.5)) : new b2Vec2(0,0);
         if(b2Math.Dot(_loc4_,_loc5_) < 0.5)
         {
            return;
         }
         if(Boolean(_loc2_.isDead || _loc2_.inHollow) || Boolean(this.hero) || _loc2_.hasJoints("trap"))
         {
            return;
         }
         this.§_-u11§(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(this.ghost || this.state != §_-e7§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-u11§(param1:Hero) : void
      {
         if(param1.id > 0 && param1.id != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-K5§(param1.id);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"trapSquirrel":[this.id,param1.id]}));
         }
      }
      
      public function §_-039§() : void
      {
         if(Boolean(this.hero) && Boolean(this.hero.id > 0) && this.hero.id != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-L1Z§();
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"trapRemove":[this.id]}));
         }
      }
      
      private function §_-x26§() : void
      {
         if(Boolean(this.hero) && Boolean(this.hero.id > 0) && this.hero.id != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-WU§();
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"trapUnleash":[this.id]}));
         }
      }
      
      private function §_-K5§(param1:int) : void
      {
         if(!this.§_-H2D§ || this.hero != null || this.state != §_-e7§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("trap"))
         {
            return;
         }
         this.hero = _loc2_;
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-n1x§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-Y1J§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.§_-J1A§.localAnchorA = this.body.GetPosition().Copy();
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyB = this.body;
         _loc2_.§_-K18§(_loc3_);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2(0,2);
         _loc3_.localAnchorB = new b2Vec2();
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         _loc3_.enableLimit = true;
         this.§_-i2J§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-i2J§.SetUserData("trap");
         this.state = §_-y2X§;
         this.§_-U1X§ = 0;
      }
      
      private function §_-L1Z§(param1:Boolean = false) : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         this.hero.removeEventListener(SquirrelEvent.§_-n1x§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-Y1J§,this.§_-jf§);
         this.hero.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         if(this.§_-U1X§ != 0)
         {
            this.hero.runSpeed += this.§_-U1X§;
         }
         this.§_-U1X§ = 0;
         this.hero.isStopped = false;
         this.view.removeEventListener(Event.COMPLETE,this.§_-Eh§);
         if(this.§_-i2J§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-i2J§);
            this.§_-i2J§ = null;
         }
         if(this.timer.running)
         {
            this.timer.reset();
            this.hero.removeBuff(this.buff,this.timer);
         }
         if(!param1)
         {
            this.state = §_-e7§;
         }
         this.hero = null;
      }
      
      private function §_-WU§() : void
      {
         if(!this.hero || this.state != §_-y2X§)
         {
            return;
         }
         if(!this.buff)
         {
            this.buff = new §_-03i§(new TrapImg(),0.3,0.5,gls("Белка в капкане бежит на 50% медленне."));
         }
         this.hero.§_-Aj§(this.buff,this.timer);
         this.§_-U1X§ = this.hero.runSpeed * §_-s2W§ / 100;
         this.hero.runSpeed -= this.§_-U1X§;
         this.timer.reset();
         this.timer.start();
         this.state = §_-Z1P§;
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-L1Z§();
      }
      
      private function set state(param1:int) : void
      {
         if(this.§_-71n§ == param1)
         {
            return;
         }
         this.§_-71n§ = param1;
         switch(param1)
         {
            case §_-e7§:
               §_-d2R§(this.view,0);
               this.view.scaleXY(1);
               this.view.gotoAndStop(0);
               this.view.y = 0;
               this.§_-w1T§.visible = false;
               this.§_-PU§.visible = false;
               this.position = this.§_-J1A§.localAnchorA.Copy();
               break;
            case §_-y2X§:
               if(this.§_-d2z§ == null)
               {
                  this.§_-d2z§ = this.body.GetWorld().CreateJoint(this.§_-J1A§);
               }
               if(this.hero.heroView is §_-v2j§)
               {
                  this.view.y = (this.hero.height - this.view.height) * 0.5;
                  this.hero.§_-83v§(this.view);
                  this.view.scaleXY(1);
               }
               this.view.play();
               this.view.addEventListener(Event.COMPLETE,this.§_-Eh§);
               this.hero.isStopped = true;
               this.§_-w1T§.visible = true;
               this.§_-PU§.visible = true;
               break;
            case §_-Z1P§:
               if(this.§_-d2z§)
               {
                  this.body.GetWorld().DestroyJoint(this.§_-d2z§);
                  this.§_-d2z§ = null;
               }
               this.§_-w1T§.visible = false;
               this.§_-PU§.visible = false;
         }
      }
      
      private function get state() : int
      {
         return this.§_-71n§;
      }
      
      private function §_-Eh§(param1:Event) : void
      {
         this.hero.isStopped = false;
         this.view.removeEventListener(Event.COMPLETE,this.§_-Eh§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-039§();
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("trapSquirrel" in _loc2_)
         {
            if(_loc2_["trapSquirrel"][0] != this.id)
            {
               return;
            }
            this.§_-K5§(_loc2_["trapSquirrel"][1]);
         }
         if("trapRemove" in _loc2_)
         {
            if(_loc2_["trapRemove"][0] != this.id)
            {
               return;
            }
            this.§_-L1Z§();
         }
         if("trapUnleash" in _loc2_)
         {
            if(_loc2_["trapUnleash"][0] != this.id)
            {
               return;
            }
            this.§_-WU§();
         }
      }
   }
}


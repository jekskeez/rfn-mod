package §_-8Q§
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
   import §_-82h§.§_-KS§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import game.mainGame.§_-q2c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-Lr§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C2s§:int = 70;
      
      private static const §_-bK§:int = 5000;
      
      private static const §_-53q§:int = 50;
      
      private static const §_-32o§:int = 0;
      
      private static const §_-y2r§:int = 1;
      
      private static const §_-x§:int = 2;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(33 / Game.§_-12A§,5 / Game.§_-12A§,new b2Vec2(0,-4 / Game.§_-12A§));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var §_-D2k§:int = 0;
      
      private var hero:Hero = null;
      
      private var §_-C1I§:b2Joint = null;
      
      private var §_-U2X§:b2Joint = null;
      
      private var §_-A2b§:b2DistanceJointDef = null;
      
      private var §_-02w§:§_-KS§ = null;
      
      private var §_-h1W§:int = 0;
      
      private var buff:§_-Q2h§ = null;
      
      private var timer:Timer = new Timer(50,100);
      
      private var §_-K2I§:Number = 0;
      
      private var §_-T1M§:§_-aS§ = null;
      
      private var §_-A2r§:Array = null;
      
      public var ropeLength:int = 7;
      
      public function §_-Lr§()
      {
         super();
         this.view = new §_-f1u§(new TrapView());
         this.view.x = 0;
         this.view.y = 0;
         this.view.loop = false;
         this.view.gotoAndStop(0);
         §_-J2J§(this.view);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
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
      
      override public function §_-Jz§(param1:Point) : Boolean
      {
         return this.view.§_-Jz§(param1);
      }
      
      override public function set filters(param1:Array) : void
      {
         this.view.filters = param1;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.ropeLength]);
         if(this.hero)
         {
            _loc1_[_loc1_.length - 1].push([this.hero.id,this.state,[this.§_-A2b§.localAnchorA.x,this.§_-A2b§.localAnchorA.y]]);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1.pop();
         this.ropeLength = _loc2_[0];
         if(_loc2_.length < 2)
         {
            return;
         }
         this.§_-A2r§ = _loc2_[1];
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetUserData(this);
         super.build(param1);
         this.§_-A2b§ = new b2DistanceJointDef();
         this.§_-A2b§.bodyA = this.body.GetWorld().GetGroundBody();
         this.§_-A2b§.bodyB = this.body;
         this.§_-A2b§.localAnchorB = new b2Vec2();
         this.§_-A2b§.frequencyHz = 3;
         this.§_-A2b§.rope = true;
         this.§_-A2b§.length = this.ropeLength;
         this.§_-02w§ = new §_-KS§();
         this.§_-02w§.visible = false;
         this.§_-02w§.start = new Point(0,0);
         §_-J2J§(this.§_-02w§);
         this.§_-T1M§ = new §_-aS§(new RopeToTrapEnd());
         this.§_-T1M§.visible = false;
         §_-J2J§(this.§_-T1M§);
         if(!this.§_-A2r§)
         {
            return;
         }
         this.position = new b2Vec2(this.§_-A2r§[2][0],this.§_-A2r§[2][1]);
         if(this.§_-A2r§[1] == §_-y2r§)
         {
            this.§_-V2t§(this.§_-A2r§[0]);
         }
         this.§_-A2b§.localAnchorA = new b2Vec2(this.§_-A2r§[2][0],this.§_-A2r§[2][1]);
         if(this.§_-A2r§[1] != §_-x§)
         {
            return;
         }
         this.hero = this.§_-21H§.squirrels.get(this.§_-A2r§[0]);
         this.state = §_-y2r§;
         this.§_-j1m§();
      }
      
      override public function dispose() : void
      {
         this.§_-V14§(true);
         if(this.§_-U2X§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-U2X§);
         }
         this.§_-U2X§ = null;
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         this.view.removeEventListener(Event.COMPLETE,this.§_-82q§);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.§_-U2X§) && this.§_-02w§.length > this.ropeLength * Game.§_-12A§ + 4)
         {
            this.§_-h1W§ += param1 * 1000;
            if(this.§_-h1W§ >= §_-bK§)
            {
               this.§_-516§();
            }
         }
         else
         {
            this.§_-h1W§ = 0;
         }
         if(!this.§_-U2X§)
         {
            return;
         }
         var _loc2_:b2Vec2 = b2Math.SubtractVV(this.§_-U2X§.GetAnchorA(),this.position);
         _loc2_.Multiply(Game.§_-12A§);
         this.§_-T1M§.x = _loc2_.x;
         this.§_-T1M§.y = _loc2_.y;
         this.§_-02w§.end = new Point(_loc2_.x,_loc2_.y);
      }
      
      public function get §_-p2i§() : Boolean
      {
         return this.hero == null;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.ghost || this.state != §_-32o§)
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
         this.§_-uy§(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(this.ghost || this.state != §_-32o§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-uy§(param1:Hero) : void
      {
         if(param1.id > 0 && param1.id != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-V2t§(param1.id);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"trapSquirrel":[this.id,param1.id]}));
         }
      }
      
      public function §_-03s§() : void
      {
         if(Boolean(this.hero) && Boolean(this.hero.id > 0) && this.hero.id != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-V14§();
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"trapRemove":[this.id]}));
         }
      }
      
      private function §_-516§() : void
      {
         if(Boolean(this.hero) && Boolean(this.hero.id > 0) && this.hero.id != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-j1m§();
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"trapUnleash":[this.id]}));
         }
      }
      
      private function §_-V2t§(param1:int) : void
      {
         if(!this.§_-21H§ || this.hero != null || this.state != §_-32o§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.hasJoints("trap"))
         {
            return;
         }
         this.hero = _loc2_;
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-M15§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-y2S§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.§_-A2b§.localAnchorA = this.body.GetPosition().Copy();
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyB = this.body;
         _loc2_.§_-ZW§(_loc3_);
         _loc3_.collideConnected = false;
         _loc3_.localAnchorA = new b2Vec2(0,2);
         _loc3_.localAnchorB = new b2Vec2();
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         _loc3_.enableLimit = true;
         this.§_-C1I§ = this.body.GetWorld().CreateJoint(_loc3_);
         this.§_-C1I§.SetUserData("trap");
         this.state = §_-y2r§;
         this.§_-K2I§ = 0;
      }
      
      private function §_-V14§(param1:Boolean = false) : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         this.hero.removeEventListener(SquirrelEvent.§_-M15§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-y2S§,this.§_-A1R§);
         this.hero.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         if(this.§_-K2I§ != 0)
         {
            this.hero.runSpeed += this.§_-K2I§;
         }
         this.§_-K2I§ = 0;
         this.hero.isStopped = false;
         this.view.removeEventListener(Event.COMPLETE,this.§_-82q§);
         if(this.§_-C1I§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-C1I§);
            this.§_-C1I§ = null;
         }
         if(this.timer.running)
         {
            this.timer.reset();
            this.hero.removeBuff(this.buff,this.timer);
         }
         if(!param1)
         {
            this.state = §_-32o§;
         }
         this.hero = null;
      }
      
      private function §_-j1m§() : void
      {
         if(!this.hero || this.state != §_-y2r§)
         {
            return;
         }
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new TrapImg(),0.3,0.5,gls("Белка в капкане бежит на 50% медленне."));
         }
         this.hero.§_-W1T§(this.buff,this.timer);
         this.§_-K2I§ = this.hero.runSpeed * §_-53q§ / 100;
         this.hero.runSpeed -= this.§_-K2I§;
         this.timer.reset();
         this.timer.start();
         this.state = §_-x§;
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-V14§();
      }
      
      private function set state(param1:int) : void
      {
         if(this.§_-D2k§ == param1)
         {
            return;
         }
         this.§_-D2k§ = param1;
         switch(param1)
         {
            case §_-32o§:
               §_-D2f§(this.view,0);
               this.view.scaleXY(1);
               this.view.gotoAndStop(0);
               this.view.y = 0;
               this.§_-02w§.visible = false;
               this.§_-T1M§.visible = false;
               this.position = this.§_-A2b§.localAnchorA.Copy();
               break;
            case §_-y2r§:
               if(this.§_-U2X§ == null)
               {
                  this.§_-U2X§ = this.body.GetWorld().CreateJoint(this.§_-A2b§);
               }
               if(this.hero.heroView is §_-51g§)
               {
                  this.view.y = (this.hero.height - this.view.height) * 0.5;
                  this.hero.§_-J2J§(this.view);
                  this.view.scaleXY(1);
               }
               this.view.play();
               this.view.addEventListener(Event.COMPLETE,this.§_-82q§);
               this.hero.isStopped = true;
               this.§_-02w§.visible = true;
               this.§_-T1M§.visible = true;
               break;
            case §_-x§:
               if(this.§_-U2X§)
               {
                  this.body.GetWorld().DestroyJoint(this.§_-U2X§);
                  this.§_-U2X§ = null;
               }
               this.§_-02w§.visible = false;
               this.§_-T1M§.visible = false;
         }
      }
      
      private function get state() : int
      {
         return this.§_-D2k§;
      }
      
      private function §_-82q§(param1:Event) : void
      {
         this.hero.isStopped = false;
         this.view.removeEventListener(Event.COMPLETE,this.§_-82q§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-03s§();
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("trapSquirrel" in _loc2_)
         {
            if(_loc2_["trapSquirrel"][0] != this.id)
            {
               return;
            }
            this.§_-V2t§(_loc2_["trapSquirrel"][1]);
         }
         if("trapRemove" in _loc2_)
         {
            if(_loc2_["trapRemove"][0] != this.id)
            {
               return;
            }
            this.§_-V14§();
         }
         if("trapUnleash" in _loc2_)
         {
            if(_loc2_["trapUnleash"][0] != this.id)
            {
               return;
            }
            this.§_-j1m§();
         }
      }
   }
}


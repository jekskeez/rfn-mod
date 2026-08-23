package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-81N§.§_-l2C§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-d2d§;
   import §_-Rj§.§_-A32§;
   import §_-T2y§.§_-92z§;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-B2Q§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-44§ extends GameBody implements §_-s2K§, §_-22J§, §_-B2Q§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-x2f§:Array = [[new ColorMatrixFilter([0,1,0,0,0,0,0,1.25,0,0,1,0,0,0,0,0,0,0,1,0])],[new ColorMatrixFilter([0,0,1.25,0,0,1,0,0,0,0,0,1.25,0,0,0,0,0,0,1,0])],[new ColorMatrixFilter([0,0.85,0.85,0,0,0.6,0,0.6,0,0,0.5,0.5,0,0,0,0,0,0,1,0])]];
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(40 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0,0.5,0.1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var §_-01O§:Boolean = false;
      
      private var controller:§_-l2C§ = null;
      
      private var color:int = 0;
      
      private var hero:Hero = null;
      
      private var §_-i2J§:b2Joint = null;
      
      private var §_-B3M§:int = 5;
      
      private var §_-tD§:int = 0;
      
      private var §_-iB§:Boolean = true;
      
      private var §_-02k§:Number;
      
      public function §_-44§()
      {
         super();
         this.view = new §_-d2d§(new BubbleBodyView());
         this.view.x = 0;
         this.view.y = 0;
         this.view.loop = false;
         §_-83v§(this.view);
         this.color = int(Math.random() * §_-x2f§.length);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.§_-U1c§();
         if(this.§_-tD§ != 0)
         {
            this.view.gotoAndStop(this.view.totalFrames - 1);
            this.§_-5L§(this.§_-tD§);
         }
         else
         {
            this.view.gotoAndPlay(0);
         }
         this.controller = new §_-l2C§();
         this.controller.bubble = this;
         this.controller.§_-pI§ = this.velocity;
         param1.AddController(this.controller);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function dispose() : void
      {
         if(this.controller)
         {
            this.controller.bubble = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.view.removeFromParent(true);
         this.§_-k2j§();
         this.visible = false;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.color,this.velocity,this.§_-oi§]);
         if(this.hero)
         {
            _loc1_[_loc1_.length - 1].push(this.hero.id);
         }
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1.pop();
         this.color = _loc2_[0];
         this.velocity = _loc2_[1];
         this.§_-oi§ = _loc2_[2];
         if(_loc2_.length < 4)
         {
            return;
         }
         this.§_-tD§ = _loc2_[3];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.§_-H2D§) && this.y + 80 < -this.§_-H2D§.map.size.y + Game.§_-s2q§)
         {
            this.§_-T2A§();
         }
      }
      
      public function set §_-oi§(param1:int) : void
      {
         this.§_-B3M§ = param1;
         if(param1 <= 0)
         {
            this.§_-T2A§();
         }
      }
      
      public function get §_-oi§() : int
      {
         return this.§_-B3M§;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc3_:Hero = null;
         var _loc2_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc2_ == this)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc2_ is Hero)
         {
            _loc3_ = _loc2_ as Hero;
            if(Boolean(_loc3_.isDead || _loc3_.inHollow) || Boolean(this.hero) || _loc3_.§_-Jo§)
            {
               return;
            }
            this.§_-j1n§(_loc3_);
            return;
         }
         --this.§_-oi§;
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:* = param1.GetFixtureA().GetBody().GetUserData();
         if(_loc3_ == this)
         {
            _loc3_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(_loc3_ is Hero || _loc3_ is §_-44§)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
      }
      
      private function §_-j1n§(param1:Hero) : void
      {
         if(param1.id > 0 && param1.id != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-5L§(param1.id);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"bubbleSquirrel":[this.id,param1.id]}));
         }
      }
      
      private function §_-T2A§() : void
      {
         if(Boolean(this.hero && this.hero.id > 0) && Boolean(this.hero.id != Game.selfId) || Boolean(!this.hero && this.§_-H2D§) && Boolean(!this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         if(!this.§_-iB§ || this.§_-01O§)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-Hj§();
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"bubbleBurst":[this.id]}));
         }
         this.§_-iB§ = false;
         setTimeout(this.§_-qM§,500);
      }
      
      private function §_-qM§() : void
      {
         this.§_-iB§ = true;
      }
      
      private function §_-5L§(param1:int) : void
      {
         if(!this.§_-H2D§ || this.hero != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         this.hero = _loc2_;
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.body;
         _loc2_.§_-K18§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.enableLimit = true;
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         _loc3_.localAnchorA = new b2Vec2(0,1);
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-i2J§ = this.body.GetWorld().CreateJoint(_loc3_);
         _loc2_.§_-Jo§ = true;
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-Y1J§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-tl§,this.§_-jf§);
         _loc2_.addEventListener(Hero.§_-H2j§,this.§_-c1A§);
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-Hj§(true);
      }
      
      private function §_-c1A§(param1:Event) : void
      {
         --this.§_-oi§;
      }
      
      private function §_-b16§() : void
      {
         if(this.body == null)
         {
            return;
         }
         this.§_-k2j§();
         this.removeFromParent();
         this.§_-H2D§.map.remove(this,true);
      }
      
      private function §_-k2j§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-Y1J§,this.§_-jf§);
         this.hero.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-tl§,this.§_-jf§);
         this.hero.removeEventListener(Hero.§_-H2j§,this.§_-c1A§);
         this.hero.§_-Jo§ = false;
         if(!this.body)
         {
            return;
         }
         if(this.§_-i2J§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-i2J§);
         }
         this.§_-i2J§ = null;
         this.hero = null;
      }
      
      private function §_-Hj§(param1:Boolean = false) : void
      {
         var burstView:§_-d2d§ = null;
         var onComplete:Function = null;
         var quick:Boolean = param1;
         if(this.§_-01O§)
         {
            return;
         }
         this.view.stop();
         this.view.visible = false;
         this.§_-01O§ = true;
         if(quick)
         {
            this.dispose();
            return;
         }
         burstView = new §_-d2d§(new BubbleBurst());
         burstView.filters = this.§_-215§() ? §_-x2f§[this.color] : null;
         burstView.loop = false;
         burstView.play();
         §_-83v§(burstView);
         onComplete = function():void
         {
            burstView.removeEventListener(Event.COMPLETE,onComplete);
            burstView.removeFromParent(true);
            burstView = null;
            §_-b16§();
         };
         burstView.addEventListener(Event.COMPLETE,onComplete);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("bubbleSquirrel" in _loc2_)
         {
            if(_loc2_["bubbleSquirrel"][0] != this.id)
            {
               return;
            }
            this.§_-5L§(_loc2_["bubbleSquirrel"][1]);
         }
         if("bubbleBurst" in _loc2_)
         {
            if(_loc2_["bubbleBurst"][0] != this.id)
            {
               return;
            }
            this.§_-Hj§();
         }
      }
      
      private function §_-U1c§() : void
      {
         if(!this.§_-215§())
         {
            return;
         }
         this.view.filters = §_-x2f§[this.color];
      }
      
      private function §_-215§() : Boolean
      {
         if(this.§_-H2D§ is §_-A32§)
         {
            return (this.§_-H2D§ as §_-A32§).location == §_-q1p§.§_-427§;
         }
         return §_-92z§.location == §_-q1p§.§_-427§;
      }
   }
}


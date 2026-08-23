package §_-8Q§
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
   import §_-H1l§.§_-x3§;
   import §_-TK§.§_-f1u§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-c2C§.§_-u24§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-NA§;
   import game.mainGame.entity.§_-p0§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-427§ extends GameBody implements §_-NA§, §_-Pn§, §_-p0§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-Z7§:Array = [[new ColorMatrixFilter([0,1,0,0,0,0,0,1.25,0,0,1,0,0,0,0,0,0,0,1,0])],[new ColorMatrixFilter([0,0,1.25,0,0,1,0,0,0,0,0,1.25,0,0,0,0,0,0,1,0])],[new ColorMatrixFilter([0,0.85,0.85,0,0,0.6,0,0.6,0,0,0.5,0.5,0,0,0,0,0,0,1,0])]];
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(40 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0,0.5,0.1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var §_-C1L§:Boolean = false;
      
      private var controller:§_-x3§ = null;
      
      private var color:int = 0;
      
      private var hero:Hero = null;
      
      private var §_-C1I§:b2Joint = null;
      
      private var §_-r2y§:int = 5;
      
      private var §_-ua§:int = 0;
      
      private var §_-E1L§:Boolean = true;
      
      private var §_-J1H§:Number;
      
      public function §_-427§()
      {
         super();
         this.view = new §_-f1u§(new BubbleBodyView());
         this.view.x = 0;
         this.view.y = 0;
         this.view.loop = false;
         §_-J2J§(this.view);
         this.color = int(Math.random() * §_-Z7§.length);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.§_-D2N§();
         if(this.§_-ua§ != 0)
         {
            this.view.gotoAndStop(this.view.totalFrames - 1);
            this.§_-E1N§(this.§_-ua§);
         }
         else
         {
            this.view.gotoAndPlay(0);
         }
         this.controller = new §_-x3§();
         this.controller.bubble = this;
         this.controller.§_-11g§ = this.velocity;
         param1.AddController(this.controller);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function dispose() : void
      {
         if(this.controller)
         {
            this.controller.bubble = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.view.removeFromParent(true);
         this.§_-R12§();
         this.visible = false;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.color,this.velocity,this.§_-r3§]);
         if(this.hero)
         {
            _loc1_[_loc1_.length - 1].push(this.hero.id);
         }
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1.pop();
         this.color = _loc2_[0];
         this.velocity = _loc2_[1];
         this.§_-r3§ = _loc2_[2];
         if(_loc2_.length < 4)
         {
            return;
         }
         this.§_-ua§ = _loc2_[3];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(Boolean(this.§_-21H§) && this.y + 80 < -this.§_-21H§.map.size.y + Game.§_-sT§)
         {
            this.§_-GD§();
         }
      }
      
      public function set §_-r3§(param1:int) : void
      {
         this.§_-r2y§ = param1;
         if(param1 <= 0)
         {
            this.§_-GD§();
         }
      }
      
      public function get §_-r3§() : int
      {
         return this.§_-r2y§;
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
            if(Boolean(_loc3_.isDead || _loc3_.inHollow) || Boolean(this.hero) || _loc3_.§_-Qh§)
            {
               return;
            }
            this.§_-X2g§(_loc3_);
            return;
         }
         --this.§_-r3§;
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
         if(_loc3_ is Hero || _loc3_ is §_-427§)
         {
            param1.SetEnabled(false);
         }
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
      
      private function §_-X2g§(param1:Hero) : void
      {
         if(param1.id > 0 && param1.id != Game.selfId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-E1N§(param1.id);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"bubbleSquirrel":[this.id,param1.id]}));
         }
      }
      
      private function §_-GD§() : void
      {
         if(Boolean(this.hero && this.hero.id > 0) && Boolean(this.hero.id != Game.selfId) || Boolean(!this.hero && this.§_-21H§) && Boolean(!this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         if(!this.§_-E1L§ || this.§_-C1L§)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-ui§();
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"bubbleBurst":[this.id]}));
         }
         this.§_-E1L§ = false;
         setTimeout(this.§_-o4§,500);
      }
      
      private function §_-o4§() : void
      {
         this.§_-E1L§ = true;
      }
      
      private function §_-E1N§(param1:int) : void
      {
         if(!this.§_-21H§ || this.hero != null)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         this.hero = _loc2_;
         var _loc3_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc3_.bodyA = this.body;
         _loc2_.§_-ZW§(_loc3_,false);
         _loc3_.collideConnected = false;
         _loc3_.enableLimit = true;
         _loc3_.lowerAngle = 0;
         _loc3_.upperAngle = 0;
         _loc3_.localAnchorA = new b2Vec2(0,1);
         _loc3_.localAnchorB = new b2Vec2();
         this.§_-C1I§ = this.body.GetWorld().CreateJoint(_loc3_);
         _loc2_.§_-Qh§ = true;
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-y2S§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-K1I§,this.§_-A1R§);
         _loc2_.addEventListener(Hero.§_-y2y§,this.§_-32H§);
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-ui§(true);
      }
      
      private function §_-32H§(param1:Event) : void
      {
         --this.§_-r3§;
      }
      
      private function §_-th§() : void
      {
         if(this.body == null)
         {
            return;
         }
         this.§_-R12§();
         this.removeFromParent();
         this.§_-21H§.map.remove(this,true);
      }
      
      private function §_-R12§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-y2S§,this.§_-A1R§);
         this.hero.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-K1I§,this.§_-A1R§);
         this.hero.removeEventListener(Hero.§_-y2y§,this.§_-32H§);
         this.hero.§_-Qh§ = false;
         if(!this.body)
         {
            return;
         }
         if(this.§_-C1I§)
         {
            this.body.GetWorld().DestroyJoint(this.§_-C1I§);
         }
         this.§_-C1I§ = null;
         this.hero = null;
      }
      
      private function §_-ui§(param1:Boolean = false) : void
      {
         var burstView:§_-f1u§ = null;
         var onComplete:Function = null;
         var quick:Boolean = param1;
         if(this.§_-C1L§)
         {
            return;
         }
         this.view.stop();
         this.view.visible = false;
         this.§_-C1L§ = true;
         if(quick)
         {
            this.dispose();
            return;
         }
         burstView = new §_-f1u§(new BubbleBurst());
         burstView.filters = this.§_-y1K§() ? §_-Z7§[this.color] : null;
         burstView.loop = false;
         burstView.play();
         §_-J2J§(burstView);
         onComplete = function():void
         {
            burstView.removeEventListener(Event.COMPLETE,onComplete);
            burstView.removeFromParent(true);
            burstView = null;
            §_-th§();
         };
         burstView.addEventListener(Event.COMPLETE,onComplete);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("bubbleSquirrel" in _loc2_)
         {
            if(_loc2_["bubbleSquirrel"][0] != this.id)
            {
               return;
            }
            this.§_-E1N§(_loc2_["bubbleSquirrel"][1]);
         }
         if("bubbleBurst" in _loc2_)
         {
            if(_loc2_["bubbleBurst"][0] != this.id)
            {
               return;
            }
            this.§_-ui§();
         }
      }
      
      private function §_-D2N§() : void
      {
         if(!this.§_-y1K§())
         {
            return;
         }
         this.view.filters = §_-Z7§[this.color];
      }
      
      private function §_-y1K§() : Boolean
      {
         if(this.§_-21H§ is §_-62b§)
         {
            return (this.§_-21H§ as §_-62b§).location == §_-at§.§_-nq§;
         }
         return §_-u24§.location == §_-at§.§_-nq§;
      }
   }
}


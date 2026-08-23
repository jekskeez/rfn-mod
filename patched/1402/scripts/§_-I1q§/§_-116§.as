package §_-I1q§
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
   import §_-8Q§.GameBody;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import game.mainGame.entity.§_-71b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-116§ extends GameBody implements §_-Pn§, §_-71b§
   {
      
      private static const §_-53X§:int = 32;
      
      private static const §_-C3c§:int = 8;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(40 / Game.§_-12A§,5 / Game.§_-12A§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var effectTime:int = 5000;
      
      private var buff:§_-Q2h§ = null;
      
      private var timer:Timer = new Timer(50,100);
      
      private var squirrels:Object = {};
      
      private var §_-K20§:Array = [];
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 12000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-116§()
      {
         super();
         this.fixed = true;
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         if(this.§_-W1u§)
         {
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-bi§);
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.rotation = 90 * Game.D2R;
         this.§_-W1u§.view.y = -15;
         this.§_-W1u§.start();
         §_-J2J§(this.§_-W1u§.view);
         this.timer.delay = this.effectTime / 100;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-K20§.length)
         {
            _loc3_ = this.§_-21H§.squirrels.get(this.§_-K20§[_loc2_]);
            if(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || _loc3_.id in this.squirrels)
            {
               return;
            }
            this.squirrels[_loc3_.id] = _loc3_.friction;
            _loc3_.friction = 0;
            _loc2_++;
         }
         this.§_-K20§.splice(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         if(this.§_-W1u§)
         {
            this.§_-W1u§.stop();
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
            this.§_-W1u§ = null;
         }
         for(_loc1_ in this.squirrels)
         {
            this.§_-42n§(int(_loc1_));
         }
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.squirrels = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.squirrels)
         {
            _loc1_.push(_loc2_);
         }
         _loc3_ = super.§_-m1Y§();
         _loc3_.push([this.aging,this.lifeTime,this.effectTime,_loc1_]);
         return _loc3_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.effectTime = param1[1][2];
         this.§_-K20§ = param1[1][3];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetFilterData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetFilterData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!_loc2_)
         {
            return;
         }
         this.§_-e18§(_loc2_.id);
         this.§_-L2L§(_loc2_.id);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         var _loc2_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureA().GetBody().GetUserData();
         }
         if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc2_ = param1.GetFixtureB().GetBody().GetUserData();
         }
         if(!_loc2_)
         {
            return;
         }
         this.§_-e18§(_loc2_.id);
         this.§_-L2L§(_loc2_.id);
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         if(param1.GetFixtureB().GetBody().GetUserData() == this && param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            param1.SetEnabled((param1.GetFixtureA().GetBody().GetUserData() as Hero).friction > 0 && _loc3_.m_normal.y >= 0);
         }
         else if(param1.GetFixtureA().GetBody().GetUserData() == this && param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            param1.SetEnabled((param1.GetFixtureB().GetBody().GetUserData() as Hero).friction > 0 && _loc3_.m_normal.y < 0);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      private function §_-L2L§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-21H§ || param1 == this.playerId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.oilSquirrel(param1);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"oilSquirrel":[this.id,param1]}));
            if(Hero.self)
            {
               Hero.self.sendLocation();
            }
         }
      }
      
      private function §_-e18§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-21H§ || param1 == this.playerId)
         {
            return;
         }
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-u1L§(param1);
         }
         else
         {
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"resetOilSquirrel":[this.id,param1]}));
            if(Hero.self)
            {
               Hero.self.sendLocation();
            }
         }
      }
      
      private function oilSquirrel(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.id in this.squirrels || _loc2_.id == this.playerId)
         {
            return;
         }
         this.squirrels[_loc2_.id] = _loc2_.friction;
         _loc2_.friction = 0;
         if(!_loc2_.isSelf)
         {
            return;
         }
         _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         if(!this.buff)
         {
            this.buff = new §_-Q2h§(new IconPerkGoat(),0.9,0.35,gls("Белка скользит после Молока."),18,18,16777215);
         }
         _loc2_.§_-W1T§(this.buff,this.timer);
         this.timer.reset();
         this.timer.start();
      }
      
      private function §_-u1L§(param1:int) : void
      {
         this.§_-42n§(param1);
         delete this.squirrels[param1];
      }
      
      private function §_-42n§(param1:int) : void
      {
         if(!this.§_-21H§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1);
         if(!_loc2_ || !_loc2_.§_-K13§ || !(_loc2_.id in this.squirrels))
         {
            return;
         }
         _loc2_.friction += this.squirrels[_loc2_.id];
         if(!_loc2_.isSelf)
         {
            return;
         }
         if(this.timer.running)
         {
            this.timer.reset();
            _loc2_.removeBuff(this.buff,this.timer);
         }
         _loc2_.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         _loc2_.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         _loc2_.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-e18§(Hero.§_-M1O§);
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-e18§(param1["player"]["id"]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("oilSquirrel" in _loc2_)
         {
            if(_loc2_["oilSquirrel"][0] != this.id)
            {
               return;
            }
            this.oilSquirrel(_loc2_["oilSquirrel"][1]);
         }
         if("resetOilSquirrel" in _loc2_)
         {
            if(_loc2_["resetOilSquirrel"][0] != this.id)
            {
               return;
            }
            this.§_-u1L§(_loc2_["resetOilSquirrel"][1]);
         }
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         if(this.body == null)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


package §_-u2r§
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
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-Rj§.§_-A32§;
   import §_-T1r§.§_-03i§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import game.mainGame.entity.§_-Q2k§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-6u§ extends GameBody implements §_-22J§, §_-Q2k§
   {
      
      private static const §_-52X§:int = 32;
      
      private static const §_-FN§:int = 8;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(40 / Game.§_-x2P§,5 / Game.§_-x2P§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var effectTime:int = 5000;
      
      private var buff:§_-03i§ = null;
      
      private var timer:Timer = new Timer(50,100);
      
      private var squirrels:Object = {};
      
      private var §_-eL§:Array = [];
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 12000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-6u§()
      {
         super();
         this.fixed = true;
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         if(this.§_-A38§)
         {
            §_-93d§.instance.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-p1C§);
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.rotation = 90 * Game.D2R;
         this.§_-A38§.view.y = -15;
         this.§_-A38§.start();
         §_-83v§(this.§_-A38§.view);
         this.timer.delay = this.effectTime / 100;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-eL§.length)
         {
            _loc3_ = this.§_-H2D§.squirrels.get(this.§_-eL§[_loc2_]);
            if(!_loc3_ || _loc3_.isDead || _loc3_.inHollow || _loc3_.id in this.squirrels)
            {
               return;
            }
            this.squirrels[_loc3_.id] = _loc3_.friction;
            _loc3_.friction = 0;
            _loc2_++;
         }
         this.§_-eL§.splice(0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:String = null;
         if(this.§_-A38§)
         {
            this.§_-A38§.stop();
            §_-93d§.instance.§_-ms§(this.§_-A38§);
            this.§_-A38§ = null;
         }
         for(_loc1_ in this.squirrels)
         {
            this.§_-u1u§(int(_loc1_));
         }
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.squirrels = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc1_:Array = [];
         for(_loc2_ in this.squirrels)
         {
            _loc1_.push(_loc2_);
         }
         _loc3_ = super.§_-A1X§();
         _loc3_.push([this.aging,this.lifeTime,this.effectTime,_loc1_]);
         return _loc3_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.effectTime = param1[1][2];
         this.§_-eL§ = param1[1][3];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
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
         this.§_-R2c§(_loc2_.id);
         this.§_-12c§(_loc2_.id);
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
         this.§_-R2c§(_loc2_.id);
         this.§_-12c§(_loc2_.id);
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
      
      private function §_-12c§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-H2D§ || param1 == this.playerId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.oilSquirrel(param1);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"oilSquirrel":[this.id,param1]}));
            if(Hero.self)
            {
               Hero.self.sendLocation();
            }
         }
      }
      
      private function §_-R2c§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-H2D§ || param1 == this.playerId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-w2f§(param1);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"resetOilSquirrel":[this.id,param1]}));
            if(Hero.self)
            {
               Hero.self.sendLocation();
            }
         }
      }
      
      private function oilSquirrel(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
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
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         if(!this.buff)
         {
            this.buff = new §_-03i§(new IconPerkGoat(),0.9,0.35,gls("Белка скользит после Молока."),18,18,16777215);
         }
         _loc2_.§_-Aj§(this.buff,this.timer);
         this.timer.reset();
         this.timer.start();
      }
      
      private function §_-w2f§(param1:int) : void
      {
         this.§_-u1u§(param1);
         delete this.squirrels[param1];
      }
      
      private function §_-u1u§(param1:int) : void
      {
         if(!this.§_-H2D§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1);
         if(!_loc2_ || !_loc2_.§_-k2W§ || !(_loc2_.id in this.squirrels))
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
         _loc2_.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.§_-R2c§(Hero.§_-74§);
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-R2c§(param1["player"]["id"]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
            this.§_-w2f§(_loc2_["resetOilSquirrel"][1]);
         }
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


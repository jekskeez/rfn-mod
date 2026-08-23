package §_-j2H§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import §_-j4§.§_-Pn§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-9A§ extends §_-T2i§ implements §_-Pn§
   {
      
      private static const §_-hh§:int = 40;
      
      private static const §_-uD§:int = 21;
      
      public var effectTime:int = 5000;
      
      private var buff:§_-Q2h§ = null;
      
      private var timer:Timer = new Timer(50,100);
      
      private var squirrels:Object = {};
      
      private var §_-K20§:Array = [];
      
      public function §_-9A§()
      {
         super();
         this.friction = 0;
         this.restitution = 0;
         this.density = 0.5;
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = this.§_-V1Q§ / Game.§_-12A§;
         super.size = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         super.build(param1);
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
         _loc3_.push([this.effectTime,_loc1_]);
         return _loc3_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.effectTime = param1[2][0];
         this.§_-K20§ = param1[2][1];
      }
      
      override public function beginContact(param1:b2Contact) : void
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
      }
      
      override public function endContact(param1:b2Contact) : void
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
         this.§_-L2L§(_loc2_.id);
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         if(param1.GetFixtureB().GetBody().GetUserData() == this)
         {
            param1.SetEnabled(_loc3_.m_normal.y >= 0);
         }
         else
         {
            param1.SetEnabled(_loc3_.m_normal.y < 0);
         }
      }
      
      override public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function get leftClass() : Class
      {
         return OilLeft;
      }
      
      override protected function get middleClass() : Class
      {
         return OilMiddle;
      }
      
      override protected function get rightClass() : Class
      {
         return OilRight;
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new OilIcon());
      }
      
      protected function get §_-J2H§() : int
      {
         return §_-hh§;
      }
      
      protected function get §_-V1Q§() : int
      {
         return §_-uD§;
      }
      
      private function §_-L2L§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-21H§)
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
         if(param1 > 0 && param1 != Game.selfId || !this.§_-21H§)
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
         if(!_loc2_ || _loc2_.isDead || _loc2_.inHollow || _loc2_.id in this.squirrels)
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
            this.buff = new §_-Q2h§(new OilIcon(),0.3,0.5,gls("Белка скользит после масла."));
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
   }
}


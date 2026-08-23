package §_-B1O§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-22J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-T1r§.§_-03i§;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-A37§ extends §_-N2o§ implements §_-22J§
   {
      
      private static const §_-Y2T§:int = 40;
      
      private static const §_-J2Y§:int = 21;
      
      public var effectTime:int = 5000;
      
      private var buff:§_-03i§ = null;
      
      private var timer:Timer = new Timer(50,100);
      
      private var squirrels:Object = {};
      
      private var §_-eL§:Array = [];
      
      public function §_-A37§()
      {
         super();
         this.friction = 0;
         this.restitution = 0;
         this.density = 0.5;
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = this.§_-D1g§ / Game.§_-x2P§;
         super.size = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc3_:Hero = null;
         super.build(param1);
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
         _loc3_.push([this.effectTime,_loc1_]);
         return _loc3_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.effectTime = param1[2][0];
         this.§_-eL§ = param1[2][1];
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
         this.§_-R2c§(_loc2_.id);
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
         this.§_-12c§(_loc2_.id);
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
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new OilIcon());
      }
      
      protected function get §_-a2v§() : int
      {
         return §_-Y2T§;
      }
      
      protected function get §_-D1g§() : int
      {
         return §_-J2Y§;
      }
      
      private function §_-12c§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId || !this.§_-H2D§)
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
         if(param1 > 0 && param1 != Game.selfId || !this.§_-H2D§)
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
         _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         if(!this.buff)
         {
            this.buff = new §_-03i§(new OilIcon(),0.3,0.5,gls("Белка скользит после масла."));
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
   }
}


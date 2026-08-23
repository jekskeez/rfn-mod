package §_-B1O§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-33r§.§_-hu§;
   import §_-51g§.§_-22J§;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   
   public class §_-01Z§ extends §_-A1f§ implements §_-22J§
   {
      
      protected var §_-Fu§:int = 28;
      
      public function §_-01Z§()
      {
         super();
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new Spikes());
      }
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new Spikes();
      }
      
      override public function get size() : b2Vec2
      {
         return super.size;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = this.§_-Fu§;
         super.size = param1;
      }
      
      override protected function resize(param1:int, param2:int) : void
      {
         if(!param2)
         {
         }
         super.resize(param1,this.§_-Fu§);
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      override protected function get §_-h4§() : uint
      {
         return this.categoriesBits;
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         if(this.ghost)
         {
            param1.SetEnabled(false);
            return;
         }
         var _loc2_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc2_);
         var _loc3_:b2Vec2 = _loc2_.m_normal.Copy();
         if(param1.GetFixtureB().GetUserData() == this)
         {
            _loc3_ = _loc3_.GetNegative();
         }
         var _loc4_:b2Vec2 = this.body != null ? new b2Vec2(Math.cos(this.body.GetAngle() - Math.PI * 0.5),Math.sin(this.body.GetAngle() - Math.PI * 0.5)) : new b2Vec2(0,0);
         if(b2Math.Dot(_loc3_,_loc4_) < 0.5)
         {
            return;
         }
         var _loc5_:Hero = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         if(!_loc5_)
         {
            _loc5_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(_loc5_ != null && this.§_-QD§(_loc5_))
         {
            _loc5_.dispatchEvent(new Event(Hero.§_-aj§));
            _loc5_.§_-L1A§ = Hero.§_-W2x§;
            _loc5_.§_-h2r§();
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
         if(this.ghost)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         if(this.ghost)
         {
            param1.SetEnabled(false);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
         this.beginContact(param1);
      }
      
      private function §_-QD§(param1:Hero) : Boolean
      {
         return !(param1.heroView.§_-Wk§ && (param1.heroView.§_-Wk§ as §_-31F§).§_-62l§ || param1.§_-Wt§ || param1.armadillo || param1.immortal || param1.inHollow || param1.behaviourController.getState(§_-hu§) != null);
      }
   }
}


package §_-j2H§
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import §_-Cc§.§_-73t§;
   import §_-TK§.§_-aS§;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   
   public class §_-L§ extends §_-01b§ implements §_-Pn§
   {
      
      protected var §_-f19§:int = 28;
      
      public function §_-L§()
      {
         super();
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new Spikes());
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new Spikes();
      }
      
      override public function get size() : b2Vec2
      {
         return super.size;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = this.§_-f19§;
         super.size = param1;
      }
      
      override protected function resize(param1:int, param2:int) : void
      {
         if(!param2)
         {
         }
         super.resize(param1,this.§_-f19§);
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      override protected function get §_-B1n§() : uint
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
         if(_loc5_ != null && this.§_-aY§(_loc5_))
         {
            _loc5_.dispatchEvent(new Event(Hero.§_-G0§));
            _loc5_.§_-b2d§ = Hero.§_-e2H§;
            _loc5_.§_-kl§();
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
      
      private function §_-aY§(param1:Hero) : Boolean
      {
         return !(param1.heroView.§_-t2V§ && (param1.heroView.§_-t2V§ as §_-23o§).§_-b2J§ || param1.§_-C28§ || param1.armadillo || param1.immortal || param1.inHollow || param1.behaviourController.getState(§_-73t§) != null);
      }
   }
}


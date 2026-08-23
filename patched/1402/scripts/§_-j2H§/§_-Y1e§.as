package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-Cc§.§_-x1W§;
   import §_-TK§.§_-aS§;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-Pn§;
   import flash.events.Event;
   
   public class §_-Y1e§ extends §_-T2i§ implements §_-Pn§
   {
      
      private static const §_-hh§:int = 40;
      
      private static const §_-uD§:int = 21;
      
      private var squirrels:Array = [];
      
      public function §_-Y1e§()
      {
         super();
         this.friction = 2000;
         this.restitution = 0;
         this.density = 1;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = this.§_-V1Q§ / Game.§_-12A§;
         super.size = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         var _loc2_:b2PolygonShape = b2PolygonShape.AsOrientedBox((this.§_-f2Y§.width - 10) * 0.5 / Game.§_-12A§,§_-i2u§ * 0.5 / Game.§_-12A§,new b2Vec2((this.§_-f2Y§.width - 10) * 0.5 / Game.§_-12A§,§_-i2u§ * 0.5 / Game.§_-12A§));
         var _loc3_:b2FixtureDef = new b2FixtureDef(_loc2_,this,friction,restitution,density,this.categories,this.maskBits,0);
         this.body.CreateFixture(_loc3_);
         super.build(param1);
         this.body.GetFixtureList().SetFriction(1000);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-K13§))
            {
               this.§_-R12§(_loc1_);
            }
         }
         this.squirrels = null;
         super.dispose();
      }
      
      override protected function get leftClass() : Class
      {
         return OilBlackLeft;
      }
      
      override protected function get middleClass() : Class
      {
         return OilBlackMiddle;
      }
      
      override protected function get rightClass() : Class
      {
         return OilBlackRight;
      }
      
      override public function beginContact(param1:b2Contact) : void
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
         if(!_loc2_ || _loc2_.friction <= 0)
         {
            return;
         }
         this.§_-eI§(_loc2_);
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
         var _loc3_:int = this.squirrels.indexOf(_loc2_);
         if(_loc3_ == -1)
         {
            return;
         }
         this.§_-R12§(_loc2_);
         this.squirrels.splice(_loc3_,1);
      }
      
      override public function preSolve(param1:b2Contact, param2:b2Manifold) : void
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
      
      override public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function §_-eI§(param1:Hero) : void
      {
         if(this.squirrels.indexOf(param1) != -1 || param1.isDead || param1.inHollow || param1.behaviourController.getState(§_-x1W§) != null)
         {
            return;
         }
         param1.§_-v28§ = true;
         param1.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         param1.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         this.squirrels.push(param1);
      }
      
      override protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new OilBlackIcon();
      }
      
      override protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new OilBlackIcon());
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      protected function get §_-J2H§() : int
      {
         return §_-hh§;
      }
      
      protected function get §_-V1Q§() : int
      {
         return §_-uD§;
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-R12§(param1["player"]);
      }
      
      private function §_-R12§(param1:Hero) : void
      {
         param1.§_-v28§ = false;
         param1.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         param1.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
   }
}


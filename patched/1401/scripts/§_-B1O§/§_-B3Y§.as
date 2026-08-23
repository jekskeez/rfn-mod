package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-V2Z§;
   import §_-51g§.§_-22J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   
   public class §_-B3Y§ extends §_-N2o§ implements §_-22J§
   {
      
      private static const §_-Y2T§:int = 40;
      
      private static const §_-J2Y§:int = 21;
      
      private var squirrels:Array = [];
      
      public function §_-B3Y§()
      {
         super();
         this.friction = 2000;
         this.restitution = 0;
         this.density = 1;
      }
      
      override public function set size(param1:b2Vec2) : void
      {
         param1.y = this.§_-D1g§ / Game.§_-x2P§;
         super.size = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         var _loc2_:b2PolygonShape = b2PolygonShape.AsOrientedBox((this.§_-y19§.width - 10) * 0.5 / Game.§_-x2P§,§_-kI§ * 0.5 / Game.§_-x2P§,new b2Vec2((this.§_-y19§.width - 10) * 0.5 / Game.§_-x2P§,§_-kI§ * 0.5 / Game.§_-x2P§));
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
            if(!(!_loc1_ || !_loc1_.§_-k2W§))
            {
               this.§_-k2j§(_loc1_);
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
         this.§_-y1Z§(_loc2_);
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
         this.§_-k2j§(_loc2_);
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
      
      public function §_-y1Z§(param1:Hero) : void
      {
         if(this.squirrels.indexOf(param1) != -1 || param1.isDead || param1.inHollow || param1.behaviourController.getState(§_-V2Z§) != null)
         {
            return;
         }
         param1.§_-61G§ = true;
         param1.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         param1.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         this.squirrels.push(param1);
      }
      
      override protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new OilBlackIcon();
      }
      
      override protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new OilBlackIcon());
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      protected function get §_-a2v§() : int
      {
         return §_-Y2T§;
      }
      
      protected function get §_-D1g§() : int
      {
         return §_-J2Y§;
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-k2j§(param1["player"]);
      }
      
      private function §_-k2j§(param1:Hero) : void
      {
         param1.§_-61G§ = false;
         param1.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         param1.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
   }
}


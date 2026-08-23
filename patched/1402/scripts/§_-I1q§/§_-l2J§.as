package §_-I1q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-22D§.TweenMax;
   import §_-8Q§.GameBody;
   import §_-j4§.§_-Pn§;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import game.mainGame.§_-q2c§;
   
   public class §_-l2J§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 2048;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-c2P§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(2,0.05);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,10000,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-E2z§:MovieClip = new NinjaCloud();
      
      private var timer:Timer = new Timer(6 * 1000,1);
      
      public function §_-l2J§(param1:b2Body = null)
      {
         addChild(this.§_-E2z§);
         this.fixed = true;
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onRemove);
         super(param1);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc3_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc3_);
         var _loc4_:Hero = null;
         if(param1.GetFixtureA().GetBody().GetUserData() is Hero)
         {
            _loc4_ = param1.GetFixtureA().GetBody().GetUserData() as Hero;
         }
         else if(param1.GetFixtureB().GetBody().GetUserData() is Hero)
         {
            _loc4_ = param1.GetFixtureB().GetBody().GetUserData() as Hero;
         }
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(_loc4_.§_-A1w§(_loc3_.m_normal).y >= 0 && this.playerId == _loc4_.id);
         }
         else
         {
            param1.SetEnabled(_loc4_.§_-A1w§(_loc3_.m_normal).y < 0 && this.playerId == _loc4_.id);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-53X§;
      }
      
      private function onRemove(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onRemove);
         TweenMax.to(this,1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(this.body == null)
         {
            return;
         }
         dispose();
      }
   }
}


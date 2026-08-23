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
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.§_-V§;
   import utils.§_-Eg§;
   
   public class §_-k2O§ extends GameBody implements §_-22J§
   {
      
      private static const §_-52X§:uint = 2048;
      
      private static const §_-4y§:int = 35;
      
      private static const §_-Q2P§:int = 30;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-sE§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsBox(1,0.1);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0,200,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-U1P§:int;
      
      private var §_-Y14§:Point;
      
      private var direction:b2Vec2;
      
      private var view:MovieClip;
      
      private var §_-L10§:Boolean = false;
      
      public function §_-k2O§()
      {
         super();
         this.init();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.fixed = true;
         this.direction = this.body.GetTransform().R.col2.Copy();
         this.direction.Multiply(-1);
         this.§_-Y14§ = new Point(this.x,this.y);
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.body == null)
         {
            return;
         }
         super.update(param1);
         if(param1 == 0 || this.§_-L10§)
         {
            return;
         }
         if(this.view.currentFrame + 1 == this.§_-U1P§)
         {
            this.§_-b16§();
            this.§_-L10§ = true;
            return;
         }
         this.view.nextFrame();
         var _loc2_:b2Vec2 = this.direction.Copy();
         _loc2_.Multiply(Math.abs(this.view.top.y) / Game.§_-x2P§);
         _loc2_.Add(new b2Vec2(this.§_-Y14§.x / Game.§_-x2P§,this.§_-Y14§.y / Game.§_-x2P§));
         this.position = _loc2_.Copy();
         var _loc3_:Point = new Point(this.x,this.y).subtract(this.§_-Y14§);
         this.view.y = _loc3_.length - 5;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.§_-U1P§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
         this.§_-U1P§ = param1[1][1];
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
            param1.SetEnabled(_loc4_.§_-n2Y§(_loc3_.m_normal).y >= 0 && this.playerId == _loc4_.id);
         }
         else
         {
            param1.SetEnabled(_loc4_.§_-n2Y§(_loc3_.m_normal).y < 0 && this.playerId == _loc4_.id);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-52X§;
      }
      
      private function init() : void
      {
         this.view = new GrowingPlantAnimation();
         this.view.x = -int(this.view.width * 0.5) - 10;
         this.view.y = -5;
         this.view.stop();
         addChild(this.view);
         this.§_-U1P§ = §_-Eg§.§_-j1G§(§_-Q2P§,§_-4y§);
      }
      
      private function §_-b16§() : void
      {
         if(this.body == null)
         {
            return;
         }
         setTimeout(this.§_-H2D§.map.§_-Qc§,700,this,true);
      }
   }
}


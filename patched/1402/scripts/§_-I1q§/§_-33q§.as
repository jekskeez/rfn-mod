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
   import §_-j4§.§_-Pn§;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.§_-q2c§;
   import utils.§_-ke§;
   
   public class §_-33q§ extends GameBody implements §_-Pn§
   {
      
      private static const §_-53X§:uint = 2048;
      
      private static const §_-dW§:int = 35;
      
      private static const §_-C2y§:int = 30;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-c2P§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsBox(1,0.1);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0,200,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-Uv§:int;
      
      private var §_-x2K§:Point;
      
      private var direction:b2Vec2;
      
      private var view:MovieClip;
      
      private var §_-51F§:Boolean = false;
      
      public function §_-33q§()
      {
         super();
         this.init();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.fixed = true;
         this.direction = this.body.GetTransform().R.col2.Copy();
         this.direction.Multiply(-1);
         this.§_-x2K§ = new Point(this.x,this.y);
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.body == null)
         {
            return;
         }
         super.update(param1);
         if(param1 == 0 || this.§_-51F§)
         {
            return;
         }
         if(this.view.currentFrame + 1 == this.§_-Uv§)
         {
            this.§_-th§();
            this.§_-51F§ = true;
            return;
         }
         this.view.nextFrame();
         var _loc2_:b2Vec2 = this.direction.Copy();
         _loc2_.Multiply(Math.abs(this.view.top.y) / Game.§_-12A§);
         _loc2_.Add(new b2Vec2(this.§_-x2K§.x / Game.§_-12A§,this.§_-x2K§.y / Game.§_-12A§));
         this.position = _loc2_.Copy();
         var _loc3_:Point = new Point(this.x,this.y).subtract(this.§_-x2K§);
         this.view.y = _loc3_.length - 5;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.§_-Uv§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
         this.§_-Uv§ = param1[1][1];
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
      
      private function init() : void
      {
         this.view = new GrowingPlantAnimation();
         this.view.x = -int(this.view.width * 0.5) - 10;
         this.view.y = -5;
         this.view.stop();
         addChild(this.view);
         this.§_-Uv§ = §_-ke§.§_-D1d§(§_-C2y§,§_-dW§);
      }
      
      private function §_-th§() : void
      {
         if(this.body == null)
         {
            return;
         }
         setTimeout(this.§_-21H§.map.§_-Y1E§,700,this,true);
      }
   }
}


package §_-B1O§
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
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-R2m§;
   import game.mainGame.entity.§_-b2X§;
   import utils.§_-41A§;
   
   public class Branch extends GameBody implements §_-R2m§, §_-22J§, §_-b2X§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-LB§:uint = 20 / Game.§_-x2P§;
      
      private static const §_-U2D§:Number = 380 / Game.§_-x2P§;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,10000,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      protected var §_-z1L§:Sprite;
      
      protected var §_-81u§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-d1H§:Shape = new Shape();
      
      private var §_-s1Y§:b2Vec2 = new b2Vec2();
      
      public function Branch()
      {
         super();
         this.init();
      }
      
      protected function init() : void
      {
         this.§_-83v§(this.§_-81u§);
         this.§_-z1L§ = new BranchView();
         this.§_-z1L§.x = -3;
         this.§_-z1L§.y = 0;
         this.§_-z1L§.mask = this.§_-d1H§;
         this.size = new b2Vec2(§_-U2D§,0);
         this.§_-d1H§.graphics.beginFill(0);
         this.§_-d1H§.graphics.drawRect(0,0,1,this.§_-z1L§.height);
         this.§_-d1H§.graphics.endFill();
         this.§_-z1L§.addChild(this.§_-d1H§);
         this.fixed = true;
         this.§_-o2q§();
      }
      
      protected function §_-o2q§() : void
      {
         var _loc1_:Matrix = new Matrix();
         while(this.§_-81u§.numChildren > 0)
         {
            this.§_-81u§.§_-n2T§(0);
         }
         var _loc2_:Rectangle = this.§_-z1L§.getBounds(this.§_-z1L§);
         var _loc3_:BitmapData = new BitmapData(_loc2_.width * §_-a2§.§_-v1n§,_loc2_.height * §_-a2§.§_-v1n§,true,0);
         _loc1_.scale(this.§_-z1L§.scaleX * §_-a2§.§_-v1n§,this.§_-z1L§.scaleY * §_-a2§.§_-v1n§);
         if(this.§_-z1L§.scaleY < 0)
         {
            _loc1_.translate(0,_loc2_.height);
         }
         _loc3_.draw(this.§_-z1L§,_loc1_);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         this.§_-81u§.§_-x2x§();
         if(this.§_-z1L§.scaleY < 0)
         {
            this.§_-81u§.pivotY = _loc2_.height / §_-a2§.§_-v1n§;
         }
         _loc4_.x = this.§_-z1L§.x * §_-a2§.§_-v1n§;
         var _loc5_:§_-h2I§ = new §_-h2I§(_loc4_);
         _loc5_.getStarlingView().scaleX = _loc5_.getStarlingView().scaleY = 1 / §_-a2§.§_-v1n§;
         this.§_-81u§.§_-83v§(_loc5_);
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y);
         var _loc3_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y + param1.height);
         var _loc4_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y);
         var _loc5_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y + param1.height);
         var _loc6_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(-this.§_-s1Y§.x * 0.5,0));
         var _loc7_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(this.§_-s1Y§.x * 0.5,0));
         var _loc8_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(this.§_-s1Y§.x * 0.5,this.§_-s1Y§.y));
         _loc6_.Multiply(Game.§_-x2P§);
         _loc7_.Multiply(Game.§_-x2P§);
         _loc8_.Multiply(Game.§_-x2P§);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || _loc6_.x > _loc2_.x && _loc6_.x < _loc4_.x && _loc6_.y > _loc2_.y && _loc6_.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-e2n§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-e2n§(_loc6_
         .x,_loc6_.y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2PolygonShape = b2PolygonShape.AsBox(this.size.x * 0.5,0.1);
         this.fixture.shape = _loc2_;
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.fixture).SetUserData(this);
         super.build(param1);
      }
      
      protected function get fixture() : b2FixtureDef
      {
         return §_-03A§;
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
         if(param1.GetFixtureB().GetUserData() == this)
         {
            param1.SetEnabled(_loc3_.m_normal.y >= 0);
         }
         else
         {
            param1.SetEnabled(_loc3_.m_normal.y < 0);
         }
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([[this.size.x,this.size.y]]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(GameBody.§_-u1P§(param1))
         {
            this.size = new b2Vec2(param1[3][0],param1[3][1]);
         }
         else
         {
            this.size = new b2Vec2(param1[1][0][0],param1[1][0][1]);
         }
      }
      
      override public function set rotation(param1:Number) : void
      {
         var _loc2_:int = Math.abs(param1) > 90 ? -1 : 1;
         if(_loc2_ != this.§_-z1L§.scaleY)
         {
            this.§_-z1L§.scaleY = _loc2_;
            this.§_-o2q§();
         }
         super.rotation = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.§_-z1L§)
         {
            return;
         }
         this.§_-z1L§.mask = null;
         this.§_-z1L§ = null;
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-s1Y§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         this.§_-s1Y§.x = Math.max(Math.min(param1.x,§_-U2D§),§_-LB§);
         this.§_-s1Y§.y = 0;
         this.§_-d1H§.scaleX = this.size.x * Game.§_-x2P§;
         this.§_-z1L§.x = -(this.§_-s1Y§.x * 0.5) * Game.§_-x2P§;
         this.§_-o2q§();
      }
      
      private function §_-e2n§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
      }
   }
}


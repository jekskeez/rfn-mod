package §_-j2H§
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
   import §_-TK§.§_-aS§;
   import §_-hd§.§_-01M§;
   import §_-j4§.§_-Pn§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-j9§;
   import utils.§_-11I§;
   
   public class Branch extends GameBody implements §_-41O§, §_-Pn§, §_-j9§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-B1r§:uint = 20 / Game.§_-12A§;
      
      private static const §_-731§:Number = 380 / Game.§_-12A§;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,10000,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      protected var §_-uY§:Sprite;
      
      protected var §_-V2l§:§_-aS§ = new §_-aS§();
      
      protected var §_-41W§:Shape = new Shape();
      
      private var §_-y1d§:b2Vec2 = new b2Vec2();
      
      public function Branch()
      {
         super();
         this.init();
      }
      
      protected function init() : void
      {
         this.§_-J2J§(this.§_-V2l§);
         this.§_-uY§ = new BranchView();
         this.§_-uY§.x = -3;
         this.§_-uY§.y = 0;
         this.§_-uY§.mask = this.§_-41W§;
         this.size = new b2Vec2(§_-731§,0);
         this.§_-41W§.graphics.beginFill(0);
         this.§_-41W§.graphics.drawRect(0,0,1,this.§_-uY§.height);
         this.§_-41W§.graphics.endFill();
         this.§_-uY§.addChild(this.§_-41W§);
         this.fixed = true;
         this.§_-Qx§();
      }
      
      protected function §_-Qx§() : void
      {
         var _loc1_:Matrix = new Matrix();
         while(this.§_-V2l§.numChildren > 0)
         {
            this.§_-V2l§.§_-av§(0);
         }
         var _loc2_:Rectangle = this.§_-uY§.getBounds(this.§_-uY§);
         var _loc3_:BitmapData = new BitmapData(_loc2_.width * §_-01M§.§_-22T§,_loc2_.height * §_-01M§.§_-22T§,true,0);
         _loc1_.scale(this.§_-uY§.scaleX * §_-01M§.§_-22T§,this.§_-uY§.scaleY * §_-01M§.§_-22T§);
         if(this.§_-uY§.scaleY < 0)
         {
            _loc1_.translate(0,_loc2_.height);
         }
         _loc3_.draw(this.§_-uY§,_loc1_);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         this.§_-V2l§.§_-i18§();
         if(this.§_-uY§.scaleY < 0)
         {
            this.§_-V2l§.pivotY = _loc2_.height / §_-01M§.§_-22T§;
         }
         _loc4_.x = this.§_-uY§.x * §_-01M§.§_-22T§;
         var _loc5_:§_-aS§ = new §_-aS§(_loc4_);
         _loc5_.getStarlingView().scaleX = _loc5_.getStarlingView().scaleY = 1 / §_-01M§.§_-22T§;
         this.§_-V2l§.§_-J2J§(_loc5_);
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y);
         var _loc3_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y + param1.height);
         var _loc4_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y);
         var _loc5_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y + param1.height);
         var _loc6_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(-this.§_-y1d§.x * 0.5,0));
         var _loc7_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(this.§_-y1d§.x * 0.5,0));
         var _loc8_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(this.§_-y1d§.x * 0.5,this.§_-y1d§.y));
         _loc6_.Multiply(Game.§_-12A§);
         _loc7_.Multiply(Game.§_-12A§);
         _loc8_.Multiply(Game.§_-12A§);
         if(this.hitTestPoint(_loc2_.x,_loc2_.y,true) || _loc6_.x > _loc2_.x && _loc6_.x < _loc4_.x && _loc6_.y > _loc2_.y && _loc6_.y < _loc3_.y)
         {
            return true;
         }
         return this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y) || this.§_-hn§(_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y,_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y) || this.§_-hn§(_loc6_.x,_loc6_
         .y,_loc8_.x,_loc8_.y,_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y);
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2PolygonShape = b2PolygonShape.AsBox(this.size.x * 0.5,0.1);
         this.fixture.shape = _loc2_;
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.fixture).SetUserData(this);
         super.build(param1);
      }
      
      protected function get fixture() : b2FixtureDef
      {
         return §_-ql§;
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
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([[this.size.x,this.size.y]]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(GameBody.§_-W1F§(param1))
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
         if(_loc2_ != this.§_-uY§.scaleY)
         {
            this.§_-uY§.scaleY = _loc2_;
            this.§_-Qx§();
         }
         super.rotation = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.§_-uY§)
         {
            return;
         }
         this.§_-uY§.mask = null;
         this.§_-uY§ = null;
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-y1d§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         this.§_-y1d§.x = Math.max(Math.min(param1.x,§_-731§),§_-B1r§);
         this.§_-y1d§.y = 0;
         this.§_-41W§.scaleX = this.size.x * Game.§_-12A§;
         this.§_-uY§.x = -(this.§_-y1d§.x * 0.5) * Game.§_-12A§;
         this.§_-Qx§();
      }
      
      private function §_-hn§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
      }
   }
}


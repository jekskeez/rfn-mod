package §_-B1O§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-C1l§.§_-a2§;
   import §_-RI§.§_-h2I§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-E1U§;
   import game.mainGame.entity.§_-R2m§;
   import starling.display.Sprite;
   import utils.§_-41A§;
   
   public class §_-A1f§ extends §_-l2J§ implements §_-R2m§, §_-E1U§
   {
      
      protected static const §_-52X§:uint = 1;
      
      protected static const §_-11C§:int = 20;
      
      protected static const §_-62i§:int = 20;
      
      protected static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      protected static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-92m§:Point;
      
      private var scale:Number;
      
      protected var icon:§_-h2I§;
      
      protected var _width:Number = 20;
      
      protected var _height:Number = 20;
      
      protected var §_-Df§:flash.display.Sprite = new flash.display.Sprite();
      
      protected var §_-93z§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-Nw§:DisplayObject = null;
      
      public var friction:Number = 0.8;
      
      public var restitution:Number = 0;
      
      public var density:Number = 500;
      
      public var §_-b6§:Boolean = false;
      
      public var §_-C1h§:Boolean = false;
      
      public function §_-A1f§()
      {
         super();
         this.§_-91h§();
         §_-83v§(this.icon);
         this.fixed = true;
         this.§_-f2O§ = "belka_land";
      }
      
      public function init(param1:Number) : void
      {
         this.scale = param1;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
      }
      
      protected function get maskBits() : uint
      {
         return §_-FN§;
      }
      
      protected function get categories() : uint
      {
         return §_-52X§;
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2PolygonShape = null;
         var _loc3_:b2FixtureDef = null;
         if(!this.body)
         {
            this.body = param1.CreateBody(§_-E2n§);
            this.body.SetUserData(this);
            _loc2_ = b2PolygonShape.AsOrientedBox(this._width * 0.5 / Game.§_-x2P§,this._height * 0.5 / Game.§_-x2P§,new b2Vec2(this._width * 0.5 / Game.§_-x2P§,this._height * 0.5 / Game.§_-x2P§));
            _loc3_ = new b2FixtureDef(_loc2_,this,this.friction,this.restitution,this.density,this.categories,this.maskBits,0);
            this.body.CreateFixture(_loc3_);
         }
         super.build(param1);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([[this._width,this._height],this.§_-EA§,this.friction,this.restitution,this.density]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(GameBody.§_-u1P§(param1))
         {
            this.resize(param1[3][0],param1[3][1]);
            this.§_-EA§ = -1;
            if(4 in param1)
            {
               this.§_-EA§ = param1[4][0];
            }
         }
         else
         {
            this.resize(param1[1][0][0],param1[1][0][1]);
            this.§_-EA§ = param1[1][1];
            this.friction = param1[1][2];
            this.restitution = param1[1][3];
            this.density = param1[1][4];
         }
         this.draw();
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(0,0));
         var _loc3_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(0,this._height / Game.§_-x2P§));
         var _loc4_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(this._width / Game.§_-x2P§,0));
         var _loc5_:b2Vec2 = §_-41A§.GetWorldPoint(this,new b2Vec2(this._width / Game.§_-x2P§,this._height / Game.§_-x2P§));
         _loc2_.Multiply(Game.§_-x2P§);
         _loc3_.Multiply(Game.§_-x2P§);
         _loc4_.Multiply(Game.§_-x2P§);
         _loc5_.Multiply(Game.§_-x2P§);
         var _loc6_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y);
         var _loc7_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y + param1.height);
         var _loc8_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y);
         var _loc9_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y + param1.height);
         if(this.hitTestPoint(_loc6_.x,_loc6_.y,true) || _loc2_.x > _loc6_.x && _loc2_.x < _loc8_.x && _loc2_.y > _loc6_.y && _loc2_.y < _loc7_.y)
         {
            return true;
         }
         return this.§_-e2n§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-e2n§(_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-e2n§(_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc4_
         .x,_loc4_.y,_loc5_.x,_loc5_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-e2n§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-e2n§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-e2n§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y);
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         var _loc4_:b2Fixture = null;
         var _loc5_:b2PolygonShape = null;
         var _loc6_:b2FixtureDef = null;
         var _loc3_:b2Vec2 = new b2Vec2(param1 / 5,param2 / 5);
         this.size = _loc3_;
         if(this.body)
         {
            _loc4_ = body.GetFixtureList();
            if(!_loc4_)
            {
               return;
            }
            this.body.DestroyFixture(_loc4_);
            _loc5_ = b2PolygonShape.AsOrientedBox(this._width * 0.5 / Game.§_-x2P§,this._height * 0.5 / Game.§_-x2P§,new b2Vec2(this._width * 0.5 / Game.§_-x2P§,this._height * 0.5 / Game.§_-x2P§));
            _loc6_ = new b2FixtureDef(_loc5_,this,this.friction,this.restitution,this.density,this.categories,this.maskBits,0);
            this.body.CreateFixture(_loc6_);
         }
      }
      
      public function get size() : b2Vec2
      {
         return new b2Vec2(this._width / 5,this._height / 5);
      }
      
      public function set size(param1:b2Vec2) : void
      {
         this.resize(param1.x * 5,param1.y * 5);
      }
      
      protected function §_-91h§() : void
      {
         this.icon = new §_-h2I§(new PlatformGround());
      }
      
      protected function draw() : void
      {
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
         if(!this.§_-Nw§)
         {
            this.§_-H1a§();
         }
         var _loc1_:starling.display.Sprite = §_-a2§.§_-A3m§(this.§_-Nw§,this._width,this._height);
         this._width = Math.ceil(this._width / this.§_-Nw§.width) * this.§_-Nw§.width;
         this._height = Math.ceil(this._height / this.§_-Nw§.height) * this.§_-Nw§.height;
         §_-83v§(_loc1_);
         if(this.§_-EA§ != -1)
         {
            §_-2N§(this._width);
         }
         if(§_-ws§(this.icon))
         {
            removeChildStarling(this.icon);
         }
      }
      
      protected function §_-H1a§() : void
      {
         this.§_-Nw§ = new PlatformGround();
      }
      
      protected function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(§_-11C§,param1);
         param2 = Math.max(§_-62i§,param2);
         param1 = Math.min(param1,1024);
         param2 = Math.min(param2,1024);
         this._width = param1;
         this._height = param2;
         this.draw();
      }
      
      private function §_-e2n§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
      }
      
      private function §_-Xh§() : void
      {
         this.§_-b6§ = true;
         this.§_-C1h§ = false;
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         if(this.§_-b6§)
         {
            Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
            Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
            return;
         }
         this.§_-Xh§();
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
         this.§_-92m§ = new Point(param1.stageX,param1.stageY);
         this.resize(§_-11C§,§_-62i§);
         if(§_-ws§(this.icon))
         {
            removeChildStarling(this.icon);
         }
      }
      
      private function §_-D23§(param1:MouseEvent) : void
      {
         this.resize((param1.stageX - this.§_-92m§.x) / this.scale,(param1.stageY - this.§_-92m§.y) / this.scale);
      }
   }
}


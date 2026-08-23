package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-hd§.§_-01M§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-O2M§;
   import starling.display.Sprite;
   import utils.§_-11I§;
   
   public class §_-01b§ extends §_-E2J§ implements §_-41O§, §_-O2M§
   {
      
      protected static const §_-53X§:uint = 1;
      
      protected static const §_-F20§:int = 20;
      
      protected static const §_-t2B§:int = 20;
      
      protected static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      protected static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_dynamicBody);
      
      private var §_-31G§:Point;
      
      private var scale:Number;
      
      protected var icon:§_-aS§;
      
      protected var _width:Number = 20;
      
      protected var _height:Number = 20;
      
      protected var §_-o1c§:flash.display.Sprite = new flash.display.Sprite();
      
      protected var §_-US§:§_-aS§ = new §_-aS§();
      
      protected var §_-Z2d§:DisplayObject = null;
      
      public var friction:Number = 0.8;
      
      public var restitution:Number = 0;
      
      public var density:Number = 500;
      
      public var §_-j2G§:Boolean = false;
      
      public var §_-X1a§:Boolean = false;
      
      public function §_-01b§()
      {
         super();
         this.§_-q2X§();
         §_-J2J§(this.icon);
         this.fixed = true;
         this.§_-11D§ = "belka_land";
      }
      
      public function init(param1:Number) : void
      {
         this.scale = param1;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
      }
      
      protected function get maskBits() : uint
      {
         return §_-C3c§;
      }
      
      protected function get categories() : uint
      {
         return §_-53X§;
      }
      
      override public function build(param1:b2World) : void
      {
         var _loc2_:b2PolygonShape = null;
         var _loc3_:b2FixtureDef = null;
         if(!this.body)
         {
            this.body = param1.CreateBody(§_-41z§);
            this.body.SetUserData(this);
            _loc2_ = b2PolygonShape.AsOrientedBox(this._width * 0.5 / Game.§_-12A§,this._height * 0.5 / Game.§_-12A§,new b2Vec2(this._width * 0.5 / Game.§_-12A§,this._height * 0.5 / Game.§_-12A§));
            _loc3_ = new b2FixtureDef(_loc2_,this,this.friction,this.restitution,this.density,this.categories,this.maskBits,0);
            this.body.CreateFixture(_loc3_);
         }
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([[this._width,this._height],this.§_-o1b§,this.friction,this.restitution,this.density]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(GameBody.§_-W1F§(param1))
         {
            this.resize(param1[3][0],param1[3][1]);
            this.§_-o1b§ = -1;
            if(4 in param1)
            {
               this.§_-o1b§ = param1[4][0];
            }
         }
         else
         {
            this.resize(param1[1][0][0],param1[1][0][1]);
            this.§_-o1b§ = param1[1][1];
            this.friction = param1[1][2];
            this.restitution = param1[1][3];
            this.density = param1[1][4];
         }
         this.draw();
      }
      
      override public function hitTestObject(param1:DisplayObject) : Boolean
      {
         var _loc2_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(0,0));
         var _loc3_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(0,this._height / Game.§_-12A§));
         var _loc4_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(this._width / Game.§_-12A§,0));
         var _loc5_:b2Vec2 = §_-11I§.GetWorldPoint(this,new b2Vec2(this._width / Game.§_-12A§,this._height / Game.§_-12A§));
         _loc2_.Multiply(Game.§_-12A§);
         _loc3_.Multiply(Game.§_-12A§);
         _loc4_.Multiply(Game.§_-12A§);
         _loc5_.Multiply(Game.§_-12A§);
         var _loc6_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y);
         var _loc7_:Point = new Point(param1.getRect(this.parent).x,param1.getRect(this.parent).y + param1.height);
         var _loc8_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y);
         var _loc9_:Point = new Point(param1.getRect(this.parent).x + param1.width,param1.getRect(this.parent).y + param1.height);
         if(this.hitTestPoint(_loc6_.x,_loc6_.y,true) || _loc2_.x > _loc6_.x && _loc2_.x < _loc8_.x && _loc2_.y > _loc6_.y && _loc2_.y < _loc7_.y)
         {
            return true;
         }
         return this.§_-hn§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc3_.x,_loc3_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc2_.x,_loc2_.y,_loc4_.x,_loc4_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-hn§(_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-hn§(_loc4_.x,_loc4_.y,_loc5_.x,_loc5_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc4_.x,_loc4_
         .y,_loc5_.x,_loc5_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc7_.x,_loc7_.y) || this.§_-hn§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc6_.x,_loc6_.y,_loc8_.x,_loc8_.y) || this.§_-hn§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y) || this.§_-hn§(_loc3_.x,_loc3_.y,_loc5_.x,_loc5_.y,_loc7_.x,_loc7_.y,_loc9_.x,_loc9_.y);
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
            _loc5_ = b2PolygonShape.AsOrientedBox(this._width * 0.5 / Game.§_-12A§,this._height * 0.5 / Game.§_-12A§,new b2Vec2(this._width * 0.5 / Game.§_-12A§,this._height * 0.5 / Game.§_-12A§));
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
      
      protected function §_-q2X§() : void
      {
         this.icon = new §_-aS§(new PlatformGround());
      }
      
      protected function draw() : void
      {
         while(numChildren > 0)
         {
            §_-av§(0);
         }
         if(!this.§_-Z2d§)
         {
            this.§_-Nq§();
         }
         var _loc1_:starling.display.Sprite = §_-01M§.§_-D1J§(this.§_-Z2d§,this._width,this._height);
         this._width = Math.ceil(this._width / this.§_-Z2d§.width) * this.§_-Z2d§.width;
         this._height = Math.ceil(this._height / this.§_-Z2d§.height) * this.§_-Z2d§.height;
         §_-J2J§(_loc1_);
         if(this.§_-o1b§ != -1)
         {
            §_-z2z§(this._width);
         }
         if(§_-U2E§(this.icon))
         {
            removeChildStarling(this.icon);
         }
      }
      
      protected function §_-Nq§() : void
      {
         this.§_-Z2d§ = new PlatformGround();
      }
      
      protected function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(§_-F20§,param1);
         param2 = Math.max(§_-t2B§,param2);
         param1 = Math.min(param1,1024);
         param2 = Math.min(param2,1024);
         this._width = param1;
         this._height = param2;
         this.draw();
      }
      
      private function §_-hn§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : Boolean
      {
         var _loc9_:Number = (param7 - param5) * (param2 - param6) - (param8 - param6) * (param1 - param5);
         var _loc10_:Number = (param7 - param5) * (param4 - param6) - (param8 - param6) * (param3 - param5);
         var _loc11_:Number = (param3 - param1) * (param6 - param2) - (param4 - param2) * (param5 - param1);
         var _loc12_:Number = (param3 - param1) * (param8 - param2) - (param4 - param2) * (param7 - param1);
         return _loc9_ * _loc10_ <= 0 && _loc11_ * _loc12_ <= 0;
      }
      
      private function §_-135§() : void
      {
         this.§_-j2G§ = true;
         this.§_-X1a§ = false;
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         if(this.§_-j2G§)
         {
            Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
            Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
            return;
         }
         this.§_-135§();
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         this.§_-31G§ = new Point(param1.stageX,param1.stageY);
         this.resize(§_-F20§,§_-t2B§);
         if(§_-U2E§(this.icon))
         {
            removeChildStarling(this.icon);
         }
      }
      
      private function §_-Cv§(param1:MouseEvent) : void
      {
         this.resize((param1.stageX - this.§_-31G§.x) / this.scale,(param1.stageY - this.§_-31G§.y) / this.scale);
      }
   }
}


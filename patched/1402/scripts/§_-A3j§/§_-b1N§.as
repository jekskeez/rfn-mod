package §_-A3j§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.§_-YZ§;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-d7§;
   import game.mainGame.§_-n1d§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-w1u§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-b1N§ extends §_-aS§ implements §_-n1d§, §_-xn§, §_-3l§, §_-41O§, §_-F1c§, §_-l2r§, §_-d7§, §_-w1u§
   {
      
      public static var bubbles:BitmapData;
      
      private var §_-ef§:int;
      
      private var particles:Vector.<§_-E1W§>;
      
      private var §_-81i§:Number;
      
      private var §_-32I§:int;
      
      private var §_-PQ§:§_-aS§;
      
      private var §_-j2M§:Number = 0;
      
      private var _color0:int = 8440575;
      
      private var _color1:int = 34815;
      
      private var _color2:int = 217302;
      
      private var §_-u1z§:Boolean = false;
      
      protected var game:SquirrelGame = null;
      
      protected var _alpha0:Number = 0.41;
      
      protected var _alpha1:Number = 0.41;
      
      protected var _alpha2:Number = 0.41;
      
      protected var §_-y1d§:b2Vec2;
      
      protected var controller:§_-31T§;
      
      protected var §_-r2Q§:§_-aS§;
      
      public var §_-mY§:Vector.<§_-iY§> = new Vector.<§_-iY§>();
      
      public var waveAmplitude:Number = 0;
      
      public var waveLength:Number = 0;
      
      public var velocity:b2Vec2 = new b2Vec2();
      
      public var allowSwim:Boolean = true;
      
      public var bubblingFactor:Number = 0;
      
      public var §_-b2l§:int = -1;
      
      public function §_-b1N§()
      {
         super();
         if(!bubbles)
         {
            bubbles = new BitmapData(15,15,true,16777215);
            bubbles.draw(new Bubble());
         }
         this.§_-y1d§ = new b2Vec2(300,300);
         this.§_-32I§ = 1;
         this.particlesCount = 6;
      }
      
      public function get landSound() : String
      {
         return "water";
      }
      
      override public function get rotation() : Number
      {
         return super.rotation;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      override public function get graphics() : Graphics
      {
         return this.§_-r2Q§ ? this.§_-r2Q§.graphics : super.graphics;
      }
      
      public function §_-uS§(param1:b2Vec2, param2:b2Vec2) : void
      {
         var _loc3_:§_-E1W§ = this.§_-b2m§(param1.x * Game.§_-12A§);
         var _loc4_:Number = param2.y * Game.§_-12A§ / 5;
         if(Boolean(_loc3_) && _loc3_.velocity < _loc4_)
         {
            _loc3_.velocity += param2.y * Game.§_-12A§ / 5;
         }
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = 0;
      }
      
      public function build(param1:b2World) : void
      {
         this.controller = new §_-31T§(this);
         param1.AddController(this.controller);
         this.graphics.clear();
         this.game = param1.userData as SquirrelGame;
         if(this.§_-b2l§ == -1)
         {
            return;
         }
         var _loc2_:§_-YZ§ = this.game.map.getObject(this.§_-b2l§) as §_-YZ§;
         if(_loc2_)
         {
            _loc2_.§_-C5§ = this.game.map.§_-923§(this);
         }
      }
      
      public function §_-r2c§(param1:Number, param2:Number) : Array
      {
         if(param2 * Game.§_-12A§ > this.y)
         {
            return [null,null,false];
         }
         var _loc3_:int = this.§_-zr§(param1 * Game.§_-12A§);
         switch(_loc3_)
         {
            case -1:
               return [null,null,false];
            case int.MAX_VALUE:
               return [null,null,false];
            default:
               var _loc4_:§_-A3h§ = §_-A3h§.§_-01u§(this.§_-Z2p§(_loc3_),this.§_-Z2p§(_loc3_ + 1));
               var _loc5_:b2Vec2 = _loc4_.normal;
               _loc5_.Normalize();
               return [_loc5_,-_loc4_.offset / Game.§_-12A§,true];
         }
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.controller)
         {
            this.controller.velocity = this.velocity;
            this.controller.§_-91l§ = false;
         }
      }
      
      public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],0,[this.size.x,this.size.y],this.waveAmplitude,this.waveLength,this.§_-j2M§,this.particlesCount,this.allowSwim,[this.velocity.x,this.velocity.y],this.bubblingFactor,this.waveEnabled,[this.color0,this.color1,this.color2],this.§_-b2l§];
      }
      
      public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.size = new b2Vec2(param1[2][0],param1[2][1]);
         this.waveAmplitude = param1[3];
         this.waveLength = param1[4];
         this.§_-j2M§ = param1[5];
         this.particlesCount = param1[6];
         this.allowSwim = Boolean(param1[7]);
         this.velocity = new b2Vec2(param1[8][0],param1[8][1]);
         this.bubblingFactor = param1[9];
         if(!(10 in param1))
         {
            return;
         }
         this.waveEnabled = Boolean(param1[10]);
         if(!(11 in param1))
         {
            return;
         }
         this.color0 = param1[11][0];
         this.color1 = param1[11][1];
         this.color2 = param1[11][2];
         this.§_-J1W§();
         if(!(12 in param1))
         {
            return;
         }
         this.§_-b2l§ = param1[12];
      }
      
      public function dispose() : void
      {
         this.game = null;
         this.graphics.clear();
         this.§_-r2Q§ = null;
         if(this.controller)
         {
            this.controller.GetWorld().DestroyController(this.controller);
            this.controller.§_-D1X§ = null;
         }
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this.size = new b2Vec2(param1,param2);
      }
      
      public function get size() : b2Vec2
      {
         var _loc1_:b2Vec2 = this.§_-y1d§.Copy();
         _loc1_.y = -_loc1_.y;
         _loc1_.Multiply(1 / (Game.§_-12A§ * 0.5));
         return _loc1_;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1 = param1.Copy();
         param1.Multiply(Game.§_-12A§ * 0.5);
         param1.y = -param1.y;
         this.§_-y1d§ = param1;
         this.§_-y1d§.y = Math.abs(this.§_-y1d§.y);
         this.§_-y1d§.x = Math.max(this.§_-y1d§.x,0);
         this.resize();
      }
      
      public function get particlesCount() : int
      {
         return this.§_-ef§;
      }
      
      public function set particlesCount(param1:int) : void
      {
         this.§_-ef§ = param1;
         this.resize();
      }
      
      public function §_-4i§(param1:b2Vec2) : Boolean
      {
         return param1.y < 0 && -param1.y < this.§_-y1d§.y - 10 && param1.x > 0 && param1.x < this.§_-y1d§.x;
      }
      
      public function §_-92g§(param1:b2Vec2, param2:Number) : void
      {
         param1.Multiply(Game.§_-12A§);
         param1.Subtract(new b2Vec2(this.x,this.y));
         var _loc3_:§_-iY§ = new §_-iY§();
         _loc3_.pos = param1;
         _loc3_.scale = param2;
         _loc3_.vel2 = new b2Vec2(Math.random() - Math.random(),-1 * Math.abs(param2));
         this.§_-mY§.push(_loc3_);
      }
      
      public function get waveEnabled() : Boolean
      {
         return this.§_-u1z§;
      }
      
      public function set waveEnabled(param1:Boolean) : void
      {
         this.§_-u1z§ = param1;
         if(!param1)
         {
            this.particlesCount = 0;
         }
      }
      
      public function get color0() : int
      {
         return this._color0;
      }
      
      public function set color0(param1:int) : void
      {
         this._color0 = param1;
         this.draw();
         this.§_-J1W§();
      }
      
      public function get color1() : int
      {
         return this._color1;
      }
      
      public function set color1(param1:int) : void
      {
         this._color1 = param1;
         this.draw();
         this.§_-J1W§();
      }
      
      public function get color2() : int
      {
         return this._color2;
      }
      
      public function set color2(param1:int) : void
      {
         this._color2 = param1;
         this.draw();
         this.§_-J1W§();
      }
      
      public function §_-u2W§() : Number
      {
         return 0.3 + (Math.min(0.5,this.bubblingFactor) * 3 + this.particlesCount * 0.1);
      }
      
      protected function §_-J1W§() : void
      {
         var _loc5_:§_-E1W§ = null;
         var _loc6_:§_-E1W§ = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.clear();
         if(this.§_-PQ§)
         {
            removeChildStarling(this.§_-PQ§);
         }
         var _loc2_:Point = this.§_-r2Q§ ? new Point(this.x,this.y) : new Point();
         _loc1_.graphics.moveTo(_loc2_.x,_loc2_.y);
         var _loc3_:Matrix = new Matrix();
         _loc3_.createGradientBox(this.§_-y1d§.x,this.§_-y1d§.y,Math.PI * 0.5,_loc2_.x,_loc2_.y - this.§_-y1d§.y);
         _loc1_.graphics.beginGradientFill(GradientType.LINEAR,[this.color0,this.color1,this.color2],[this._alpha0 * this.alpha,this._alpha1 * this.alpha,this._alpha2 * this.alpha],[0,100,255],_loc3_);
         _loc1_.graphics.lineTo(this.particles[0].x + _loc2_.x,this.particles[0].y + _loc2_.y);
         var _loc4_:int = 0;
         while(_loc4_ < this.particles.length - 1)
         {
            _loc5_ = this.particles[_loc4_];
            _loc6_ = this.particles[_loc4_ + 1];
            _loc7_ = new Point(_loc5_.x + _loc2_.x,_loc5_.y + _loc2_.y);
            _loc8_ = new Point(_loc6_.x + _loc2_.x,_loc6_.y + _loc2_.y);
            _loc1_.graphics.curveTo(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y);
            _loc4_++;
         }
         _loc1_.graphics.lineStyle();
         _loc1_.graphics.lineTo(this.§_-y1d§.x + _loc2_.x,_loc2_.y);
         _loc1_.graphics.endFill();
         this.§_-PQ§ = new §_-aS§(_loc1_);
         §_-J2J§(this.§_-PQ§);
      }
      
      protected function draw() : void
      {
      }
      
      protected function resize() : void
      {
         var _loc2_:§_-E1W§ = null;
         this.particles = new Vector.<§_-E1W§>();
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         while(this.particles.length < this.particlesCount)
         {
            this.particles.push(new §_-E1W§(-this.§_-y1d§.y));
         }
         this.particles.push(new §_-E1W§(-this.§_-y1d§.y),new §_-E1W§(-this.§_-y1d§.y));
         var _loc1_:Number = 0;
         for each(_loc2_ in this.particles)
         {
            _loc2_.x = _loc1_;
            §_-J2J§(_loc2_);
            _loc1_ += this.§_-y1d§.x / (this.particles.length - 1);
         }
         this.§_-81i§ = this.§_-y1d§.x * this.§_-y1d§.y;
         if(this.§_-r2Q§ == null)
         {
            this.draw();
         }
         this.§_-J1W§();
      }
      
      private function §_-Z2p§(param1:int) : b2Vec2
      {
         var _loc2_:* = this.particles[param1];
         return new b2Vec2(-(_loc2_.x + this.x),_loc2_.y + this.y);
      }
      
      private function §_-zr§(param1:Number) : int
      {
         if(param1 < this.x)
         {
            return -1;
         }
         if(param1 >= this.x + this.§_-y1d§.x)
         {
            return int.MAX_VALUE;
         }
         var _loc2_:int = int((param1 - this.x) * (this.particles.length - 1) / this.§_-y1d§.x);
         if(_loc2_ >= this.particles.length - 1)
         {
            return int.MAX_VALUE;
         }
         return _loc2_;
      }
      
      private function §_-b2m§(param1:Number) : §_-E1W§
      {
         var _loc2_:int = this.§_-zr§(param1);
         if(_loc2_ in this.particles)
         {
            return this.particles[_loc2_];
         }
         return null;
      }
   }
}


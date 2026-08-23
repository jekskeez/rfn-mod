package §_-42p§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-83V§.§_-Y28§;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-B35§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-W1B§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-R2m§;
   import game.mainGame.entity.§_-YY§;
   
   public class §_-01t§ extends §_-h2I§ implements §_-B35§, §_-63Q§, §_-03u§, §_-R2m§, §_-Tm§, §_-C2x§, §_-W1B§, §_-YY§
   {
      
      public static var bubbles:BitmapData;
      
      private var §_-ZO§:int;
      
      private var particles:Vector.<§_-h2e§>;
      
      private var §_-K1f§:Number;
      
      private var §_-S24§:int;
      
      private var §_-x2H§:§_-h2I§;
      
      private var §_-il§:Number = 0;
      
      private var _color0:int = 8440575;
      
      private var _color1:int = 34815;
      
      private var _color2:int = 217302;
      
      private var §_-y1M§:Boolean = false;
      
      protected var game:SquirrelGame = null;
      
      protected var _alpha0:Number = 0.41;
      
      protected var _alpha1:Number = 0.41;
      
      protected var _alpha2:Number = 0.41;
      
      protected var §_-s1Y§:b2Vec2;
      
      protected var controller:§_-Mq§;
      
      protected var §_-YA§:§_-h2I§;
      
      public var §_-u2y§:Vector.<§_-xG§> = new Vector.<§_-xG§>();
      
      public var waveAmplitude:Number = 0;
      
      public var waveLength:Number = 0;
      
      public var velocity:b2Vec2 = new b2Vec2();
      
      public var allowSwim:Boolean = true;
      
      public var bubblingFactor:Number = 0;
      
      public var §_-u29§:int = -1;
      
      public function §_-01t§()
      {
         super();
         if(!bubbles)
         {
            bubbles = new BitmapData(15,15,true,16777215);
            bubbles.draw(new Bubble());
         }
         this.§_-s1Y§ = new b2Vec2(300,300);
         this.§_-S24§ = 1;
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
         return this.§_-YA§ ? this.§_-YA§.graphics : super.graphics;
      }
      
      public function §_-UF§(param1:b2Vec2, param2:b2Vec2) : void
      {
         var _loc3_:§_-h2e§ = this.§_-x2m§(param1.x * Game.§_-x2P§);
         var _loc4_:Number = param2.y * Game.§_-x2P§ / 5;
         if(Boolean(_loc3_) && _loc3_.velocity < _loc4_)
         {
            _loc3_.velocity += param2.y * Game.§_-x2P§ / 5;
         }
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
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
         this.controller = new §_-Mq§(this);
         param1.AddController(this.controller);
         this.graphics.clear();
         this.game = param1.userData as SquirrelGame;
         if(this.§_-u29§ == -1)
         {
            return;
         }
         var _loc2_:§_-Y28§ = this.game.map.getObject(this.§_-u29§) as §_-Y28§;
         if(_loc2_)
         {
            _loc2_.§_-Oz§ = this.game.map.§_-F2W§(this);
         }
      }
      
      public function §_-V1z§(param1:Number, param2:Number) : Array
      {
         if(param2 * Game.§_-x2P§ > this.y)
         {
            return [null,null,false];
         }
         var _loc3_:int = this.§_-h1p§(param1 * Game.§_-x2P§);
         switch(_loc3_)
         {
            case -1:
               return [null,null,false];
            case int.MAX_VALUE:
               return [null,null,false];
            default:
               var _loc4_:§_-iC§ = §_-iC§.§_-t27§(this.§_-N21§(_loc3_),this.§_-N21§(_loc3_ + 1));
               var _loc5_:b2Vec2 = _loc4_.normal;
               _loc5_.Normalize();
               return [_loc5_,-_loc4_.offset / Game.§_-x2P§,true];
         }
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.controller)
         {
            this.controller.velocity = this.velocity;
            this.controller.§_-v1T§ = false;
         }
      }
      
      public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],0,[this.size.x,this.size.y],this.waveAmplitude,this.waveLength,this.§_-il§,this.particlesCount,this.allowSwim,[this.velocity.x,this.velocity.y],this.bubblingFactor,this.waveEnabled,[this.color0,this.color1,this.color2],this.§_-u29§];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.size = new b2Vec2(param1[2][0],param1[2][1]);
         this.waveAmplitude = param1[3];
         this.waveLength = param1[4];
         this.§_-il§ = param1[5];
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
         this.§_-11E§();
         if(!(12 in param1))
         {
            return;
         }
         this.§_-u29§ = param1[12];
      }
      
      public function dispose() : void
      {
         this.game = null;
         this.graphics.clear();
         this.§_-YA§ = null;
         if(this.controller)
         {
            this.controller.GetWorld().DestroyController(this.controller);
            this.controller.§_-42G§ = null;
         }
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
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
         var _loc1_:b2Vec2 = this.§_-s1Y§.Copy();
         _loc1_.y = -_loc1_.y;
         _loc1_.Multiply(1 / (Game.§_-x2P§ * 0.5));
         return _loc1_;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1 = param1.Copy();
         param1.Multiply(Game.§_-x2P§ * 0.5);
         param1.y = -param1.y;
         this.§_-s1Y§ = param1;
         this.§_-s1Y§.y = Math.abs(this.§_-s1Y§.y);
         this.§_-s1Y§.x = Math.max(this.§_-s1Y§.x,0);
         this.resize();
      }
      
      public function get particlesCount() : int
      {
         return this.§_-ZO§;
      }
      
      public function set particlesCount(param1:int) : void
      {
         this.§_-ZO§ = param1;
         this.resize();
      }
      
      public function §_-YP§(param1:b2Vec2) : Boolean
      {
         return param1.y < 0 && -param1.y < this.§_-s1Y§.y - 10 && param1.x > 0 && param1.x < this.§_-s1Y§.x;
      }
      
      public function §_-t2E§(param1:b2Vec2, param2:Number) : void
      {
         param1.Multiply(Game.§_-x2P§);
         param1.Subtract(new b2Vec2(this.x,this.y));
         var _loc3_:§_-xG§ = new §_-xG§();
         _loc3_.pos = param1;
         _loc3_.scale = param2;
         _loc3_.vel2 = new b2Vec2(Math.random() - Math.random(),-1 * Math.abs(param2));
         this.§_-u2y§.push(_loc3_);
      }
      
      public function get waveEnabled() : Boolean
      {
         return this.§_-y1M§;
      }
      
      public function set waveEnabled(param1:Boolean) : void
      {
         this.§_-y1M§ = param1;
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
         this.§_-11E§();
      }
      
      public function get color1() : int
      {
         return this._color1;
      }
      
      public function set color1(param1:int) : void
      {
         this._color1 = param1;
         this.draw();
         this.§_-11E§();
      }
      
      public function get color2() : int
      {
         return this._color2;
      }
      
      public function set color2(param1:int) : void
      {
         this._color2 = param1;
         this.draw();
         this.§_-11E§();
      }
      
      public function §_-q§() : Number
      {
         return 0.3 + (Math.min(0.5,this.bubblingFactor) * 3 + this.particlesCount * 0.1);
      }
      
      protected function §_-11E§() : void
      {
         var _loc5_:§_-h2e§ = null;
         var _loc6_:§_-h2e§ = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.clear();
         if(this.§_-x2H§)
         {
            removeChildStarling(this.§_-x2H§);
         }
         var _loc2_:Point = this.§_-YA§ ? new Point(this.x,this.y) : new Point();
         _loc1_.graphics.moveTo(_loc2_.x,_loc2_.y);
         var _loc3_:Matrix = new Matrix();
         _loc3_.createGradientBox(this.§_-s1Y§.x,this.§_-s1Y§.y,Math.PI * 0.5,_loc2_.x,_loc2_.y - this.§_-s1Y§.y);
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
         _loc1_.graphics.lineTo(this.§_-s1Y§.x + _loc2_.x,_loc2_.y);
         _loc1_.graphics.endFill();
         this.§_-x2H§ = new §_-h2I§(_loc1_);
         §_-83v§(this.§_-x2H§);
      }
      
      protected function draw() : void
      {
      }
      
      protected function resize() : void
      {
         var _loc2_:§_-h2e§ = null;
         this.particles = new Vector.<§_-h2e§>();
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         while(this.particles.length < this.particlesCount)
         {
            this.particles.push(new §_-h2e§(-this.§_-s1Y§.y));
         }
         this.particles.push(new §_-h2e§(-this.§_-s1Y§.y),new §_-h2e§(-this.§_-s1Y§.y));
         var _loc1_:Number = 0;
         for each(_loc2_ in this.particles)
         {
            _loc2_.x = _loc1_;
            §_-83v§(_loc2_);
            _loc1_ += this.§_-s1Y§.x / (this.particles.length - 1);
         }
         this.§_-K1f§ = this.§_-s1Y§.x * this.§_-s1Y§.y;
         if(this.§_-YA§ == null)
         {
            this.draw();
         }
         this.§_-11E§();
      }
      
      private function §_-N21§(param1:int) : b2Vec2
      {
         var _loc2_:* = this.particles[param1];
         return new b2Vec2(-(_loc2_.x + this.x),_loc2_.y + this.y);
      }
      
      private function §_-h1p§(param1:Number) : int
      {
         if(param1 < this.x)
         {
            return -1;
         }
         if(param1 >= this.x + this.§_-s1Y§.x)
         {
            return int.MAX_VALUE;
         }
         var _loc2_:int = int((param1 - this.x) * (this.particles.length - 1) / this.§_-s1Y§.x);
         if(_loc2_ >= this.particles.length - 1)
         {
            return int.MAX_VALUE;
         }
         return _loc2_;
      }
      
      private function §_-x2m§(param1:Number) : §_-h2e§
      {
         var _loc2_:int = this.§_-h1p§(param1);
         if(_loc2_ in this.particles)
         {
            return this.particles[_loc2_];
         }
         return null;
      }
   }
}


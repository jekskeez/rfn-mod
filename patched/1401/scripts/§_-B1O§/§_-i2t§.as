package §_-B1O§
{
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-81N§.§_-H2r§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Rn§.§_-I2G§;
   import §_-Y22§.§_-C2x§;
   import flash.display.GradientType;
   import flash.display.InterpolationMethod;
   import flash.display.Shape;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.utils.setTimeout;
   import game.mainGame.GameMap;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-W1B§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-R2m§;
   
   public class §_-i2t§ extends §_-h2I§ implements §_-63Q§, §_-03u§, §_-I2G§, §_-C2x§, §_-R2m§, §_-Tm§, §_-72o§, §_-W1B§
   {
      
      private static const §_-f3§:int = 14416639;
      
      private static const §_-O1N§:int = 303;
      
      private var controller:§_-H2r§;
      
      private var _direction:b2Vec2 = new b2Vec2();
      
      private var §_-02k§:Number = -100;
      
      private var §_-m2p§:b2Vec2 = new b2Vec2(10,10);
      
      private var §_-C2h§:b2Vec2 = new b2Vec2(20,20);
      
      private var §_-1u§:Boolean = true;
      
      private var §_-c2z§:Boolean = true;
      
      private var §_-t2e§:Boolean = true;
      
      private var §_-L1n§:Boolean = true;
      
      private var §_-71v§:String = "";
      
      private var §_-P2i§:Number = 0;
      
      private var §_-030§:§_-A1f§;
      
      private var §_-K2H§:b2Vec2 = null;
      
      private var §_-r8§:b2Vec2 = new b2Vec2(0,0);
      
      private var §_-F1a§:§_-h2I§ = new §_-h2I§();
      
      private var §_-Ny§:§_-h2I§ = new §_-h2I§();
      
      private var §_-C1T§:§_-h2I§ = new §_-h2I§();
      
      private var circle:§_-h2I§ = new §_-h2I§(new GravityCircle());
      
      private var §_-ix§:b2Vec2 = new b2Vec2();
      
      public var body:GameBody;
      
      private var §_-D2n§:int = 0;
      
      private var §_-E1P§:int = 0;
      
      public function §_-i2t§()
      {
         super();
         §_-83v§(this.§_-C1T§);
         §_-83v§(this.§_-F1a§);
         §_-83v§(this.§_-Ny§);
         this.redraw();
         this.touchable = false;
      }
      
      public function init() : void
      {
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-33E§);
         this.mouseEnabled = false;
         this.mouseChildren = false;
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
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 * Game.R2D;
      }
      
      public function build(param1:b2World) : void
      {
         this.controller = new §_-H2r§();
         this.controller.body = this;
         param1.AddController(this.controller);
         this.§_-P2Q§();
      }
      
      public function §_-A1X§() : *
      {
         return [this.§_-K2H§ ? [this.§_-K2H§.x,this.§_-K2H§.y] : [this.position.x,this.position.y],this.angle,this.velocity,[this.direction.x,this.direction.y],[this.size.x,this.size.y],[this.outSize.x,this.outSize.y],this.disableGravity,this.affectHero,this.affectObject,this.extGravity,this.§_-V26§ ? this.§_-V26§.name : this.§_-71v§];
      }
      
      public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         this.velocity = param1[2];
         this.direction = new b2Vec2(param1[3][0],param1[3][1]);
         this.size = new b2Vec2(param1[4][0],param1[4][1]);
         this.outSize = new b2Vec2(param1[5][0],param1[5][1]);
         this.disableGravity = Boolean(param1[6]);
         this.affectHero = Boolean(param1[7]);
         this.affectObject = Boolean(param1[8]);
         this.extGravity = Boolean(param1[9]);
         if(!(10 in param1))
         {
            return;
         }
         this.§_-71v§ = param1[10];
      }
      
      public function dispose() : void
      {
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-n2T§(0);
         }
         if(this.controller)
         {
            this.controller.dispose();
         }
         this.§_-V26§ = null;
         this.body = null;
         this.controller = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-V26§ || !this.§_-V26§.parentStarling)
         {
            this.§_-V26§ = null;
            return;
         }
         var _loc2_:b2Vec2 = this.§_-V26§.position.Copy();
         var _loc3_:b2Vec2 = this.§_-V26§.size.Copy();
         _loc3_.Multiply(0.5);
         this.size = _loc3_.Copy();
         var _loc4_:b2Mat22 = new b2Mat22();
         this.angle = this.§_-V26§.angle;
         _loc4_.Set(this.angle);
         _loc3_.MulM(_loc4_);
         _loc3_.Multiply(0.5);
         _loc2_.Add(_loc3_);
         this.§_-K2H§ = this.§_-V26§.position;
         this.position = _loc2_;
      }
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         if(this.§_-71v§ == "")
         {
            return;
         }
         setTimeout(this.§_-DB§,0,param1);
      }
      
      public function §_-u2q§(param1:GameMap) : void
      {
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-m2p§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = Math.abs(param1.x);
         param1.y = Math.abs(param1.y);
         if(this.§_-m2p§.x == param1.x && this.§_-m2p§.y == param1.y)
         {
            return;
         }
         this.§_-m2p§ = param1;
         this.§_-P2Q§();
         this.redraw();
      }
      
      public function get direction() : b2Vec2
      {
         return this._direction;
      }
      
      public function set direction(param1:b2Vec2) : void
      {
         this._direction = param1;
         this.§_-P2Q§();
         this.redraw();
      }
      
      public function get velocity() : Number
      {
         return this.§_-02k§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-02k§ = param1;
         this.§_-P2Q§();
      }
      
      public function get outSize() : b2Vec2
      {
         return this.§_-C2h§;
      }
      
      public function set outSize(param1:b2Vec2) : void
      {
         this.§_-C2h§ = param1;
         this.§_-P2Q§();
         this.redraw();
      }
      
      public function get disableGravity() : Boolean
      {
         return this.§_-1u§;
      }
      
      public function set disableGravity(param1:Boolean) : void
      {
         this.§_-1u§ = param1;
         this.§_-P2Q§();
      }
      
      public function get affectHero() : Boolean
      {
         return this.§_-c2z§;
      }
      
      public function set affectHero(param1:Boolean) : void
      {
         this.§_-c2z§ = param1;
         this.§_-P2Q§();
      }
      
      public function get affectObject() : Boolean
      {
         return this.§_-t2e§;
      }
      
      public function set affectObject(param1:Boolean) : void
      {
         this.§_-t2e§ = param1;
         this.§_-P2Q§();
      }
      
      public function get extGravity() : Boolean
      {
         return this.§_-L1n§;
      }
      
      public function set extGravity(param1:Boolean) : void
      {
         this.§_-L1n§ = param1;
         this.§_-P2Q§();
      }
      
      public function get §_-V26§() : §_-A1f§
      {
         return this.§_-030§;
      }
      
      public function set §_-V26§(param1:§_-A1f§) : void
      {
         this.§_-030§ = param1;
         if(param1 == null)
         {
            Game.stage.removeEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
         }
         else
         {
            Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
         }
      }
      
      public function §_-q§() : Number
      {
         return 0.5 * int(this.affectObject);
      }
      
      private function §_-DB§(param1:GameMap) : void
      {
         var _loc2_:§_-63Q§ = param1.§_-xL§(this.§_-71v§);
         if(_loc2_ is §_-A1f§)
         {
            this.§_-V26§ = _loc2_ as §_-A1f§;
         }
         this.§_-71v§ = "";
      }
      
      private function §_-P2Q§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.controller.G = this.velocity;
         this.controller.§_-M2V§ = this.size;
         this.controller.outSize = b2Math.AddVV(this.outSize,this.size);
         this.controller.direction = this.direction;
         this.controller.§_-83M§ = new b2Vec2();
         this.controller.disableGlobalGravity = this.disableGravity;
         this.controller.addExtGrav = this.extGravity;
         this.controller.affectHero = this.affectHero;
         this.controller.affectObjects = this.affectObject;
      }
      
      private function redraw() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.direction.Length() != 0 && this.§_-D2n§ == this.outSize.x + this.size.x && this.§_-E1P§ == this.outSize.y + this.size.y)
         {
            return;
         }
         this.§_-D2n§ = this.outSize.x + this.size.x;
         this.§_-E1P§ = this.outSize.y + this.size.y;
         while(this.§_-F1a§.numChildren > 0)
         {
            this.§_-F1a§.§_-n2T§(0);
         }
         while(this.§_-C1T§.numChildren > 0)
         {
            this.§_-C1T§.§_-n2T§(0);
         }
         if(this.direction.Length() == 0)
         {
            this.§_-r8§.x = (this.outSize.x + this.size.x) * Game.§_-x2P§;
            this.§_-r8§.y = (this.outSize.y + this.size.y) * Game.§_-x2P§;
            _loc3_ = this.§_-r8§.x / §_-O1N§;
            if(_loc3_ < 2000)
            {
               this.circle.scaleXY(_loc3_);
            }
            this.§_-F1a§.§_-83v§(this.circle);
            this.§_-F1a§.§_-x2x§();
         }
         else
         {
            this.§_-P2i§ = Math.sqrt(Math.pow((this.outSize.x + this.size.x) * Game.§_-x2P§,2) + Math.pow((this.outSize.y + this.size.y) * Game.§_-x2P§,2));
            _loc4_ = Math.atan2(this.direction.y,this.direction.x) - this.angle;
            this.§_-r8§.x = int(Math.cos(_loc4_) * (this.§_-P2i§ * 0.5));
            this.§_-r8§.y = int(Math.sin(_loc4_) * (this.§_-P2i§ * 0.5));
            this.§_-F1a§.§_-x2x§();
            this.§_-r8§.x = Math.abs(this.§_-r8§.x);
            this.§_-r8§.y = Math.abs(this.§_-r8§.y);
            this.§_-ix§.Set(int(Math.cos(_loc4_) * this.velocity / 50),int(Math.sin(_loc4_) * this.velocity / 50));
         }
         var _loc1_:Matrix = new Matrix();
         var _loc2_:Shape = new Shape();
         _loc1_.createGradientBox((this.outSize.x + this.size.x) * Game.§_-x2P§,(this.outSize.y + this.size.y) * Game.§_-x2P§,0,(-this.outSize.x - this.size.x) * Game.§_-x2P§ * 0.5,(-this.outSize.y - this.size.y) * Game.§_-x2P§ * 0.5);
         _loc2_.graphics.beginGradientFill(this.direction.Length() == 0 ? GradientType.RADIAL : GradientType.LINEAR,[§_-f3§,§_-f3§,§_-f3§,§_-f3§],[0,0.1,0.5,0],[0,this.direction.Length() == 0 ? 222 : 50,250,255],_loc1_,SpreadMethod.PAD,InterpolationMethod.RGB,0);
         if(this.direction.Length() == 0)
         {
            _loc2_.graphics.drawEllipse((-this.outSize.x - this.size.x) * Game.§_-x2P§ * 0.5,(-this.outSize.y - this.size.y) * Game.§_-x2P§ * 0.5,(this.outSize.x + this.size.x) * Game.§_-x2P§,(this.outSize.y + this.size.y) * Game.§_-x2P§);
         }
         else
         {
            _loc2_.graphics.drawRect((-this.outSize.x - this.size.x) * Game.§_-x2P§ * 0.5,(-this.outSize.y - this.size.y) * Game.§_-x2P§ * 0.5,(this.outSize.x + this.size.x) * Game.§_-x2P§,(this.outSize.y + this.size.y) * Game.§_-x2P§);
         }
         this.§_-C1T§.§_-83v§(new §_-h2I§(_loc2_,true));
         if(this.direction.x != 0 || this.direction.y != 0 || this.§_-V26§ != null)
         {
            return;
         }
         while(this.§_-C1T§.numChildren > 0)
         {
            this.§_-C1T§.§_-n2T§(0);
         }
         _loc2_.graphics.beginFill(16777215,0.1);
         _loc2_.graphics.drawRect(-this.size.x * Game.§_-x2P§ * 0.5,-this.size.y * Game.§_-x2P§ * 0.5,this.size.x * Game.§_-x2P§,this.size.y * Game.§_-x2P§);
         this.§_-C1T§.§_-83v§(new §_-h2I§(_loc2_,true));
      }
      
      private function §_-33E§(param1:MouseEvent) : void
      {
         if(Boolean(param1.target) && Boolean(param1.target is Sprite) && (param1.target as §_-h2I§).parentStarling is §_-A1f§)
         {
            this.§_-V26§ = (param1.target as §_-h2I§).parentStarling as §_-A1f§;
            this.parent.swapChildren(this.§_-V26§,this);
         }
         this.mouseChildren = true;
         this.mouseEnabled = true;
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-33E§);
         this.update();
      }
      
      private function §_-L1Y§(param1:Event) : void
      {
         this.update();
      }
   }
}


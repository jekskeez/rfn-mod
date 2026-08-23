package §_-j2H§
{
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-H1l§.§_-ho§;
   import §_-I2Y§.§_-l2r§;
   import §_-M16§.§_-U1I§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
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
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-d7§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-d2T§ extends §_-aS§ implements §_-xn§, §_-3l§, §_-U1I§, §_-l2r§, §_-41O§, §_-F1c§, §_-hQ§, §_-d7§
   {
      
      private static const §_-u2p§:int = 14416639;
      
      private static const §_-w1v§:int = 303;
      
      private var controller:§_-ho§;
      
      private var _direction:b2Vec2 = new b2Vec2();
      
      private var §_-J1H§:Number = -100;
      
      private var §_-Nz§:b2Vec2 = new b2Vec2(10,10);
      
      private var §_-6V§:b2Vec2 = new b2Vec2(20,20);
      
      private var §_-XN§:Boolean = true;
      
      private var §_-RI§:Boolean = true;
      
      private var §_-Od§:Boolean = true;
      
      private var §_-21t§:Boolean = true;
      
      private var §_-62J§:String = "";
      
      private var §_-W1n§:Number = 0;
      
      private var §_-O1J§:§_-01b§;
      
      private var §_-u2K§:b2Vec2 = null;
      
      private var §_-x1X§:b2Vec2 = new b2Vec2(0,0);
      
      private var §_-61j§:§_-aS§ = new §_-aS§();
      
      private var §_-YI§:§_-aS§ = new §_-aS§();
      
      private var §_-K1x§:§_-aS§ = new §_-aS§();
      
      private var circle:§_-aS§ = new §_-aS§(new GravityCircle());
      
      private var §_-a1p§:b2Vec2 = new b2Vec2();
      
      public var body:GameBody;
      
      private var §_-3p§:int = 0;
      
      private var §_-61V§:int = 0;
      
      public function §_-d2T§()
      {
         super();
         §_-J2J§(this.§_-K1x§);
         §_-J2J§(this.§_-61j§);
         §_-J2J§(this.§_-YI§);
         this.redraw();
         this.touchable = false;
      }
      
      public function init() : void
      {
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-t2M§);
         this.mouseEnabled = false;
         this.mouseChildren = false;
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
         return this.rotation * Game.D2R;
      }
      
      public function set angle(param1:Number) : void
      {
         this.rotation = param1 * Game.R2D;
      }
      
      public function build(param1:b2World) : void
      {
         this.controller = new §_-ho§();
         this.controller.body = this;
         param1.AddController(this.controller);
         this.§_-D1s§();
      }
      
      public function §_-m1Y§() : *
      {
         return [this.§_-u2K§ ? [this.§_-u2K§.x,this.§_-u2K§.y] : [this.position.x,this.position.y],this.angle,this.velocity,[this.direction.x,this.direction.y],[this.size.x,this.size.y],[this.outSize.x,this.outSize.y],this.disableGravity,this.affectHero,this.affectObject,this.extGravity,this.§_-RC§ ? this.§_-RC§.name : this.§_-62J§];
      }
      
      public function §_-o2I§(param1:*) : void
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
         this.§_-62J§ = param1[10];
      }
      
      public function dispose() : void
      {
         if(this.parentStarling)
         {
            this.parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            this.§_-av§(0);
         }
         if(this.controller)
         {
            this.controller.dispose();
         }
         this.§_-RC§ = null;
         this.body = null;
         this.controller = null;
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-RC§ || !this.§_-RC§.parentStarling)
         {
            this.§_-RC§ = null;
            return;
         }
         var _loc2_:b2Vec2 = this.§_-RC§.position.Copy();
         var _loc3_:b2Vec2 = this.§_-RC§.size.Copy();
         _loc3_.Multiply(0.5);
         this.size = _loc3_.Copy();
         var _loc4_:b2Mat22 = new b2Mat22();
         this.angle = this.§_-RC§.angle;
         _loc4_.Set(this.angle);
         _loc3_.MulM(_loc4_);
         _loc3_.Multiply(0.5);
         _loc2_.Add(_loc3_);
         this.§_-u2K§ = this.§_-RC§.position;
         this.position = _loc2_;
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         if(this.§_-62J§ == "")
         {
            return;
         }
         setTimeout(this.§_-m1y§,0,param1);
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-Nz§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = Math.abs(param1.x);
         param1.y = Math.abs(param1.y);
         if(this.§_-Nz§.x == param1.x && this.§_-Nz§.y == param1.y)
         {
            return;
         }
         this.§_-Nz§ = param1;
         this.§_-D1s§();
         this.redraw();
      }
      
      public function get direction() : b2Vec2
      {
         return this._direction;
      }
      
      public function set direction(param1:b2Vec2) : void
      {
         this._direction = param1;
         this.§_-D1s§();
         this.redraw();
      }
      
      public function get velocity() : Number
      {
         return this.§_-J1H§;
      }
      
      public function set velocity(param1:Number) : void
      {
         this.§_-J1H§ = param1;
         this.§_-D1s§();
      }
      
      public function get outSize() : b2Vec2
      {
         return this.§_-6V§;
      }
      
      public function set outSize(param1:b2Vec2) : void
      {
         this.§_-6V§ = param1;
         this.§_-D1s§();
         this.redraw();
      }
      
      public function get disableGravity() : Boolean
      {
         return this.§_-XN§;
      }
      
      public function set disableGravity(param1:Boolean) : void
      {
         this.§_-XN§ = param1;
         this.§_-D1s§();
      }
      
      public function get affectHero() : Boolean
      {
         return this.§_-RI§;
      }
      
      public function set affectHero(param1:Boolean) : void
      {
         this.§_-RI§ = param1;
         this.§_-D1s§();
      }
      
      public function get affectObject() : Boolean
      {
         return this.§_-Od§;
      }
      
      public function set affectObject(param1:Boolean) : void
      {
         this.§_-Od§ = param1;
         this.§_-D1s§();
      }
      
      public function get extGravity() : Boolean
      {
         return this.§_-21t§;
      }
      
      public function set extGravity(param1:Boolean) : void
      {
         this.§_-21t§ = param1;
         this.§_-D1s§();
      }
      
      public function get §_-RC§() : §_-01b§
      {
         return this.§_-O1J§;
      }
      
      public function set §_-RC§(param1:§_-01b§) : void
      {
         this.§_-O1J§ = param1;
         if(param1 == null)
         {
            Game.stage.removeEventListener(Event.ENTER_FRAME,this.§_-A1X§);
         }
         else
         {
            Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-A1X§);
         }
      }
      
      public function §_-u2W§() : Number
      {
         return 0.5 * int(this.affectObject);
      }
      
      private function §_-m1y§(param1:GameMap) : void
      {
         var _loc2_:§_-xn§ = param1.§_-br§(this.§_-62J§);
         if(_loc2_ is §_-01b§)
         {
            this.§_-RC§ = _loc2_ as §_-01b§;
         }
         this.§_-62J§ = "";
      }
      
      private function §_-D1s§() : void
      {
         if(!this.controller)
         {
            return;
         }
         this.controller.G = this.velocity;
         this.controller.§_-P16§ = this.size;
         this.controller.outSize = b2Math.AddVV(this.outSize,this.size);
         this.controller.direction = this.direction;
         this.controller.§_-f10§ = new b2Vec2();
         this.controller.disableGlobalGravity = this.disableGravity;
         this.controller.addExtGrav = this.extGravity;
         this.controller.affectHero = this.affectHero;
         this.controller.affectObjects = this.affectObject;
      }
      
      private function redraw() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.direction.Length() != 0 && this.§_-3p§ == this.outSize.x + this.size.x && this.§_-61V§ == this.outSize.y + this.size.y)
         {
            return;
         }
         this.§_-3p§ = this.outSize.x + this.size.x;
         this.§_-61V§ = this.outSize.y + this.size.y;
         while(this.§_-61j§.numChildren > 0)
         {
            this.§_-61j§.§_-av§(0);
         }
         while(this.§_-K1x§.numChildren > 0)
         {
            this.§_-K1x§.§_-av§(0);
         }
         if(this.direction.Length() == 0)
         {
            this.§_-x1X§.x = (this.outSize.x + this.size.x) * Game.§_-12A§;
            this.§_-x1X§.y = (this.outSize.y + this.size.y) * Game.§_-12A§;
            _loc3_ = this.§_-x1X§.x / §_-w1v§;
            if(_loc3_ < 2000)
            {
               this.circle.scaleXY(_loc3_);
            }
            this.§_-61j§.§_-J2J§(this.circle);
            this.§_-61j§.§_-i18§();
         }
         else
         {
            this.§_-W1n§ = Math.sqrt(Math.pow((this.outSize.x + this.size.x) * Game.§_-12A§,2) + Math.pow((this.outSize.y + this.size.y) * Game.§_-12A§,2));
            _loc4_ = Math.atan2(this.direction.y,this.direction.x) - this.angle;
            this.§_-x1X§.x = int(Math.cos(_loc4_) * (this.§_-W1n§ * 0.5));
            this.§_-x1X§.y = int(Math.sin(_loc4_) * (this.§_-W1n§ * 0.5));
            this.§_-61j§.§_-i18§();
            this.§_-x1X§.x = Math.abs(this.§_-x1X§.x);
            this.§_-x1X§.y = Math.abs(this.§_-x1X§.y);
            this.§_-a1p§.Set(int(Math.cos(_loc4_) * this.velocity / 50),int(Math.sin(_loc4_) * this.velocity / 50));
         }
         var _loc1_:Matrix = new Matrix();
         var _loc2_:Shape = new Shape();
         _loc1_.createGradientBox((this.outSize.x + this.size.x) * Game.§_-12A§,(this.outSize.y + this.size.y) * Game.§_-12A§,0,(-this.outSize.x - this.size.x) * Game.§_-12A§ * 0.5,(-this.outSize.y - this.size.y) * Game.§_-12A§ * 0.5);
         _loc2_.graphics.beginGradientFill(this.direction.Length() == 0 ? GradientType.RADIAL : GradientType.LINEAR,[§_-u2p§,§_-u2p§,§_-u2p§,§_-u2p§],[0,0.1,0.5,0],[0,this.direction.Length() == 0 ? 222 : 50,250,255],_loc1_,SpreadMethod.PAD,InterpolationMethod.RGB,0);
         if(this.direction.Length() == 0)
         {
            _loc2_.graphics.drawEllipse((-this.outSize.x - this.size.x) * Game.§_-12A§ * 0.5,(-this.outSize.y - this.size.y) * Game.§_-12A§ * 0.5,(this.outSize.x + this.size.x) * Game.§_-12A§,(this.outSize.y + this.size.y) * Game.§_-12A§);
         }
         else
         {
            _loc2_.graphics.drawRect((-this.outSize.x - this.size.x) * Game.§_-12A§ * 0.5,(-this.outSize.y - this.size.y) * Game.§_-12A§ * 0.5,(this.outSize.x + this.size.x) * Game.§_-12A§,(this.outSize.y + this.size.y) * Game.§_-12A§);
         }
         this.§_-K1x§.§_-J2J§(new §_-aS§(_loc2_,true));
         if(this.direction.x != 0 || this.direction.y != 0 || this.§_-RC§ != null)
         {
            return;
         }
         while(this.§_-K1x§.numChildren > 0)
         {
            this.§_-K1x§.§_-av§(0);
         }
         _loc2_.graphics.beginFill(16777215,0.1);
         _loc2_.graphics.drawRect(-this.size.x * Game.§_-12A§ * 0.5,-this.size.y * Game.§_-12A§ * 0.5,this.size.x * Game.§_-12A§,this.size.y * Game.§_-12A§);
         this.§_-K1x§.§_-J2J§(new §_-aS§(_loc2_,true));
      }
      
      private function §_-t2M§(param1:MouseEvent) : void
      {
         if(Boolean(param1.target) && Boolean(param1.target is Sprite) && (param1.target as §_-aS§).parentStarling is §_-01b§)
         {
            this.§_-RC§ = (param1.target as §_-aS§).parentStarling as §_-01b§;
            this.parent.swapChildren(this.§_-RC§,this);
         }
         this.mouseChildren = true;
         this.mouseEnabled = true;
         Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-t2M§);
         this.update();
      }
      
      private function §_-A1X§(param1:Event) : void
      {
         this.update();
      }
   }
}


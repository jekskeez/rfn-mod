package §_-B1O§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-81N§.§_-92L§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.InterpolationMethod;
   import flash.display.Shape;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import game.mainGame.§_-V§;
   import game.mainGame.§_-W1B§;
   import game.mainGame.entity.§_-21e§;
   import game.mainGame.entity.§_-R2m§;
   import game.mainGame.entity.§_-f2A§;
   
   public class §_-22r§ extends GameBody implements §_-R2m§, §_-21e§, §_-W1B§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-U2D§:Number = 1.7976931348623157e+308;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,3,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-NB§:Number = 228 / Game.§_-x2P§;
      
      private static const §_-52d§:Number = 229 / Game.§_-x2P§;
      
      private static const §_-LB§:uint = 10 / Game.§_-x2P§;
      
      private static const §_-u2I§:Array = [[0,0]];
      
      protected var §_-s1Y§:b2Vec2 = new b2Vec2(§_-NB§,§_-52d§);
      
      protected var §_-I4§:Number = 10;
      
      protected var §_-eH§:Boolean = true;
      
      protected var view:§_-h2I§;
      
      protected var §_-E2C§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-F1a§:§_-h2I§ = new §_-h2I§();
      
      protected var §_-m27§:int = 0;
      
      protected var §_-c2z§:Boolean = true;
      
      protected var §_-93b§:Boolean = true;
      
      protected var §_-91O§:Number = 150;
      
      protected var §_-t29§:Boolean = true;
      
      protected var §_-K2f§:Boolean = false;
      
      protected var §_-ea§:Number = 3;
      
      protected var §_-OL§:Boolean;
      
      protected var controller:§_-92L§;
      
      protected var bitmapData:BitmapData = null;
      
      protected var skins:Array = null;
      
      private var §_-3W§:int = 1;
      
      private var §_-02x§:Shape = new Shape();
      
      private var §_-E2a§:§_-h2I§ = new §_-h2I§();
      
      private var §_-62N§:§_-93d§ = §_-93d§.instance;
      
      private var §_-H2w§:§_-f1G§;
      
      private var §_-q1i§:§_-h2I§ = new §_-h2I§();
      
      public function §_-22r§()
      {
         super();
         this.§_-q1i§.§_-x2x§();
         this.§_-83v§(this.§_-q1i§);
         this.§_-E2C§.touchable = false;
         §_-83v§(this.§_-E2C§);
         this.§_-F1a§.touchable = false;
         §_-83v§(this.§_-F1a§);
         this.view = new §_-h2I§(new Planet1());
         §_-83v§(this.view);
         this.§_-J1v§();
         this.touchable = false;
      }
      
      override public function set cacheAsBitmap(param1:Boolean) : void
      {
         this.view.cacheAsBitmap = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         var _loc2_:b2CircleShape = new b2CircleShape(this.size.x * 0.5);
         this.fixture.density = this.§_-ea§;
         this.fixture.shape = _loc2_;
         this.fixture.friction = this.skin == 2 ? 0.1 : 0.8;
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.fixture);
         super.build(param1);
         this.§_-52D§();
         this.controller = new this.controllerClass();
         this.controller.body = this.body;
         this.controller.invSqr = this.§_-eH§;
         param1.AddController(this.controller);
         this.gravity = this.gravity;
         this.affectObjects = this.affectObjects;
         this.affectHero = this.affectHero;
         this.maxDistance = this.maxDistance;
         this.addExtGrav = this.addExtGrav;
         this.disableGlobalGravity = this.disableGlobalGravity;
         this.§_-H2w§ = this.§_-62N§.§_-23j§(§_-93d§.§_-R2v§);
         if(Boolean(this.§_-H2w§) && Boolean(this.§_-q1i§))
         {
            this.§_-H2w§.start();
            this.§_-H2w§.view.§_-x2x§();
            this.§_-H2w§.view.§_-M2F§ = 0;
            this.§_-H2w§.view.§_-Cg§ = 0;
            this.§_-q1i§.getStarlingView().addChild(this.§_-H2w§.view);
            this.§_-J1v§();
         }
      }
      
      protected function get controllerClass() : Class
      {
         return §_-92L§;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([[this.size.x,this.size.y],this.gravity,this.invSqr,this.affectObjects,this.affectHero,this.maxDistance,this.addExtGrav,this.biDirectional,this.density,this.disableGlobalGravity,this.skin]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:int = GameBody.§_-u1P§(param1) ? 3 : 1;
         this.size = new b2Vec2(param1[_loc2_][0][0],param1[_loc2_][0][1]);
         this.gravity = param1[_loc2_][1];
         this.invSqr = Boolean(param1[_loc2_][2]);
         this.affectObjects = Boolean(param1[_loc2_][3]);
         this.affectHero = Boolean(param1[_loc2_][4]);
         this.maxDistance = param1[_loc2_][5];
         this.addExtGrav = Boolean(param1[_loc2_][6]);
         this.biDirectional = Boolean(param1[_loc2_][7]);
         this.density = param1[_loc2_][8];
         this.disableGlobalGravity = Boolean(param1[_loc2_][9]);
         this.skin = param1[_loc2_][10];
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-s1Y§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = param1.y = Math.max(Math.min(Math.max(param1.x,param1.y),§_-U2D§),§_-LB§);
         this.§_-s1Y§ = param1;
         this.view.scaleXY(this.size.x / §_-NB§);
         this.§_-J1v§();
         if(!this.controller)
         {
            return;
         }
         this.controller.maxDistance = this.§_-91O§ / Game.§_-x2P§ + this.size.x;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-f2A§.§_-61A§(§_-u2I§);
      }
      
      public function get gravity() : Number
      {
         return this.§_-I4§;
      }
      
      public function set gravity(param1:Number) : void
      {
         this.§_-I4§ = param1;
         this.§_-J1v§();
         if(!this.controller)
         {
            return;
         }
         this.controller.G = param1;
      }
      
      public function get invSqr() : Boolean
      {
         return this.§_-eH§;
      }
      
      public function set invSqr(param1:Boolean) : void
      {
         this.§_-eH§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.invSqr = param1;
      }
      
      public function get affectHero() : Boolean
      {
         return this.§_-c2z§;
      }
      
      public function set affectHero(param1:Boolean) : void
      {
         this.§_-c2z§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.affectHero = param1;
      }
      
      public function get affectObjects() : Boolean
      {
         return this.§_-93b§;
      }
      
      public function set affectObjects(param1:Boolean) : void
      {
         this.§_-93b§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.affectObjects = param1;
      }
      
      public function get maxDistance() : Number
      {
         return this.§_-91O§;
      }
      
      public function set maxDistance(param1:Number) : void
      {
         this.§_-91O§ = param1;
         this.§_-J1v§();
         if(!this.controller)
         {
            return;
         }
         this.controller.maxDistance = this.§_-91O§ / Game.§_-x2P§ + this.size.x * 0.5;
      }
      
      public function get addExtGrav() : Boolean
      {
         return this.§_-t29§;
      }
      
      public function set addExtGrav(param1:Boolean) : void
      {
         this.§_-t29§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.addExtGrav = param1;
      }
      
      public function get biDirectional() : Boolean
      {
         return this.§_-K2f§;
      }
      
      public function set biDirectional(param1:Boolean) : void
      {
         this.§_-K2f§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.biDirectional = param1;
      }
      
      public function get density() : Number
      {
         return this.§_-ea§;
      }
      
      public function set density(param1:Number) : void
      {
         this.§_-ea§ = param1;
      }
      
      public function get disableGlobalGravity() : Boolean
      {
         return this.§_-OL§;
      }
      
      public function set disableGlobalGravity(param1:Boolean) : void
      {
         this.§_-OL§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.disableGlobalGravity = param1;
      }
      
      public function get skin() : int
      {
         return this.§_-m27§;
      }
      
      public function set skin(param1:int) : void
      {
         if(this.skins == null)
         {
            this.skins = [Planet1,Planet2,Planet3,Planet4];
         }
         if(param1 > this.skins.length - 1)
         {
            param1 = this.skins.length - 1;
         }
         this.§_-m27§ = param1;
         var _loc2_:Array = this.view.filters;
         if(this.view.parentStarling)
         {
            this.removeChildStarling(this.view);
         }
         this.view = new §_-h2I§(new this.skins[param1]());
         this.view.filters = _loc2_;
         §_-83v§(this.view);
         this.size = this.size;
      }
      
      override public function dispose() : void
      {
         if(this.§_-H2w§)
         {
            this.§_-H2w§.stop();
            this.§_-H2w§.removeFromParent(true);
         }
         if(this.§_-q1i§)
         {
            this.§_-q1i§.getStarlingView().removeFromParent(true);
            this.§_-q1i§.removeFromParent(true);
         }
         this.§_-E2C§.removeFromParent();
         this.§_-F1a§.removeFromParent();
         this.view.removeFromParent();
         this.§_-H2w§ = null;
         super.dispose();
         if(this.bitmapData != null)
         {
            this.bitmapData.dispose();
            this.bitmapData = null;
         }
         if(!this.controller || !this.controller.GetWorld())
         {
            return;
         }
         this.controller.body = null;
         this.controller.GetWorld().RemoveController(this.controller);
      }
      
      public function §_-q§() : Number
      {
         return 0.5 * int(this.affectObjects);
      }
      
      protected function get fixture() : b2FixtureDef
      {
         return §_-03A§;
      }
      
      private function §_-52D§() : void
      {
         var _loc1_:Number = this.rotation;
         this.rotation = 0;
         var _loc2_:Boolean = this.ghost;
         this.ghost = false;
         var _loc3_:Rectangle = this.getBounds(this);
         this.bitmapData = new BitmapData(this.width,this.height,true,16777215);
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(this.view);
         this.bitmapData.draw(_loc4_,new Matrix(1,0,0,1,this.width * 0.5,this.height * 0.5));
         var _loc5_:Bitmap = new Bitmap(this.bitmapData);
         _loc5_.x = _loc3_.x;
         _loc5_.y = _loc3_.y;
         _loc5_.smoothing = true;
         §_-83v§(new §_-h2I§(_loc5_));
         this.rotation = _loc1_;
         this.ghost = _loc2_;
      }
      
      private function §_-J1v§() : void
      {
         var _loc1_:* = 0;
         var _loc2_:Matrix = null;
         if(this.§_-02x§.scaleX != this.§_-91O§ + this.size.x * Game.§_-x2P§ * 0.5)
         {
            while(this.§_-E2C§.numChildren > 0)
            {
               this.§_-E2C§.§_-n2T§(0);
            }
            _loc1_ = 14416639;
            _loc2_ = new Matrix();
            _loc2_.createGradientBox(2,2,0,-1,-1);
            this.§_-02x§.graphics.clear();
            this.§_-02x§.graphics.beginGradientFill(GradientType.RADIAL,[_loc1_,_loc1_,_loc1_,_loc1_],[0,0.1,0.5,0],[0,222,250,255],_loc2_,SpreadMethod.PAD,InterpolationMethod.RGB,0);
            this.§_-02x§.graphics.drawCircle(0,0,1);
            this.§_-02x§.graphics.endFill();
            this.§_-02x§.scaleX = this.§_-02x§.scaleY = this.§_-91O§ + this.size.x * Game.§_-x2P§ * 0.5;
            this.§_-E2a§.removeFromParent();
            this.§_-E2a§ = new §_-h2I§(this.§_-02x§);
            this.§_-E2C§.§_-83v§(this.§_-E2a§);
         }
         if(this.§_-H2w§)
         {
            if(this.§_-H2w§.view.maxRadius != this.§_-91O§ + this.size.x * Game.§_-x2P§ * 0.5 || this.§_-H2w§.view.rotatePerSecond != Math.abs(Math.min(180,this.§_-ea§ + this.§_-I4§) / 180 * Math.PI))
            {
               this.§_-H2w§.view.maxRadius = this.§_-91O§ + this.size.x * Game.§_-x2P§ * 0.5;
               this.§_-H2w§.view.rotatePerSecond = Math.abs(Math.min(180,this.§_-ea§ + this.§_-I4§) / 180 * Math.PI);
            }
         }
      }
   }
}


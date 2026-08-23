package §_-j2H§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-H1l§.§_-f28§;
   import §_-TK§.§_-aS§;
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
   import game.mainGame.§_-d7§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-Y1z§;
   import game.mainGame.entity.§_-e2t§;
   
   public class §_-k2G§ extends GameBody implements §_-41O§, §_-e2t§, §_-d7§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-731§:Number = 1.7976931348623157e+308;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.8,0.1,3,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private static const §_-o1y§:Number = 228 / Game.§_-12A§;
      
      private static const §_-D2R§:Number = 229 / Game.§_-12A§;
      
      private static const §_-B1r§:uint = 10 / Game.§_-12A§;
      
      private static const §_-t2E§:Array = [[0,0]];
      
      protected var §_-y1d§:b2Vec2 = new b2Vec2(§_-o1y§,§_-D2R§);
      
      protected var §_-22J§:Number = 10;
      
      protected var §_-52W§:Boolean = true;
      
      protected var view:§_-aS§;
      
      protected var §_-g1n§:§_-aS§ = new §_-aS§();
      
      protected var §_-61j§:§_-aS§ = new §_-aS§();
      
      protected var §_-p22§:int = 0;
      
      protected var §_-RI§:Boolean = true;
      
      protected var §_-O1m§:Boolean = true;
      
      protected var §_-Gz§:Number = 150;
      
      protected var §_-42B§:Boolean = true;
      
      protected var §_-2E§:Boolean = false;
      
      protected var §_-DC§:Number = 3;
      
      protected var §_-y1L§:Boolean;
      
      protected var controller:§_-f28§;
      
      protected var bitmapData:BitmapData = null;
      
      protected var skins:Array = null;
      
      private var §_-02Y§:int = 1;
      
      private var §_-x2J§:Shape = new Shape();
      
      private var §_-G1g§:§_-aS§ = new §_-aS§();
      
      private var §_-Tt§:§_-w10§ = §_-w10§.instance;
      
      private var §_-y2V§:§_-11u§;
      
      private var §_-iI§:§_-aS§ = new §_-aS§();
      
      public function §_-k2G§()
      {
         super();
         this.§_-iI§.§_-i18§();
         this.§_-J2J§(this.§_-iI§);
         this.§_-g1n§.touchable = false;
         §_-J2J§(this.§_-g1n§);
         this.§_-61j§.touchable = false;
         §_-J2J§(this.§_-61j§);
         this.view = new §_-aS§(new Planet1());
         §_-J2J§(this.view);
         this.§_-k2p§();
         this.touchable = false;
      }
      
      override public function set cacheAsBitmap(param1:Boolean) : void
      {
         this.view.cacheAsBitmap = param1;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         var _loc2_:b2CircleShape = new b2CircleShape(this.size.x * 0.5);
         this.fixture.density = this.§_-DC§;
         this.fixture.shape = _loc2_;
         this.fixture.friction = this.skin == 2 ? 0.1 : 0.8;
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(this.fixture);
         super.build(param1);
         this.§_-81M§();
         this.controller = new this.controllerClass();
         this.controller.body = this.body;
         this.controller.invSqr = this.§_-52W§;
         param1.AddController(this.controller);
         this.gravity = this.gravity;
         this.affectObjects = this.affectObjects;
         this.affectHero = this.affectHero;
         this.maxDistance = this.maxDistance;
         this.addExtGrav = this.addExtGrav;
         this.disableGlobalGravity = this.disableGlobalGravity;
         this.§_-y2V§ = this.§_-Tt§.§_-d1y§(§_-w10§.§_-i1k§);
         if(Boolean(this.§_-y2V§) && Boolean(this.§_-iI§))
         {
            this.§_-y2V§.start();
            this.§_-y2V§.view.§_-i18§();
            this.§_-y2V§.view.§_-L2Z§ = 0;
            this.§_-y2V§.view.§_-2F§ = 0;
            this.§_-iI§.getStarlingView().addChild(this.§_-y2V§.view);
            this.§_-k2p§();
         }
      }
      
      protected function get controllerClass() : Class
      {
         return §_-f28§;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([[this.size.x,this.size.y],this.gravity,this.invSqr,this.affectObjects,this.affectHero,this.maxDistance,this.addExtGrav,this.biDirectional,this.density,this.disableGlobalGravity,this.skin]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:int = GameBody.§_-W1F§(param1) ? 3 : 1;
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
         return this.§_-y1d§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = param1.y = Math.max(Math.min(Math.max(param1.x,param1.y),§_-731§),§_-B1r§);
         this.§_-y1d§ = param1;
         this.view.scaleXY(this.size.x / §_-o1y§);
         this.§_-k2p§();
         if(!this.controller)
         {
            return;
         }
         this.controller.maxDistance = this.§_-Gz§ / Game.§_-12A§ + this.size.x;
      }
      
      public function get pinPositions() : Vector.<b2Vec2>
      {
         return §_-Y1z§.§_-I2W§(§_-t2E§);
      }
      
      public function get gravity() : Number
      {
         return this.§_-22J§;
      }
      
      public function set gravity(param1:Number) : void
      {
         this.§_-22J§ = param1;
         this.§_-k2p§();
         if(!this.controller)
         {
            return;
         }
         this.controller.G = param1;
      }
      
      public function get invSqr() : Boolean
      {
         return this.§_-52W§;
      }
      
      public function set invSqr(param1:Boolean) : void
      {
         this.§_-52W§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.invSqr = param1;
      }
      
      public function get affectHero() : Boolean
      {
         return this.§_-RI§;
      }
      
      public function set affectHero(param1:Boolean) : void
      {
         this.§_-RI§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.affectHero = param1;
      }
      
      public function get affectObjects() : Boolean
      {
         return this.§_-O1m§;
      }
      
      public function set affectObjects(param1:Boolean) : void
      {
         this.§_-O1m§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.affectObjects = param1;
      }
      
      public function get maxDistance() : Number
      {
         return this.§_-Gz§;
      }
      
      public function set maxDistance(param1:Number) : void
      {
         this.§_-Gz§ = param1;
         this.§_-k2p§();
         if(!this.controller)
         {
            return;
         }
         this.controller.maxDistance = this.§_-Gz§ / Game.§_-12A§ + this.size.x * 0.5;
      }
      
      public function get addExtGrav() : Boolean
      {
         return this.§_-42B§;
      }
      
      public function set addExtGrav(param1:Boolean) : void
      {
         this.§_-42B§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.addExtGrav = param1;
      }
      
      public function get biDirectional() : Boolean
      {
         return this.§_-2E§;
      }
      
      public function set biDirectional(param1:Boolean) : void
      {
         this.§_-2E§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.biDirectional = param1;
      }
      
      public function get density() : Number
      {
         return this.§_-DC§;
      }
      
      public function set density(param1:Number) : void
      {
         this.§_-DC§ = param1;
      }
      
      public function get disableGlobalGravity() : Boolean
      {
         return this.§_-y1L§;
      }
      
      public function set disableGlobalGravity(param1:Boolean) : void
      {
         this.§_-y1L§ = param1;
         if(!this.controller)
         {
            return;
         }
         this.controller.disableGlobalGravity = param1;
      }
      
      public function get skin() : int
      {
         return this.§_-p22§;
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
         this.§_-p22§ = param1;
         var _loc2_:Array = this.view.filters;
         if(this.view.parentStarling)
         {
            this.removeChildStarling(this.view);
         }
         this.view = new §_-aS§(new this.skins[param1]());
         this.view.filters = _loc2_;
         §_-J2J§(this.view);
         this.size = this.size;
      }
      
      override public function dispose() : void
      {
         if(this.§_-y2V§)
         {
            this.§_-y2V§.stop();
            this.§_-y2V§.removeFromParent(true);
         }
         if(this.§_-iI§)
         {
            this.§_-iI§.getStarlingView().removeFromParent(true);
            this.§_-iI§.removeFromParent(true);
         }
         this.§_-g1n§.removeFromParent();
         this.§_-61j§.removeFromParent();
         this.view.removeFromParent();
         this.§_-y2V§ = null;
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
      
      public function §_-u2W§() : Number
      {
         return 0.5 * int(this.affectObjects);
      }
      
      protected function get fixture() : b2FixtureDef
      {
         return §_-ql§;
      }
      
      private function §_-81M§() : void
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
         §_-J2J§(new §_-aS§(_loc5_));
         this.rotation = _loc1_;
         this.ghost = _loc2_;
      }
      
      private function §_-k2p§() : void
      {
         var _loc1_:* = 0;
         var _loc2_:Matrix = null;
         if(this.§_-x2J§.scaleX != this.§_-Gz§ + this.size.x * Game.§_-12A§ * 0.5)
         {
            while(this.§_-g1n§.numChildren > 0)
            {
               this.§_-g1n§.§_-av§(0);
            }
            _loc1_ = 14416639;
            _loc2_ = new Matrix();
            _loc2_.createGradientBox(2,2,0,-1,-1);
            this.§_-x2J§.graphics.clear();
            this.§_-x2J§.graphics.beginGradientFill(GradientType.RADIAL,[_loc1_,_loc1_,_loc1_,_loc1_],[0,0.1,0.5,0],[0,222,250,255],_loc2_,SpreadMethod.PAD,InterpolationMethod.RGB,0);
            this.§_-x2J§.graphics.drawCircle(0,0,1);
            this.§_-x2J§.graphics.endFill();
            this.§_-x2J§.scaleX = this.§_-x2J§.scaleY = this.§_-Gz§ + this.size.x * Game.§_-12A§ * 0.5;
            this.§_-G1g§.removeFromParent();
            this.§_-G1g§ = new §_-aS§(this.§_-x2J§);
            this.§_-g1n§.§_-J2J§(this.§_-G1g§);
         }
         if(this.§_-y2V§)
         {
            if(this.§_-y2V§.view.maxRadius != this.§_-Gz§ + this.size.x * Game.§_-12A§ * 0.5 || this.§_-y2V§.view.rotatePerSecond != Math.abs(Math.min(180,this.§_-DC§ + this.§_-22J§) / 180 * Math.PI))
            {
               this.§_-y2V§.view.maxRadius = this.§_-Gz§ + this.size.x * Game.§_-12A§ * 0.5;
               this.§_-y2V§.view.rotatePerSecond = Math.abs(Math.min(180,this.§_-DC§ + this.§_-22J§) / 180 * Math.PI);
            }
         }
      }
   }
}


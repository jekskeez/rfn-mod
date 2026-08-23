package §_-M16§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.b2World;
   import §_-82h§.§_-U1w§;
   import §_-8Q§.GameBody;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.events.Event;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-L1d§;
   import game.mainGame.entity.§_-NA§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-Z2Z§ extends §_-aS§ implements §_-U1I§, §_-hQ§, §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-L1d§, §_-NA§
   {
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      protected var §_-F2U§:int = -1;
      
      protected var §_-j2K§:int = -1;
      
      protected var §_-cJ§:b2DistanceJointDef = null;
      
      protected var §_-D11§:§_-U1w§;
      
      public var §_-E1O§:Boolean = true;
      
      public var lifeTime:Number = 10;
      
      public var body:GameBody = null;
      
      public var hero:Hero = null;
      
      public var §_-dZ§:Boolean;
      
      public var damping:Number = 0.1;
      
      public var frequency:Number = 2;
      
      public var anchor0:§_-gy§ = null;
      
      public var anchor1:§_-gy§ = null;
      
      public function §_-Z2Z§()
      {
         super();
         this.§_-D11§ = new §_-U1w§();
         this.anchor0 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.anchor0.visible = false;
         this.anchor1 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.anchor1.visible = false;
      }
      
      override public function get rotation() : Number
      {
         return 0;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      public function §_-x26§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         §_-J2J§(this.§_-D11§);
         param1.add(this.anchor0);
         param1.add(this.anchor1);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-31.5 / Game.§_-12A§,0));
         this.anchor0.position = _loc2_;
         _loc2_.Add(new b2Vec2(63 / Game.§_-12A§,0));
         this.anchor1.position = _loc2_;
         this.update();
      }
      
      public function §_-A3v§(param1:GameMap) : void
      {
         param1.remove(this.anchor0);
         if(this.anchor0 != null)
         {
            this.anchor0.dispose();
         }
         param1.remove(this.anchor1);
         if(this.anchor1 != null)
         {
            this.anchor1.dispose();
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
      }
      
      public function build(param1:b2World) : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0,false);
         }
         if(this.§_-dZ§)
         {
            this.visible = false;
            this.dispose();
            return;
         }
         §_-J2J§(this.§_-D11§);
         this.update();
         this.world = param1;
         if(this.§_-cJ§ != null)
         {
            this.hero = (param1.userData as SquirrelGame).squirrels.get(this.§_-F2U§) as Hero;
            this.body = (param1.userData as SquirrelGame).map.getObject(this.§_-j2K§) as GameBody;
         }
         if(!this.hero || !this.body)
         {
            this.visible = false;
            return;
         }
         if(this.§_-cJ§ == null)
         {
            this.§_-cJ§ = new b2DistanceJointDef();
         }
         this.§_-cJ§.bodyA = this.body.body;
         if(Boolean(this.hero) && this.hero.§_-K13§)
         {
            this.hero.§_-n2I§(this.§_-cJ§,false);
            if(this.body != null)
            {
               this.body.addChild(this.anchor0);
            }
            if(this.hero != null)
            {
               this.hero.addChild(this.anchor1);
            }
            this.§_-cJ§.rope = true;
            this.§_-cJ§.length = 5;
            this.§_-cJ§.localAnchorA = new b2Vec2();
            this.§_-cJ§.localAnchorB = new b2Vec2();
            this.§_-cJ§.dampingRatio = this.damping;
            this.§_-cJ§.frequencyHz = this.frequency;
            this.§_-cJ§.collideConnected = true;
            this.joint = param1.CreateJoint(this.§_-cJ§);
            this.anchor0.position = this.§_-cJ§.localAnchorA;
            this.anchor1.position = this.§_-cJ§.localAnchorB;
            this.§_-D11§.§_-91w§(this.body,this.hero);
            this.§_-g2E§();
            return;
         }
         this.visible = false;
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.anchor1);
      }
      
      public function §_-m1Y§() : *
      {
         var _loc1_:Array = [];
         if(this.§_-dZ§)
         {
            return _loc1_;
         }
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         _loc1_.push([this.frequency,this.damping]);
         _loc1_.push([this.lifeTime,this.§_-E1O§]);
         _loc1_.push([this.hero ? this.hero.id : -1,this.body ? this.body.id : -1,this.§_-dZ§]);
         return _loc1_;
      }
      
      public function §_-o2I§(param1:*) : void
      {
         if(param1.length == 0)
         {
            this.§_-dZ§ = true;
            return;
         }
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.anchor1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.frequency = param1[3][0];
         this.damping = param1[3][1];
         this.lifeTime = param1[4][0];
         this.§_-E1O§ = Boolean(param1[4][1]);
         this.§_-cJ§ = new b2DistanceJointDef();
         this.§_-F2U§ = param1[5][0];
         this.§_-j2K§ = param1[5][1];
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.§_-dZ§)
         {
            this.visible = false;
            return;
         }
         this.rotation = 0;
         if(this.§_-E1O§)
         {
            this.lifeTime -= param1;
            this.§_-D11§.alpha = b2Math.Clamp(this.lifeTime,0,1);
            if(this.lifeTime <= 0)
            {
               this.§_-D1p§();
            }
         }
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         this.graphics.clear();
         if(this.parentStarling != null)
         {
            this.parentStarling.removeChildStarling(this);
         }
         if(this.anchor0 != null)
         {
            this.anchor0.dispose();
         }
         this.anchor0 = null;
         if(this.anchor1 != null)
         {
            this.anchor1.dispose();
         }
         this.anchor1 = null;
         if(this.joint != null)
         {
            this.world.DestroyJoint(this.joint);
         }
         this.joint = null;
         this.§_-D11§.visible = false;
         this.§_-D11§.dispose();
         this.§_-dZ§ = true;
         this.body = null;
         this.hero = null;
      }
      
      protected function §_-D1p§(param1:Event = null) : void
      {
         this.dispose();
      }
      
      protected function §_-g2E§() : void
      {
         this.body.addEventListener(Hero.§_-J2F§,this.§_-D1p§,false,0,true);
         this.hero.addEventListener(Hero.§_-J2F§,this.§_-D1p§,false,0,true);
      }
   }
}


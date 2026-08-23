package §_-Rn§
{
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import §_-f17§.§_-k1y§;
   import flash.events.Event;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-A2f§;
   import game.mainGame.entity.§_-s2K§;
   
   public class §_-A2Z§ extends §_-h2I§ implements §_-I2G§, §_-72o§, §_-63Q§, §_-03u§, §_-C2x§, §_-Tm§, §_-A2f§, §_-s2K§
   {
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      protected var §_-K1v§:int = -1;
      
      protected var §_-o5§:int = -1;
      
      protected var §_-f1B§:b2DistanceJointDef = null;
      
      protected var §_-21L§:§_-k1y§;
      
      public var §_-gq§:Boolean = true;
      
      public var lifeTime:Number = 10;
      
      public var body:GameBody = null;
      
      public var hero:Hero = null;
      
      public var §_-1N§:Boolean;
      
      public var damping:Number = 0.1;
      
      public var frequency:Number = 2;
      
      public var anchor0:§_-dv§ = null;
      
      public var anchor1:§_-dv§ = null;
      
      public function §_-A2Z§()
      {
         super();
         this.§_-21L§ = new §_-k1y§();
         this.anchor0 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
         this.anchor0.visible = false;
         this.anchor1 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
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
      
      public function §_-t2Q§(param1:GameMap) : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         §_-83v§(this.§_-21L§);
         param1.add(this.anchor0);
         param1.add(this.anchor1);
         if(this.anchor0.position.x != 0 || this.anchor0.position.y != 0)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.position.Copy();
         _loc2_.Add(new b2Vec2(-31.5 / Game.§_-x2P§,0));
         this.anchor0.position = _loc2_;
         _loc2_.Add(new b2Vec2(63 / Game.§_-x2P§,0));
         this.anchor1.position = _loc2_;
         this.update();
      }
      
      public function §_-u2q§(param1:GameMap) : void
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
      }
      
      public function build(param1:b2World) : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0,false);
         }
         if(this.§_-1N§)
         {
            this.visible = false;
            this.dispose();
            return;
         }
         §_-83v§(this.§_-21L§);
         this.update();
         this.world = param1;
         if(this.§_-f1B§ != null)
         {
            this.hero = (param1.userData as SquirrelGame).squirrels.get(this.§_-K1v§) as Hero;
            this.body = (param1.userData as SquirrelGame).map.getObject(this.§_-o5§) as GameBody;
         }
         if(!this.hero || !this.body)
         {
            this.visible = false;
            return;
         }
         if(this.§_-f1B§ == null)
         {
            this.§_-f1B§ = new b2DistanceJointDef();
         }
         this.§_-f1B§.bodyA = this.body.body;
         if(Boolean(this.hero) && this.hero.§_-k2W§)
         {
            this.hero.§_-oQ§(this.§_-f1B§,false);
            if(this.body != null)
            {
               this.body.addChild(this.anchor0);
            }
            if(this.hero != null)
            {
               this.hero.addChild(this.anchor1);
            }
            this.§_-f1B§.rope = true;
            this.§_-f1B§.length = 5;
            this.§_-f1B§.localAnchorA = new b2Vec2();
            this.§_-f1B§.localAnchorB = new b2Vec2();
            this.§_-f1B§.dampingRatio = this.damping;
            this.§_-f1B§.frequencyHz = this.frequency;
            this.§_-f1B§.collideConnected = true;
            this.joint = param1.CreateJoint(this.§_-f1B§);
            this.anchor0.position = this.§_-f1B§.localAnchorA;
            this.anchor1.position = this.§_-f1B§.localAnchorB;
            this.§_-21L§.§_-2i§(this.body,this.hero);
            this.§_-70§();
            return;
         }
         this.visible = false;
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.anchor1);
      }
      
      public function §_-A1X§() : *
      {
         var _loc1_:Array = [];
         if(this.§_-1N§)
         {
            return _loc1_;
         }
         _loc1_.push([this.position.x,this.position.y]);
         _loc1_.push([this.anchor0.position.x,this.anchor0.position.y]);
         _loc1_.push([this.anchor1.position.x,this.anchor1.position.y]);
         _loc1_.push([this.frequency,this.damping]);
         _loc1_.push([this.lifeTime,this.§_-gq§]);
         _loc1_.push([this.hero ? this.hero.id : -1,this.body ? this.body.id : -1,this.§_-1N§]);
         return _loc1_;
      }
      
      public function §_-41M§(param1:*) : void
      {
         if(param1.length == 0)
         {
            this.§_-1N§ = true;
            return;
         }
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.anchor0.position = new b2Vec2(param1[1][0],param1[1][1]);
         this.anchor1.position = new b2Vec2(param1[2][0],param1[2][1]);
         this.frequency = param1[3][0];
         this.damping = param1[3][1];
         this.lifeTime = param1[4][0];
         this.§_-gq§ = Boolean(param1[4][1]);
         this.§_-f1B§ = new b2DistanceJointDef();
         this.§_-K1v§ = param1[5][0];
         this.§_-o5§ = param1[5][1];
      }
      
      public function update(param1:Number = 0) : void
      {
         if(this.§_-1N§)
         {
            this.visible = false;
            return;
         }
         this.rotation = 0;
         if(this.§_-gq§)
         {
            this.lifeTime -= param1;
            this.§_-21L§.alpha = b2Math.Clamp(this.lifeTime,0,1);
            if(this.lifeTime <= 0)
            {
               this.§_-41K§();
            }
         }
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
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
         this.§_-21L§.visible = false;
         this.§_-21L§.dispose();
         this.§_-1N§ = true;
         this.body = null;
         this.hero = null;
      }
      
      protected function §_-41K§(param1:Event = null) : void
      {
         this.dispose();
      }
      
      protected function §_-70§() : void
      {
         this.body.addEventListener(Hero.§_-n2S§,this.§_-41K§,false,0,true);
         this.hero.addEventListener(Hero.§_-n2S§,this.§_-41K§,false,0,true);
      }
   }
}


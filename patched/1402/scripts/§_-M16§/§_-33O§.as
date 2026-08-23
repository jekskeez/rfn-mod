package §_-M16§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.b2World;
   import §_-82h§.§_-a1a§;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-l2u§.§_-t2k§;
   import flash.events.Event;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.entity.§_-L1d§;
   import game.mainGame.entity.§_-hQ§;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-33O§ extends §_-aS§ implements §_-U1I§, §_-hQ§, §_-xn§, §_-3l§, §_-l2r§, §_-F1c§, §_-L1d§
   {
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      protected var body0Id:int = -1;
      
      protected var body1Id:int = -1;
      
      protected var §_-cJ§:b2DistanceJointDef = null;
      
      protected var §_-D11§:§_-a1a§;
      
      public var §_-dZ§:Boolean;
      
      public var damping:Number = 0.1;
      
      public var frequency:Number = 1;
      
      public var anchor0:§_-gy§ = null;
      
      public var anchor1:§_-gy§ = null;
      
      public var hero0:Hero = null;
      
      public var hero1:Hero = null;
      
      public function §_-33O§()
      {
         super();
         this.anchor0 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.anchor0.visible = false;
         this.anchor1 = new §_-gy§(this,new §_-aS§(new PinUnlimited()));
         this.anchor1.visible = false;
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
      
      protected function get maxLength() : Number
      {
         return 5;
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
            this.hero1 = (param1.userData as SquirrelGame).squirrels.get(this.body0Id) as Hero;
            this.hero0 = (param1.userData as SquirrelGame).squirrels.get(this.body1Id) as Hero;
         }
         if(this.hero1 == null && this.hero0 == null)
         {
            this.visible = false;
            return;
         }
         if(this.§_-cJ§ == null)
         {
            this.§_-cJ§ = new b2DistanceJointDef();
         }
         if(Boolean(this.hero1) && this.hero1.§_-K13§)
         {
            this.hero1.§_-n2I§(this.§_-cJ§);
         }
         else
         {
            if(!param1.GetGroundBody())
            {
               this.visible = false;
               return;
            }
            this.§_-cJ§.bodyA = param1.GetGroundBody();
         }
         if(Boolean(this.hero0) && this.hero0.§_-K13§)
         {
            this.hero0.§_-n2I§(this.§_-cJ§,false);
         }
         else
         {
            if(!param1.GetGroundBody())
            {
               this.visible = false;
               return;
            }
            this.§_-cJ§.bodyB = param1.GetGroundBody();
         }
         this.§_-cJ§.rope = true;
         this.§_-cJ§.localAnchorA = new b2Vec2();
         this.§_-cJ§.localAnchorB = new b2Vec2();
         this.§_-cJ§.length = this.maxLength;
         this.§_-cJ§.dampingRatio = this.damping;
         this.§_-cJ§.frequencyHz = this.frequency;
         this.§_-cJ§.collideConnected = true;
         this.joint = param1.CreateJoint(this.§_-cJ§);
         this.anchor0.position = this.§_-cJ§.localAnchorA;
         this.anchor1.position = this.§_-cJ§.localAnchorB;
         if(this.hero1 != null)
         {
            this.hero1.addChild(this.anchor0);
         }
         if(this.hero0 != null)
         {
            this.hero0.addChild(this.anchor1);
         }
         this.§_-D11§.§_-n1D§(this.hero0,this.hero1);
         this.§_-g2E§();
      }
      
      public function §_-m1Y§() : *
      {
      }
      
      public function §_-o2I§(param1:*) : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         this.graphics.clear();
         this.hero0 = null;
         this.hero1 = null;
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
      }
      
      public function update(param1:Number = 0) : void
      {
      }
      
      public function §_-h1u§(param1:§_-t2k§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.anchor1);
      }
      
      protected function §_-D1p§(param1:Event = null) : void
      {
         this.dispose();
      }
      
      protected function §_-g2E§() : void
      {
      }
   }
}


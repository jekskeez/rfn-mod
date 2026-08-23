package §_-Rn§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2DistanceJointDef;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-uq§;
   import §_-Y22§.§_-C2x§;
   import §_-f17§.§_-G16§;
   import flash.events.Event;
   import game.mainGame.GameMap;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-72o§;
   import game.mainGame.entity.§_-A2f§;
   
   public class §_-q2A§ extends §_-h2I§ implements §_-I2G§, §_-72o§, §_-63Q§, §_-03u§, §_-C2x§, §_-Tm§, §_-A2f§
   {
      
      private var joint:b2Joint = null;
      
      private var world:b2World = null;
      
      protected var body0Id:int = -1;
      
      protected var body1Id:int = -1;
      
      protected var §_-f1B§:b2DistanceJointDef = null;
      
      protected var §_-21L§:§_-G16§;
      
      public var §_-1N§:Boolean;
      
      public var damping:Number = 0.1;
      
      public var frequency:Number = 1;
      
      public var anchor0:§_-dv§ = null;
      
      public var anchor1:§_-dv§ = null;
      
      public var hero0:Hero = null;
      
      public var hero1:Hero = null;
      
      public function §_-q2A§()
      {
         super();
         this.anchor0 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
         this.anchor0.visible = false;
         this.anchor1 = new §_-dv§(this,new §_-h2I§(new PinUnlimited()));
         this.anchor1.visible = false;
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
            this.hero1 = (param1.userData as SquirrelGame).squirrels.get(this.body0Id) as Hero;
            this.hero0 = (param1.userData as SquirrelGame).squirrels.get(this.body1Id) as Hero;
         }
         if(this.hero1 == null && this.hero0 == null)
         {
            this.visible = false;
            return;
         }
         if(this.§_-f1B§ == null)
         {
            this.§_-f1B§ = new b2DistanceJointDef();
         }
         if(Boolean(this.hero1) && this.hero1.§_-k2W§)
         {
            this.hero1.§_-oQ§(this.§_-f1B§);
         }
         else
         {
            if(!param1.GetGroundBody())
            {
               this.visible = false;
               return;
            }
            this.§_-f1B§.bodyA = param1.GetGroundBody();
         }
         if(Boolean(this.hero0) && this.hero0.§_-k2W§)
         {
            this.hero0.§_-oQ§(this.§_-f1B§,false);
         }
         else
         {
            if(!param1.GetGroundBody())
            {
               this.visible = false;
               return;
            }
            this.§_-f1B§.bodyB = param1.GetGroundBody();
         }
         this.§_-f1B§.rope = true;
         this.§_-f1B§.localAnchorA = new b2Vec2();
         this.§_-f1B§.localAnchorB = new b2Vec2();
         this.§_-f1B§.length = this.maxLength;
         this.§_-f1B§.dampingRatio = this.damping;
         this.§_-f1B§.frequencyHz = this.frequency;
         this.§_-f1B§.collideConnected = true;
         this.joint = param1.CreateJoint(this.§_-f1B§);
         this.anchor0.position = this.§_-f1B§.localAnchorA;
         this.anchor1.position = this.§_-f1B§.localAnchorB;
         if(this.hero1 != null)
         {
            this.hero1.addChild(this.anchor0);
         }
         if(this.hero0 != null)
         {
            this.hero0.addChild(this.anchor1);
         }
         this.§_-21L§.§_-j1i§(this.hero0,this.hero1);
         this.§_-70§();
      }
      
      public function §_-A1X§() : *
      {
      }
      
      public function §_-41M§(param1:*) : void
      {
      }
      
      public function dispose() : void
      {
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
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
         this.§_-21L§.visible = false;
         this.§_-21L§.dispose();
         this.§_-1N§ = true;
      }
      
      public function update(param1:Number = 0) : void
      {
      }
      
      public function §_-91N§(param1:§_-uq§) : void
      {
         param1.add(this.anchor0);
         param1.add(this.anchor1);
      }
      
      protected function §_-41K§(param1:Event = null) : void
      {
         this.dispose();
      }
      
      protected function §_-70§() : void
      {
      }
   }
}


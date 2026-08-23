package §_-b1B§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2Joint;
   import Box2D.Dynamics.Joints.b2RevoluteJointDef;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-42B§.TweenMax;
   import §_-83V§.GameBody;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-T1r§.§_-03i§;
   import §_-vK§.§_-QC§;
   import flash.events.Event;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-s2K§;
   import utils.§_-i2C§;
   
   public class §_-r12§ extends GameBody implements §_-s2K§, §_-Q2k§
   {
      
      private static const §_-A3F§:int = 2000;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var §_-Z2r§:Boolean = false;
      
      public var size:int = 40;
      
      public var §_-K1v§:int;
      
      private var view:§_-i2C§ = null;
      
      private var hero:Hero = null;
      
      private var joint:b2Joint = null;
      
      private var timer:Timer = new Timer(§_-A3F§ / 100,100);
      
      private var buff:§_-03i§ = null;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 2000;
      
      private var §_-01O§:Boolean = false;
      
      public function §_-r12§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         var _loc2_:b2PolygonShape = b2PolygonShape.AsOrientedBox(this.size / Game.§_-x2P§,this.size / Game.§_-x2P§,new b2Vec2());
         this.body.CreateFixture(new b2FixtureDef(_loc2_,null,0.1,0.1,1,this.categoriesBits,§_-FN§,0));
         super.build(param1);
         this.fixedRotation = true;
         this.hero = (param1.userData as SquirrelGame).squirrels.get(this.§_-K1v§);
         if(!this.hero || this.hero.isDead || this.hero.inHollow)
         {
            this.dispose();
            return;
         }
         this.§_-gZ§();
         if(!this.hero.isSelf)
         {
            return;
         }
         this.timer.reset();
         this.timer.start();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body)
         {
            if(!this.aging || this.§_-01O§)
            {
               return;
            }
            this.§_-C2o§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-b16§();
            }
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.§_-Z2r§,this.size,this.§_-K1v§,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-Z2r§ = Boolean(param1[1][0]);
         this.size = param1[1][1];
         this.§_-K1v§ = param1[1][2];
         this.aging = Boolean(param1[1][3]);
         this.lifeTime = param1[1][4];
      }
      
      override public function dispose() : void
      {
         this.§_-k2j§();
         this.timer.stop();
         super.dispose();
      }
      
      public function get aging() : Boolean
      {
         return this.§_-O1u§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-O1u§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-C2o§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-C2o§ = param1;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         TweenMax.to(this,0.1,{
            "alpha":0,
            "onComplete":this.death
         });
      }
      
      private function death() : void
      {
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      override protected function get categoriesBits() : uint
      {
         return this.§_-Z2r§ ? uint(§_-V§.§_-j1I§) : uint(§_-V§.§_-eh§);
      }
      
      private function §_-gZ§() : void
      {
         this.position = this.hero.position.Copy();
         this.angle = this.hero.angle;
         this.position = b2Math.AddVV(this.position,this.body.GetWorldVector(new b2Vec2(0,-1)));
         this.hero.§_-j2i§ = true;
         this.buff = new §_-03i§(new §_-QC§.perkData[§_-QC§.§_-t§]["buttonClass"](),0.7,0.5,"<b/>" + §_-QC§.perkData[§_-QC§.§_-t§]["name"] + "</b><br/>" + §_-QC§.§_-03v§(§_-QC§.§_-t§,§_-QC§.§_-l11§,null));
         this.hero.§_-Aj§(this.buff,this.timer);
         var _loc1_:FreezerView = new FreezerView();
         _loc1_.scaleX = _loc1_.scaleY = this.size * 2 / 40;
         this.view = new §_-i2C§(_loc1_);
         this.view.x = -_loc1_.width * 0.5 - 10;
         this.view.y = -_loc1_.height * 0.5 - 10;
         this.view.play();
         this.hero.addChild(this.view);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.bodyA = this.body;
         this.hero.§_-K18§(_loc2_,false);
         _loc2_.collideConnected = false;
         _loc2_.localAnchorA = new b2Vec2(0,1);
         _loc2_.localAnchorB = new b2Vec2();
         this.joint = this.body.GetWorld().CreateJoint(_loc2_);
         this.hero.addEventListener(SquirrelEvent.§_-z1B§,this.§_-M1f§);
         this.hero.addEventListener(SquirrelEvent.§_-S2i§,this.§_-M1f§);
         this.hero.addEventListener(HollowEvent.§_-63s§,this.§_-M1f§);
         this.hero.addEventListener(SquirrelEvent.§_-f2m§,this.§_-M1f§);
      }
      
      private function §_-k2j§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-M1f§);
         this.hero.removeEventListener(SquirrelEvent.§_-S2i§,this.§_-M1f§);
         this.hero.removeEventListener(HollowEvent.§_-63s§,this.§_-M1f§);
         this.hero.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-M1f§);
         this.hero.§_-j2i§ = false;
         if(this.buff)
         {
            this.hero.removeBuff(this.buff,this.timer);
         }
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.parent.removeChild(this.view);
         }
         if(this.view)
         {
            this.view.remove();
         }
         if(!this.body)
         {
            return;
         }
         if(this.joint)
         {
            this.body.GetWorld().DestroyJoint(this.joint);
         }
         this.joint = null;
         this.hero = null;
      }
      
      private function §_-M1f§(param1:Event) : void
      {
         this.§_-b16§();
      }
   }
}


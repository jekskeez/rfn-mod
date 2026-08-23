package §_-Q2§
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
   import §_-22D§.TweenMax;
   import §_-8Q§.GameBody;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-cm§.§_-Q2h§;
   import §_-o10§.§_-pl§;
   import flash.events.Event;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-NA§;
   import utils.§_-h25§;
   
   public class §_-F1R§ extends GameBody implements §_-NA§, §_-71b§
   {
      
      private static const §_-a1F§:int = 2000;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var §_-XO§:Boolean = false;
      
      public var size:int = 40;
      
      public var §_-F2U§:int;
      
      private var view:§_-h25§ = null;
      
      private var hero:Hero = null;
      
      private var joint:b2Joint = null;
      
      private var timer:Timer = new Timer(§_-a1F§ / 100,100);
      
      private var buff:§_-Q2h§ = null;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 2000;
      
      private var §_-C1L§:Boolean = false;
      
      public function §_-F1R§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         var _loc2_:b2PolygonShape = b2PolygonShape.AsOrientedBox(this.size / Game.§_-12A§,this.size / Game.§_-12A§,new b2Vec2());
         this.body.CreateFixture(new b2FixtureDef(_loc2_,null,0.1,0.1,1,this.categoriesBits,§_-C3c§,0));
         super.build(param1);
         this.fixedRotation = true;
         this.hero = (param1.userData as SquirrelGame).squirrels.get(this.§_-F2U§);
         if(!this.hero || this.hero.isDead || this.hero.inHollow)
         {
            this.dispose();
            return;
         }
         this.§_-g1c§();
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
            if(!this.aging || this.§_-C1L§)
            {
               return;
            }
            this.§_-Q26§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-th§();
            }
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.§_-XO§,this.size,this.§_-F2U§,this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-XO§ = Boolean(param1[1][0]);
         this.size = param1[1][1];
         this.§_-F2U§ = param1[1][2];
         this.aging = Boolean(param1[1][3]);
         this.lifeTime = param1[1][4];
      }
      
      override public function dispose() : void
      {
         this.§_-R12§();
         this.timer.stop();
         super.dispose();
      }
      
      public function get aging() : Boolean
      {
         return this.§_-837§;
      }
      
      public function set aging(param1:Boolean) : void
      {
         this.§_-837§ = param1;
      }
      
      public function get lifeTime() : Number
      {
         return this.§_-Q26§;
      }
      
      public function set lifeTime(param1:Number) : void
      {
         this.§_-Q26§ = param1;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
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
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      override protected function get categoriesBits() : uint
      {
         return this.§_-XO§ ? uint(§_-q2c§.§_-wI§) : uint(§_-q2c§.§_-o2l§);
      }
      
      private function §_-g1c§() : void
      {
         this.position = this.hero.position.Copy();
         this.angle = this.hero.angle;
         this.position = b2Math.AddVV(this.position,this.body.GetWorldVector(new b2Vec2(0,-1)));
         this.hero.§_-424§ = true;
         this.buff = new §_-Q2h§(new §_-pl§.perkData[§_-pl§.§_-43u§]["buttonClass"](),0.7,0.5,"<b/>" + §_-pl§.perkData[§_-pl§.§_-43u§]["name"] + "</b><br/>" + §_-pl§.§_-O2e§(§_-pl§.§_-43u§,§_-pl§.§_-61Z§,null));
         this.hero.§_-W1T§(this.buff,this.timer);
         var _loc1_:FreezerView = new FreezerView();
         _loc1_.scaleX = _loc1_.scaleY = this.size * 2 / 40;
         this.view = new §_-h25§(_loc1_);
         this.view.x = -_loc1_.width * 0.5 - 10;
         this.view.y = -_loc1_.height * 0.5 - 10;
         this.view.play();
         this.hero.addChild(this.view);
         var _loc2_:b2RevoluteJointDef = new b2RevoluteJointDef();
         _loc2_.bodyA = this.body;
         this.hero.§_-ZW§(_loc2_,false);
         _loc2_.collideConnected = false;
         _loc2_.localAnchorA = new b2Vec2(0,1);
         _loc2_.localAnchorB = new b2Vec2();
         this.joint = this.body.GetWorld().CreateJoint(_loc2_);
         this.hero.addEventListener(SquirrelEvent.§_-E25§,this.§_-U1D§);
         this.hero.addEventListener(SquirrelEvent.§_-Z2N§,this.§_-U1D§);
         this.hero.addEventListener(HollowEvent.§_-h1g§,this.§_-U1D§);
         this.hero.addEventListener(SquirrelEvent.§_-pZ§,this.§_-U1D§);
      }
      
      private function §_-R12§() : void
      {
         if(!this.hero)
         {
            return;
         }
         this.hero.removeEventListener(SquirrelEvent.§_-E25§,this.§_-U1D§);
         this.hero.removeEventListener(SquirrelEvent.§_-Z2N§,this.§_-U1D§);
         this.hero.removeEventListener(HollowEvent.§_-h1g§,this.§_-U1D§);
         this.hero.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-U1D§);
         this.hero.§_-424§ = false;
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
      
      private function §_-U1D§(param1:Event) : void
      {
         this.§_-th§();
      }
   }
}


package §_-I1q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-81P§.§_-61P§;
   import §_-81P§.§_-f1D§;
   import §_-8Q§.§_-f1e§;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-L1q§;
   import starling.core.Starling;
   
   public class §_-Bt§ extends §_-f1e§ implements §_-71b§, §_-L1q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(100 / Game.§_-12A§,5 / Game.§_-12A§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 7000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-Bt§()
      {
         super();
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
         if(this.§_-W1u§)
         {
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-m2z§);
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.§_-L2Z§ = this.x;
         this.§_-W1u§.view.§_-2F§ = this.y;
         this.§_-W1u§.start();
         Hero.self.getStarlingView().parent.addChild(this.§_-W1u§.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
      {
         return this.personalId != param1;
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
         if(this.body == null)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.§_-W1u§)
         {
            return;
         }
         var _loc1_:§_-f1D§ = new §_-f1D§(this.§_-W1u§.view,0.5,§_-61P§.§_-fq§);
         _loc1_.§_-02Q§("alpha",0);
         _loc1_.onComplete = this.§_-L1c§;
         Starling.§_-zb§.add(_loc1_);
      }
      
      private function §_-L1c§() : void
      {
         if(!this.§_-W1u§)
         {
            return;
         }
         this.§_-W1u§.stop();
         §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         this.§_-W1u§ = null;
      }
   }
}


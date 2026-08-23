package §_-u2r§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-83V§.§_-n1e§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-m1z§.§_-529§;
   import §_-m1z§.§_-Mk§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-FD§;
   import game.mainGame.entity.§_-Q2k§;
   import starling.core.Starling;
   
   public class §_-D2M§ extends §_-n1e§ implements §_-Q2k§, §_-FD§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(100 / Game.§_-x2P§,5 / Game.§_-x2P§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 7000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-D2M§()
      {
         super();
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
         if(this.§_-A38§)
         {
            §_-93d§.instance.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-R2n§);
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y;
         this.§_-A38§.start();
         Hero.self.getStarlingView().parent.addChild(this.§_-A38§.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
      }
      
      public function get personalId() : int
      {
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1;
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
         if(this.body == null)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(!this.§_-A38§)
         {
            return;
         }
         var _loc1_:§_-529§ = new §_-529§(this.§_-A38§.view,0.5,§_-Mk§.§_-Y16§);
         _loc1_.§_-42i§("alpha",0);
         _loc1_.onComplete = this.§_-ms§;
         Starling.§_-A3B§.add(_loc1_);
      }
      
      private function §_-ms§() : void
      {
         if(!this.§_-A38§)
         {
            return;
         }
         this.§_-A38§.stop();
         §_-93d§.instance.§_-ms§(this.§_-A38§);
         this.§_-A38§ = null;
      }
   }
}


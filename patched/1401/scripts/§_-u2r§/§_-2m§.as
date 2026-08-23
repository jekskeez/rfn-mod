package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   import game.mainGame.entity.§_-Q2k§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-2m§ extends GameBody implements §_-Q2k§
   {
      
      private static const §_-52X§:uint = 0;
      
      private static const §_-FN§:uint = 0;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(9 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 1000;
      
      private var §_-01O§:Boolean = false;
      
      private var view:§_-h2I§;
      
      private var §_-LT§:§_-d2d§;
      
      public function §_-2m§()
      {
         super();
         this.view = new §_-h2I§(new MinionPerkView());
         §_-83v§(this.view);
         this.§_-LT§ = new §_-d2d§(new MinionPerkExplodeView());
         this.§_-LT§.loop = false;
         this.§_-LT§.visible = false;
         §_-83v§(this.§_-LT§);
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
         this.§_-C2o§ -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(0,-100)));
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.lifeTime = param1[1][0];
         this.playerId = param1[1][1];
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
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         var _loc1_:Object = {};
         _loc1_["banana"] = {"id":this.id};
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc1_));
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc3_:§_-K2y§ = null;
         if(!("banana" in param1[1]) || param1[1]["banana"]["id"] != this.id)
         {
            return;
         }
         this.fixed = true;
         this.view.visible = false;
         this.§_-LT§.visible = true;
         this.§_-LT§.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.§_-LT§.play();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = new §_-K2y§();
            _loc3_.playerId = this.playerId;
            _loc3_.angle = this.body.GetAngle() + Math.PI * (_loc2_ - 2) / 4;
            _loc3_.position = this.position.Copy();
            _loc3_.§_-w2L§ = _loc2_;
            this.§_-H2D§.map.§_-nA§(_loc3_,true);
            _loc2_++;
         }
      }
      
      private function §_-r5§(param1:Event) : void
      {
         if(!this.§_-LT§)
         {
            return;
         }
         if(this.§_-LT§.currentFrame < this.§_-LT§.totalFrames - 1)
         {
            return;
         }
         this.§_-LT§.stop();
         this.§_-LT§.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.map))
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
   }
}


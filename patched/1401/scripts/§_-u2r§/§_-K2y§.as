package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-B1c§;
   import §_-83V§.GameBody;
   import §_-P2b§.§_-6L§;
   import §_-RI§.§_-h2I§;
   import game.mainGame.entity.§_-Q2k§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-K2y§ extends GameBody implements §_-Q2k§
   {
      
      private static const §_-52X§:uint = 0;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(1 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,10,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 5000;
      
      private var §_-01O§:Boolean = false;
      
      private var view:§_-h2I§;
      
      public var §_-w2L§:int = 0;
      
      public function §_-K2y§()
      {
         super();
         this.view = new §_-h2I§(new MinionPerkView());
         this.view.scaleX = this.view.scaleY = 0.7;
         §_-83v§(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:b2Vec2 = null;
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         if(this.§_-H2D§.squirrels.isSynchronizing)
         {
            this.§_-C2o§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-b16§();
            }
         }
         if(Hero.§_-6g§)
         {
            if(Hero.self.behaviourController.getState(§_-B1c§) != null)
            {
               return;
            }
            _loc2_ = Hero.self.position.Copy();
            _loc2_.Subtract(this.position);
            if(_loc2_.Length() < 4)
            {
               Connection.§_-Li§(§_-h2B§.§_-Q1g§,§_-6L§.§_-U2d§,this.playerId,this.§_-w2L§);
               this.view.visible = false;
               return;
            }
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(0,-20)));
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         if(param1[0] != §_-6L§.§_-U2d§)
         {
            return;
         }
         if(param1[2] != this.playerId)
         {
            return;
         }
         if(param1[3] != this.§_-w2L§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-H2D§.squirrels.get(param1[1]);
         if(_loc2_)
         {
            _loc2_.behaviourController.§_-gz§(new §_-B1c§(5));
         }
         this.§_-b16§();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.lifeTime,this.playerId,this.§_-w2L§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.lifeTime = param1[1][0];
         this.playerId = param1[1][1];
         this.§_-w2L§ = param1[1][2];
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
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-Q1g§]);
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-01O§ = true;
         this.§_-H2D§.map.§_-Qc§(this,true);
      }
   }
}


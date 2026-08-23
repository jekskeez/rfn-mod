package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-m2U§;
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-B1O§.§_-O1q§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-m1z§.§_-529§;
   import §_-m1z§.§_-Mk§;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-p19§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.core.Starling;
   
   public class §_-Rq§ extends GameBody implements §_-Q2k§, §_-22J§, §_-p19§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      public static const §_-m2H§:int = 100;
      
      public static const §_-A1T§:Number = 3;
      
      public static const §_-a2o§:Number = 0.4;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(1 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,1,0.5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var direction:Boolean = false;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 5000;
      
      private var §_-01O§:Boolean = false;
      
      private var §_-W2t§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-A38§:§_-f1G§;
      
      public function §_-Rq§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
         if(!this.§_-m1I§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.direction ? -§_-m2H§ : §_-m2H§,0)));
         }
         if(this.§_-A38§)
         {
            §_-93d§.instance.§_-ms§(this.§_-A38§);
         }
         this.§_-A38§ = §_-93d§.instance.§_-23j§(§_-93d§.§_-51a§);
         this.§_-A38§.view.visible = true;
         this.§_-A38§.view.§_-M2F§ = this.x;
         this.§_-A38§.view.§_-Cg§ = this.y;
         this.§_-A38§.view.§_-P26§ += this.direction ? Math.PI : 0;
         this.§_-A38§.start();
         Hero.self.getStarlingView().parent.addChild(this.§_-A38§.view);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.§_-Q2q§();
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         var _loc4_:Object = null;
         super.update(param1);
         if(Boolean(this.§_-A38§) && Boolean(this.§_-A38§.view))
         {
            this.§_-A38§.view.§_-M2F§ = this.x;
            this.§_-A38§.view.§_-Cg§ = this.y;
         }
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-01O§ || this.§_-W2t§)
         {
            return;
         }
         if(!this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         for each(_loc2_ in this.§_-H2D§.squirrels.players)
         {
            if(!(_loc2_.isDead || _loc2_.inHollow))
            {
               _loc3_ = _loc2_.position.Copy();
               _loc3_.Subtract(this.position);
               if(_loc3_.Length() <= 2)
               {
                  this.§_-W2t§ = true;
                  _loc4_ = {};
                  _loc4_["angel"] = {
                     "x":this.position.x,
                     "y":this.position.y,
                     "id":this.id
                  };
                  Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc4_));
                  return;
               }
            }
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-b16§();
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!("angel" in param1[1]) || param1[1]["angel"]["id"] != this.id)
         {
            return;
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.position = new b2Vec2(param1[1]["angel"]["x"],param1[1]["angel"]["y"]);
         this.§_-Q2q§();
      }
      
      private function §_-Q2q§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         for each(_loc1_ in this.§_-H2D§.squirrels.players)
         {
            if(!(_loc1_.isDead || _loc1_.inHollow))
            {
               _loc2_ = _loc1_.position.Copy();
               _loc2_.Subtract(this.position);
               if(_loc2_.Length() <= 6)
               {
                  if(_loc1_.id != this.playerId)
                  {
                     _loc1_.behaviourController.§_-gz§(new §_-m2U§(§_-A1T§,§_-a2o§));
                  }
               }
            }
         }
         this.§_-b16§();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId,this.direction]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
         this.direction = param1[1][3];
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
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-43D§;
      }
   }
}


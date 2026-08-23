package §_-I1q§
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
   import §_-81P§.§_-61P§;
   import §_-81P§.§_-f1D§;
   import §_-8Q§.GameBody;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-Cc§.§_-F1B§;
   import §_-j2H§.§_-D1T§;
   import §_-j4§.§_-Pn§;
   import game.mainGame.entity.§_-71b§;
   import game.mainGame.entity.§_-p2r§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.core.Starling;
   
   public class §_-02o§ extends GameBody implements §_-71b§, §_-Pn§, §_-p2r§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 1;
      
      public static const §_-qU§:int = 100;
      
      public static const §_-C2O§:int = 75;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(1 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var direction:Boolean = false;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 5000;
      
      private var §_-C1L§:Boolean = false;
      
      private var §_-gX§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      private var §_-W1u§:§_-11u§;
      
      public function §_-02o§()
      {
         super();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         this.body.SetBullet(true);
         super.build(param1);
         if(!this.§_-32u§)
         {
            this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(this.direction ? -§_-qU§ : §_-qU§,0)));
         }
         if(this.§_-W1u§)
         {
            §_-w10§.instance.§_-L1c§(this.§_-W1u§);
         }
         this.§_-W1u§ = §_-w10§.instance.§_-d1y§(§_-w10§.§_-r1R§);
         this.§_-W1u§.view.visible = true;
         this.§_-W1u§.view.§_-L2Z§ = this.x;
         this.§_-W1u§.view.§_-2F§ = this.y;
         this.§_-W1u§.view.§_-B1N§ += this.direction ? Math.PI : 0;
         this.§_-W1u§.start();
         Hero.self.getStarlingView().parent.addChild(this.§_-W1u§.view);
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         this.§_-O10§();
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
         if(Boolean(this.§_-W1u§) && Boolean(this.§_-W1u§.view))
         {
            this.§_-W1u§.view.§_-L2Z§ = this.x;
            this.§_-W1u§.view.§_-2F§ = this.y;
         }
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-C1L§ || this.§_-gX§)
         {
            return;
         }
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         for each(_loc2_ in this.§_-21H§.squirrels.players)
         {
            if(!(_loc2_.isDead || _loc2_.inHollow || _loc2_.id == this.playerId))
            {
               _loc3_ = _loc2_.position.Copy();
               _loc3_.Subtract(this.position);
               if(_loc3_.Length() <= 2)
               {
                  this.§_-gX§ = true;
                  _loc4_ = {};
                  _loc4_["stitch"] = {
                     "x":this.position.x,
                     "y":this.position.y,
                     "id":this.id
                  };
                  Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc4_));
                  return;
               }
            }
         }
         this.lifeTime -= param1 * 1000;
         if(this.lifeTime <= 0)
         {
            this.§_-th§();
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(!("stitch" in param1[1]) || param1[1]["stitch"]["id"] != this.id)
         {
            return;
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.position = new b2Vec2(param1[1]["stitch"]["x"],param1[1]["stitch"]["y"]);
         this.§_-O10§();
      }
      
      private function §_-O10§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:b2Vec2 = null;
         var _loc3_:b2Vec2 = null;
         for each(_loc1_ in this.§_-21H§.squirrels.players)
         {
            if(!(_loc1_.isDead || _loc1_.inHollow))
            {
               _loc2_ = _loc1_.position.Copy();
               _loc2_.Subtract(this.position);
               if(_loc2_.Length() <= 6)
               {
                  _loc3_ = new b2Vec2(§_-C2O§ * (_loc2_.x / _loc2_.Length()),§_-C2O§ * (_loc2_.y / _loc2_.Length()));
                  _loc1_.body.SetLinearVelocity(_loc3_);
                  if(_loc1_.id != this.playerId)
                  {
                     _loc1_.behaviourController.§_-W10§(new §_-F1B§(0.5));
                  }
               }
            }
         }
         this.§_-th§();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime,this.playerId,this.direction]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
         this.direction = param1[1][3];
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
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-12O§;
      }
   }
}


package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-R§;
   import §_-83V§.GameBody;
   import §_-RI§.§_-d2d§;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-a2g§ extends GameBody implements §_-Q2k§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      public static const §_-m2H§:int = 100;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(2 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,1,0.5,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var direction:Boolean = false;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 2000;
      
      private var §_-01O§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      protected var view:§_-d2d§;
      
      private var §_-v1H§:Array = [];
      
      public function §_-a2g§()
      {
         super();
         this.view = this.§_-61E§();
         this.view.visible = false;
         this.view.scaleX = this.view.scaleY = 0.5;
         §_-83v§(this.view);
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
         this.view.visible = true;
         this.view.loop = true;
         this.view.play();
         this.controller = new b2ConstantAccelController();
         this.controller.A = param1.GetGravity().GetNegative();
         this.controller.AddBody(this.body);
         param1.AddController(this.controller);
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:Hero = null;
         var _loc3_:b2Vec2 = null;
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-01O§)
         {
            return;
         }
         for each(_loc2_ in this.§_-H2D§.squirrels.players)
         {
            if(!(_loc2_.id == this.playerId || _loc2_.isDead || _loc2_.inHollow || this.§_-v1H§.indexOf(_loc2_.id) != -1))
            {
               _loc3_ = this.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() <= 4)
               {
                  this.§_-v1H§.push(_loc2_.id);
                  _loc2_.behaviourController.§_-gz§(new §_-R§(1));
               }
            }
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
         _loc1_.push([this.aging,this.lifeTime,this.playerId,this.§_-v1H§,this.direction]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
         this.§_-v1H§ = param1[1][3];
         this.direction = param1[1][4];
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
      
      protected function §_-61E§() : §_-d2d§
      {
         return new §_-d2d§(new CaptainAmericaPerkView());
      }
   }
}


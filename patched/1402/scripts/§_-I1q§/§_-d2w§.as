package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Controllers.b2ConstantAccelController;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-Cc§.§_-F1B§;
   import §_-TK§.§_-f1u§;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-d2w§ extends GameBody implements §_-71b§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 1;
      
      public static const §_-qU§:int = 100;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(2 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,1,0.5,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public var direction:Boolean = false;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 2000;
      
      private var §_-C1L§:Boolean = false;
      
      private var controller:b2ConstantAccelController;
      
      protected var view:§_-f1u§;
      
      private var §_-fN§:Array = [];
      
      public function §_-d2w§()
      {
         super();
         this.view = this.§_-U25§();
         this.view.visible = false;
         this.view.scaleX = this.view.scaleY = 0.5;
         §_-J2J§(this.view);
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
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         for each(_loc2_ in this.§_-21H§.squirrels.players)
         {
            if(!(_loc2_.id == this.playerId || _loc2_.isDead || _loc2_.inHollow || this.§_-fN§.indexOf(_loc2_.id) != -1))
            {
               _loc3_ = this.position.Copy();
               _loc3_.Subtract(_loc2_.position);
               if(_loc3_.Length() <= 4)
               {
                  this.§_-fN§.push(_loc2_.id);
                  _loc2_.behaviourController.§_-W10§(new §_-F1B§(1));
               }
            }
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
         _loc1_.push([this.aging,this.lifeTime,this.playerId,this.§_-fN§,this.direction]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
         this.playerId = param1[1][2];
         this.§_-fN§ = param1[1][3];
         this.direction = param1[1][4];
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
      
      protected function §_-U25§() : §_-f1u§
      {
         return new §_-f1u§(new CaptainAmericaPerkView());
      }
   }
}


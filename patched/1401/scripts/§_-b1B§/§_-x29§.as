package §_-b1B§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-637§.§_-627§;
   import §_-637§.§_-Ft§;
   import §_-83V§.§_-n1e§;
   import §_-RI§.§_-h2I§;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-Q2k§;
   
   public class §_-x29§ extends §_-n1e§ implements §_-Ft§, §_-627§, §_-Q2k§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-x1h§:uint = 50 / Game.§_-x2P§;
      
      private static const §_-D2U§:uint = 10 / Game.§_-x2P§;
      
      private static const §_-911§:Number = §_-D2U§ * 0.5;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-911§,§_-911§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,-1);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-Mf§:Cast = null;
      
      private var §_-O1j§:Boolean = false;
      
      private var §_-D19§:Boolean = false;
      
      private var §_-Ap§:b2Vec2 = null;
      
      private var §_-O1u§:Boolean = true;
      
      private var §_-C2o§:Number = 0;
      
      private var §_-01O§:Boolean = false;
      
      public var §_-Y2e§:Boolean = false;
      
      public function §_-x29§()
      {
         super();
         this.view = new §_-h2I§(new DrawingBlockImage());
         view.x = -§_-x1h§;
         view.y = -§_-x1h§;
         §_-83v§(view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
         this.fixed = true;
      }
      
      override public function dispose() : void
      {
         this.§_-Mf§ = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
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
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Ap§ = null;
         this.§_-Mf§.§_-k1K§ = 0;
         if(!Hero.self)
         {
            return;
         }
         this.§_-O1j§ = Hero.self.§_-o15§;
         this.§_-D19§ = true;
         Hero.self.§_-o15§ = this.§_-O1j§ || this.§_-Y2e§;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-k1K§ = NaN;
         if(!Hero.self)
         {
            return;
         }
         if(this.§_-D19§)
         {
            Hero.self.§_-o15§ = this.§_-O1j§;
            this.§_-D19§ = false;
         }
      }
      
      public function §_-W1U§() : Boolean
      {
         if(!Game.toggle)
         {
            if(this.§_-Ap§ == null)
            {
               this.§_-Ap§ = this.position.Copy();
               return true;
            }
            var _loc1_:b2Vec2 = b2Math.SubtractVV(this.position,this.§_-Ap§);
            if(_loc1_.Length() >= 2 / Game.§_-x2P§)
            {
               if(_loc1_.Length() >= 8 / Game.§_-x2P§)
               {
                  _loc1_.Normalize();
                  _loc1_.Multiply(8 / Game.§_-x2P§);
                  this.position = b2Math.AddVV(this.§_-Ap§,_loc1_);
                  this.§_-Ap§ = this.position.Copy();
                  return true;
               }
               this.§_-Ap§ = this.position.Copy();
               return true;
            }
            return false;
         }
         if(this.§_-Ap§ == null)
         {
            this.§_-Ap§ = this.position.Copy();
            return true;
         }
         _loc1_ = b2Math.SubtractVV(this.position,this.§_-Ap§);
         if(Math.abs(_loc1_.x) >= §_-D2U§ || Math.abs(_loc1_.y) >= §_-D2U§)
         {
            _loc1_.x = _loc1_.x >= §_-911§ ? §_-D2U§ : (_loc1_.x <= -§_-911§ ? -§_-D2U§ : 0);
            _loc1_.y = _loc1_.y >= §_-911§ ? §_-D2U§ : (_loc1_.y <= -§_-911§ ? -§_-D2U§ : 0);
            this.position = b2Math.AddVV(this.§_-Ap§,_loc1_);
            this.§_-Ap§ = this.position.Copy();
            return true;
         }
         return false;
      }
      
      public function clone() : *
      {
         var _loc1_:§_-x29§ = new §_-x29§();
         _loc1_.§_-41M§(this.§_-A1X§());
         return _loc1_;
      }
      
      private function §_-b16§() : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-H2D§.map.§_-Qc§(this,true);
         this.§_-01O§ = true;
      }
   }
}


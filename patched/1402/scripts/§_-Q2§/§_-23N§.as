package §_-Q2§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.§_-f1e§;
   import §_-F5§.§_-Y1d§;
   import §_-F5§.§_-k2D§;
   import §_-TK§.§_-aS§;
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-71b§;
   
   public class §_-23N§ extends §_-f1e§ implements §_-Y1d§, §_-k2D§, §_-71b§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-U1n§:uint = 50 / Game.§_-12A§;
      
      private static const §_-7s§:uint = 10 / Game.§_-12A§;
      
      private static const §_-mR§:Number = §_-7s§ * 0.5;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-mR§,§_-mR§,new b2Vec2());
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,-1);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-42p§:Cast = null;
      
      private var §_-O1g§:Boolean = false;
      
      private var §_-K1L§:Boolean = false;
      
      private var §_-BQ§:b2Vec2 = null;
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 0;
      
      private var §_-C1L§:Boolean = false;
      
      public var §_-F2O§:Boolean = false;
      
      public function §_-23N§()
      {
         super();
         this.view = new §_-aS§(new DrawingBlockImage());
         view.x = -§_-U1n§;
         view.y = -§_-U1n§;
         §_-J2J§(view);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.5);
         this.body.SetAngularDamping(1.5);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
         this.fixed = true;
      }
      
      override public function dispose() : void
      {
         this.§_-42p§ = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.aging,this.lifeTime]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.aging = Boolean(param1[1][0]);
         this.lifeTime = param1[1][1];
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
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-BQ§ = null;
         this.§_-42p§.§_-g1h§ = 0;
         if(!Hero.self)
         {
            return;
         }
         this.§_-O1g§ = Hero.self.§_-Uz§;
         this.§_-K1L§ = true;
         Hero.self.§_-Uz§ = this.§_-O1g§ || this.§_-F2O§;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-g1h§ = NaN;
         if(!Hero.self)
         {
            return;
         }
         if(this.§_-K1L§)
         {
            Hero.self.§_-Uz§ = this.§_-O1g§;
            this.§_-K1L§ = false;
         }
      }
      
      public function §_-q1G§() : Boolean
      {
         if(!Game.toggle)
         {
            if(this.§_-BQ§ == null)
            {
               this.§_-BQ§ = this.position.Copy();
               return true;
            }
            var _loc1_:b2Vec2 = b2Math.SubtractVV(this.position,this.§_-BQ§);
            if(_loc1_.Length() >= 2 / Game.§_-12A§)
            {
               if(_loc1_.Length() >= 8 / Game.§_-12A§)
               {
                  _loc1_.Normalize();
                  _loc1_.Multiply(8 / Game.§_-12A§);
                  this.position = b2Math.AddVV(this.§_-BQ§,_loc1_);
                  this.§_-BQ§ = this.position.Copy();
                  return true;
               }
               this.§_-BQ§ = this.position.Copy();
               return true;
            }
            return false;
         }
         if(this.§_-BQ§ == null)
         {
            this.§_-BQ§ = this.position.Copy();
            return true;
         }
         _loc1_ = b2Math.SubtractVV(this.position,this.§_-BQ§);
         if(Math.abs(_loc1_.x) >= §_-7s§ || Math.abs(_loc1_.y) >= §_-7s§)
         {
            _loc1_.x = _loc1_.x >= §_-mR§ ? §_-7s§ : (_loc1_.x <= -§_-mR§ ? -§_-7s§ : 0);
            _loc1_.y = _loc1_.y >= §_-mR§ ? §_-7s§ : (_loc1_.y <= -§_-mR§ ? -§_-7s§ : 0);
            this.position = b2Math.AddVV(this.§_-BQ§,_loc1_);
            this.§_-BQ§ = this.position.Copy();
            return true;
         }
         return false;
      }
      
      public function clone() : *
      {
         var _loc1_:§_-23N§ = new §_-23N§();
         _loc1_.§_-o2I§(this.§_-m1Y§());
         return _loc1_;
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-21H§.map.§_-Y1E§(this,true);
         this.§_-C1L§ = true;
      }
   }
}


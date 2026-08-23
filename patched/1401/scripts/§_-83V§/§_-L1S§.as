package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.§_-sd§;
   
   public class §_-L1S§ extends GameBody implements §_-sd§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsVector(points,0);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,3,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-E1M§:int = 0;
      
      private var view:§_-h2I§ = null;
      
      private var §_-01O§:Boolean = false;
      
      public var bubbleDelay:int = 3000;
      
      public var bubbleSpeed:Number = -10;
      
      public var bubbleTouchLimit:int = 3;
      
      public function §_-L1S§()
      {
         super();
         this.view = new §_-h2I§(new BubbleEmitterImg());
         this.view.§_-x2x§();
         this.view.y = -(this.view.height * 0.5);
         §_-83v§(this.view);
         this.fixed = true;
      }
      
      private static function get points() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-4.5,0));
         _loc1_.push(new b2Vec2(-3.5,-1.35));
         _loc1_.push(new b2Vec2(3.5,-1.35));
         _loc1_.push(new b2Vec2(4.5,0));
         return _loc1_;
      }
      
      override public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      override public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      override public function get rotation() : Number
      {
         return super.rotation;
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = 0;
      }
      
      override public function get angle() : Number
      {
         return 0;
      }
      
      override public function set angle(param1:Number) : void
      {
         this.rotation = 0;
      }
      
      public function get §_-9y§() : Boolean
      {
         return this.scaleX > 0;
      }
      
      public function set §_-9y§(param1:Boolean) : void
      {
         this.scaleX = Math.abs(this.scaleX) * (param1 ? 1 : -1);
      }
      
      override public function §_-A1X§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.§_-9y§,[this.§_-E1M§,this.bubbleDelay,this.bubbleSpeed,this.bubbleTouchLimit]];
      }
      
      override public function §_-41M§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         this.§_-9y§ = Boolean(param1[2]);
         var _loc2_:Array = param1[3];
         this.§_-E1M§ = _loc2_[0];
         this.bubbleDelay = _loc2_[1];
         this.bubbleSpeed = _loc2_[2];
         this.bubbleTouchLimit = _loc2_[3];
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         this.§_-01O§ = true;
         super.dispose();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.§_-01O§)
         {
            return;
         }
         this.§_-E1M§ += param1 * 1000;
         if(this.§_-E1M§ < this.bubbleDelay)
         {
            return;
         }
         this.§_-E1M§ = 0;
         this.§_-l1O§();
      }
      
      private function §_-l1O§() : void
      {
         if(!this.§_-H2D§ || !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:§_-44§ = new §_-44§();
         _loc1_.position = new b2Vec2(this.position.x,this.position.y - 7);
         _loc1_.velocity = this.bubbleSpeed;
         _loc1_.§_-oi§ = this.bubbleTouchLimit;
         this.§_-H2D§.map.§_-nA§(_loc1_,true);
      }
   }
}


package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import game.mainGame.§_-N1R§;
   import game.mainGame.§_-q2c§;
   
   public class §_-fp§ extends GameBody implements §_-N1R§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsVector(points,0);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,3,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-fP§:int = 0;
      
      private var view:§_-aS§ = null;
      
      private var §_-C1L§:Boolean = false;
      
      public var bubbleDelay:int = 3000;
      
      public var bubbleSpeed:Number = -10;
      
      public var bubbleTouchLimit:int = 3;
      
      public function §_-fp§()
      {
         super();
         this.view = new §_-aS§(new BubbleEmitterImg());
         this.view.§_-i18§();
         this.view.y = -(this.view.height * 0.5);
         §_-J2J§(this.view);
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
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      override public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
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
      
      public function get §_-N2C§() : Boolean
      {
         return this.scaleX > 0;
      }
      
      public function set §_-N2C§(param1:Boolean) : void
      {
         this.scaleX = Math.abs(this.scaleX) * (param1 ? 1 : -1);
      }
      
      override public function §_-m1Y§() : *
      {
         return [[this.position.x,this.position.y],this.angle,this.§_-N2C§,[this.§_-fP§,this.bubbleDelay,this.bubbleSpeed,this.bubbleTouchLimit]];
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         this.position = new b2Vec2(param1[0][0],param1[0][1]);
         this.angle = param1[1];
         this.§_-N2C§ = Boolean(param1[2]);
         var _loc2_:Array = param1[3];
         this.§_-fP§ = _loc2_[0];
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
         this.§_-C1L§ = true;
         super.dispose();
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
      }
      
      override public function update(param1:Number = 0) : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-fP§ += param1 * 1000;
         if(this.§_-fP§ < this.bubbleDelay)
         {
            return;
         }
         this.§_-fP§ = 0;
         this.§_-lG§();
      }
      
      private function §_-lG§() : void
      {
         if(!this.§_-21H§ || !this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc1_:§_-427§ = new §_-427§();
         _loc1_.position = new b2Vec2(this.position.x,this.position.y - 7);
         _loc1_.velocity = this.bubbleSpeed;
         _loc1_.§_-r3§ = this.bubbleTouchLimit;
         this.§_-21H§.map.§_-TP§(_loc1_,true);
      }
   }
}


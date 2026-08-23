package §_-u2r§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-83V§.GameBody;
   import §_-RI§.§_-h2I§;
   import game.mainGame.§_-V§;
   import game.mainGame.entity.§_-FD§;
   
   public class §_-k1Q§ extends GameBody implements §_-FD§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape();
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-h2I§;
      
      public var lifeTime:Number = 5;
      
      public var §_-QJ§:Boolean = false;
      
      public var size:Number = 5;
      
      public function §_-k1Q§(param1:b2Body = null)
      {
         super(param1);
         this.fixed = true;
      }
      
      public function get personalId() : int
      {
         if(!this.§_-QJ§)
         {
            return 0;
         }
         return this.playerId;
      }
      
      public function §_-d2E§(param1:int) : Boolean
      {
         return this.personalId != param1;
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body || this.lifeTime <= 0)
         {
            return;
         }
         this.lifeTime -= param1;
         if(this.lifeTime <= 0)
         {
            if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
            {
               return;
            }
            this.lifeTime = -1;
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         var _loc2_:b2CircleShape = new b2CircleShape(this.size * 0.5);
         §_-03A§.shape = _loc2_;
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         this.view = new §_-h2I§(new NewYearSnowManView());
         this.view.scaleXY(this.size / 5);
         this.view.y = 5 * this.size;
         §_-83v§(this.view);
         super.build(param1);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.playerId,this.§_-QJ§,this.lifeTime,this.size]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.playerId = param1[1][0];
         this.§_-QJ§ = Boolean(param1[1][1]);
         this.lifeTime = param1[1][2];
         this.size = param1[1][3];
      }
   }
}


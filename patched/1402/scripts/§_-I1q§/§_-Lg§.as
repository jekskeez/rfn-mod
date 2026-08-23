package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import game.mainGame.§_-q2c§;
   import game.mainGame.entity.§_-L1q§;
   
   public class §_-Lg§ extends GameBody implements §_-L1q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape();
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-aS§;
      
      public var lifeTime:Number = 5;
      
      public var §_-B2v§:Boolean = false;
      
      public var size:Number = 5;
      
      public function §_-Lg§(param1:b2Body = null)
      {
         super(param1);
         this.fixed = true;
      }
      
      public function get personalId() : int
      {
         if(!this.§_-B2v§)
         {
            return 0;
         }
         return this.playerId;
      }
      
      public function §_-sP§(param1:int) : Boolean
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
            if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
            {
               return;
            }
            this.lifeTime = -1;
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         var _loc2_:b2CircleShape = new b2CircleShape(this.size * 0.5);
         §_-ql§.shape = _loc2_;
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         this.view = new §_-aS§(new NewYearSnowManView());
         this.view.scaleXY(this.size / 5);
         this.view.y = 5 * this.size;
         §_-J2J§(this.view);
         super.build(param1);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.playerId,this.§_-B2v§,this.lifeTime,this.size]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.playerId = param1[1][0];
         this.§_-B2v§ = Boolean(param1[1][1]);
         this.lifeTime = param1[1][2];
         this.size = param1[1][3];
      }
   }
}


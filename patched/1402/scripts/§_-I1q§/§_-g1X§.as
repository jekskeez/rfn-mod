package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-Cc§.§_-b2h§;
   import §_-TK§.§_-aS§;
   import §_-j2E§.§_-A11§;
   import game.mainGame.entity.§_-71b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-g1X§ extends GameBody implements §_-71b§
   {
      
      private static const §_-53X§:uint = 0;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(1 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 5000;
      
      private var §_-C1L§:Boolean = false;
      
      private var view:§_-aS§;
      
      public var §_-N1C§:int = 0;
      
      public function §_-g1X§()
      {
         super();
         this.view = new §_-aS§(new MinionPerkView());
         this.view.scaleX = this.view.scaleY = 0.7;
         §_-J2J§(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc2_:b2Vec2 = null;
         super.update(param1);
         if(!this.body)
         {
            return;
         }
         if(!this.aging || this.§_-C1L§)
         {
            return;
         }
         if(this.§_-21H§.squirrels.isSynchronizing)
         {
            this.§_-Q26§ -= param1 * 1000;
            if(this.lifeTime <= 0)
            {
               this.§_-th§();
            }
         }
         if(Hero.§_-Cg§)
         {
            if(Hero.self.behaviourController.getState(§_-b2h§) != null)
            {
               return;
            }
            _loc2_ = Hero.self.position.Copy();
            _loc2_.Subtract(this.position);
            if(_loc2_.Length() < 4)
            {
               Connection.§_-e2T§(§_-u1O§.§_-u22§,§_-A11§.§_-g2h§,this.playerId,this.§_-N1C§);
               this.view.visible = false;
               return;
            }
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(0,-20)));
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-u22§]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         if(param1[0] != §_-A11§.§_-g2h§)
         {
            return;
         }
         if(param1[2] != this.playerId)
         {
            return;
         }
         if(param1[3] != this.§_-N1C§)
         {
            return;
         }
         var _loc2_:Hero = this.§_-21H§.squirrels.get(param1[1]);
         if(_loc2_)
         {
            _loc2_.behaviourController.§_-W10§(new §_-b2h§(5));
         }
         this.§_-th§();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.lifeTime,this.playerId,this.§_-N1C§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.lifeTime = param1[1][0];
         this.playerId = param1[1][1];
         this.§_-N1C§ = param1[1][2];
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
      
      override public function dispose() : void
      {
         super.dispose();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-u22§]);
      }
      
      private function §_-th§() : void
      {
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         this.§_-21H§.map.§_-Y1E§(this,true);
      }
   }
}


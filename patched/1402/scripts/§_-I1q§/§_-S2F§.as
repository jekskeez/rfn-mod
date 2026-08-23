package §_-I1q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import flash.events.Event;
   import game.mainGame.entity.§_-71b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-S2F§ extends GameBody implements §_-71b§
   {
      
      private static const §_-53X§:uint = 0;
      
      private static const §_-C3c§:uint = 0;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(9 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,10,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,true,b2Body.b2_dynamicBody);
      
      private var §_-837§:Boolean = true;
      
      private var §_-Q26§:Number = 1000;
      
      private var §_-C1L§:Boolean = false;
      
      private var view:§_-aS§;
      
      private var §_-S25§:§_-f1u§;
      
      public function §_-S2F§()
      {
         super();
         this.view = new §_-aS§(new MinionPerkView());
         §_-J2J§(this.view);
         this.§_-S25§ = new §_-f1u§(new MinionPerkExplodeView());
         this.§_-S25§.loop = false;
         this.§_-S25§.visible = false;
         §_-J2J§(this.§_-S25§);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(!this.body)
         {
            return;
         }
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
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetLinearDamping(1.1);
         this.body.SetAngularDamping(1.1);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§).SetUserData(this);
         super.build(param1);
         this.body.SetLinearVelocity(this.body.GetWorldVector(new b2Vec2(0,-100)));
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.lifeTime,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.lifeTime = param1[1][0];
         this.playerId = param1[1][1];
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
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         if(this.§_-C1L§)
         {
            return;
         }
         this.§_-C1L§ = true;
         var _loc1_:Object = {};
         _loc1_["banana"] = {"id":this.id};
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc1_));
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc3_:§_-g1X§ = null;
         if(!("banana" in param1[1]) || param1[1]["banana"]["id"] != this.id)
         {
            return;
         }
         this.fixed = true;
         this.view.visible = false;
         this.§_-S25§.visible = true;
         this.§_-S25§.addEventListener(Event.ENTER_FRAME,this.§_-52w§);
         this.§_-S25§.play();
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         if(!this.§_-21H§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            _loc3_ = new §_-g1X§();
            _loc3_.playerId = this.playerId;
            _loc3_.angle = this.body.GetAngle() + Math.PI * (_loc2_ - 2) / 4;
            _loc3_.position = this.position.Copy();
            _loc3_.§_-N1C§ = _loc2_;
            this.§_-21H§.map.§_-TP§(_loc3_,true);
            _loc2_++;
         }
      }
      
      private function §_-52w§(param1:Event) : void
      {
         if(!this.§_-S25§)
         {
            return;
         }
         if(this.§_-S25§.currentFrame < this.§_-S25§.totalFrames - 1)
         {
            return;
         }
         this.§_-S25§.stop();
         this.§_-S25§.removeEventListener(Event.ENTER_FRAME,this.§_-52w§);
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.map))
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
      }
   }
}


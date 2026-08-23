package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-43y§;
   import §_-l2u§.§_-62b§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-o2T§ extends GameBody
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-d2V§:Object = {};
      
      private var view:§_-aS§;
      
      public var §_-b1J§:§_-43y§;
      
      public function §_-o2T§()
      {
         super();
         this.view = new §_-aS§(new OlympicCoinView());
         §_-J2J§(this.view);
         this.fixed = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.visible = !this.§_-d2V§[Hero.§_-M1O§];
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push(this.§_-d2V§);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-d2V§ = "1" in param1 && param1[1] != null ? param1[1] : {};
      }
      
      override public function dispose() : void
      {
         if(this.§_-b1J§)
         {
            this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
            this.§_-b1J§ = null;
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(param1.state != DetectHeroEvent.BEGIN_CONTACT)
         {
            return;
         }
         var _loc2_:Hero = param1.hero;
         if(_loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         if(_loc2_ != Hero.self && _loc2_.id > 0 && _loc2_.id != Game.selfId)
         {
            return;
         }
         if(this.§_-d2V§[_loc2_.id])
         {
            return;
         }
         this.§_-d2V§[_loc2_.id] = true;
         this.visible = false;
         if(!_loc2_.isSelf)
         {
            return;
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-re§,_loc2_));
         if(this.§_-21H§ is §_-62b§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"olympicCoin":this.id}));
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("olympicCoin" in _loc2_) || _loc2_["olympicCoin"] != this.id)
         {
            return;
         }
         this.§_-d2V§[param1[0]] = true;
         this.visible = !this.§_-d2V§[Hero.§_-M1O§];
      }
   }
}


package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-8I§.SquirrelEvent;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-9F§ extends GameBody
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-H1e§:Object = {};
      
      private var view:§_-h2I§;
      
      public var §_-V2K§:§_-z12§;
      
      public function §_-9F§()
      {
         super();
         this.view = new §_-h2I§(new OlympicCoinView());
         §_-83v§(this.view);
         this.fixed = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.visible = !this.§_-H1e§[Hero.§_-74§];
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push(this.§_-H1e§);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-H1e§ = "1" in param1 && param1[1] != null ? param1[1] : {};
      }
      
      override public function dispose() : void
      {
         if(this.§_-V2K§)
         {
            this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
            this.§_-V2K§ = null;
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
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
         if(this.§_-H1e§[_loc2_.id])
         {
            return;
         }
         this.§_-H1e§[_loc2_.id] = true;
         this.visible = false;
         if(!_loc2_.isSelf)
         {
            return;
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-P2f§,_loc2_));
         if(this.§_-H2D§ is §_-A32§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"olympicCoin":this.id}));
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("olympicCoin" in _loc2_) || _loc2_["olympicCoin"] != this.id)
         {
            return;
         }
         this.§_-H1e§[param1[0]] = true;
         this.visible = !this.§_-H1e§[Hero.§_-74§];
      }
   }
}


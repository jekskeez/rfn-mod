package §_-B1O§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-83V§.GameBody;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-S2§.Perk;
   import §_-S2§.§_-a1T§;
   import game.mainGame.§_-V§;
   
   public class §_-92o§ extends GameBody
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsVector(points,0);
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,2,§_-V§.§_-tL§,§_-V§.§_-qV§,0,true);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,0.1,3,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var §_-V2K§:§_-z12§ = null;
      
      public function §_-92o§()
      {
         super();
         this.view = new §_-d2d§(new MagicFlowImg());
         this.view.stop();
         §_-83v§(this.view);
         this.fixed = true;
      }
      
      private static function get points() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-4.5,0));
         _loc1_.push(new b2Vec2(-3.6,-1.35));
         _loc1_.push(new b2Vec2(-3.5,-1.6));
         _loc1_.push(new b2Vec2(3.5,-1.6));
         _loc1_.push(new b2Vec2(3.6,-1.35));
         _loc1_.push(new b2Vec2(4.5,0));
         return _loc1_;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(FIXTURE_DEF1));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.view.play();
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeFromParent();
         }
         this.view = null;
         if(this.§_-V2K§)
         {
            this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         }
         this.§_-V2K§ = null;
         super.dispose();
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.inHollow || _loc2_.isDead || _loc2_.isHare || _loc2_.isDragon)
         {
            return;
         }
         if(param1.state != DetectHeroEvent.BEGIN_CONTACT)
         {
            return;
         }
         var _loc3_:§_-a1T§ = _loc2_.perkController;
         var _loc4_:* = int(_loc3_.perksClothes.length - 1);
         while(_loc4_ >= 0)
         {
            (_loc3_.perksClothes[_loc4_] as Perk).§_-3V§ = 0;
            _loc4_--;
         }
      }
   }
}


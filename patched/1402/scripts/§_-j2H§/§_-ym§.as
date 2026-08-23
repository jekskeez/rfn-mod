package §_-j2H§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-j4§.§_-43y§;
   import §_-n1h§.Perk;
   import §_-n1h§.§_-dC§;
   import game.mainGame.§_-q2c§;
   
   public class §_-ym§ extends GameBody
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const SHAPE1:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      private static const SHAPE2:b2PolygonShape = b2PolygonShape.AsVector(points,0);
      
      private static const FIXTURE_DEF1:b2FixtureDef = new b2FixtureDef(SHAPE1,null,0.8,0.1,2,§_-q2c§.§_-Wp§,§_-q2c§.§_-rT§,0,true);
      
      private static const FIXTURE_DEF2:b2FixtureDef = new b2FixtureDef(SHAPE2,null,0.8,0.1,3,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var §_-b1J§:§_-43y§ = null;
      
      public function §_-ym§()
      {
         super();
         this.view = new §_-f1u§(new MagicFlowImg());
         this.view.stop();
         §_-J2J§(this.view);
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
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(FIXTURE_DEF2);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(FIXTURE_DEF1));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
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
         if(this.§_-b1J§)
         {
            this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         }
         this.§_-b1J§ = null;
         super.dispose();
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
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
         var _loc3_:§_-dC§ = _loc2_.perkController;
         var _loc4_:* = int(_loc3_.perksClothes.length - 1);
         while(_loc4_ >= 0)
         {
            (_loc3_.perksClothes[_loc4_] as Perk).§_-G27§ = 0;
            _loc4_--;
         }
      }
   }
}


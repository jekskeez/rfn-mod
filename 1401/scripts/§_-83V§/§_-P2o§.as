package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-8I§.SquirrelEvent;
   import §_-B1O§.§_-O1q§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import game.mainGame.entity.§_-p19§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-23z§;
   
   public class §_-P2o§ extends GameBody implements §_-jP§, §_-p19§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-n11§:§_-d2d§ = new §_-d2d§(new AcornContactMovie());
      
      private var §_-s1D§:§_-23z§;
      
      private var §_-Tq§:Number = 1;
      
      private var fixture:b2Fixture = null;
      
      private var §_-Q2t§:Boolean = false;
      
      private var §_-u2F§:§_-d2d§ = new §_-d2d§(new AcornEffectLight());
      
      private var view:§_-h2I§ = new §_-h2I§(new AcornsVector());
      
      public var §_-V2K§:§_-z12§;
      
      public function §_-P2o§()
      {
         super();
         this.§_-u2F§.§_-o1b§ = 16;
         this.§_-u2F§.stop();
         this.§_-u2F§.loop = false;
         this.§_-u2F§.y = -10;
         this.§_-n11§.visible = false;
         this.§_-n11§.loop = false;
         this.§_-n11§.stop();
         this.§_-n11§.x = -11;
         this.§_-n11§.y = -48;
         this.§_-n11§.addEventListener(Event.COMPLETE,this.§_-W1p§);
         this.fixed = true;
         this.§_-s1D§ = new §_-23z§(this.view,new Point());
         §_-83v§(this.view);
         §_-83v§(this.§_-u2F§);
      }
      
      private static function §_-vO§(param1:Number) : b2FixtureDef
      {
         var _loc2_:b2PolygonShape = b2PolygonShape.AsOrientedBox(param1 * (46 * 0.5) / Game.§_-x2P§,param1 * (32 * 0.5) / Game.§_-x2P§,new b2Vec2(param1 * (25 * 0.5) / Game.§_-x2P§,param1 * (21 * 0.5) / Game.§_-x2P§));
         return new b2FixtureDef(_loc2_,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      }
      
      override public function get ghost() : Boolean
      {
         return false;
      }
      
      override public function set ghost(param1:Boolean) : void
      {
         if(param1)
         {
         }
         super.ghost = false;
      }
      
      override public function build(param1:b2World) : void
      {
         this.§_-u2F§.loop = true;
         this.§_-u2F§.play();
         this.body = param1.CreateBody(§_-E2n§);
         this.fixture = this.body.CreateFixture(§_-vO§(this.§_-Tq§));
         this.§_-V2K§ = new §_-z12§(this.fixture);
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         §_-83v§(this.§_-n11§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-n11§.removeEventListener(Event.COMPLETE,this.§_-W1p§);
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
         this.§_-s1D§ = null;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push(this.§_-Tq§);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if(!(1 in param1))
         {
            return;
         }
         this.scale = param1[1];
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-Tq§ == param1)
         {
            return;
         }
         this.§_-Tq§ = param1;
         this.scaleX = this.scaleY = param1;
         if(!this.body)
         {
            return;
         }
         if(this.fixture)
         {
            this.body.DestroyFixture(this.fixture);
         }
         this.fixture = this.body.CreateFixture(§_-vO§(param1));
         if(this.fixture)
         {
            this.§_-V2K§.§_-z2e§(this.fixture);
         }
      }
      
      public function §_-92T§(param1:DetectHeroEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.hero.id != Game.selfId && param1.hero.id > 0)
         {
            return;
         }
         if(param1.hero.§_-426§ || param1.hero.inHollow || param1.hero.isDead)
         {
            return;
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-62z§,param1.hero));
         param1.hero.§_-4j§(Hero.§_-517§);
         if(param1.§_-t18§)
         {
            this.§_-n11§.gotoAndPlay(0);
            this.§_-n11§.visible = true;
         }
         if(!param1.hero.isHare)
         {
            _loc2_ = Math.random() * §_-43Z§.§_-K1K§.length;
         }
         GameSounds.play(§_-43Z§.§_-K1K§[_loc2_]);
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-I2j§,§_-1s§.§_-L29§);
      }
      
      public function get showIcon() : Boolean
      {
         return this.alpha > 0;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-52X§;
      }
      
      private function §_-W1p§(param1:Event) : void
      {
         this.§_-n11§.stop();
         this.§_-n11§.visible = false;
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(this.alpha == 0)
         {
            return;
         }
         this.§_-92T§(param1);
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-43D§;
      }
   }
}


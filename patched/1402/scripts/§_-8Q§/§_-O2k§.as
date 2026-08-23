package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j2H§.§_-D1T§;
   import §_-j4§.§_-43y§;
   import flash.events.Event;
   import flash.geom.Point;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import game.mainGame.entity.§_-p2r§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-L14§;
   
   public class §_-O2k§ extends GameBody implements §_-jC§, §_-p2r§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-22B§:§_-f1u§ = new §_-f1u§(new AcornContactMovie());
      
      private var §_-r1V§:§_-L14§;
      
      private var §_-a12§:Number = 1;
      
      private var fixture:b2Fixture = null;
      
      private var §_-Z2g§:Boolean = false;
      
      private var §_-j1r§:§_-f1u§ = new §_-f1u§(new AcornEffectLight());
      
      private var view:§_-aS§ = new §_-aS§(new AcornsVector());
      
      public var §_-b1J§:§_-43y§;
      
      public function §_-O2k§()
      {
         super();
         this.§_-j1r§.§_-r2X§ = 16;
         this.§_-j1r§.stop();
         this.§_-j1r§.loop = false;
         this.§_-j1r§.y = -10;
         this.§_-22B§.visible = false;
         this.§_-22B§.loop = false;
         this.§_-22B§.stop();
         this.§_-22B§.x = -11;
         this.§_-22B§.y = -48;
         this.§_-22B§.addEventListener(Event.COMPLETE,this.§_-42L§);
         this.fixed = true;
         this.§_-r1V§ = new §_-L14§(this.view,new Point());
         §_-J2J§(this.view);
         §_-J2J§(this.§_-j1r§);
      }
      
      private static function §_-me§(param1:Number) : b2FixtureDef
      {
         var _loc2_:b2PolygonShape = b2PolygonShape.AsOrientedBox(param1 * (46 * 0.5) / Game.§_-12A§,param1 * (32 * 0.5) / Game.§_-12A§,new b2Vec2(param1 * (25 * 0.5) / Game.§_-12A§,param1 * (21 * 0.5) / Game.§_-12A§));
         return new b2FixtureDef(_loc2_,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
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
         this.§_-j1r§.loop = true;
         this.§_-j1r§.play();
         this.body = param1.CreateBody(§_-41z§);
         this.fixture = this.body.CreateFixture(§_-me§(this.§_-a12§));
         this.§_-b1J§ = new §_-43y§(this.fixture);
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         §_-J2J§(this.§_-22B§);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.§_-22B§.removeEventListener(Event.COMPLETE,this.§_-42L§);
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
         this.§_-r1V§ = null;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push(this.§_-a12§);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         if(!(1 in param1))
         {
            return;
         }
         this.scale = param1[1];
      }
      
      public function set scale(param1:Number) : void
      {
         if(this.§_-a12§ == param1)
         {
            return;
         }
         this.§_-a12§ = param1;
         this.scaleX = this.scaleY = param1;
         if(!this.body)
         {
            return;
         }
         if(this.fixture)
         {
            this.body.DestroyFixture(this.fixture);
         }
         this.fixture = this.body.CreateFixture(§_-me§(param1));
         if(this.fixture)
         {
            this.§_-b1J§.§_-41S§(this.fixture);
         }
      }
      
      public function §_-R2p§(param1:DetectHeroEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.hero.id != Game.selfId && param1.hero.id > 0)
         {
            return;
         }
         if(param1.hero.§_-62F§ || param1.hero.inHollow || param1.hero.isDead)
         {
            return;
         }
         dispatchEvent(new SquirrelEvent(SquirrelEvent.§_-Xw§,param1.hero));
         param1.hero.§_-I1u§(Hero.§_-43e§);
         if(param1.§_-B2l§)
         {
            this.§_-22B§.gotoAndPlay(0);
            this.§_-22B§.visible = true;
         }
         if(!param1.hero.isHare)
         {
            _loc2_ = Math.random() * §_-RH§.§_-R22§.length;
         }
         GameSounds.play(§_-RH§.§_-R22§[_loc2_]);
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-o1U§,§_-D1m§.§_-A36§);
      }
      
      public function get showIcon() : Boolean
      {
         return this.alpha > 0;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-53X§;
      }
      
      private function §_-42L§(param1:Event) : void
      {
         this.§_-22B§.stop();
         this.§_-22B§.visible = false;
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(this.alpha == 0)
         {
            return;
         }
         this.§_-R2p§(param1);
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-12O§;
      }
   }
}


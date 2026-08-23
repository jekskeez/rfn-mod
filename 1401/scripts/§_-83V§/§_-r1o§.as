package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-B1O§.§_-O1q§;
   import §_-P2b§.§_-6L§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import game.§_-s2v§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-1s§;
   import game.mainGame.§_-jP§;
   import game.mainGame.entity.§_-p19§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   
   public class §_-r1o§ extends GameBody implements §_-jP§, §_-s2K§, §_-p19§
   {
      
      protected static const §_-52X§:uint = 32;
      
      protected static const §_-FN§:uint = 8;
      
      protected static const §_-L1E§:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      protected static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      protected static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-Q2t§:Boolean = false;
      
      protected var §_-42S§:Boolean = false;
      
      protected var §_-c1p§:Boolean = false;
      
      protected var §_-U2q§:int = 0;
      
      protected var §_-rj§:int = -1;
      
      protected var §_-U1q§:§_-d2d§;
      
      public var §_-V2K§:§_-z12§;
      
      public var view:§_-s2v§ = null;
      
      public function §_-r1o§(param1:Class)
      {
         super();
         var _loc2_:DisplayObject = new param1();
         this.view = new §_-s2v§(_loc2_);
         this.view.x = -15;
         this.view.y = -15;
         this.view.scaleXY(0.5);
         §_-83v§(this.view);
         this.fixed = true;
         Connection.listen(this.§_-o2C§,this.packets);
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
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         if(this.§_-rj§ == -1)
         {
            this.view.play();
         }
         this.§_-H2D§ = param1.userData as SquirrelGame;
      }
      
      override public function dispose() : void
      {
         this.view.dispose();
         super.dispose();
         Connection.forget(this.§_-o2C§,this.packets);
         if(this.§_-U1q§)
         {
            this.§_-U1q§.removeEventListener(Event.CHANGE,this.§_-h2v§);
            this.§_-U1q§.removeFromParent();
         }
         this.§_-U1q§ = null;
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
      }
      
      public function get §_-c20§() : Boolean
      {
         return this.§_-c1p§;
      }
      
      public function set §_-c20§(param1:Boolean) : void
      {
         this.§_-c1p§ = param1;
         this.visible = !param1;
      }
      
      public function get sideIcon() : §_-h2I§
      {
         return new §_-1s§(§_-1s§.§_-72m§,§_-1s§.§_-b1P§);
      }
      
      public function get showIcon() : Boolean
      {
         return !this.§_-c20§;
      }
      
      public function get §_-Rc§() : Boolean
      {
         return this.§_-Q2t§;
      }
      
      public function set §_-Rc§(param1:Boolean) : void
      {
         this.§_-Q2t§ = param1;
      }
      
      public function get index() : int
      {
         return this.§_-U2q§;
      }
      
      public function §_-u7§(param1:int) : void
      {
         if(this.§_-rj§ == param1)
         {
            return;
         }
         this.§_-rj§ = param1;
         if(this.§_-U1q§)
         {
            this.§_-U1q§.removeEventListener(Event.COMPLETE,this.§_-h2v§);
            this.§_-U1q§.removeFromParent();
         }
         this.§_-U1q§ = null;
         if(this.§_-rj§ == -1)
         {
            this.view.play();
         }
         else
         {
            this.view.stop();
            this.§_-U1q§ = new §_-d2d§(new FreezerViewCreate());
            this.§_-U1q§.x = -32;
            this.§_-U1q§.y = -32;
            this.§_-U1q§.addEventListener(Event.COMPLETE,this.§_-h2v§);
            this.§_-U1q§.play();
            this.§_-U1q§.loop = false;
            §_-83v§(this.§_-U1q§);
            GameSounds.play("freeze_element");
         }
      }
      
      protected function §_-h2v§(param1:Event) : void
      {
         if(this.§_-rj§ == -1)
         {
            return;
         }
         if(this.§_-U1q§)
         {
            this.§_-U1q§.removeEventListener(Event.CHANGE,this.§_-h2v§);
            this.§_-U1q§.removeFromParent();
         }
         this.§_-U1q§ = new §_-d2d§(new FreezerView());
         this.§_-U1q§.x = -32;
         this.§_-U1q§.y = -32;
         this.§_-U1q§.play();
         this.§_-U1q§.loop = false;
         §_-83v§(this.§_-U1q§);
      }
      
      protected function get packets() : Array
      {
         return [];
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-52X§;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.§_-rj§]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.§_-u7§(param1[1][0]);
      }
      
      protected function §_-5d§(param1:DetectHeroEvent) : void
      {
      }
      
      protected function §_-o2C§(param1:§_-S2I§) : void
      {
      }
      
      protected function get available() : Boolean
      {
         if(this.§_-c20§)
         {
            return false;
         }
         var _loc1_:Boolean = Hero.self && Hero.self.perkController && Hero.self.perkController.§_-e4§(§_-6L§.§_-p23§) != -1 && Hero.self.isSquirrel;
         return this.§_-rj§ == -1 || _loc1_;
      }
      
      protected function §_-b16§() : void
      {
         if(Boolean(this.§_-H2D§) && Boolean(this.§_-H2D§.map))
         {
            this.§_-H2D§.map.§_-Qc§(this,true);
         }
         if(this.§_-U1q§)
         {
            this.§_-U1q§.removeFromParent();
         }
         this.§_-U1q§ = null;
      }
      
      public function get spotSize() : int
      {
         return §_-O1q§.§_-c2I§;
      }
   }
}


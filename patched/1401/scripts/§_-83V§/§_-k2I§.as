package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-41b§;
   import §_-637§.§_-Ft§;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-RI§.§_-v2j§;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   
   public class §_-k2I§ extends GameBody implements §_-Ft§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(20 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_staticBody);
      
      public var §_-V2K§:§_-41b§;
      
      public var game:SquirrelGame;
      
      private var view:§_-d2d§;
      
      private var arrow:§_-h2I§;
      
      private var §_-826§:§_-h2I§;
      
      private var §_-J2y§:Boolean = false;
      
      private var §_-Mf§:Cast = null;
      
      public function §_-k2I§(param1:DisplayObjectContainer, param2:DisplayObjectContainer = null, param3:DisplayObjectContainer = null)
      {
         super();
         this.view = new §_-d2d§(param1,false);
         this.view.loop = true;
         this.view.play();
         §_-83v§(this.view);
         this.arrow = new §_-h2I§(param2);
         this.view.§_-83v§(this.arrow);
         this.useDirection = false;
         this.§_-826§ = new §_-h2I§(param3);
         this.view.§_-83v§(this.§_-826§);
         if(param1)
         {
            param1.x = param1.width * 0.5;
            param1.y = param1.height * 0.5;
            param1.mouseEnabled = false;
            addChild(param1);
         }
         if(param2)
         {
            param2.x = param2.width * 0.5;
            param2.y = param2.height * 0.5;
            addChild(param2);
         }
         addEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
      }
      
      override public function set angle(param1:Number) : void
      {
         super.angle = param1;
         this.useDirection = this.useDirection;
      }
      
      override public function set rotation(param1:Number) : void
      {
         this.view.rotation = -param1;
         this.arrow.rotation = param1;
         super.rotation = param1;
         this.useDirection = this.useDirection;
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
         this.§_-d24§();
         this.game = param1.userData;
         this.body = param1.CreateBody(§_-E2n§);
         this.§_-V2K§ = new §_-41b§(this.body.CreateFixture(§_-03A§));
         this.useDirection = this.useDirection;
         super.build(param1);
         this.view.loop = true;
         this.view.play();
      }
      
      override public function dispose() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         super.dispose();
         this.§_-V2K§ = null;
      }
      
      public function get useDirection() : Boolean
      {
         return this.§_-J2y§;
      }
      
      public function set useDirection(param1:Boolean) : void
      {
         this.§_-J2y§ = param1;
         this.arrow.visible = param1;
         if(!this.§_-V2K§)
         {
            return;
         }
         this.§_-V2K§.direction = this.angle;
         this.§_-V2K§.useDirection = param1;
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-Mf§ = param1;
      }
      
      public function §_-11O§() : void
      {
         this.§_-Mf§.§_-R1d§ = Cast.§_-Cl§ * 0.5;
      }
      
      public function §_-b2q§() : void
      {
         if(!this.§_-Mf§)
         {
            return;
         }
         this.§_-Mf§.§_-R1d§ = NaN;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-52X§;
      }
      
      private function §_-d24§() : void
      {
         while(this.§_-j2Z§() > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      private function §_-wm§(param1:Event) : void
      {
         if(this.parentStarling != null || this.parent is §_-v2j§)
         {
            this.§_-d24§();
            this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-wm§);
         }
      }
   }
}


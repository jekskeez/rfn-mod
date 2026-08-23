package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-F5§.§_-Y1d§;
   import §_-TK§.§_-51g§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-j4§.§_-11k§;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import game.mainGame.Cast;
   import game.mainGame.SquirrelGame;
   
   public class §_-B1l§ extends GameBody implements §_-Y1d§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(20 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_staticBody);
      
      public var §_-b1J§:§_-11k§;
      
      public var game:SquirrelGame;
      
      private var view:§_-f1u§;
      
      private var arrow:§_-aS§;
      
      private var §_-03e§:§_-aS§;
      
      private var §_-m22§:Boolean = false;
      
      private var §_-42p§:Cast = null;
      
      public function §_-B1l§(param1:DisplayObjectContainer, param2:DisplayObjectContainer = null, param3:DisplayObjectContainer = null)
      {
         super();
         this.view = new §_-f1u§(param1,false);
         this.view.loop = true;
         this.view.play();
         §_-J2J§(this.view);
         this.arrow = new §_-aS§(param2);
         this.view.§_-J2J§(this.arrow);
         this.useDirection = false;
         this.§_-03e§ = new §_-aS§(param3);
         this.view.§_-J2J§(this.§_-03e§);
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
         addEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
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
         this.§_-A1O§();
         this.game = param1.userData;
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-11k§(this.body.CreateFixture(§_-ql§));
         this.useDirection = this.useDirection;
         super.build(param1);
         this.view.loop = true;
         this.view.play();
      }
      
      override public function dispose() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         super.dispose();
         this.§_-b1J§ = null;
      }
      
      public function get useDirection() : Boolean
      {
         return this.§_-m22§;
      }
      
      public function set useDirection(param1:Boolean) : void
      {
         this.§_-m22§ = param1;
         this.arrow.visible = param1;
         if(!this.§_-b1J§)
         {
            return;
         }
         this.§_-b1J§.direction = this.angle;
         this.§_-b1J§.useDirection = param1;
      }
      
      public function set cast(param1:Cast) : void
      {
         this.§_-42p§ = param1;
      }
      
      public function §_-52N§() : void
      {
         this.§_-42p§.§_-B3f§ = Cast.§_-LB§ * 0.5;
      }
      
      public function §_-23C§() : void
      {
         if(!this.§_-42p§)
         {
            return;
         }
         this.§_-42p§.§_-B3f§ = NaN;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-53X§;
      }
      
      private function §_-A1O§() : void
      {
         while(this.§_-Hr§() > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      private function §_-F10§(param1:Event) : void
      {
         if(this.parentStarling != null || this.parent is §_-51g§)
         {
            this.§_-A1O§();
            this.removeEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         }
      }
   }
}


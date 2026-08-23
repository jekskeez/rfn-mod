package §_-8Q§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-j2E§.§_-A11§;
   import §_-j2H§.§_-D1T§;
   import §_-j4§.§_-43y§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import game.§_-53v§;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-D1m§;
   import game.mainGame.§_-jC§;
   import game.mainGame.entity.§_-NA§;
   import game.mainGame.entity.§_-p2r§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   
   public class §_-r2M§ extends GameBody implements §_-jC§, §_-NA§, §_-p2r§
   {
      
      protected static const §_-53X§:uint = 32;
      
      protected static const §_-C3c§:uint = 8;
      
      protected static const §_-G2l§:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      protected static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      protected static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-Z2g§:Boolean = false;
      
      protected var §_-D27§:Boolean = false;
      
      protected var §_-n29§:Boolean = false;
      
      protected var §_-Km§:int = 0;
      
      protected var §_-g§:int = -1;
      
      protected var §_-n5§:§_-f1u§;
      
      public var §_-b1J§:§_-43y§;
      
      public var view:§_-53v§ = null;
      
      public function §_-r2M§(param1:Class)
      {
         super();
         var _loc2_:DisplayObject = new param1();
         this.view = new §_-53v§(_loc2_);
         this.view.x = -15;
         this.view.y = -15;
         this.view.scaleXY(0.5);
         §_-J2J§(this.view);
         this.fixed = true;
         Connection.listen(this.§_-x2f§,this.packets);
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
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         if(this.§_-g§ == -1)
         {
            this.view.play();
         }
         this.§_-21H§ = param1.userData as SquirrelGame;
      }
      
      override public function dispose() : void
      {
         this.view.dispose();
         super.dispose();
         Connection.forget(this.§_-x2f§,this.packets);
         if(this.§_-n5§)
         {
            this.§_-n5§.removeEventListener(Event.CHANGE,this.§_-f2X§);
            this.§_-n5§.removeFromParent();
         }
         this.§_-n5§ = null;
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      public function get §_-3D§() : Boolean
      {
         return this.§_-n29§;
      }
      
      public function set §_-3D§(param1:Boolean) : void
      {
         this.§_-n29§ = param1;
         this.visible = !param1;
      }
      
      public function get sideIcon() : §_-aS§
      {
         return new §_-D1m§(§_-D1m§.§_-s2n§,§_-D1m§.§_-E1n§);
      }
      
      public function get showIcon() : Boolean
      {
         return !this.§_-3D§;
      }
      
      public function get §_-P2t§() : Boolean
      {
         return this.§_-Z2g§;
      }
      
      public function set §_-P2t§(param1:Boolean) : void
      {
         this.§_-Z2g§ = param1;
      }
      
      public function get index() : int
      {
         return this.§_-Km§;
      }
      
      public function §_-25§(param1:int) : void
      {
         if(this.§_-g§ == param1)
         {
            return;
         }
         this.§_-g§ = param1;
         if(this.§_-n5§)
         {
            this.§_-n5§.removeEventListener(Event.COMPLETE,this.§_-f2X§);
            this.§_-n5§.removeFromParent();
         }
         this.§_-n5§ = null;
         if(this.§_-g§ == -1)
         {
            this.view.play();
         }
         else
         {
            this.view.stop();
            this.§_-n5§ = new §_-f1u§(new FreezerViewCreate());
            this.§_-n5§.x = -32;
            this.§_-n5§.y = -32;
            this.§_-n5§.addEventListener(Event.COMPLETE,this.§_-f2X§);
            this.§_-n5§.play();
            this.§_-n5§.loop = false;
            §_-J2J§(this.§_-n5§);
            GameSounds.play("freeze_element");
         }
      }
      
      protected function §_-f2X§(param1:Event) : void
      {
         if(this.§_-g§ == -1)
         {
            return;
         }
         if(this.§_-n5§)
         {
            this.§_-n5§.removeEventListener(Event.CHANGE,this.§_-f2X§);
            this.§_-n5§.removeFromParent();
         }
         this.§_-n5§ = new §_-f1u§(new FreezerView());
         this.§_-n5§.x = -32;
         this.§_-n5§.y = -32;
         this.§_-n5§.play();
         this.§_-n5§.loop = false;
         §_-J2J§(this.§_-n5§);
      }
      
      protected function get packets() : Array
      {
         return [];
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-53X§;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.§_-g§]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.§_-25§(param1[1][0]);
      }
      
      protected function §_-M2L§(param1:DetectHeroEvent) : void
      {
      }
      
      protected function §_-x2f§(param1:§_-s2l§) : void
      {
      }
      
      protected function get available() : Boolean
      {
         if(this.§_-3D§)
         {
            return false;
         }
         var _loc1_:Boolean = Hero.self && Hero.self.perkController && Hero.self.perkController.§_-S1Q§(§_-A11§.§_-Se§) != -1 && Hero.self.isSquirrel;
         return this.§_-g§ == -1 || _loc1_;
      }
      
      protected function §_-th§() : void
      {
         if(Boolean(this.§_-21H§) && Boolean(this.§_-21H§.map))
         {
            this.§_-21H§.map.§_-Y1E§(this,true);
         }
         if(this.§_-n5§)
         {
            this.§_-n5§.removeFromParent();
         }
         this.§_-n5§ = null;
      }
      
      public function get spotSize() : int
      {
         return §_-D1T§.§_-b2q§;
      }
   }
}


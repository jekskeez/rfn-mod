package §_-d11§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-83V§.GameBody;
   import §_-A2x§.GameMapNet;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-T1r§.§_-b1U§;
   import §_-T1r§.§_-i1L§;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import game.§_-s2v§;
   import game.mainGame.§_-1s§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   import utils.§_-23z§;
   
   public class §_-72C§ extends GameBody
   {
      
      private static const §_-S12§:Number = 5;
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-L1E§:b2CircleShape = new b2CircleShape(15 / Game.§_-x2P§);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0,false);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-n11§:§_-d2d§;
      
      private var §_-s1D§:§_-23z§;
      
      public var §_-V2K§:§_-z12§;
      
      protected var view:§_-s2v§ = null;
      
      private var §_-39§:Boolean = false;
      
      private var §_-03V§:Number = 0;
      
      public function §_-72C§()
      {
         super();
         this.§_-b2H§();
         this.§_-n11§ = new §_-d2d§(new PoiseContactMovie());
         this.§_-n11§.loop = false;
         this.§_-n11§.visible = false;
         this.§_-n11§.stop();
         this.§_-n11§.x = -21;
         this.§_-n11§.y = -48;
         this.§_-n11§.addEventListener(Event.COMPLETE,this.§_-42b§);
         this.fixed = true;
         this.§_-s1D§ = new §_-23z§(this.view,new Point());
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function get alpha() : Number
      {
         return this.view.alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.view.alpha = param1;
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
         this.view.play();
         §_-83v§(this.§_-n11§);
         §_-83v§(this.view);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.view.stop();
         this.§_-n11§.removeEventListener(Event.COMPLETE,this.§_-42b§);
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.view.dispose();
         this.§_-03V§ = 0;
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
         this.§_-s1D§ = null;
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-03V§ > 0)
         {
            this.§_-03V§ -= param1;
            if(this.§_-03V§ <= 0)
            {
               this.§_-a1t§();
            }
         }
      }
      
      public function §_-X1p§(param1:DetectHeroEvent) : void
      {
         if(!param1.hero.isSelf)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.isHare || param1.hero.isDragon)
         {
            return;
         }
         if(this.§_-39§ || !this.§_-33j§(param1))
         {
            return;
         }
         this.§_-n11§.§_-01w§(0,35);
         this.§_-n11§.visible = true;
         GameSounds.play("battle_item");
         if(!(param1.hero.game is §_-b1U§))
         {
            this.§_-P6§(param1);
            return;
         }
         this.§_-Dm§(param1);
         this.§_-39§ = true;
      }
      
      public function get sideIcon() : DisplayObject
      {
         return new §_-1s§(§_-1s§.§_-I2j§,§_-1s§.§_-93g§);
      }
      
      public function get showIcon() : Boolean
      {
         return this.alpha > 0;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-52X§;
      }
      
      protected function §_-b2H§() : void
      {
      }
      
      protected function §_-33j§(param1:DetectHeroEvent) : Boolean
      {
         return true;
      }
      
      protected function §_-O1L§(param1:DetectHeroEvent) : void
      {
      }
      
      protected function §_-P6§(param1:DetectHeroEvent) : void
      {
         this.§_-22§(false);
         this.§_-39§ = false;
         if(param1.hero is §_-i1L§)
         {
            this.§_-91c§(param1.hero as §_-i1L§);
         }
         else
         {
            this.§_-O1L§(param1);
         }
      }
      
      protected function §_-91c§(param1:§_-i1L§) : void
      {
      }
      
      protected function §_-Dm§(param1:DetectHeroEvent) : void
      {
      }
      
      protected function §_-N24§() : void
      {
      }
      
      protected function §_-7P§(param1:Object) : Array
      {
         return param1 as Array;
      }
      
      protected function §_-Q1b§(param1:Object) : Array
      {
         return param1 as Array;
      }
      
      protected function get respawnTime() : Number
      {
         return §_-S12§;
      }
      
      private function §_-42b§(param1:Event) : void
      {
         this.§_-n11§.stop();
         this.§_-n11§.visible = false;
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         if(this.view.alpha == 0)
         {
            return;
         }
         this.§_-X1p§(param1);
      }
      
      private function §_-a1t§() : void
      {
         var _loc1_:Boolean = Boolean(this.§_-H2D§) && this.§_-H2D§.map is GameMapNet && (this.§_-H2D§.map as GameMapNet).§_-dJ§.§_-G1U§;
         if(_loc1_)
         {
            this.§_-N24§();
         }
         if(_loc1_ || !(this.§_-H2D§ is §_-b1U§))
         {
            this.§_-22§(true);
         }
      }
      
      private function §_-22§(param1:Boolean) : void
      {
         if(param1)
         {
            this.alpha = 1;
            if(this.§_-V2K§.§_-61I§.length != 0)
            {
               this.§_-V2K§.dispatchEvent(new DetectHeroEvent(this.§_-V2K§.§_-61I§[0]));
            }
            this.§_-03V§ = 0;
            return;
         }
         this.alpha = 0;
         this.§_-03V§ = this.respawnTime;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc3_:§_-i1L§ = null;
         var _loc2_:Object = param1[1];
         if(this.§_-7P§(_loc2_) != null)
         {
            if(this.§_-7P§(_loc2_)[0] != this.id)
            {
               return;
            }
            if(this.alpha == 0)
            {
               this.§_-39§ = false;
               return;
            }
            this.§_-22§(false);
            this.§_-39§ = false;
            _loc3_ = this.§_-H2D§.squirrels.get(this.§_-7P§(_loc2_)[1]) as §_-i1L§;
            if(!Hero.self)
            {
               return;
            }
            this.§_-91c§(_loc3_);
         }
         if(this.§_-Q1b§(_loc2_) != null)
         {
            if(this.§_-Q1b§(_loc2_)[0] != this.id)
            {
               return;
            }
            this.§_-22§(true);
         }
      }
   }
}


package §_-g16§
{
   import Box2D.Collision.Shapes.b2CircleShape;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-cm§.§_-V1t§;
   import §_-cm§.§_-cV§;
   import §_-j4§.§_-43y§;
   import §_-td§.GameMapNet;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import game.§_-53v§;
   import game.mainGame.§_-D1m§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   import utils.§_-L14§;
   
   public class §_-XJ§ extends GameBody
   {
      
      private static const §_-t5§:Number = 5;
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-G2l§:b2CircleShape = new b2CircleShape(15 / Game.§_-12A§);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.8,0.1,1,§_-53X§,§_-C3c§,0,false);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var §_-22B§:§_-f1u§;
      
      private var §_-r1V§:§_-L14§;
      
      public var §_-b1J§:§_-43y§;
      
      protected var view:§_-53v§ = null;
      
      private var §_-h12§:Boolean = false;
      
      private var §_-w2X§:Number = 0;
      
      public function §_-XJ§()
      {
         super();
         this.§_-AD§();
         this.§_-22B§ = new §_-f1u§(new PoiseContactMovie());
         this.§_-22B§.loop = false;
         this.§_-22B§.visible = false;
         this.§_-22B§.stop();
         this.§_-22B§.x = -21;
         this.§_-22B§.y = -48;
         this.§_-22B§.addEventListener(Event.COMPLETE,this.§_-y2f§);
         this.fixed = true;
         this.§_-r1V§ = new §_-L14§(this.view,new Point());
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
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
         this.body = param1.CreateBody(§_-41z§);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.view.play();
         §_-J2J§(this.§_-22B§);
         §_-J2J§(this.view);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.view.stop();
         this.§_-22B§.removeEventListener(Event.COMPLETE,this.§_-y2f§);
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.view.dispose();
         this.§_-w2X§ = 0;
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
         this.§_-r1V§ = null;
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.§_-w2X§ > 0)
         {
            this.§_-w2X§ -= param1;
            if(this.§_-w2X§ <= 0)
            {
               this.§_-B35§();
            }
         }
      }
      
      public function §_-a13§(param1:DetectHeroEvent) : void
      {
         if(!param1.hero.isSelf)
         {
            return;
         }
         if(param1.hero.isDead || param1.hero.isHare || param1.hero.isDragon)
         {
            return;
         }
         if(this.§_-h12§ || !this.§_-x2V§(param1))
         {
            return;
         }
         this.§_-22B§.§_-W2R§(0,35);
         this.§_-22B§.visible = true;
         GameSounds.play("battle_item");
         if(!(param1.hero.game is §_-cV§))
         {
            this.§_-T2N§(param1);
            return;
         }
         this.§_-91m§(param1);
         this.§_-h12§ = true;
      }
      
      public function get sideIcon() : DisplayObject
      {
         return new §_-D1m§(§_-D1m§.§_-o1U§,§_-D1m§.§_-b2Z§);
      }
      
      public function get showIcon() : Boolean
      {
         return this.alpha > 0;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-53X§;
      }
      
      protected function §_-AD§() : void
      {
      }
      
      protected function §_-x2V§(param1:DetectHeroEvent) : Boolean
      {
         return true;
      }
      
      protected function §_-q1Y§(param1:DetectHeroEvent) : void
      {
      }
      
      protected function §_-T2N§(param1:DetectHeroEvent) : void
      {
         this.§_-e1s§(false);
         this.§_-h12§ = false;
         if(param1.hero is §_-V1t§)
         {
            this.§_-E6§(param1.hero as §_-V1t§);
         }
         else
         {
            this.§_-q1Y§(param1);
         }
      }
      
      protected function §_-E6§(param1:§_-V1t§) : void
      {
      }
      
      protected function §_-91m§(param1:DetectHeroEvent) : void
      {
      }
      
      protected function §_-92O§() : void
      {
      }
      
      protected function §_-Gu§(param1:Object) : Array
      {
         return param1 as Array;
      }
      
      protected function §_-p2D§(param1:Object) : Array
      {
         return param1 as Array;
      }
      
      protected function get respawnTime() : Number
      {
         return §_-t5§;
      }
      
      private function §_-y2f§(param1:Event) : void
      {
         this.§_-22B§.stop();
         this.§_-22B§.visible = false;
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         if(this.view.alpha == 0)
         {
            return;
         }
         this.§_-a13§(param1);
      }
      
      private function §_-B35§() : void
      {
         var _loc1_:Boolean = Boolean(this.§_-21H§) && this.§_-21H§.map is GameMapNet && (this.§_-21H§.map as GameMapNet).§_-u1m§.§_-Ca§;
         if(_loc1_)
         {
            this.§_-92O§();
         }
         if(_loc1_ || !(this.§_-21H§ is §_-cV§))
         {
            this.§_-e1s§(true);
         }
      }
      
      private function §_-e1s§(param1:Boolean) : void
      {
         if(param1)
         {
            this.alpha = 1;
            if(this.§_-b1J§.§_-5O§.length != 0)
            {
               this.§_-b1J§.dispatchEvent(new DetectHeroEvent(this.§_-b1J§.§_-5O§[0]));
            }
            this.§_-w2X§ = 0;
            return;
         }
         this.alpha = 0;
         this.§_-w2X§ = this.respawnTime;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc3_:§_-V1t§ = null;
         var _loc2_:Object = param1[1];
         if(this.§_-Gu§(_loc2_) != null)
         {
            if(this.§_-Gu§(_loc2_)[0] != this.id)
            {
               return;
            }
            if(this.alpha == 0)
            {
               this.§_-h12§ = false;
               return;
            }
            this.§_-e1s§(false);
            this.§_-h12§ = false;
            _loc3_ = this.§_-21H§.squirrels.get(this.§_-Gu§(_loc2_)[1]) as §_-V1t§;
            if(!Hero.self)
            {
               return;
            }
            this.§_-E6§(_loc3_);
         }
         if(this.§_-p2D§(_loc2_) != null)
         {
            if(this.§_-p2D§(_loc2_)[0] != this.id)
            {
               return;
            }
            this.§_-e1s§(true);
         }
      }
   }
}


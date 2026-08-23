package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-H1l§.§_-sC§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-hd§.§_-01M§;
   import §_-j4§.§_-43y§;
   import flash.events.Event;
   import game.mainGame.entity.§_-41O§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-Q2M§ extends GameBody implements §_-41O§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-v2o§:int = 64;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.2,0,0.1,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private var §_-y1d§:b2Vec2 = new b2Vec2();
      
      private var §_-b1J§:§_-43y§ = null;
      
      private var controller:§_-sC§ = null;
      
      private var squirrels:Array = [];
      
      private var image:VineSegment;
      
      public function §_-Q2M§()
      {
         super();
         this.image = new VineSegment();
         this.size = new b2Vec2(0,2 * this.image.height / Game.§_-12A§);
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.size.x,this.size.y]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.size = new b2Vec2(param1[1][0],param1[1][1]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         §_-ql§.shape = b2PolygonShape.AsOrientedBox(this.§_-y1d§.x * 0.5,this.§_-y1d§.y * 0.5,new b2Vec2(this.§_-y1d§.x * 0.5,this.§_-y1d§.y * 0.5));
         this.body.SetUserData(this);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.controller = new §_-sC§();
         this.controller.§_-Ab§ = this.squirrels;
         param1.AddController(this.controller);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         if(this.controller)
         {
            this.controller.§_-Ab§ = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
         this.image = null;
         while(numChildren > 0)
         {
            §_-av§(0);
         }
         super.dispose();
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-K13§))
            {
               this.§_-R12§(_loc1_);
            }
         }
         this.squirrels = null;
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.y = param1.y * 0.5 * Game.§_-12A§;
         param1.y = Math.ceil(param1.y / this.image.height) * this.image.height;
         this.§_-y1d§.y = Math.max(param1.y,§_-v2o§);
         this.§_-y1d§.y /= Game.§_-12A§;
         this.§_-y1d§.x = this.image.width / Game.§_-12A§;
         this.draw();
      }
      
      public function get size() : b2Vec2
      {
         return new b2Vec2(this.§_-y1d§.x,this.§_-y1d§.y * 2);
      }
      
      private function draw() : void
      {
         var _loc1_:Sprite = null;
         try
         {
            while(numChildren > 0)
            {
               §_-av§(0);
            }
            _loc1_ = §_-01M§.§_-D1J§(this.image,this.§_-y1d§.x * Game.§_-12A§,this.§_-y1d§.y * Game.§_-12A§);
            §_-J2J§(_loc1_);
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.inHollow)
         {
            return;
         }
         if(_loc2_.ghost)
         {
            return;
         }
         var _loc3_:int = this.squirrels.indexOf(_loc2_);
         if(param1.state == DetectHeroEvent.BEGIN_CONTACT && _loc3_ == -1)
         {
            this.squirrels.push(_loc2_);
            _loc2_.climbing = true;
            _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-f2P§,this.§_-A1R§);
            _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
            if(_loc2_.id == Game.selfId)
            {
               GameSounds.play("stairs");
            }
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-R12§(_loc2_);
            if(_loc3_ != -1)
            {
               this.squirrels.splice(_loc3_,1);
            }
         }
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-R12§(param1["player"]);
         var _loc2_:int = this.squirrels.indexOf(param1["player"]);
         if(_loc2_ != -1)
         {
            this.squirrels.splice(_loc2_,1);
         }
      }
      
      private function §_-R12§(param1:Hero) : void
      {
         param1.climbing = false;
         param1.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-f2P§,this.§_-A1R§);
         param1.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
   }
}


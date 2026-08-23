package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-81N§.§_-W1J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-C1l§.§_-a2§;
   import §_-R1w§.DetectHeroEvent;
   import flash.events.Event;
   import game.mainGame.entity.§_-R2m§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-r2t§ extends GameBody implements §_-R2m§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-P2g§:int = 64;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.2,0,0.1,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private var §_-s1Y§:b2Vec2 = new b2Vec2();
      
      private var §_-V2K§:§_-z12§ = null;
      
      private var controller:§_-W1J§ = null;
      
      private var squirrels:Array = [];
      
      private var image:VineSegment;
      
      public function §_-r2t§()
      {
         super();
         this.image = new VineSegment();
         this.size = new b2Vec2(0,2 * this.image.height / Game.§_-x2P§);
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.size.x,this.size.y]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.size = new b2Vec2(param1[1][0],param1[1][1]);
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         §_-03A§.shape = b2PolygonShape.AsOrientedBox(this.§_-s1Y§.x * 0.5,this.§_-s1Y§.y * 0.5,new b2Vec2(this.§_-s1Y§.x * 0.5,this.§_-s1Y§.y * 0.5));
         this.body.SetUserData(this);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.controller = new §_-W1J§();
         this.controller.§_-i2a§ = this.squirrels;
         param1.AddController(this.controller);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         if(this.controller)
         {
            this.controller.§_-i2a§ = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
         this.image = null;
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
         super.dispose();
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-k2W§))
            {
               this.§_-k2j§(_loc1_);
            }
         }
         this.squirrels = null;
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.y = param1.y * 0.5 * Game.§_-x2P§;
         param1.y = Math.ceil(param1.y / this.image.height) * this.image.height;
         this.§_-s1Y§.y = Math.max(param1.y,§_-P2g§);
         this.§_-s1Y§.y /= Game.§_-x2P§;
         this.§_-s1Y§.x = this.image.width / Game.§_-x2P§;
         this.draw();
      }
      
      public function get size() : b2Vec2
      {
         return new b2Vec2(this.§_-s1Y§.x,this.§_-s1Y§.y * 2);
      }
      
      private function draw() : void
      {
         var _loc1_:Sprite = null;
         try
         {
            while(numChildren > 0)
            {
               §_-n2T§(0);
            }
            _loc1_ = §_-a2§.§_-A3m§(this.image,this.§_-s1Y§.x * Game.§_-x2P§,this.§_-s1Y§.y * Game.§_-x2P§);
            §_-83v§(_loc1_);
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
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
            _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-722§,this.§_-jf§);
            _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
            if(_loc2_.id == Game.selfId)
            {
               GameSounds.play("stairs");
            }
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-k2j§(_loc2_);
            if(_loc3_ != -1)
            {
               this.squirrels.splice(_loc3_,1);
            }
         }
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-k2j§(param1["player"]);
         var _loc2_:int = this.squirrels.indexOf(param1["player"]);
         if(_loc2_ != -1)
         {
            this.squirrels.splice(_loc2_,1);
         }
      }
      
      private function §_-k2j§(param1:Hero) : void
      {
         param1.climbing = false;
         param1.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-722§,this.§_-jf§);
         param1.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
   }
}


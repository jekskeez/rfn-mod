package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-d2d§;
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import flash.events.Event;
   import game.mainGame.entity.§_-M15§;
   import game.mainGame.entity.§_-s2K§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-k1b§ extends GameBody implements §_-M15§, §_-s2K§
   {
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-F2L§:uint = 3;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-F2L§,§_-F2L§,new b2Vec2(0,-43 / Game.§_-x2P§));
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.2,0,0.1,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private var §_-V2K§:§_-z12§ = null;
      
      private var squirrels:Array = [];
      
      private var view:§_-d2d§ = null;
      
      private var particles:§_-h2I§ = new §_-h2I§();
      
      private var §_-c1w§:Boolean = true;
      
      private var §_-RV§:§_-93d§ = §_-93d§.instance;
      
      private var §_-5U§:§_-f1G§;
      
      public function §_-k1b§()
      {
         super();
         this.view = new §_-d2d§(new Disintegrator());
         §_-83v§(this.particles);
         §_-83v§(this.view);
      }
      
      override public function set angle(param1:Number) : void
      {
         super.angle = this.§_-42Y§(param1 * Game.R2D) * Game.D2R;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         this.§_-5U§ = this.§_-RV§.§_-23j§(§_-93d§.§_-g0§);
         this.§_-5U§.start();
         this.particles.getStarlingView().addChild(this.§_-5U§.view);
         this.§_-5U§.view.§_-M2F§ = 0;
         this.§_-5U§.view.§_-Cg§ = -this.view.height * 0.5;
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         if(this.§_-5U§)
         {
            this.§_-5U§.stop();
            this.§_-5U§.removeFromParent(true);
            this.§_-5U§ = null;
         }
         this.particles.removeFromParent(true);
         this.particles = null;
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-k2W§))
            {
               this.§_-w2f§(_loc1_);
            }
         }
         this.squirrels = null;
         if(this.§_-V2K§)
         {
            this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         }
         this.§_-V2K§ = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push(this.active);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.active = Boolean(param1[1]);
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-c1w§ == param1)
         {
            return;
         }
         this.§_-c1w§ = param1;
         this.view.gotoAndStop(param1 ? 0 : 1);
         this.particles.visible = param1;
         if(!param1)
         {
            return;
         }
         this.§_-kk§();
      }
      
      public function get active() : Boolean
      {
         return this.§_-c1w§;
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.inHollow)
         {
            return;
         }
         var _loc3_:int = this.squirrels.indexOf(_loc2_);
         if(param1.state == DetectHeroEvent.BEGIN_CONTACT && _loc3_ == -1)
         {
            this.squirrels.push(_loc2_);
            this.§_-i1F§(_loc2_);
            _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
            _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-62z§,this.§_-92T§);
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-w2f§(_loc2_);
            if(_loc3_ != -1)
            {
               this.squirrels.splice(_loc3_,1);
            }
         }
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-w2f§(param1["player"]);
         var _loc2_:int = this.squirrels.indexOf(param1["player"]);
         if(_loc2_ != -1)
         {
            this.squirrels.splice(_loc2_,1);
         }
      }
      
      private function §_-w2f§(param1:Hero) : void
      {
         param1.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         param1.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-62z§,this.§_-92T§);
      }
      
      private function §_-92T§(param1:SquirrelEvent) : void
      {
         this.§_-i1F§(param1.player);
      }
      
      private function §_-i1F§(param1:Hero) : void
      {
         if(!param1.§_-426§ || !this.active || !param1.isSelf)
         {
            return;
         }
         param1.§_-4j§(Hero.§_-VP§);
         this.§_-iN§(param1);
         if(!(this.§_-H2D§ is §_-A32§))
         {
            Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-y2K§);
         }
      }
      
      private function §_-iN§(param1:Hero) : void
      {
         var _loc2_:§_-d2d§ = new §_-d2d§(new DisintegratorMissNut());
         param1.heroView.§_-83v§(_loc2_);
         _loc2_.x = 0;
         _loc2_.y = (-param1.heroView.height - _loc2_.height) * 0.5;
         _loc2_.loop = false;
         _loc2_.play();
         _loc2_.addEventListener(Event.COMPLETE,this.§_-nr§,false,0,true);
      }
      
      private function §_-nr§(param1:Event = null) : void
      {
         if(!param1.target)
         {
            return;
         }
         var _loc2_:§_-d2d§ = param1.target as §_-d2d§;
         if(_loc2_)
         {
            _loc2_.stop();
            _loc2_.removeFromParent(true);
            _loc2_ = null;
         }
      }
      
      private function §_-kk§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:* = int(this.squirrels.length - 1);
         while(_loc2_ >= 0)
         {
            _loc1_ = this.squirrels[_loc2_];
            if(Boolean(_loc1_) && _loc1_.§_-426§)
            {
               this.§_-i1F§(_loc1_);
            }
            _loc2_--;
         }
      }
      
      public function §_-42Y§(param1:Number) : Number
      {
         var _loc2_:int = param1 < 0 ? int(360 + param1) : int(param1);
         if(_loc2_ >= 0 && _loc2_ < 45 || _loc2_ >= 315)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ >= 45 && _loc2_ < 135)
         {
            _loc2_ = 90;
         }
         else if(_loc2_ >= 135 && _loc2_ < 225)
         {
            _loc2_ = 180;
         }
         else
         {
            _loc2_ = 270;
         }
         return _loc2_;
      }
   }
}


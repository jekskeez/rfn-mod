package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-TK§.§_-aS§;
   import §_-TK§.§_-f1u§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-j4§.§_-43y§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import game.mainGame.entity.§_-81a§;
   import game.mainGame.entity.§_-NA§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-51I§ extends GameBody implements §_-81a§, §_-NA§
   {
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-k2B§:uint = 3;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-k2B§,§_-k2B§,new b2Vec2(0,-43 / Game.§_-12A§));
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.2,0,0.1,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private var §_-b1J§:§_-43y§ = null;
      
      private var squirrels:Array = [];
      
      private var view:§_-f1u§ = null;
      
      private var particles:§_-aS§ = new §_-aS§();
      
      private var §_-8x§:Boolean = true;
      
      private var §_-N1J§:§_-w10§ = §_-w10§.instance;
      
      private var §_-D2A§:§_-11u§;
      
      public function §_-51I§()
      {
         super();
         this.view = new §_-f1u§(new Disintegrator());
         §_-J2J§(this.particles);
         §_-J2J§(this.view);
      }
      
      override public function set angle(param1:Number) : void
      {
         super.angle = this.§_-U14§(param1 * Game.R2D) * Game.D2R;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         this.§_-D2A§ = this.§_-N1J§.§_-d1y§(§_-w10§.§_-I2g§);
         this.§_-D2A§.start();
         this.particles.getStarlingView().addChild(this.§_-D2A§.view);
         this.§_-D2A§.view.§_-L2Z§ = 0;
         this.§_-D2A§.view.§_-2F§ = -this.view.height * 0.5;
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         if(this.§_-D2A§)
         {
            this.§_-D2A§.stop();
            this.§_-D2A§.removeFromParent(true);
            this.§_-D2A§ = null;
         }
         this.particles.removeFromParent(true);
         this.particles = null;
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-K13§))
            {
               this.§_-u1L§(_loc1_);
            }
         }
         this.squirrels = null;
         if(this.§_-b1J§)
         {
            this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         }
         this.§_-b1J§ = null;
         super.dispose();
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push(this.active);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.active = Boolean(param1[1]);
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-8x§ == param1)
         {
            return;
         }
         this.§_-8x§ = param1;
         this.view.gotoAndStop(param1 ? 0 : 1);
         this.particles.visible = param1;
         if(!param1)
         {
            return;
         }
         this.§_-73a§();
      }
      
      public function get active() : Boolean
      {
         return this.§_-8x§;
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
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
            this.§_-g2q§(_loc2_);
            _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
            _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-Xw§,this.§_-R2p§);
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-u1L§(_loc2_);
            if(_loc3_ != -1)
            {
               this.squirrels.splice(_loc3_,1);
            }
         }
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-u1L§(param1["player"]);
         var _loc2_:int = this.squirrels.indexOf(param1["player"]);
         if(_loc2_ != -1)
         {
            this.squirrels.splice(_loc2_,1);
         }
      }
      
      private function §_-u1L§(param1:Hero) : void
      {
         param1.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         param1.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-Xw§,this.§_-R2p§);
      }
      
      private function §_-R2p§(param1:SquirrelEvent) : void
      {
         this.§_-g2q§(param1.player);
      }
      
      private function §_-g2q§(param1:Hero) : void
      {
         if(!param1.§_-62F§ || !this.active || !param1.isSelf)
         {
            return;
         }
         param1.§_-I1u§(Hero.§_-z2T§);
         this.§_-B18§(param1);
         if(!(this.§_-21H§ is §_-62b§))
         {
            Connection.§_-e2T§(§_-u1O§.§_-D2o§,§_-u1O§.§_-D7§);
         }
      }
      
      private function §_-B18§(param1:Hero) : void
      {
         var _loc2_:§_-f1u§ = new §_-f1u§(new DisintegratorMissNut());
         param1.heroView.§_-J2J§(_loc2_);
         _loc2_.x = 0;
         _loc2_.y = (-param1.heroView.height - _loc2_.height) * 0.5;
         _loc2_.loop = false;
         _loc2_.play();
         _loc2_.addEventListener(Event.COMPLETE,this.§_-D2G§,false,0,true);
      }
      
      private function §_-D2G§(param1:Event = null) : void
      {
         if(!param1.target)
         {
            return;
         }
         var _loc2_:§_-f1u§ = param1.target as §_-f1u§;
         if(_loc2_)
         {
            _loc2_.stop();
            _loc2_.removeFromParent(true);
            _loc2_ = null;
         }
      }
      
      private function §_-73a§() : void
      {
         var _loc1_:Hero = null;
         var _loc2_:* = int(this.squirrels.length - 1);
         while(_loc2_ >= 0)
         {
            _loc1_ = this.squirrels[_loc2_];
            if(Boolean(_loc1_) && _loc1_.§_-62F§)
            {
               this.§_-g2q§(_loc1_);
            }
            _loc2_--;
         }
      }
      
      public function §_-U14§(param1:Number) : Number
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


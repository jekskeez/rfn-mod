package §_-83V§
{
   import Box2D.Collision.Shapes.b2CircleShape;
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
   import §_-RI§.§_-h2I§;
   import §_-Rj§.§_-A32§;
   import flash.events.Event;
   import game.mainGame.§_-V§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-NW§ extends GameBody
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-l2D§:Number = 0.1;
      
      private static const §_-Op§:int = 1000;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsVector(§_-b2Y§,0);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,2,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-h2I§ = null;
      
      private var §_-VQ§:§_-h2I§ = null;
      
      private var §_-J1D§:Number = 20;
      
      private var §_-V2K§:§_-z12§ = null;
      
      private var squirrels:Array = [];
      
      private var §_-53P§:Number = 0;
      
      private var §_-G1t§:Hero = null;
      
      private var §_-9§:Number = 0;
      
      public var power:Number = 200;
      
      public var active:Boolean = true;
      
      public var selfDirection:Boolean = true;
      
      public function §_-NW§()
      {
         super();
         this.view = new §_-h2I§(new HomingGunImg());
         §_-83v§(this.view);
         this.§_-VQ§ = new §_-h2I§(new PerkRadius());
         this.§_-9§ = this.§_-VQ§.width;
         §_-83v§(this.§_-VQ§);
         this.radius = 200;
         this.fixed = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      private static function get §_-b2Y§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(0.4,-1.2));
         _loc1_.push(new b2Vec2(2.2,-1.2));
         _loc1_.push(new b2Vec2(4,-0.9));
         _loc1_.push(new b2Vec2(4,0.9));
         _loc1_.push(new b2Vec2(2.2,1.2));
         _loc1_.push(new b2Vec2(0.4,1.2));
         _loc1_.push(new b2Vec2(-1,0));
         return _loc1_;
      }
      
      override public function set showDebug(param1:Boolean) : void
      {
         super.showDebug = param1;
         this.§_-VQ§.visible = this.§_-C1B§;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(new b2FixtureDef(new b2CircleShape(this.radius / Game.§_-x2P§),null,0.8,0.1,2,§_-V§.§_-tL§,§_-V§.§_-qV§,0,true)));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = int(this.squirrels.length - 1);
         while(_loc1_ >= 0)
         {
            this.§_-w2f§(this.squirrels[_loc1_]);
            _loc1_--;
         }
         this.squirrels = null;
         if(this.§_-V2K§)
         {
            this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         }
         this.§_-V2K§ = null;
         this.§_-G1t§ = null;
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.radius,this.power,this.active,this.§_-53P§,this.selfDirection]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.radius = param1[1][0];
         this.power = param1[1][1];
         this.active = Boolean(param1[1][2]);
         this.§_-53P§ = param1[1][3];
         if(4 in param1[1])
         {
            this.selfDirection = param1[1][4];
         }
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.body == null)
         {
            return;
         }
         if(this.§_-53P§ > 0)
         {
            this.§_-53P§ -= param1 * 1000;
            return;
         }
         if(!this.active)
         {
            return;
         }
         if(this.squirrels.length == 0)
         {
            return;
         }
         if(this.§_-G1t§ != null)
         {
            return;
         }
         var _loc2_:Hero = this.squirrels[0];
         if(_loc2_ == null || _loc2_.isDead || _loc2_.inHollow)
         {
            return;
         }
         var _loc3_:Number = Math.atan2(_loc2_.position.y - this.position.y,_loc2_.position.x - this.position.x);
         var _loc4_:Number = _loc3_ - this.angle;
         if(Math.abs(_loc4_) > Math.PI)
         {
            _loc4_ += Math.PI * 2 * (_loc3_ <= 0 ? 1 : -1);
         }
         if(Math.abs(_loc4_) < §_-l2D§)
         {
            this.§_-G1t§ = _loc2_;
            this.§_-g1k§(_loc2_.id);
            return;
         }
         if(!this.selfDirection)
         {
            return;
         }
         this.fixed = false;
         this.angle += (_loc4_ > 0 ? 1 : -1) * §_-l2D§;
         this.fixed = true;
      }
      
      public function set radius(param1:Number) : void
      {
         this.§_-J1D§ = param1 / Game.§_-x2P§;
         this.§_-VQ§.scaleXY(param1 * 2 / this.§_-9§);
      }
      
      public function get radius() : Number
      {
         return this.§_-J1D§ * Game.§_-x2P§;
      }
      
      private function §_-g1k§(param1:int) : void
      {
         if(param1 > 0 && param1 != Game.selfId)
         {
            return;
         }
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-437§(this.angle);
         }
         else
         {
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"cannonShoot":[this.id,this.angle]}));
         }
      }
      
      private function §_-437§(param1:Number) : void
      {
         this.fixed = false;
         this.angle = param1;
         this.fixed = true;
         this.§_-53P§ = §_-Op§;
         this.§_-G1t§ = null;
         if(Boolean(this.§_-H2D§) && !this.§_-H2D§.squirrels.isSynchronizing)
         {
            return;
         }
         var _loc2_:§_-St§ = new §_-St§();
         _loc2_.angle = param1;
         _loc2_.position = this.body.GetWorldPoint(new b2Vec2(6,0));
         _loc2_.velocity = this.power;
         this.§_-H2D§.map.§_-nA§(_loc2_,true);
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
            _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
            _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-w2f§(_loc2_);
         }
      }
      
      private function §_-w2f§(param1:Hero) : void
      {
         var _loc2_:int = this.squirrels.indexOf(param1);
         if(_loc2_ == -1)
         {
            return;
         }
         this.squirrels.splice(_loc2_,1);
         param1.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         param1.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-w2f§(param1["player"]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("cannonShoot" in _loc2_)
         {
            if(_loc2_["cannonShoot"][0] != this.id)
            {
               return;
            }
            this.§_-437§(_loc2_["cannonShoot"][1]);
         }
      }
   }
}

